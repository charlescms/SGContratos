{
 Classe da tabela: TbCategClientes - Categoria Clientes
}

unit DTbCategClientes;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0020,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDTbCategClientes = class(TTabela)
  public
    CATCLICOD: TDTbCategClientes_CATCLICOD;
    DESCRICAO: TDTbCategClientes_DESCRICAO;
    Usuario: TDTbCategClientes_Usuario;
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

constructor TDTbCategClientes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'TbCategClientes';
  Titulo           := 'Categoria Clientes';
  Name             := 'DTbCategClientes';
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
  DataSource.Name  := 'DsTbCategClientes';
  with UpdateSql do
  begin
    Name           := 'UpdSql_TbCategClientes';
    // Exclusão de Registro
    DeleteSQL.Add('delete from TbCategClientes');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  CATCLICOD = :OLD_CATCLICOD');
    // Inserção de Registro
    InsertSQL.Add('insert into TbCategClientes');
    InsertSQL.Add('  (');
    InsertSQL.Add('  CATCLICOD,');
    InsertSQL.Add('  DESCRICAO,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :CATCLICOD,');
    InsertSQL.Add('  :DESCRICAO,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update TbCategClientes');
    ModifySQL.Add('set');
    ModifySQL.Add('  CATCLICOD = :CATCLICOD,');
    ModifySQL.Add('  DESCRICAO = :DESCRICAO,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  CATCLICOD = :OLD_CATCLICOD');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  TbCategClientes.CATCLICOD AS CATCLICOD,');
    RefreshSQL.Add('  TbCategClientes.DESCRICAO AS DESCRICAO,');
    RefreshSQL.Add('  TbCategClientes.Usuario AS Usuario');
    RefreshSQL.Add('from TbCategClientes');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  TbCategClientes.CATCLICOD = :OLD_CATCLICOD');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  TbCategClientes.CATCLICOD AS CATCLICOD,');
  SqlPrincipal.Add('  TbCategClientes.DESCRICAO AS DESCRICAO,');
  SqlPrincipal.Add('  TbCategClientes.Usuario AS Usuario');
  SqlPrincipal.Add('from TbCategClientes');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by TbCategClientes.CATCLICOD');
  DESCRICAO := TDTbCategClientes_DESCRICAO.Create(AOwner);
  DESCRICAO.Valor.DataSet := Self;
  CATCLICOD := TDTbCategClientes_CATCLICOD.Create(AOwner);
  CATCLICOD.Valor.DataSet := Self;
  Usuario := TDTbCategClientes_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(CATCLICOD);
//CRIANDO CAMPOS 
  Campos.Add(CATCLICOD);
  Campos.Add(DESCRICAO);
  Campos.Add(Usuario);
  TituloIndices.Add('Cód Categoria');
  Indices.Add('TbCategClientes.CATCLICOD');
  Crescente.Add('S');
  TituloPrimaria := 'Cód Categoria';
  ChPrimaria     := 'TbCategClientes.CATCLICOD';
//CRIANDO TituloIndices 
  TituloIndice   := 'Cód Categoria';
  ChaveIndice    := 'TbCategClientes.CATCLICOD';
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

procedure TDTbCategClientes.CriaForeignKeys;
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

function TDTbCategClientes.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDTbCategClientes.ExclusaoCascata;
begin
end;

function TDTbCategClientes.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDTbCategClientes.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TbCategClientes') then
    if PTabela(TabGlobal.DTbCategClientes, ['CATCLICOD'], [CATCLICOD.Valor.Value]) then
      Result := True;
end;

procedure TDTbCategClientes.CalculaCampos;
begin
end;

procedure TDTbCategClientes.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDTbCategClientes.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDTbCategClientes.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDTbCategClientes.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDTbCategClientes.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDTbCategClientes.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (CATCLICOD.SempreAtribui) and (CATCLICOD.AutoIncremento > 0) then
      AutoIncremento('CATCLICOD', True, CATCLICOD.AutoIncremento);
end;

procedure TDTbCategClientes.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDTbCategClientes.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDTbCategClientes.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
