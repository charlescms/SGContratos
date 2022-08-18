{
 Classe da tabela: TbSitClientes - Situação de Clientes
}

unit DTbSitClientes;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0016,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDTbSitClientes = class(TTabela)
  public
    SITCLICOD: TDTbSitClientes_SITCLICOD;
    DESCRICAO: TDTbSitClientes_DESCRICAO;
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

constructor TDTbSitClientes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'TbSitClientes';
  Titulo           := 'Situação de Clientes';
  Name             := 'DTbSitClientes';
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
  DataSource.Name  := 'DsTbSitClientes';
  with UpdateSql do
  begin
    Name           := 'UpdSql_TbSitClientes';
    // Exclusão de Registro
    DeleteSQL.Add('delete from TbSitClientes');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  SITCLICOD = :OLD_SITCLICOD');
    // Inserção de Registro
    InsertSQL.Add('insert into TbSitClientes');
    InsertSQL.Add('  (');
    InsertSQL.Add('  SITCLICOD,');
    InsertSQL.Add('  DESCRICAO');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :SITCLICOD,');
    InsertSQL.Add('  :DESCRICAO');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update TbSitClientes');
    ModifySQL.Add('set');
    ModifySQL.Add('  SITCLICOD = :SITCLICOD,');
    ModifySQL.Add('  DESCRICAO = :DESCRICAO');
    ModifySQL.Add('where');
    ModifySQL.Add('  SITCLICOD = :OLD_SITCLICOD');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  TbSitClientes.SITCLICOD AS SITCLICOD,');
    RefreshSQL.Add('  TbSitClientes.DESCRICAO AS DESCRICAO');
    RefreshSQL.Add('from TbSitClientes');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  TbSitClientes.SITCLICOD = :OLD_SITCLICOD');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  TbSitClientes.SITCLICOD AS SITCLICOD,');
  SqlPrincipal.Add('  TbSitClientes.DESCRICAO AS DESCRICAO');
  SqlPrincipal.Add('from TbSitClientes');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by TbSitClientes.SITCLICOD');
  SITCLICOD := TDTbSitClientes_SITCLICOD.Create(AOwner);
  SITCLICOD.Valor.DataSet := Self;
  DESCRICAO := TDTbSitClientes_DESCRICAO.Create(AOwner);
  DESCRICAO.Valor.DataSet := Self;
  ChavePrimaria.Add(SITCLICOD);
  Campos.Add(SITCLICOD);
  Campos.Add(DESCRICAO);
  TituloIndices.Add('Código');
  Indices.Add('TbSitClientes.SITCLICOD');
  Crescente.Add('S');
  TituloPrimaria := 'Código';
  ChPrimaria     := 'TbSitClientes.SITCLICOD';
  TituloIndices.Add('Por Descrição');
  Indices.Add('SitClientes.DESCRICAO');
  Crescente.Add('S');
  TituloIndice   := 'Código';
  ChaveIndice    := 'TbSitClientes.SITCLICOD';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;

procedure TDTbSitClientes.CriaForeignKeys;
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

function TDTbSitClientes.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
  if PTabela(TabGlobal.DClientes, ['SITCLICOD'], [SITCLICOD.Valor.Value]) then
  begin
    MessageDlg('Registro está ligado a tabela: '+TabGlobal.DClientes.Titulo,mtError,[mbOk],0);
    PodeExcluir := False;
    exit;
  end;
end;

procedure TDTbSitClientes.ExclusaoCascata;
begin
end;

function TDTbSitClientes.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDTbSitClientes.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TbSitClientes') then
    if PTabela(TabGlobal.DTbSitClientes, ['SITCLICOD'], [SITCLICOD.Valor.Value]) then
      Result := True;
end;

procedure TDTbSitClientes.CalculaCampos;
begin
end;

procedure TDTbSitClientes.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDTbSitClientes.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDTbSitClientes.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDTbSitClientes.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDTbSitClientes.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDTbSitClientes.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (SITCLICOD.SempreAtribui) and (SITCLICOD.AutoIncremento > 0) then
      AutoIncremento('SITCLICOD', True, SITCLICOD.AutoIncremento);
end;

procedure TDTbSitClientes.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDTbSitClientes.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDTbSitClientes.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
