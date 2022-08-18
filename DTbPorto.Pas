{
 Classe da tabela: TbPorto - Tabela de Porto
}

unit DTbPorto;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0023,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDTbPorto = class(TTabela)
  public
    CodTbPorto: TDTbPorto_CodTbPorto;
    NomePorto: TDTbPorto_NomePorto;
    Usuario: TDTbPorto_Usuario;
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

constructor TDTbPorto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'TbPorto';
  Titulo           := 'Tabela de Porto';
  Name             := 'DTbPorto';
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
  Open_begin       := True;
  Versao           := 6;
  UsarGenerator    := True;
  TableType        := ttTable;
  DataSource.Name  := 'DsTbPorto';
  with UpdateSql do
  begin
    Name           := 'UpdSql_TbPorto';
    // Exclusão de Registro
    DeleteSQL.Add('delete from TbPorto');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  CodTbPorto = :OLD_CodTbPorto');
    // Inserção de Registro
    InsertSQL.Add('insert into TbPorto');
    InsertSQL.Add('  (');
    InsertSQL.Add('  CodTbPorto,');
    InsertSQL.Add('  NomePorto,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :CodTbPorto,');
    InsertSQL.Add('  :NomePorto,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update TbPorto');
    ModifySQL.Add('set');
    ModifySQL.Add('  CodTbPorto = :CodTbPorto,');
    ModifySQL.Add('  NomePorto = :NomePorto,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  CodTbPorto = :OLD_CodTbPorto');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  TbPorto.CodTbPorto AS CodTbPorto,');
    RefreshSQL.Add('  TbPorto.NomePorto AS NomePorto,');
    RefreshSQL.Add('  TbPorto.Usuario AS Usuario');
    RefreshSQL.Add('from TbPorto');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  TbPorto.CodTbPorto = :OLD_CodTbPorto');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  TbPorto.CodTbPorto AS CodTbPorto,');
  SqlPrincipal.Add('  TbPorto.NomePorto AS NomePorto,');
  SqlPrincipal.Add('  TbPorto.Usuario AS Usuario');
  SqlPrincipal.Add('from TbPorto');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by TbPorto.CodTbPorto');
  CodTbPorto := TDTbPorto_CodTbPorto.Create(AOwner);
  CodTbPorto.Valor.DataSet := Self;
  NomePorto := TDTbPorto_NomePorto.Create(AOwner);
  NomePorto.Valor.DataSet := Self;
  Usuario := TDTbPorto_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(CodTbPorto);
//CRIANDO CAMPOS 
  Campos.Add(CodTbPorto);
  Campos.Add(NomePorto);
  Campos.Add(Usuario);
  TituloIndices.Add('Código');
  Indices.Add('TbPorto.CodTbPorto');
  Crescente.Add('S');
  TituloPrimaria := 'Código';
  ChPrimaria     := 'TbPorto.CodTbPorto';
//CRIANDO TituloIndices 
  TituloIndice   := 'Código';
  ChaveIndice    := 'TbPorto.CodTbPorto';
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

procedure TDTbPorto.CriaForeignKeys;
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

function TDTbPorto.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDTbPorto.ExclusaoCascata;
begin
end;

function TDTbPorto.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDTbPorto.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TbPorto') then
    if PTabela(TabGlobal.DTbPorto, ['CodTbPorto'], [CodTbPorto.Valor.Value]) then
      Result := True;
end;

procedure TDTbPorto.CalculaCampos;
begin
end;

procedure TDTbPorto.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDTbPorto.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDTbPorto.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDTbPorto.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDTbPorto.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDTbPorto.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (CodTbPorto.SempreAtribui) and (CodTbPorto.AutoIncremento > 0) then
      AutoIncremento('CodTbPorto', True, CodTbPorto.AutoIncremento);
end;

procedure TDTbPorto.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDTbPorto.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDTbPorto.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
