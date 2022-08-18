{
 Classe da tabela: OrdemCobrancaProdExp - Produtos Exportados da Ord. Cobraça
}

unit DOrdemCobrancaProdExp;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0011,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDOrdemCobrancaProdExp = class(TTabela)
  public
    NumOrdCobranca: TDOrdemCobrancaProdExp_NumOrdCobranca;
    Contrato: TDOrdemCobrancaProdExp_Contrato;
    Seq: TDOrdemCobrancaProdExp_Seq;
    Navio: TDOrdemCobrancaProdExp_Navio;
    DataEmbarque: TDOrdemCobrancaProdExp_DataEmbarque;
    QuantidadeExp: TDOrdemCobrancaProdExp_QuantidadeExp;
    Fatura: TDOrdemCobrancaProdExp_Fatura;
    StDocumento: TDOrdemCobrancaProdExp_StDocumento;
    Cadastro: TDOrdemCobrancaProdExp_Cadastro;
    ETADestino: TDOrdemCobrancaProdExp_ETADestino;
    FormPago: TDOrdemCobrancaProdExp_FormPago;
    PrecoFOB: TDOrdemCobrancaProdExp_PrecoFOB;
    DataOrdCobranca: TDOrdemCobrancaProdExp_DataOrdCobranca;
    Rate: TDOrdemCobrancaProdExp_Rate;
    Status: TDOrdemCobrancaProdExp_Status;
    OBS: TDOrdemCobrancaProdExp_OBS;
    Comentario: TDOrdemCobrancaProdExp_Comentario;
    DataLiq: TDOrdemCobrancaProdExp_DataLiq;
    NomeMix: TDOrdemCobrancaProdExp_NomeMix;
    Comissao: TDOrdemCobrancaProdExp_Comissao;
    VALOR_EX: TDOrdemCobrancaProdExp_VALOR_EX;
    VALORDESCONTO_EX: TDOrdemCobrancaProdExp_VALORDESCONTO_EX;
    COMISAOSFATURA_EX: TDOrdemCobrancaProdExp_COMISAOSFATURA_EX;
    VALORCONVERTIDO_EX: TDOrdemCobrancaProdExp_VALORCONVERTIDO_EX;
    Valor: TDOrdemCobrancaProdExp_Valor;
    ValorDesconto: TDOrdemCobrancaProdExp_ValorDesconto;
    MOEDACOMISSAO: TDOrdemCobrancaProdExp_MOEDACOMISSAO;
    TAXACONVERCAO: TDOrdemCobrancaProdExp_TAXACONVERCAO;
    COMISAOSFATURA: TDOrdemCobrancaProdExp_COMISAOSFATURA;
    VALORCONVERTIDO: TDOrdemCobrancaProdExp_VALORCONVERTIDO;
    Usuario: TDOrdemCobrancaProdExp_Usuario;
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

constructor TDOrdemCobrancaProdExp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'OrdemCobrancaProdExp';
  Titulo           := 'Produtos Exportados da Ord. Cobraça';
  Name             := 'DOrdemCobrancaProdExp';
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
  DataSource.Name  := 'DsOrdemCobrancaProdExp';
  with UpdateSql do
  begin
    Name           := 'UpdSql_OrdemCobrancaProdExp';
    // Exclusão de Registro
    DeleteSQL.Add('delete from OrdemCobrancaProdExp');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  NumOrdCobranca = :OLD_NumOrdCobranca');
    DeleteSQL.Add('  and Contrato = :OLD_Contrato');
    DeleteSQL.Add('  and Seq = :OLD_Seq');
    // Inserção de Registro
    InsertSQL.Add('insert into OrdemCobrancaProdExp');
    InsertSQL.Add('  (');
    InsertSQL.Add('  NumOrdCobranca,');
    InsertSQL.Add('  Contrato,');
    InsertSQL.Add('  Seq,');
    InsertSQL.Add('  Valor,');
    InsertSQL.Add('  ValorDesconto,');
    InsertSQL.Add('  MOEDACOMISSAO,');
    InsertSQL.Add('  TAXACONVERCAO,');
    InsertSQL.Add('  COMISAOSFATURA,');
    InsertSQL.Add('  VALORCONVERTIDO,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :NumOrdCobranca,');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :Seq,');
    InsertSQL.Add('  :Valor,');
    InsertSQL.Add('  :ValorDesconto,');
    InsertSQL.Add('  :MOEDACOMISSAO,');
    InsertSQL.Add('  :TAXACONVERCAO,');
    InsertSQL.Add('  :COMISAOSFATURA,');
    InsertSQL.Add('  :VALORCONVERTIDO,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update OrdemCobrancaProdExp');
    ModifySQL.Add('set');
    ModifySQL.Add('  NumOrdCobranca = :NumOrdCobranca,');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  Seq = :Seq,');
    ModifySQL.Add('  Valor = :Valor,');
    ModifySQL.Add('  ValorDesconto = :ValorDesconto,');
    ModifySQL.Add('  MOEDACOMISSAO = :MOEDACOMISSAO,');
    ModifySQL.Add('  TAXACONVERCAO = :TAXACONVERCAO,');
    ModifySQL.Add('  COMISAOSFATURA = :COMISAOSFATURA,');
    ModifySQL.Add('  VALORCONVERTIDO = :VALORCONVERTIDO,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  NumOrdCobranca = :OLD_NumOrdCobranca');
    ModifySQL.Add('  and Contrato = :OLD_Contrato');
    ModifySQL.Add('  and Seq = :OLD_Seq');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  OrdemCobrancaProdExp.NumOrdCobranca AS NumOrdCobranca,');
    RefreshSQL.Add('  OrdemCobrancaProdExp.Contrato AS Contrato,');
    RefreshSQL.Add('  OrdemCobrancaProdExp.Seq AS Seq,');
    RefreshSQL.Add('  ExportadoTransito.Navio AS Navio,');
    RefreshSQL.Add('  ExportadoTransito.DataEmbarque AS DataEmbarque,');
    RefreshSQL.Add('  ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
    RefreshSQL.Add('  ExportadoTransito.Fatura AS Fatura,');
    RefreshSQL.Add('  ExportadoTransito.StDocumento AS StDocumento,');
    RefreshSQL.Add('  ExportadoTransito.Cadastro AS Cadastro,');
    RefreshSQL.Add('  ExportadoTransito.ETADestino AS ETADestino,');
    RefreshSQL.Add('  ExportadoTransito.FormPago AS FormPago,');
    RefreshSQL.Add('  ExportadoTransito.PrecoFOB AS PrecoFOB,');
    RefreshSQL.Add('  ExportadoTransito.DataOrdCobranca AS DataOrdCobranca,');
    RefreshSQL.Add('  ExportadoTransito.Rate AS Rate,');
    RefreshSQL.Add('  ExportadoTransito.Status AS Status,');
    RefreshSQL.Add('  ExportadoTransito.OBS AS OBS,');
    RefreshSQL.Add('  ExportadoTransito.Comentario AS Comentario,');
    RefreshSQL.Add('  ExportadoTransito.DataLiq AS DataLiq,');
    RefreshSQL.Add('  ContratoTransporte.NomeMix AS NomeMix,');
    RefreshSQL.Add('  ContratoTransporte.Comissao AS Comissao,');
    RefreshSQL.Add('  ExportadoTransito.Valor AS VALOR_EX,');
    RefreshSQL.Add('  ExportadoTransito.ValorDesconto AS VALORDESCONTO_EX,');
    RefreshSQL.Add('  OrdemCobrancaProdExp.Valor AS Valor,');
    RefreshSQL.Add('  OrdemCobrancaProdExp.ValorDesconto AS ValorDesconto,');
    RefreshSQL.Add('  OrdemCobrancaProdExp.MOEDACOMISSAO AS MOEDACOMISSAO,');
    RefreshSQL.Add('  OrdemCobrancaProdExp.TAXACONVERCAO AS TAXACONVERCAO,');
    RefreshSQL.Add('  OrdemCobrancaProdExp.COMISAOSFATURA AS COMISAOSFATURA,');
    RefreshSQL.Add('  OrdemCobrancaProdExp.VALORCONVERTIDO AS VALORCONVERTIDO,');
    RefreshSQL.Add('  OrdemCobrancaProdExp.Usuario AS Usuario');
    RefreshSQL.Add('from OrdemCobrancaProdExp');
    RefreshSQL.Add('Left Outer Join ExportadoTransito on');
    RefreshSQL.Add('  OrdemCobrancaProdExp.Contrato = ExportadoTransito.Contrato');
    RefreshSQL.Add('  and OrdemCobrancaProdExp.Seq = ExportadoTransito.Seq');
    RefreshSQL.Add('Left Outer Join ContratoTransporte on');
    RefreshSQL.Add('  OrdemCobrancaProdExp.Contrato = ContratoTransporte.Contrato');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  OrdemCobrancaProdExp.NumOrdCobranca = :OLD_NumOrdCobranca');
    RefreshSQL.Add('  and OrdemCobrancaProdExp.Contrato = :OLD_Contrato');
    RefreshSQL.Add('  and OrdemCobrancaProdExp.Seq = :OLD_Seq');
  end;
  TabelasExtras.Add('ExportadoTransito');
  TabelasExtras.Add('ContratoTransporte');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  OrdemCobrancaProdExp.NumOrdCobranca AS NumOrdCobranca,');
  SqlPrincipal.Add('  OrdemCobrancaProdExp.Contrato AS Contrato,');
  SqlPrincipal.Add('  OrdemCobrancaProdExp.Seq AS Seq,');
  SqlPrincipal.Add('  ExportadoTransito.Navio AS Navio,');
  SqlPrincipal.Add('  ExportadoTransito.DataEmbarque AS DataEmbarque,');
  SqlPrincipal.Add('  ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
  SqlPrincipal.Add('  ExportadoTransito.Fatura AS Fatura,');
  SqlPrincipal.Add('  ExportadoTransito.StDocumento AS StDocumento,');
  SqlPrincipal.Add('  ExportadoTransito.Cadastro AS Cadastro,');
  SqlPrincipal.Add('  ExportadoTransito.ETADestino AS ETADestino,');
  SqlPrincipal.Add('  ExportadoTransito.FormPago AS FormPago,');
  SqlPrincipal.Add('  ExportadoTransito.PrecoFOB AS PrecoFOB,');
  SqlPrincipal.Add('  ExportadoTransito.DataOrdCobranca AS DataOrdCobranca,');
  SqlPrincipal.Add('  ExportadoTransito.Rate AS Rate,');
  SqlPrincipal.Add('  ExportadoTransito.Status AS Status,');
  SqlPrincipal.Add('  ExportadoTransito.OBS AS OBS,');
  SqlPrincipal.Add('  ExportadoTransito.Comentario AS Comentario,');
  SqlPrincipal.Add('  ExportadoTransito.DataLiq AS DataLiq,');
  SqlPrincipal.Add('  ContratoTransporte.NomeMix AS NomeMix,');
  SqlPrincipal.Add('  ContratoTransporte.Comissao AS Comissao,');
  SqlPrincipal.Add('  ExportadoTransito.Valor AS VALOR_EX,');
  SqlPrincipal.Add('  ExportadoTransito.ValorDesconto AS VALORDESCONTO_EX,');
  SqlPrincipal.Add('  OrdemCobrancaProdExp.Valor AS Valor,');
  SqlPrincipal.Add('  OrdemCobrancaProdExp.ValorDesconto AS ValorDesconto,');
  SqlPrincipal.Add('  OrdemCobrancaProdExp.MOEDACOMISSAO AS MOEDACOMISSAO,');
  SqlPrincipal.Add('  OrdemCobrancaProdExp.TAXACONVERCAO AS TAXACONVERCAO,');
  SqlPrincipal.Add('  OrdemCobrancaProdExp.COMISAOSFATURA AS COMISAOSFATURA,');
  SqlPrincipal.Add('  OrdemCobrancaProdExp.VALORCONVERTIDO AS VALORCONVERTIDO,');
  SqlPrincipal.Add('  OrdemCobrancaProdExp.Usuario AS Usuario');
  SqlPrincipal.Add('from OrdemCobrancaProdExp');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ExportadoTransito on');
  FiltroExtra.Add('  OrdemCobrancaProdExp.Contrato = ExportadoTransito.Contrato');
  FiltroExtra.Add('  and OrdemCobrancaProdExp.Seq = ExportadoTransito.Seq');
  FiltroExtra.Add('Left Outer Join ContratoTransporte on');
  FiltroExtra.Add('  OrdemCobrancaProdExp.Contrato = ContratoTransporte.Contrato');
  Sql.Add('order by OrdemCobrancaProdExp.NumOrdCobranca,OrdemCobrancaProdExp.Contrato,OrdemCobrancaProdExp.Seq');
  NumOrdCobranca := TDOrdemCobrancaProdExp_NumOrdCobranca.Create(AOwner);
  NumOrdCobranca.Valor.DataSet := Self;
  Contrato := TDOrdemCobrancaProdExp_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  Fatura := TDOrdemCobrancaProdExp_Fatura.Create(AOwner);
  Fatura.Valor.DataSet := Self;
  DataOrdCobranca := TDOrdemCobrancaProdExp_DataOrdCobranca.Create(AOwner);
  DataOrdCobranca.Valor.DataSet := Self;
  Status := TDOrdemCobrancaProdExp_Status.Create(AOwner);
  Status.Valor.DataSet := Self;
  MOEDACOMISSAO := TDOrdemCobrancaProdExp_MOEDACOMISSAO.Create(AOwner);
  MOEDACOMISSAO.Valor.DataSet := Self;
  Valor := TDOrdemCobrancaProdExp_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  TAXACONVERCAO := TDOrdemCobrancaProdExp_TAXACONVERCAO.Create(AOwner);
  TAXACONVERCAO.Valor.DataSet := Self;
  COMISAOSFATURA := TDOrdemCobrancaProdExp_COMISAOSFATURA.Create(AOwner);
  COMISAOSFATURA.Valor.DataSet := Self;
  VALORCONVERTIDO := TDOrdemCobrancaProdExp_VALORCONVERTIDO.Create(AOwner);
  VALORCONVERTIDO.Valor.DataSet := Self;
  Seq := TDOrdemCobrancaProdExp_Seq.Create(AOwner);
  Seq.Valor.DataSet := Self;
  Navio := TDOrdemCobrancaProdExp_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  DataEmbarque := TDOrdemCobrancaProdExp_DataEmbarque.Create(AOwner);
  DataEmbarque.Valor.DataSet := Self;
  ETADestino := TDOrdemCobrancaProdExp_ETADestino.Create(AOwner);
  ETADestino.Valor.DataSet := Self;
  QuantidadeExp := TDOrdemCobrancaProdExp_QuantidadeExp.Create(AOwner);
  QuantidadeExp.Valor.DataSet := Self;
  FormPago := TDOrdemCobrancaProdExp_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  PrecoFOB := TDOrdemCobrancaProdExp_PrecoFOB.Create(AOwner);
  PrecoFOB.Valor.DataSet := Self;
  StDocumento := TDOrdemCobrancaProdExp_StDocumento.Create(AOwner);
  StDocumento.Valor.DataSet := Self;
  OBS := TDOrdemCobrancaProdExp_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  Comentario := TDOrdemCobrancaProdExp_Comentario.Create(AOwner);
  Comentario.Valor.DataSet := Self;
  Rate := TDOrdemCobrancaProdExp_Rate.Create(AOwner);
  Rate.Valor.DataSet := Self;
  DataLiq := TDOrdemCobrancaProdExp_DataLiq.Create(AOwner);
  DataLiq.Valor.DataSet := Self;
  Cadastro := TDOrdemCobrancaProdExp_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  NomeMix := TDOrdemCobrancaProdExp_NomeMix.Create(AOwner);
  NomeMix.Valor.DataSet := Self;
  Comissao := TDOrdemCobrancaProdExp_Comissao.Create(AOwner);
  Comissao.Valor.DataSet := Self;
  ValorDesconto := TDOrdemCobrancaProdExp_ValorDesconto.Create(AOwner);
  ValorDesconto.Valor.DataSet := Self;
  VALOR_EX := TDOrdemCobrancaProdExp_VALOR_EX.Create(AOwner);
  VALOR_EX.Valor.DataSet := Self;
  VALORDESCONTO_EX := TDOrdemCobrancaProdExp_VALORDESCONTO_EX.Create(AOwner);
  VALORDESCONTO_EX.Valor.DataSet := Self;
  COMISAOSFATURA_EX := TDOrdemCobrancaProdExp_COMISAOSFATURA_EX.Create(AOwner);
  COMISAOSFATURA_EX.Valor.DataSet := Self;
  VALORCONVERTIDO_EX := TDOrdemCobrancaProdExp_VALORCONVERTIDO_EX.Create(AOwner);
  VALORCONVERTIDO_EX.Valor.DataSet := Self;
  Usuario := TDOrdemCobrancaProdExp_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(NumOrdCobranca);
  ChavePrimaria.Add(Contrato);
  ChavePrimaria.Add(Seq);
//CRIANDO CAMPOS 
  Campos.Add(NumOrdCobranca);
  Campos.Add(Contrato);
  Campos.Add(Seq);
  Campos.Add(Navio);
  Campos.Add(DataEmbarque);
  Campos.Add(QuantidadeExp);
  Campos.Add(Fatura);
  Campos.Add(StDocumento);
  Campos.Add(Cadastro);
  Campos.Add(ETADestino);
  Campos.Add(FormPago);
  Campos.Add(PrecoFOB);
  Campos.Add(DataOrdCobranca);
  Campos.Add(Rate);
  Campos.Add(Status);
  Campos.Add(OBS);
  Campos.Add(Comentario);
  Campos.Add(DataLiq);
  Campos.Add(NomeMix);
  Campos.Add(Comissao);
  Campos.Add(VALOR_EX);
  Campos.Add(VALORDESCONTO_EX);
  Campos.Add(COMISAOSFATURA_EX);
  Campos.Add(VALORCONVERTIDO_EX);
  Campos.Add(Valor);
  Campos.Add(ValorDesconto);
  Campos.Add(MOEDACOMISSAO);
  Campos.Add(TAXACONVERCAO);
  Campos.Add(COMISAOSFATURA);
  Campos.Add(VALORCONVERTIDO);
  Campos.Add(Usuario);
  TituloIndices.Add('Número Ordem Cobrança,Contrato,Seq.');
  Indices.Add('OrdemCobrancaProdExp.NumOrdCobranca,OrdemCobrancaProdExp.Contrato,OrdemCobrancaProdExp.Seq');
  Crescente.Add('S');
  TituloPrimaria := 'Número Ordem Cobrança,Contrato,Seq.';
  ChPrimaria     := 'OrdemCobrancaProdExp.NumOrdCobranca,OrdemCobrancaProdExp.Contrato,OrdemCobrancaProdExp.Seq';
//CRIANDO TituloIndices 
  TituloIndice   := 'Número Ordem Cobrança,Contrato,Seq.';
  ChaveIndice    := 'OrdemCobrancaProdExp.NumOrdCobranca,OrdemCobrancaProdExp.Contrato,OrdemCobrancaProdExp.Seq';
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

procedure TDOrdemCobrancaProdExp.CriaForeignKeys;
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

function TDOrdemCobrancaProdExp.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDOrdemCobrancaProdExp.ExclusaoCascata;
begin
end;

function TDOrdemCobrancaProdExp.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ExportadoTransito') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) or (UpperCase('Seq') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DExportadoTransito, ['Contrato','Seq'], [Contrato.Valor.Value,Seq.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDOrdemCobrancaProdExp.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ExportadoTransito') then
    if PTabela(TabGlobal.DExportadoTransito, ['Contrato','Seq'], [Contrato.Valor.Value,Seq.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('OrdemCobrancaProdExp') then
    if PTabela(TabGlobal.DOrdemCobrancaProdExp, ['NumOrdCobranca','Contrato','Seq'], [NumOrdCobranca.Valor.Value,Contrato.Valor.Value,Seq.Valor.Value]) then
      Result := True;
end;

procedure TDOrdemCobrancaProdExp.CalculaCampos;
begin
  VALORCONVERTIDO.Conteudo := CalculaDOrdemCobrancaProdExp_VALORCONVERTIDO(Self);
end;

procedure TDOrdemCobrancaProdExp.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDOrdemCobrancaProdExp.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('OrdemCobrancaProdExp.NumOrdCobranca = :OrdemCobranca_NumOrdCobranca');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  NumOrdCobranca.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDOrdemCobrancaProdExp.AtribuiMestre(DataSet: TDataSet);
begin
  NumOrdCobranca.Valor.Value := TabGlobal.DOrdemCobranca.NumOrdCobranca.Valor.Value;
end;

procedure TDOrdemCobrancaProdExp.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDOrdemCobrancaProdExp.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDOrdemCobrancaProdExp.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (NumOrdCobranca.SempreAtribui) and (NumOrdCobranca.AutoIncremento > 0) then
      AutoIncremento('NumOrdCobranca', True, NumOrdCobranca.AutoIncremento);
end;

procedure TDOrdemCobrancaProdExp.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDOrdemCobrancaProdExp.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDOrdemCobrancaProdExp.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
