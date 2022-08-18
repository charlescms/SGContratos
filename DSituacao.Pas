{
 Classe da tabela: Situacao - Situação
}

unit DSituacao;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0017,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDSituacao = class(TTabela)
  public
    Contrato: TDSituacao_Contrato;
    NomeMix: TDSituacao_NomeMix;
    FORCOD: TDSituacao_FORCOD;
    RAZAO: TDSituacao_RAZAO;
    C_C: TDSituacao_C_C;
    QuantidadeTotal: TDSituacao_QuantidadeTotal;
    PrecoFOBTotal: TDSituacao_PrecoFOBTotal;
    ValorSCCTotal: TDSituacao_ValorSCCTotal;
    QUANTTOTALEXP: TDSituacao_QUANTTOTALEXP;
    ValorTotalExp: TDSituacao_ValorTotalExp;
    Navio: TDSituacao_Navio;
    DataEmbarque: TDSituacao_DataEmbarque;
    QuantidadeExp: TDSituacao_QuantidadeExp;
    Valor: TDSituacao_Valor;
    ID: TDSituacao_ID;
    NOME: TDSituacao_NOME;
    StatusCT: TDSituacao_StatusCT;
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

constructor TDSituacao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ContratoTransporte';
  Titulo           := 'Situação';
  Name             := 'DSituacao';
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
  DataSource.Name  := 'DsSituacao';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Situacao';
    // Exclusão de Registro
    DeleteSQL.Add('delete from ContratoTransporte');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Contrato = :OLD_Contrato');
    // Inserção de Registro
    InsertSQL.Add('insert into ContratoTransporte');
    InsertSQL.Add('  (');
    InsertSQL.Add('  Contrato,');
    InsertSQL.Add('  NomeMix,');
    InsertSQL.Add('  FORCOD,');
    InsertSQL.Add('  C_C,');
    InsertSQL.Add('  QuantidadeTotal,');
    InsertSQL.Add('  PrecoFOBTotal,');
    InsertSQL.Add('  ValorSCCTotal,');
    InsertSQL.Add('  QUANTTOTALEXP,');
    InsertSQL.Add('  ValorTotalExp,');
    InsertSQL.Add('  ID,');
    InsertSQL.Add('  StatusCT');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :NomeMix,');
    InsertSQL.Add('  :FORCOD,');
    InsertSQL.Add('  :C_C,');
    InsertSQL.Add('  :QuantidadeTotal,');
    InsertSQL.Add('  :PrecoFOBTotal,');
    InsertSQL.Add('  :ValorSCCTotal,');
    InsertSQL.Add('  :QUANTTOTALEXP,');
    InsertSQL.Add('  :ValorTotalExp,');
    InsertSQL.Add('  :ID,');
    InsertSQL.Add('  :StatusCT');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update ContratoTransporte');
    ModifySQL.Add('set');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  NomeMix = :NomeMix,');
    ModifySQL.Add('  FORCOD = :FORCOD,');
    ModifySQL.Add('  C_C = :C_C,');
    ModifySQL.Add('  QuantidadeTotal = :QuantidadeTotal,');
    ModifySQL.Add('  PrecoFOBTotal = :PrecoFOBTotal,');
    ModifySQL.Add('  ValorSCCTotal = :ValorSCCTotal,');
    ModifySQL.Add('  QUANTTOTALEXP = :QUANTTOTALEXP,');
    ModifySQL.Add('  ValorTotalExp = :ValorTotalExp,');
    ModifySQL.Add('  ID = :ID,');
    ModifySQL.Add('  StatusCT = :StatusCT');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  Situacao.Contrato AS Contrato,');
    RefreshSQL.Add('  Situacao.NomeMix AS NomeMix,');
    RefreshSQL.Add('  Situacao.FORCOD AS FORCOD,');
    RefreshSQL.Add('  Fornecedores.RAZAO AS RAZAO,');
    RefreshSQL.Add('  Situacao.C_C AS C_C,');
    RefreshSQL.Add('  Situacao.QuantidadeTotal AS QuantidadeTotal,');
    RefreshSQL.Add('  Situacao.PrecoFOBTotal AS PrecoFOBTotal,');
    RefreshSQL.Add('  Situacao.ValorSCCTotal AS ValorSCCTotal,');
    RefreshSQL.Add('  Situacao.QUANTTOTALEXP AS QUANTTOTALEXP,');
    RefreshSQL.Add('  Situacao.ValorTotalExp AS ValorTotalExp,');
    RefreshSQL.Add('  ExportadoTransito.Navio AS Navio,');
    RefreshSQL.Add('  ExportadoTransito.DataEmbarque AS DataEmbarque,');
    RefreshSQL.Add('  ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
    RefreshSQL.Add('  ExportadoTransito.Valor AS Valor,');
    RefreshSQL.Add('  Situacao.ID AS ID,');
    RefreshSQL.Add('  Tab_pais.NOME AS NOME,');
    RefreshSQL.Add('  Situacao.StatusCT AS StatusCT');
    // CRIANDO SUB-SELECT 1 
    RefreshSQL.Add('from ( SELECT '); // inicio sub-select 
    RefreshSQL.Add('  ContratoTransporte.Contrato AS Contrato,');
    RefreshSQL.Add('  ContratoTransporte.NomeMix AS NomeMix,');
    RefreshSQL.Add('  ContratoTransporte.FORCOD AS FORCOD,');
    RefreshSQL.Add('  ContratoTransporte.C_C AS C_C,');
    RefreshSQL.Add('  ContratoTransporte.QuantidadeTotal AS QuantidadeTotal,');
    RefreshSQL.Add('  ContratoTransporte.PrecoFOBTotal AS PrecoFOBTotal,');
    RefreshSQL.Add('  ContratoTransporte.ValorSCCTotal AS ValorSCCTotal,');
    RefreshSQL.Add('  ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,');
    RefreshSQL.Add('  ContratoTransporte.ValorTotalExp AS ValorTotalExp,');
    RefreshSQL.Add('  ContratoTransporte.ID AS ID,');
    RefreshSQL.Add('  ContratoTransporte.StatusCT AS StatusCT');
    RefreshSQL.Add('from ContratoTransporte'); // fim sub-select
    RefreshSQL.Add(' ) AS  Situacao' );
    RefreshSQL.Add('Left Outer Join Fornecedores on');
    RefreshSQL.Add('  Situacao.FORCOD = Fornecedores.FORCOD');
    RefreshSQL.Add('Left Outer Join ExportadoTransito on');
    RefreshSQL.Add('  Situacao.Contrato = ExportadoTransito.Contrato');
    RefreshSQL.Add('Left Outer Join Tab_pais on');
    RefreshSQL.Add('  Situacao.ID = Tab_pais.ID');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  Situacao.Contrato = :OLD_Contrato');
  end;
  TabelasExtras.Add('Fornecedores');
  TabelasExtras.Add('ExportadoTransito');
  TabelasExtras.Add('Tab_pais');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  Situacao.Contrato AS Contrato,');
  SqlPrincipal.Add('  Situacao.NomeMix AS NomeMix,');
  SqlPrincipal.Add('  Situacao.FORCOD AS FORCOD,');
  SqlPrincipal.Add('  Fornecedores.RAZAO AS RAZAO,');
  SqlPrincipal.Add('  Situacao.C_C AS C_C,');
  SqlPrincipal.Add('  Situacao.QuantidadeTotal AS QuantidadeTotal,');
  SqlPrincipal.Add('  Situacao.PrecoFOBTotal AS PrecoFOBTotal,');
  SqlPrincipal.Add('  Situacao.ValorSCCTotal AS ValorSCCTotal,');
  SqlPrincipal.Add('  Situacao.QUANTTOTALEXP AS QUANTTOTALEXP,');
  SqlPrincipal.Add('  Situacao.ValorTotalExp AS ValorTotalExp,');
  SqlPrincipal.Add('  ExportadoTransito.Navio AS Navio,');
  SqlPrincipal.Add('  ExportadoTransito.DataEmbarque AS DataEmbarque,');
  SqlPrincipal.Add('  ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
  SqlPrincipal.Add('  ExportadoTransito.Valor AS Valor,');
  SqlPrincipal.Add('  Situacao.ID AS ID,');
  SqlPrincipal.Add('  Tab_pais.NOME AS NOME,');
  SqlPrincipal.Add('  Situacao.StatusCT AS StatusCT');
  SqlPrincipal.Add('from ( select      ');  // inicio de sub-select
  SqlPrincipal.Add('       ContratoTransporte.Contrato AS Contrato,');
  SqlPrincipal.Add('       ContratoTransporte.NomeMix AS NomeMix,');
  SqlPrincipal.Add('       ContratoTransporte.FORCOD AS FORCOD,');
  SqlPrincipal.Add('       ContratoTransporte.C_C AS C_C,');
  SqlPrincipal.Add('       ContratoTransporte.QuantidadeTotal AS QuantidadeTotal,');
  SqlPrincipal.Add('       ContratoTransporte.PrecoFOBTotal AS PrecoFOBTotal,');
  SqlPrincipal.Add('       ContratoTransporte.ValorSCCTotal AS ValorSCCTotal,');
  SqlPrincipal.Add('       ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,');
  SqlPrincipal.Add('       ContratoTransporte.ValorTotalExp AS ValorTotalExp,');
  SqlPrincipal.Add('       ContratoTransporte.ID AS ID,');
  SqlPrincipal.Add('       ContratoTransporte.StatusCT AS StatusCT');
  SqlPrincipal.Add('       from  ContratoTransporte'); // fim de sub-select
  SqlPrincipal.Add('     ) as  Situacao');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join Fornecedores on');
  FiltroExtra.Add('  Situacao.FORCOD = Fornecedores.FORCOD');
  FiltroExtra.Add('Left Outer Join ExportadoTransito on');
  FiltroExtra.Add('  Situacao.Contrato = ExportadoTransito.Contrato');
  FiltroExtra.Add('Left Outer Join Tab_pais on');
  FiltroExtra.Add('  Situacao.ID = Tab_pais.ID');
  Sql.Add('order by Situacao.NomeMix,Situacao.Contrato');
  Contrato := TDSituacao_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  NomeMix := TDSituacao_NomeMix.Create(AOwner);
  NomeMix.Valor.DataSet := Self;
  FORCOD := TDSituacao_FORCOD.Create(AOwner);
  FORCOD.Valor.DataSet := Self;
  C_C := TDSituacao_C_C.Create(AOwner);
  C_C.Valor.DataSet := Self;
  PrecoFOBTotal := TDSituacao_PrecoFOBTotal.Create(AOwner);
  PrecoFOBTotal.Valor.DataSet := Self;
  ValorSCCTotal := TDSituacao_ValorSCCTotal.Create(AOwner);
  ValorSCCTotal.Valor.DataSet := Self;
  QUANTTOTALEXP := TDSituacao_QUANTTOTALEXP.Create(AOwner);
  QUANTTOTALEXP.Valor.DataSet := Self;
  RAZAO := TDSituacao_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  ValorTotalExp := TDSituacao_ValorTotalExp.Create(AOwner);
  ValorTotalExp.Valor.DataSet := Self;
  Navio := TDSituacao_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  DataEmbarque := TDSituacao_DataEmbarque.Create(AOwner);
  DataEmbarque.Valor.DataSet := Self;
  QuantidadeExp := TDSituacao_QuantidadeExp.Create(AOwner);
  QuantidadeExp.Valor.DataSet := Self;
  QuantidadeTotal := TDSituacao_QuantidadeTotal.Create(AOwner);
  QuantidadeTotal.Valor.DataSet := Self;
  Valor := TDSituacao_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  ID := TDSituacao_ID.Create(AOwner);
  ID.Valor.DataSet := Self;
  NOME := TDSituacao_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  StatusCT := TDSituacao_StatusCT.Create(AOwner);
  StatusCT.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(Contrato);
//CRIANDO CAMPOS 
  Campos.Add(Contrato);
  Campos.Add(NomeMix);
  Campos.Add(FORCOD);
  Campos.Add(RAZAO);
  Campos.Add(C_C);
  Campos.Add(QuantidadeTotal);
  Campos.Add(PrecoFOBTotal);
  Campos.Add(ValorSCCTotal);
  Campos.Add(QUANTTOTALEXP);
  Campos.Add(ValorTotalExp);
  Campos.Add(Navio);
  Campos.Add(DataEmbarque);
  Campos.Add(QuantidadeExp);
  Campos.Add(Valor);
  Campos.Add(ID);
  Campos.Add(NOME);
  Campos.Add(StatusCT);
  TituloIndices.Add('Ctto.');
  Indices.Add('Situacao.Contrato');
  Crescente.Add('S');
  TituloPrimaria := 'Ctto.';
  ChPrimaria     := 'Situacao.Contrato';
//CRIANDO TituloIndices 
  TituloIndice   := 'Producto,Ctto.';
  ChaveIndice    := 'Situacao.NomeMix,Situacao.Contrato';
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

procedure TDSituacao.CriaForeignKeys;
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

function TDSituacao.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDSituacao.ExclusaoCascata;
begin
end;

function TDSituacao.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if (UpperCase('FORCOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('ExportadoTransito') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DExportadoTransito, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('Tab_pais') then
    if (UpperCase('ID') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DTab_pais, ['ID'], [ID.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDSituacao.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ExportadoTransito') then
    if PTabela(TabGlobal.DExportadoTransito, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Tab_pais') then
    if PTabela(TabGlobal.DTab_pais, ['ID'], [ID.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DSituacao, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;
end;

procedure TDSituacao.CalculaCampos;
begin
end;

procedure TDSituacao.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDSituacao.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDSituacao.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDSituacao.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDSituacao.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDSituacao.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDSituacao.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDSituacao.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDSituacao.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
