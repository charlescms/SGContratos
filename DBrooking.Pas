{
 Classe da tabela: Brooking - Booking
}

unit DBrooking;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0000,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDBrooking = class(TTabela)
  public
    Contrato: TDBrooking_Contrato;
    Seq: TDBrooking_Seq;
    Cadastro: TDBrooking_Cadastro;
    Navio: TDBrooking_Navio;
    Quantidade: TDBrooking_Quantidade;
    DataPrevista: TDBrooking_DataPrevista;
    StatusBK: TDBrooking_StatusBK;
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

constructor TDBrooking.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'Brooking';
  Titulo           := 'Booking';
  Name             := 'DBrooking';
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
  DataSource.Name  := 'DsBrooking';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Brooking';
    // Exclusão de Registro
    DeleteSQL.Add('delete from Brooking');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Contrato = :OLD_Contrato');
    DeleteSQL.Add('  and Seq = :OLD_Seq');
    // Inserção de Registro
    InsertSQL.Add('insert into Brooking');
    InsertSQL.Add('  (');
    InsertSQL.Add('  Contrato,');
    InsertSQL.Add('  Seq,');
    InsertSQL.Add('  Cadastro,');
    InsertSQL.Add('  Navio,');
    InsertSQL.Add('  Quantidade,');
    InsertSQL.Add('  DataPrevista,');
    InsertSQL.Add('  StatusBK');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :Seq,');
    InsertSQL.Add('  :Cadastro,');
    InsertSQL.Add('  :Navio,');
    InsertSQL.Add('  :Quantidade,');
    InsertSQL.Add('  :DataPrevista,');
    InsertSQL.Add('  :StatusBK');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update Brooking');
    ModifySQL.Add('set');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  Seq = :Seq,');
    ModifySQL.Add('  Cadastro = :Cadastro,');
    ModifySQL.Add('  Navio = :Navio,');
    ModifySQL.Add('  Quantidade = :Quantidade,');
    ModifySQL.Add('  DataPrevista = :DataPrevista,');
    ModifySQL.Add('  StatusBK = :StatusBK');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    ModifySQL.Add('  and Seq = :OLD_Seq');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  Brooking.Contrato AS Contrato,');
    RefreshSQL.Add('  Brooking.Seq AS Seq,');
    RefreshSQL.Add('  Brooking.Cadastro AS Cadastro,');
    RefreshSQL.Add('  Brooking.Navio AS Navio,');
    RefreshSQL.Add('  Brooking.Quantidade AS Quantidade,');
    RefreshSQL.Add('  Brooking.DataPrevista AS DataPrevista,');
    RefreshSQL.Add('  Brooking.StatusBK AS StatusBK');
    RefreshSQL.Add('from Brooking');
    RefreshSQL.Add('Left Outer Join TbStatus on');
    RefreshSQL.Add('  Brooking.StatusBK = TbStatus.StatusCT');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  Brooking.Contrato = :OLD_Contrato');
    RefreshSQL.Add('  and Brooking.Seq = :OLD_Seq');
  end;
  TabelasExtras.Add('TbStatus');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  Brooking.Contrato AS Contrato,');
  SqlPrincipal.Add('  Brooking.Seq AS Seq,');
  SqlPrincipal.Add('  Brooking.Cadastro AS Cadastro,');
  SqlPrincipal.Add('  Brooking.Navio AS Navio,');
  SqlPrincipal.Add('  Brooking.Quantidade AS Quantidade,');
  SqlPrincipal.Add('  Brooking.DataPrevista AS DataPrevista,');
  SqlPrincipal.Add('  Brooking.StatusBK AS StatusBK');
  SqlPrincipal.Add('from Brooking');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join TbStatus on');
  FiltroExtra.Add('  Brooking.StatusBK = TbStatus.StatusCT');
  Sql.Add('order by Brooking.Contrato,Brooking.Seq');
  Contrato := TDBrooking_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  Quantidade := TDBrooking_Quantidade.Create(AOwner);
  Quantidade.Valor.DataSet := Self;
  Seq := TDBrooking_Seq.Create(AOwner);
  Seq.Valor.DataSet := Self;
  Navio := TDBrooking_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  DataPrevista := TDBrooking_DataPrevista.Create(AOwner);
  DataPrevista.Valor.DataSet := Self;
  StatusBK := TDBrooking_StatusBK.Create(AOwner);
  StatusBK.Valor.DataSet := Self;
  Cadastro := TDBrooking_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  ChavePrimaria.Add(Contrato);
  ChavePrimaria.Add(Seq);
  Campos.Add(Contrato);
  Campos.Add(Seq);
  Campos.Add(Cadastro);
  Campos.Add(Navio);
  Campos.Add(Quantidade);
  Campos.Add(DataPrevista);
  Campos.Add(StatusBK);
  TituloIndices.Add('Contrato,Seq.');
  Indices.Add('Brooking.Contrato,Brooking.Seq');
  Crescente.Add('S');
  TituloPrimaria := 'Contrato,Seq.';
  ChPrimaria     := 'Brooking.Contrato,Brooking.Seq';
  TituloIndice   := 'Contrato,Seq.';
  ChaveIndice    := 'Brooking.Contrato,Brooking.Seq';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;

procedure TDBrooking.CriaForeignKeys;
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

function TDBrooking.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDBrooking.ExclusaoCascata;
begin
end;

function TDBrooking.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
end;

function TDBrooking.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TbStatus') then
    if PTabela(TabGlobal.DTbStatus, ['StatusCT'], [StatusBK.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Brooking') then
    if PTabela(TabGlobal.DBrooking, ['Contrato','Seq'], [Contrato.Valor.Value,Seq.Valor.Value]) then
      Result := True;
end;

procedure TDBrooking.CalculaCampos;
begin
end;

procedure TDBrooking.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDBrooking.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('Brooking.Contrato = :ContratoTransporte_Contrato');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  Contrato.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDBrooking.AtribuiMestre(DataSet: TDataSet);
begin
  Contrato.Valor.Value := TabGlobal.DContratoTransporte.Contrato.Valor.Value;
end;

procedure TDBrooking.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDBrooking.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDBrooking.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDBrooking.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDBrooking.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDBrooking.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
