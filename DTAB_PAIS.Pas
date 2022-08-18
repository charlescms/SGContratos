{
 Classe da tabela: TAB_PAIS - TAB_PAIS
}

unit DTAB_PAIS;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0010,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDTAB_PAIS = class(TTabela)
  public
    ID: TDTAB_PAIS_ID;
    NOME: TDTAB_PAIS_NOME;
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

constructor TDTAB_PAIS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'TAB_PAIS';
  Titulo           := 'TAB_PAIS';
  Name             := 'DTAB_PAIS';
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
  DataSource.Name  := 'DsTAB_PAIS';
  with UpdateSql do
  begin
    Name           := 'UpdSql_TAB_PAIS';
    // Exclusão de Registro
    DeleteSQL.Add('delete from TAB_PAIS');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  ID = :OLD_ID');
    // Inserção de Registro
    InsertSQL.Add('insert into TAB_PAIS');
    InsertSQL.Add('  (');
    InsertSQL.Add('  ID,');
    InsertSQL.Add('  NOME');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :ID,');
    InsertSQL.Add('  :NOME');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update TAB_PAIS');
    ModifySQL.Add('set');
    ModifySQL.Add('  ID = :ID,');
    ModifySQL.Add('  NOME = :NOME');
    ModifySQL.Add('where');
    ModifySQL.Add('  ID = :OLD_ID');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  TAB_PAIS.ID AS ID,');
    RefreshSQL.Add('  TAB_PAIS.NOME AS NOME');
    RefreshSQL.Add('from TAB_PAIS');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  TAB_PAIS.ID = :OLD_ID');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  TAB_PAIS.ID AS ID,');
  SqlPrincipal.Add('  TAB_PAIS.NOME AS NOME');
  SqlPrincipal.Add('from TAB_PAIS');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by TAB_PAIS.NOME');
  ID := TDTAB_PAIS_ID.Create(AOwner);
  ID.Valor.DataSet := Self;
  NOME := TDTAB_PAIS_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  ChavePrimaria.Add(ID);
  Campos.Add(ID);
  Campos.Add(NOME);
  TituloIndices.Add('Cód. Pais');
  Indices.Add('TAB_PAIS.ID');
  Crescente.Add('S');
  TituloPrimaria := 'Cód. Pais';
  ChPrimaria     := 'TAB_PAIS.ID';
  TituloIndice   := 'Nome Pais';
  ChaveIndice    := 'TAB_PAIS.NOME';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;

procedure TDTAB_PAIS.CriaForeignKeys;
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

function TDTAB_PAIS.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDTAB_PAIS.ExclusaoCascata;
begin
end;

function TDTAB_PAIS.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDTAB_PAIS.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TAB_PAIS') then
    if PTabela(TabGlobal.DTAB_PAIS, ['ID'], [ID.Valor.Value]) then
      Result := True;
end;

procedure TDTAB_PAIS.CalculaCampos;
begin
end;

procedure TDTAB_PAIS.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDTAB_PAIS.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDTAB_PAIS.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDTAB_PAIS.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDTAB_PAIS.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDTAB_PAIS.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (ID.SempreAtribui) and (ID.AutoIncremento > 0) then
      AutoIncremento('ID', True, ID.AutoIncremento);
end;

procedure TDTAB_PAIS.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDTAB_PAIS.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDTAB_PAIS.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
