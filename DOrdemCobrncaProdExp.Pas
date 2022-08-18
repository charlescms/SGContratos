{
 Classe da tabela: OrdemCobrncaProdExp - Produtos Exportados da Ord. Cobraça
}

unit DOrdemCobrncaProdExp;

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
  TDOrdemCobrncaProdExp = class(TTabela)
  public
    NumOrdCobranca: TDOrdemCobrncaProdExp_NumOrdCobranca;
    Contrato: TDOrdemCobrncaProdExp_Contrato;
    Seq: TDOrdemCobrncaProdExp_Seq;
    Navio: TDOrdemCobrncaProdExp_Navio;
    DataEmbarque: TDOrdemCobrncaProdExp_DataEmbarque;
    QuantidadeExp: TDOrdemCobrncaProdExp_QuantidadeExp;
    Fatura: TDOrdemCobrncaProdExp_Fatura;
    StDocumento: TDOrdemCobrncaProdExp_StDocumento;
    Cadastro: TDOrdemCobrncaProdExp_Cadastro;
    ETADestino: TDOrdemCobrncaProdExp_ETADestino;
    FormPago: TDOrdemCobrncaProdExp_FormPago;
    PrecoFOB: TDOrdemCobrncaProdExp_PrecoFOB;
    DataOrdCobranca: TDOrdemCobrncaProdExp_DataOrdCobranca;
    Rate: TDOrdemCobrncaProdExp_Rate;
    Status: TDOrdemCobrncaProdExp_Status;
    OBS: TDOrdemCobrncaProdExp_OBS;
    Comentario: TDOrdemCobrncaProdExp_Comentario;
    DataLiq: TDOrdemCobrncaProdExp_DataLiq;
    NomeMix: TDOrdemCobrncaProdExp_NomeMix;
    Comissao: TDOrdemCobrncaProdExp_Comissao;
    VALOR_EX: TDOrdemCobrncaProdExp_VALOR_EX;
    VALORDESCONTO_EX: TDOrdemCobrncaProdExp_VALORDESCONTO_EX;
    COMISAOSFATURA_EX: TDOrdemCobrncaProdExp_COMISAOSFATURA_EX;
    VALORCONVERTIDO_EX: TDOrdemCobrncaProdExp_VALORCONVERTIDO_EX;
    Valor: TDOrdemCobrncaProdExp_Valor;
    ValorDesconto: TDOrdemCobrncaProdExp_ValorDesconto;
    MOEDACOMISSAO: TDOrdemCobrncaProdExp_MOEDACOMISSAO;
    TAXACONVERCAO: TDOrdemCobrncaProdExp_TAXACONVERCAO;
    COMISAOSFATURA: TDOrdemCobrncaProdExp_COMISAOSFATURA;
    VALORCONVERTIDO: TDOrdemCobrncaProdExp_VALORCONVERTIDO;
    Usuario: TDOrdemCobrncaProdExp_Usuario;
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

constructor TDOrdemCobrncaProdExp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'OrdemCobrncaProdExp';
  Titulo           := 'Produtos Exportados da Ord. Cobraça';
  Name             := 'DOrdemCobrncaProdExp';
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
  DataSource.Name  := 'DsOrdemCobrncaProdExp';
  with UpdateSql do
  begin
    Name           := 'UpdSql_OrdemCobrncaProdExp';
    // Exclusão de Registro
    DeleteSQL.Add('delete from OrdemCobrncaProdExp');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  NumOrdCobranca = :OLD_NumOrdCobranca');
    DeleteSQL.Add('  and Contrato = :OLD_Contrato');
    DeleteSQL.Add('  and Seq = :OLD_Seq');
    // Inserção de Registro
    InsertSQL.Add('insert into OrdemCobrncaProdExp');
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
    ModifySQL.Add('update OrdemCobrncaProdExp');
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
    RefreshSQL.Add('  OrdemCobrncaProdExp.NumOrdCobranca AS NumOrdCobranca,');
    RefreshSQL.Add('  OrdemCobrncaProdExp.Contrato AS Contrato,');
    RefreshSQL.Add('  OrdemCobrncaProdExp.Seq AS Seq,');
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
    RefreshSQL.Add('  OrdemCobrncaProdExp.Valor AS Valor,');
    RefreshSQL.Add('  OrdemCobrncaProdExp.ValorDesconto AS ValorDesconto,');
    RefreshSQL.Add('  OrdemCobrncaProdExp.MOEDACOMISSAO AS MOEDACOMISSAO,');
    RefreshSQL.Add('  OrdemCobrncaProdExp.TAXACONVERCAO AS TAXACONVERCAO,');
    RefreshSQL.Add('  OrdemCobrncaProdExp.COMISAOSFATURA AS COMISAOSFATURA,');
    RefreshSQL.Add('  OrdemCobrncaProdExp.VALORCONVERTIDO AS VALORCONVERTIDO,');
    RefreshSQL.Add('  OrdemCobrncaProdExp.Usuario AS Usuario');
    RefreshSQL.Add('from OrdemCobrncaProdExp');
    RefreshSQL.Add('Left Outer Join ExportadoTransito on');
    RefreshSQL.Add('  OrdemCobrncaProdExp.Contrato = ExportadoTransito.Contrato');
    RefreshSQL.Add('  and OrdemCobrncaProdExp.Seq = ExportadoTransito.Seq');
    RefreshSQL.Add('Left Outer Join ContratoTransporte on');
    RefreshSQL.Add('  OrdemCobrncaProdExp.Contrato = ContratoTransporte.Contrato');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  OrdemCobrncaProdExp.NumOrdCobranca = :OLD_NumOrdCobranca');
    RefreshSQL.Add('  and OrdemCobrncaProdExp.Contrato = :OLD_Contrato');
    RefreshSQL.Add('  and OrdemCobrncaProdExp.Seq = :OLD_Seq');
  end;
  TabelasExtras.Add('ExportadoTransito');
  TabelasExtras.Add('ContratoTransporte');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  OrdemCobrncaProdExp.NumOrdCobranca AS NumOrdCobranca,');
  SqlPrincipal.Add('  OrdemCobrncaProdExp.Contrato AS Contrato,');
  SqlPrincipal.Add('  OrdemCobrncaProdExp.Seq AS Seq,');
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
  SqlPrincipal.Add('  OrdemCobrncaProdExp.Valor AS Valor,');
  SqlPrincipal.Add('  OrdemCobrncaProdExp.ValorDesconto AS ValorDesconto,');
  SqlPrincipal.Add('  OrdemCobrncaProdExp.MOEDACOMISSAO AS MOEDACOMISSAO,');
  SqlPrincipal.Add('  OrdemCobrncaProdExp.TAXACONVERCAO AS TAXACONVERCAO,');
  SqlPrincipal.Add('  OrdemCobrncaProdExp.COMISAOSFATURA AS COMISAOSFATURA,');
  SqlPrincipal.Add('  OrdemCobrncaProdExp.VALORCONVERTIDO AS VALORCONVERTIDO,');
  SqlPrincipal.Add('  OrdemCobrncaProdExp.Usuario AS Usuario');
  SqlPrincipal.Add('from OrdemCobrncaProdExp');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ExportadoTransito on');
  FiltroExtra.Add('  OrdemCobrncaProdExp.Contrato = ExportadoTransito.Contrato');
  FiltroExtra.Add('  and OrdemCobrncaProdExp.Seq = ExportadoTransito.Seq');
  FiltroExtra.Add('Left Outer Join ContratoTransporte on');
  FiltroExtra.Add('  OrdemCobrncaProdExp.Contrato = ContratoTransporte.Contrato');
  Sql.Add('order by OrdemCobrncaProdExp.NumOrdCobranca,OrdemCobrncaProdExp.Contrato,OrdemCobrncaProdExp.Seq');
  NumOrdCobranca := TDOrdemCobrncaProdExp_NumOrdCobranca.Create(AOwner);
  NumOrdCobranca.Valor.DataSet := Self;
  Contrato := TDOrdemCobrncaProdExp_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  Fatura := TDOrdemCobrncaProdExp_Fatura.Create(AOwner);
  Fatura.Valor.DataSet := Self;
  DataOrdCobranca := TDOrdemCobrncaProdExp_DataOrdCobranca.Create(AOwner);
  DataOrdCobranca.Valor.DataSet := Self;
  Status := TDOrdemCobrncaProdExp_Status.Create(AOwner);
  Status.Valor.DataSet := Self;
  MOEDACOMISSAO := TDOrdemCobrncaProdExp_MOEDACOMISSAO.Create(AOwner);
  MOEDACOMISSAO.Valor.DataSet := Self;
  Valor := TDOrdemCobrncaProdExp_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  TAXACONVERCAO := TDOrdemCobrncaProdExp_TAXACONVERCAO.Create(AOwner);
  TAXACONVERCAO.Valor.DataSet := Self;
  COMISAOSFATURA := TDOrdemCobrncaProdExp_COMISAOSFATURA.Create(AOwner);
  COMISAOSFATURA.Valor.DataSet := Self;
  VALORCONVERTIDO := TDOrdemCobrncaProdExp_VALORCONVERTIDO.Create(AOwner);
  VALORCONVERTIDO.Valor.DataSet := Self;
  Seq := TDOrdemCobrncaProdExp_Seq.Create(AOwner);
  Seq.Valor.DataSet := Self;
  Navio := TDOrdemCobrncaProdExp_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  DataEmbarque := TDOrdemCobrncaProdExp_DataEmbarque.Create(AOwner);
  DataEmbarque.Valor.DataSet := Self;
  ETADestino := TDOrdemCobrncaProdExp_ETADestino.Create(AOwner);
  ETADestino.Valor.DataSet := Self;
  QuantidadeExp := TDOrdemCobrncaProdExp_QuantidadeExp.Create(AOwner);
  QuantidadeExp.Valor.DataSet := Self;
  FormPago := TDOrdemCobrncaProdExp_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  PrecoFOB := TDOrdemCobrncaProdExp_PrecoFOB.Create(AOwner);
  PrecoFOB.Valor.DataSet := Self;
  StDocumento := TDOrdemCobrncaProdExp_StDocumento.Create(AOwner);
  StDocumento.Valor.DataSet := Self;
  OBS := TDOrdemCobrncaProdExp_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  Comentario := TDOrdemCobrncaProdExp_Comentario.Create(AOwner);
  Comentario.Valor.DataSet := Self;
  Rate := TDOrdemCobrncaProdExp_Rate.Create(AOwner);
  Rate.Valor.DataSet := Self;
  DataLiq := TDOrdemCobrncaProdExp_DataLiq.Create(AOwner);
  DataLiq.Valor.DataSet := Self;
  Cadastro := TDOrdemCobrncaProdExp_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  NomeMix := TDOrdemCobrncaProdExp_NomeMix.Create(AOwner);
  NomeMix.Valor.DataSet := Self;
  Comissao := TDOrdemCobrncaProdExp_Comissao.Create(AOwner);
  Comissao.Valor.DataSet := Self;
  ValorDesconto := TDOrdemCobrncaProdExp_ValorDesconto.Create(AOwner);
  ValorDesconto.Valor.DataSet := Self;
  VALOR_EX := TDOrdemCobrncaProdExp_VALOR_EX.Create(AOwner);
  VALOR_EX.Valor.DataSet := Self;
  VALORDESCONTO_EX := TDOrdemCobrncaProdExp_VALORDESCONTO_EX.Create(AOwner);
  VALORDESCONTO_EX.Valor.DataSet := Self;
  COMISAOSFATURA_EX := TDOrdemCobrncaProdExp_COMISAOSFATURA_EX.Create(AOwner);
  COMISAOSFATURA_EX.Valor.DataSet := Self;
  VALORCONVERTIDO_EX := TDOrdemCobrncaProdExp_VALORCONVERTIDO_EX.Create(AOwner);
  VALORCONVERTIDO_EX.Valor.DataSet := Self;
  Usuario := TDOrdemCobrncaProdExp_Usuario.Create(AOwner);
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
  Indices.Add('OrdemCobrncaProdExp.NumOrdCobranca,OrdemCobrncaProdExp.Contrato,OrdemCobrncaProdExp.Seq');
  Crescente.Add('S');
  TituloPrimaria := 'Número Ordem Cobrança,Contrato,Seq.';
  ChPrimaria     := 'OrdemCobrncaProdExp.NumOrdCobranca,OrdemCobrncaProdExp.Contrato,OrdemCobrncaProdExp.Seq';
//CRIANDO TituloIndices 
  TituloIndice   := 'Número Ordem Cobrança,Contrato,Seq.';
  ChaveIndice    := 'OrdemCobrncaProdExp.NumOrdCobranca,OrdemCobrncaProdExp.Contrato,OrdemCobrncaProdExp.Seq';
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

procedure TDOrdemCobrncaProdExp.CriaForeignKeys;
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

function TDOrdemCobrncaProdExp.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDOrdemCobrncaProdExp.ExclusaoCascata;
begin
end;

function TDOrdemCobrncaProdExp.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
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

function TDOrdemCobrncaProdExp.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ExportadoTransito') then
    if PTabela(TabGlobal.DExportadoTransito, ['Contrato','Seq'], [Contrato.Valor.Value,Seq.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('OrdemCobrncaProdExp') then
    if PTabela(TabGlobal.DOrdemCobrncaProdExp, ['NumOrdCobranca','Contrato','Seq'], [NumOrdCobranca.Valor.Value,Contrato.Valor.Value,Seq.Valor.Value]) then
      Result := True;
end;

procedure TDOrdemCobrncaProdExp.CalculaCampos;
begin
  VALORCONVERTIDO.Conteudo := CalculaDOrdemCobrncaProdExp_VALORCONVERTIDO(Self);
end;

procedure TDOrdemCobrncaProdExp.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDOrdemCobrncaProdExp.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('OrdemCobrncaProdExp.NumOrdCobranca = :OrdemCobranca_NumOrdCobranca');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  NumOrdCobranca.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDOrdemCobrncaProdExp.AtribuiMestre(DataSet: TDataSet);
begin
  NumOrdCobranca.Valor.Value := TabGlobal.DOrdemCobranca.NumOrdCobranca.Valor.Value;
end;

procedure TDOrdemCobrncaProdExp.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDOrdemCobrncaProdExp.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDOrdemCobrncaProdExp.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (NumOrdCobranca.SempreAtribui) and (NumOrdCobranca.AutoIncremento > 0) then
      AutoIncremento('NumOrdCobranca', True, NumOrdCobranca.AutoIncremento);
end;

procedure TDOrdemCobrncaProdExp.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDOrdemCobrncaProdExp.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDOrdemCobrncaProdExp.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
