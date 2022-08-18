{
 Classe da tabela: Informe - Informe
}

unit DInforme;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0007,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDInforme = class(TTabela)
  public
    Contrato: TDInforme_Contrato;
    NomeMix: TDInforme_NomeMix;
    RAZAO: TDInforme_RAZAO;
    NOME: TDInforme_NOME;
    C_C: TDInforme_C_C;
    FormPago: TDInforme_FormPago;
    QUANTIDADETOTAL: TDInforme_QUANTIDADETOTAL;
    FECHA_EMB: TDInforme_FECHA_EMB;
    PrecoFOB: TDInforme_PrecoFOB;
    PRECOFOBTOTAL: TDInforme_PRECOFOBTOTAL;
    PrecoSCC: TDInforme_PrecoSCC;
    VALORSCCTOTAL: TDInforme_VALORSCCTOTAL;
    NAVIO_BUQ: TDInforme_NAVIO_BUQ;
    Quantidade: TDInforme_Quantidade;
    Navio: TDInforme_Navio;
    QuantidadeExp: TDInforme_QuantidadeExp;
    Valor: TDInforme_Valor;
    DataEmbarque: TDInforme_DataEmbarque;
    Fatura: TDInforme_Fatura;
    ETADestino: TDInforme_ETADestino;
    OBS: TDInforme_OBS;
    FORCOD: TDInforme_FORCOD;
    ID: TDInforme_ID;
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

constructor TDInforme.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ContratoTransporte';
  Titulo           := 'Informe';
  Name             := 'DInforme';
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
  DataSource.Name  := 'DsInforme';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Informe';
    // Exclusão de Registro
    DeleteSQL.Add('delete from ContratoTransporte');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Contrato = :OLD_Contrato');
    // Inserção de Registro
    InsertSQL.Add('insert into ContratoTransporte');
    InsertSQL.Add('  (');
    InsertSQL.Add('  Contrato,');
    InsertSQL.Add('  NomeMix,');
    InsertSQL.Add('  C_C,');
    InsertSQL.Add('  QUANTIDADETOTAL,');
    InsertSQL.Add('  FECHA_EMB,');
    InsertSQL.Add('  PRECOFOBTOTAL,');
    InsertSQL.Add('  VALORSCCTOTAL,');
    InsertSQL.Add('  FORCOD,');
    InsertSQL.Add('  ID');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :NomeMix,');
    InsertSQL.Add('  :C_C,');
    InsertSQL.Add('  :QUANTIDADETOTAL,');
    InsertSQL.Add('  :FECHA_EMB,');
    InsertSQL.Add('  :PRECOFOBTOTAL,');
    InsertSQL.Add('  :VALORSCCTOTAL,');
    InsertSQL.Add('  :FORCOD,');
    InsertSQL.Add('  :ID');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update ContratoTransporte');
    ModifySQL.Add('set');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  NomeMix = :NomeMix,');
    ModifySQL.Add('  C_C = :C_C,');
    ModifySQL.Add('  QUANTIDADETOTAL = :QUANTIDADETOTAL,');
    ModifySQL.Add('  FECHA_EMB = :FECHA_EMB,');
    ModifySQL.Add('  PRECOFOBTOTAL = :PRECOFOBTOTAL,');
    ModifySQL.Add('  VALORSCCTOTAL = :VALORSCCTOTAL,');
    ModifySQL.Add('  FORCOD = :FORCOD,');
    ModifySQL.Add('  ID = :ID');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  ContratoTransporte.Contrato AS Contrato,');
    RefreshSQL.Add('  ContratoTransporte.NomeMix AS NomeMix,');
    RefreshSQL.Add('  Fornecedores.RAZAO AS RAZAO,');
    RefreshSQL.Add('  TAB_PAIS.NOME AS NOME,');
    RefreshSQL.Add('  ContratoTransporte.C_C AS C_C,');
    RefreshSQL.Add('  PrudutoContratoT.FormPago AS FormPago,');
    RefreshSQL.Add('  ContratoTransporte.QUANTIDADETOTAL AS QUANTIDADETOTAL,');
    RefreshSQL.Add('  ContratoTransporte.FECHA_EMB AS FECHA_EMB,');
    RefreshSQL.Add('  PrudutoContratoT.PrecoFOB AS PrecoFOB,');
    RefreshSQL.Add('  ContratoTransporte.PRECOFOBTOTAL AS PRECOFOBTOTAL,');
    RefreshSQL.Add('  PrudutoContratoT.PrecoSCC AS PrecoSCC,');
    RefreshSQL.Add('  ContratoTransporte.VALORSCCTOTAL AS VALORSCCTOTAL,');
    RefreshSQL.Add('  Boocking.Navio AS NAVIO_BUQ,');
    RefreshSQL.Add('  Boocking.Quantidade AS Quantidade,');
    RefreshSQL.Add('  ExpotadoTransito.Navio AS Navio,');
    RefreshSQL.Add('  ExpotadoTransito.QuantidadeExp AS QuantidadeExp,');
    RefreshSQL.Add('  ExpotadoTransito.Valor AS Valor,');
    RefreshSQL.Add('  ExpotadoTransito.DataEmbarque AS DataEmbarque,');
    RefreshSQL.Add('  ExpotadoTransito.Fatura AS Fatura,');
    RefreshSQL.Add('  ExpotadoTransito.ETADestino AS ETADestino,');
    RefreshSQL.Add('  ExpotadoTransito.OBS AS OBS,');
    RefreshSQL.Add('  ContratoTransporte.FORCOD AS FORCOD,');
    RefreshSQL.Add('  ContratoTransporte.ID AS ID');
    RefreshSQL.Add('from ContratoTransporte');
    RefreshSQL.Add('Left Outer Join ExpotadoTransito on');
    RefreshSQL.Add('  ContratoTransporte.Contrato = ExpotadoTransito.Contrato');
    RefreshSQL.Add('Left Outer Join Boocking on');
    RefreshSQL.Add('  ContratoTransporte.Contrato = Boocking.Contrato');
    RefreshSQL.Add('Left Outer Join Fornecedores on');
    RefreshSQL.Add('  ContratoTransporte.FORCOD = Fornecedores.FORCOD');
    RefreshSQL.Add('Left Outer Join TAB_PAIS on');
    RefreshSQL.Add('  ContratoTransporte.ID = TAB_PAIS.ID');
    RefreshSQL.Add('Left Outer Join PrudutoContratoT on');
    RefreshSQL.Add('  ContratoTransporte.Contrato = PrudutoContratoT.Contrato');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  ContratoTransporte.Contrato = :OLD_Contrato');
  end;
  TabelasExtras.Add('ExpotadoTransito');
  TabelasExtras.Add('Boocking');
  TabelasExtras.Add('Fornecedores');
  TabelasExtras.Add('TAB_PAIS');
  TabelasExtras.Add('PrudutoContratoT');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  ContratoTransporte.Contrato AS Contrato,');
  SqlPrincipal.Add('  ContratoTransporte.NomeMix AS NomeMix,');
  SqlPrincipal.Add('  Fornecedores.RAZAO AS RAZAO,');
  SqlPrincipal.Add('  TAB_PAIS.NOME AS NOME,');
  SqlPrincipal.Add('  ContratoTransporte.C_C AS C_C,');
  SqlPrincipal.Add('  PrudutoContratoT.FormPago AS FormPago,');
  SqlPrincipal.Add('  ContratoTransporte.QUANTIDADETOTAL AS QUANTIDADETOTAL,');
  SqlPrincipal.Add('  ContratoTransporte.FECHA_EMB AS FECHA_EMB,');
  SqlPrincipal.Add('  PrudutoContratoT.PrecoFOB AS PrecoFOB,');
  SqlPrincipal.Add('  ContratoTransporte.PRECOFOBTOTAL AS PRECOFOBTOTAL,');
  SqlPrincipal.Add('  PrudutoContratoT.PrecoSCC AS PrecoSCC,');
  SqlPrincipal.Add('  ContratoTransporte.VALORSCCTOTAL AS VALORSCCTOTAL,');
  SqlPrincipal.Add('  Boocking.Navio AS NAVIO_BUQ,');
  SqlPrincipal.Add('  Boocking.Quantidade AS Quantidade,');
  SqlPrincipal.Add('  ExpotadoTransito.Navio AS Navio,');
  SqlPrincipal.Add('  ExpotadoTransito.QuantidadeExp AS QuantidadeExp,');
  SqlPrincipal.Add('  ExpotadoTransito.Valor AS Valor,');
  SqlPrincipal.Add('  ExpotadoTransito.DataEmbarque AS DataEmbarque,');
  SqlPrincipal.Add('  ExpotadoTransito.Fatura AS Fatura,');
  SqlPrincipal.Add('  ExpotadoTransito.ETADestino AS ETADestino,');
  SqlPrincipal.Add('  ExpotadoTransito.OBS AS OBS,');
  SqlPrincipal.Add('  ContratoTransporte.FORCOD AS FORCOD,');
  SqlPrincipal.Add('  ContratoTransporte.ID AS ID');
  SqlPrincipal.Add('from ContratoTransporte');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ExpotadoTransito on');
  FiltroExtra.Add('  ContratoTransporte.Contrato = ExpotadoTransito.Contrato');
  FiltroExtra.Add('Left Outer Join Boocking on');
  FiltroExtra.Add('  ContratoTransporte.Contrato = Boocking.Contrato');
  FiltroExtra.Add('Left Outer Join Fornecedores on');
  FiltroExtra.Add('  ContratoTransporte.FORCOD = Fornecedores.FORCOD');
  FiltroExtra.Add('Left Outer Join TAB_PAIS on');
  FiltroExtra.Add('  ContratoTransporte.ID = TAB_PAIS.ID');
  FiltroExtra.Add('Left Outer Join PrudutoContratoT on');
  FiltroExtra.Add('  ContratoTransporte.Contrato = PrudutoContratoT.Contrato');
  Sql.Add('order by ContratoTransporte.Contrato');
  
  Contrato := TDInforme_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  NomeMix := TDInforme_NomeMix.Create(AOwner);
  NomeMix.Valor.DataSet := Self;
  RAZAO := TDInforme_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  NOME := TDInforme_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  C_C := TDInforme_C_C.Create(AOwner);
  C_C.Valor.DataSet := Self;
  FormPago := TDInforme_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  QUANTIDADETOTAL := TDInforme_QUANTIDADETOTAL.Create(AOwner);
  QUANTIDADETOTAL.Valor.DataSet := Self;
  PrecoFOB := TDInforme_PrecoFOB.Create(AOwner);
  PrecoFOB.Valor.DataSet := Self;
  PRECOFOBTOTAL := TDInforme_PRECOFOBTOTAL.Create(AOwner);
  PRECOFOBTOTAL.Valor.DataSet := Self;
  PrecoSCC := TDInforme_PrecoSCC.Create(AOwner);
  PrecoSCC.Valor.DataSet := Self;
  VALORSCCTOTAL := TDInforme_VALORSCCTOTAL.Create(AOwner);
  VALORSCCTOTAL.Valor.DataSet := Self;
  NAVIO_BUQ := TDInforme_NAVIO_BUQ.Create(AOwner);
  NAVIO_BUQ.Valor.DataSet := Self;
  Quantidade := TDInforme_Quantidade.Create(AOwner);
  Quantidade.Valor.DataSet := Self;
  Navio := TDInforme_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  QuantidadeExp := TDInforme_QuantidadeExp.Create(AOwner);
  QuantidadeExp.Valor.DataSet := Self;
  Valor := TDInforme_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  DataEmbarque := TDInforme_DataEmbarque.Create(AOwner);
  DataEmbarque.Valor.DataSet := Self;
  Fatura := TDInforme_Fatura.Create(AOwner);
  Fatura.Valor.DataSet := Self;
  ETADestino := TDInforme_ETADestino.Create(AOwner);
  ETADestino.Valor.DataSet := Self;
  OBS := TDInforme_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  FORCOD := TDInforme_FORCOD.Create(AOwner);
  FORCOD.Valor.DataSet := Self;
  ID := TDInforme_ID.Create(AOwner);
  ID.Valor.DataSet := Self;
  FECHA_EMB := TDInforme_FECHA_EMB.Create(AOwner);
  FECHA_EMB.Valor.DataSet := Self;
  
  ChavePrimaria.Add(Contrato);
  Campos.Add(Contrato);
  Campos.Add(NomeMix);
  Campos.Add(RAZAO);
  Campos.Add(NOME);
  Campos.Add(C_C);
  Campos.Add(FormPago);
  Campos.Add(QUANTIDADETOTAL);
  Campos.Add(FECHA_EMB);
  Campos.Add(PrecoFOB);
  Campos.Add(PRECOFOBTOTAL);
  Campos.Add(PrecoSCC);
  Campos.Add(VALORSCCTOTAL);
  Campos.Add(NAVIO_BUQ);
  Campos.Add(Quantidade);
  Campos.Add(Navio);
  Campos.Add(QuantidadeExp);
  Campos.Add(Valor);
  Campos.Add(DataEmbarque);
  Campos.Add(Fatura);
  Campos.Add(ETADestino);
  Campos.Add(OBS);
  Campos.Add(FORCOD);
  Campos.Add(ID);
  TituloIndices.Add('Contrato');
  Indices.Add('ContratoTransporte.Contrato');
  Crescente.Add('S');
  TituloPrimaria := 'Contrato';
  ChPrimaria     := 'ContratoTransporte.Contrato';
  TituloIndice   := 'Contrato';
  ChaveIndice    := 'ContratoTransporte.Contrato';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;

procedure TDInforme.CriaForeignKeys;
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

function TDInforme.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDInforme.ExclusaoCascata;
begin
end;

function TDInforme.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if (UpperCase('FORCOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('TAB_PAIS') then
    if (UpperCase('ID') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DTAB_PAIS, ['ID'], [ID.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('PrudutoContratoT') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DProdutoContratoT, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('Boocking') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DBoocking, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('ExpotadoTransito') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DExpotadoTransito, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDInforme.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('TAB_PAIS') then
    if PTabela(TabGlobal.DTAB_PAIS, ['ID'], [ID.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('PrudutoContratoT') then
    if PTabela(TabGlobal.DProdutoContratoT, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Boocking') then
    if PTabela(TabGlobal.DBoocking, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ExpotadoTransito') then
    if PTabela(TabGlobal.DExpotadoTransito, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DInforme, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;
end;

procedure TDInforme.CalculaCampos;
begin
end;

procedure TDInforme.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDInforme.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDInforme.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDInforme.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDInforme.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDInforme.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDInforme.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDInforme.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDInforme.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
