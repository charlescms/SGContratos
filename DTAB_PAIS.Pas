{
 Classe da tabela: Tab_pais - Pais
}

unit DTab_pais;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0018,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDTab_pais = class(TTabela)
  public
    ID: TDTab_pais_ID;
    NOME: TDTab_pais_NOME;
    Usuario: TDTab_pais_Usuario;
    constructor Create(AOwner: TComponent); override;
    procedure CriaForeignKeys; override;
    function PodeExcluir: Boolean; override;
    procedure ExclusaoCascata; override;
    function PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean; overload; override;
    function PesquisaRelacionados(Tabela: String): Boolean; overload; override;
    procedure CalculaCampos; override;
    procedure Parametros(Tabela: TTabela); override;
    procedure AtribuiRelacionamentos(Atribui: Boolean = True); override;
    procedure AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True); override;
    procedure AtribuiMestre(DataSet: TDataSet); override;
    procedure ProcessoDireto1(DataSet: TDataSet);
    procedure ProcessoDireto2(DataSet: TDataSet);
    procedure AtualizaCalculados(DataSet: TDataSet);
    procedure ProcessoInverso1(DataSet: TDataSet);
    procedure ProcessoInverso2(DataSet: TDataSet);
  end;

implementation

uses Publicas, Validar, Rotinas, Abertura, Calculos, RotinaEd;

constructor TDTab_pais.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'Tab_pais';
  Titulo           := 'Pais';
  Name             := 'DTab_pais';
  Database         := BaseDados.BD_Base_Dados;
  {$IFDEF IBX}
  Transaction      := BaseDados.TRS_BD_Base_Dados;
  UpdateSql        := TIBUpdateSQL.Create(AOwner);
  {$ELSE}
  RequestLive      := True;
  AutoRefresh      := True;
  CachedUpdates    := True;
  UpdateSql        := TXSQLUpdateSQL.Create(AOwner);
  DatabaseName     := BaseDados.BD_Base_Dados.DatabaseName;
  {$ENDIF}
  Local            := False;
  Open_begin       := False;
  Versao           := 6;
  UsarGenerator    := True;
  TableType        := ttTable;
  DataSource.Name  := 'DsTab_pais';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Tab_pais';
    // Exclusão de Registro
    DeleteSQL.Add('delete from Tab_pais');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  ID = :OLD_ID');
    // Inserção de Registro
    InsertSQL.Add('insert into Tab_pais');
    InsertSQL.Add('  (');
    InsertSQL.Add('  ID,');
    InsertSQL.Add('  NOME,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :ID,');
    InsertSQL.Add('  :NOME,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update Tab_pais');
    ModifySQL.Add('set');
    ModifySQL.Add('  ID = :ID,');
    ModifySQL.Add('  NOME = :NOME,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  ID = :OLD_ID');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  Tab_pais.ID AS ID,');
    RefreshSQL.Add('  Tab_pais.NOME AS NOME,');
    RefreshSQL.Add('  Tab_pais.Usuario AS Usuario');
    RefreshSQL.Add('from Tab_pais');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  Tab_pais.ID = :OLD_ID');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  Tab_pais.ID AS ID,');
  SqlPrincipal.Add('  Tab_pais.NOME AS NOME,');
  SqlPrincipal.Add('  Tab_pais.Usuario AS Usuario');
  SqlPrincipal.Add('from Tab_pais');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by TAB_PAIS.NOME');
  ID := TDTab_pais_ID.Create(AOwner);
  ID.Valor.DataSet := Self;
  NOME := TDTab_pais_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  Usuario := TDTab_pais_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(ID);
//CRIANDO CAMPOS 
  Campos.Add(ID);
  Campos.Add(NOME);
  Campos.Add(Usuario);
  TituloIndices.Add('Cód. Pais');
  Indices.Add('Tab_pais.ID');
  Crescente.Add('S');
  TituloPrimaria := 'Cód. Pais';
  ChPrimaria     := 'Tab_pais.ID';
//CRIANDO TituloIndices 
  TituloIndice   := 'Nome Pais';
  ChaveIndice    := 'TAB_PAIS.NOME';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;
////////////////////////////////
//   CRIANDO PROCEDIMENTOS    //
////////////////////////////////

procedure TDTab_pais.CriaForeignKeys;
var
  Script_ForeignKeys: TSQLScript;
begin
  if ForeignKeys.Count > 0 then
  begin
    Script_ForeignKeys := TSQLScript.Create(Self);
    with Script_ForeignKeys do
    begin
      Database         := BaseDados.BD_Base_Dados;
      {$IFDEF IBX}
      Transaction      := BaseDados.TRS_BD_Base_Dados;
      with Script do
      {$ELSE}
      DatabaseName     := BaseDados.BD_Base_Dados.DatabaseName;
      with SQL do
      {$ENDIF}
      AddStrings(ForeignKeys);
      Executar;
      Free;
    end;
  end;
end;

function TDTab_pais.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDTab_pais.ExclusaoCascata;
begin
end;

function TDTab_pais.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDTab_pais.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Tab_pais') then
    if PTabela(TabGlobal.DTab_pais, ['ID'], [ID.Valor.Value]) then
      Result := True;
end;

procedure TDTab_pais.CalculaCampos;
begin
end;

procedure TDTab_pais.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDTab_pais.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  if Atualiza then
    AtualizaSql;
end;

procedure TDTab_pais.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDTab_pais.ProcessoDireto1(DataSet: TDataSet);
var
  QueryLc: TTabela;
  EmEdicao: Boolean;
begin
  {$IFDEF IBX}
  Transaction.CommitRetaining;
  {$ELSE}
  {$ENDIF}
  Inclusao    := False;
  Modificacao := False;
end;

procedure TDTab_pais.ProcessoDireto2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  {$IFDEF IBX}
  Transaction.CommitRetaining;
  {$ELSE}
  {$ENDIF}
  Inclusao    := False;
  Modificacao := False;
end;

procedure TDTab_pais.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (ID.SempreAtribui) and (ID.AutoIncremento > 0) then
      AutoIncremento('ID', True, ID.AutoIncremento);
end;

procedure TDTab_pais.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDTab_pais.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDTab_pais.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
