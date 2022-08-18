{
 Classe da tabela: TbStatus - Status do Contrato
}

unit DTbStatus;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0014,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDTbStatus = class(TTabela)
  public
    StatusCT: TDTbStatus_StatusCT;
    Descricao: TDTbStatus_Descricao;
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

constructor TDTbStatus.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'TbStatus';
  Titulo           := 'Status do Contrato';
  Name             := 'DTbStatus';
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
  DataSource.Name  := 'DsTbStatus';
  with UpdateSql do
  begin
    Name           := 'UpdSql_TbStatus';
    // Exclusão de Registro
    DeleteSQL.Add('delete from TbStatus');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  StatusCT = :OLD_StatusCT');
    // Inserção de Registro
    InsertSQL.Add('insert into TbStatus');
    InsertSQL.Add('  (');
    InsertSQL.Add('  StatusCT,');
    InsertSQL.Add('  Descricao');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :StatusCT,');
    InsertSQL.Add('  :Descricao');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update TbStatus');
    ModifySQL.Add('set');
    ModifySQL.Add('  StatusCT = :StatusCT,');
    ModifySQL.Add('  Descricao = :Descricao');
    ModifySQL.Add('where');
    ModifySQL.Add('  StatusCT = :OLD_StatusCT');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  TbStatus.StatusCT AS StatusCT,');
    RefreshSQL.Add('  TbStatus.Descricao AS Descricao');
    RefreshSQL.Add('from TbStatus');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  TbStatus.StatusCT = :OLD_StatusCT');
  end;
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  TbStatus.StatusCT AS StatusCT,');
  SqlPrincipal.Add('  TbStatus.Descricao AS Descricao');
  SqlPrincipal.Add('from TbStatus');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  Sql.Add('order by TbStatus.StatusCT');
  Descricao := TDTbStatus_Descricao.Create(AOwner);
  Descricao.Valor.DataSet := Self;
  StatusCT := TDTbStatus_StatusCT.Create(AOwner);
  StatusCT.Valor.DataSet := Self;
  ChavePrimaria.Add(StatusCT);
  Campos.Add(StatusCT);
  Campos.Add(Descricao);
  TituloIndices.Add('Status');
  Indices.Add('TbStatus.StatusCT');
  Crescente.Add('S');
  TituloPrimaria := 'Status';
  ChPrimaria     := 'TbStatus.StatusCT';
  TituloIndice   := 'Status';
  ChaveIndice    := 'TbStatus.StatusCT';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;

procedure TDTbStatus.CriaForeignKeys;
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

function TDTbStatus.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDTbStatus.ExclusaoCascata;
begin
end;

function TDTbStatus.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDTbStatus.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TbStatus') then
    if PTabela(TabGlobal.DTbStatus, ['StatusCT'], [StatusCT.Valor.Value]) then
      Result := True;
end;

procedure TDTbStatus.CalculaCampos;
begin
end;

procedure TDTbStatus.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDTbStatus.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDTbStatus.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDTbStatus.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDTbStatus.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDTbStatus.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (StatusCT.SempreAtribui) and (StatusCT.AutoIncremento > 0) then
      AutoIncremento('StatusCT', True, StatusCT.AutoIncremento);
end;

procedure TDTbStatus.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDTbStatus.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDTbStatus.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
