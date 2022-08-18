{
 Classe da tabela: TbAtividades - Tabela de Atividades Comerciais
}

unit DTbAtividades;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0019,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDTbAtividades = class(TTabela)
  public
    TBATIVCOD: TDTbAtividades_TBATIVCOD;
    DESCRICAO: TDTbAtividades_DESCRICAO;
    Usuario: TDTbAtividades_Usuario;
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

constructor TDTbAtividades.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'TbAtividades';
  Titulo           := 'Tabela de Atividades Comerciais';
  Name             := 'DTbAtividades';
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
  DataSource.Name  := 'DsTbAtividades';
  with UpdateSql do
  begin
    Name           := 'UpdSql_TbAtividades';
    // Exclusão de Registro
    DeleteSQL.Add('delete from TbAtividades');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  TBATIVCOD = :OLD_TBATIVCOD');
    // Inserção de Registro
    InsertSQL.Add('insert into TbAtividades');
    InsertSQL.Add('  (');
    InsertSQL.Add('  TBATIVCOD,');
    InsertSQL.Add('  DESCRICAO,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :TBATIVCOD,');
    InsertSQL.Add('  :DESCRICAO,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update TbAtividades');
    ModifySQL.Add('set');
    ModifySQL.Add('  TBATIVCOD = :TBATIVCOD,');
    ModifySQL.Add('  DESCRICAO = :DESCRICAO,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  TBATIVCOD = :OLD_TBATIVCOD');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  TbAtividades.TBATIVCOD AS TBATIVCOD,');
    RefreshSQL.Add('  TbAtividades.DESCRICAO AS DESCRICAO,');
    RefreshSQL.Add('  TbAtividades.Usuario AS Usuario');
    RefreshSQL.Add('from TbAtividades');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  TbAtividades.TBATIVCOD = :OLD_TBATIVCOD');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  TbAtividades.TBATIVCOD AS TBATIVCOD,');
  SqlPrincipal.Add('  TbAtividades.DESCRICAO AS DESCRICAO,');
  SqlPrincipal.Add('  TbAtividades.Usuario AS Usuario');
  SqlPrincipal.Add('from TbAtividades');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by TbAtividades.TBATIVCOD');
  TBATIVCOD := TDTbAtividades_TBATIVCOD.Create(AOwner);
  TBATIVCOD.Valor.DataSet := Self;
  DESCRICAO := TDTbAtividades_DESCRICAO.Create(AOwner);
  DESCRICAO.Valor.DataSet := Self;
  Usuario := TDTbAtividades_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(TBATIVCOD);
//CRIANDO CAMPOS 
  Campos.Add(TBATIVCOD);
  Campos.Add(DESCRICAO);
  Campos.Add(Usuario);
  TituloIndices.Add('Código');
  Indices.Add('TbAtividades.TBATIVCOD');
  Crescente.Add('S');
  TituloPrimaria := 'Código';
  ChPrimaria     := 'TbAtividades.TBATIVCOD';
//CRIANDO TituloIndices 
  TituloIndices.Add('Por Descrição');
  Indices.Add('DESCRICAO');
  Crescente.Add('S');
  TituloIndice   := 'Código';
  ChaveIndice    := 'TbAtividades.TBATIVCOD';
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

procedure TDTbAtividades.CriaForeignKeys;
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

function TDTbAtividades.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
  if PTabela(TabGlobal.DClientes, ['TBATIVCOD'], [TBATIVCOD.Valor.Value]) then
  begin
    MessageDlg('Registro está ligado a tabela: '+TabGlobal.DClientes.Titulo,mtError,[mbOk],0);
    PodeExcluir := False;
    exit;
  end;
  if PTabela(TabGlobal.DFornecedores, ['TBATIVCOD'], [TBATIVCOD.Valor.Value]) then
  begin
    MessageDlg('Registro está ligado a tabela: '+TabGlobal.DFornecedores.Titulo,mtError,[mbOk],0);
    PodeExcluir := False;
    exit;
  end;
end;

procedure TDTbAtividades.ExclusaoCascata;
begin
end;

function TDTbAtividades.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDTbAtividades.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TbAtividades') then
    if PTabela(TabGlobal.DTbAtividades, ['TBATIVCOD'], [TBATIVCOD.Valor.Value]) then
      Result := True;
end;

procedure TDTbAtividades.CalculaCampos;
begin
end;

procedure TDTbAtividades.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDTbAtividades.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDTbAtividades.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDTbAtividades.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDTbAtividades.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDTbAtividades.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (TBATIVCOD.SempreAtribui) and (TBATIVCOD.AutoIncremento > 0) then
      AutoIncremento('TBATIVCOD', True, TBATIVCOD.AutoIncremento);
end;

procedure TDTbAtividades.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDTbAtividades.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDTbAtividades.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
