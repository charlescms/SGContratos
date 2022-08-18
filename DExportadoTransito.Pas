{
 Classe da tabela: ExportadoTransito - Exportado Transito
}

unit DExportadoTransito;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0005,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDExportadoTransito = class(TTabela)
  public
    Contrato: TDExportadoTransito_Contrato;
    Seq: TDExportadoTransito_Seq;
    Navio: TDExportadoTransito_Navio;
    Cadastro: TDExportadoTransito_Cadastro;
    DataEmbarque: TDExportadoTransito_DataEmbarque;
    ETADestino: TDExportadoTransito_ETADestino;
    Fatura: TDExportadoTransito_Fatura;
    QuantidadeExp: TDExportadoTransito_QuantidadeExp;
    Valor: TDExportadoTransito_Valor;
    ValorDesconto: TDExportadoTransito_ValorDesconto;
    FormPago: TDExportadoTransito_FormPago;
    PrecoFOB: TDExportadoTransito_PrecoFOB;
    FormComissao: TDExportadoTransito_FormComissao;
    Comissao: TDExportadoTransito_Comissao;
    ComisaoSFatura: TDExportadoTransito_ComisaoSFatura;
    StDocumento: TDExportadoTransito_StDocumento;
    OBS: TDExportadoTransito_OBS;
    Comentario: TDExportadoTransito_Comentario;
    Rate: TDExportadoTransito_Rate;
    DataLiq: TDExportadoTransito_DataLiq;
    NumNFEmit: TDExportadoTransito_NumNFEmit;
    NumOrdCobranca: TDExportadoTransito_NumOrdCobranca;
    DataOrdCobranca: TDExportadoTransito_DataOrdCobranca;
    DataNF: TDExportadoTransito_DataNF;
    Status: TDExportadoTransito_Status;
    MOEDACOMISSAO: TDExportadoTransito_MOEDACOMISSAO;
    ValorConvertido: TDExportadoTransito_ValorConvertido;
    FORCOD: TDExportadoTransito_FORCOD;
    NomeMix: TDExportadoTransito_NomeMix;
    RAZAO: TDExportadoTransito_RAZAO;
    Recebimento: TDExportadoTransito_Recebimento;
    Valor_NF: TDExportadoTransito_Valor_NF;
    Selecionado: TDExportadoTransito_Selecionado;
    MOEDACOMISSAOTAXA: TDExportadoTransito_MOEDACOMISSAOTAXA;
    Usuario: TDExportadoTransito_Usuario;
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

constructor TDExportadoTransito.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ExportadoTransito';
  Titulo           := 'Exportado Transito';
  Name             := 'DExportadoTransito';
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
  DataSource.Name  := 'DsExportadoTransito';
  with UpdateSql do
  begin
    Name           := 'UpdSql_ExportadoTransito';
    // Exclusão de Registro
    DeleteSQL.Add('delete from ExportadoTransito');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Contrato = :OLD_Contrato');
    DeleteSQL.Add('  and Seq = :OLD_Seq');
    // Inserção de Registro
    InsertSQL.Add('insert into ExportadoTransito');
    InsertSQL.Add('  (');
    InsertSQL.Add('  Contrato,');
    InsertSQL.Add('  Seq,');
    InsertSQL.Add('  Navio,');
    InsertSQL.Add('  Cadastro,');
    InsertSQL.Add('  DataEmbarque,');
    InsertSQL.Add('  ETADestino,');
    InsertSQL.Add('  Fatura,');
    InsertSQL.Add('  QuantidadeExp,');
    InsertSQL.Add('  Valor,');
    InsertSQL.Add('  ValorDesconto,');
    InsertSQL.Add('  FormPago,');
    InsertSQL.Add('  PrecoFOB,');
    InsertSQL.Add('  ComisaoSFatura,');
    InsertSQL.Add('  StDocumento,');
    InsertSQL.Add('  OBS,');
    InsertSQL.Add('  Comentario,');
    InsertSQL.Add('  Rate,');
    InsertSQL.Add('  DataLiq,');
    InsertSQL.Add('  NumNFEmit,');
    InsertSQL.Add('  NumOrdCobranca,');
    InsertSQL.Add('  DataOrdCobranca,');
    InsertSQL.Add('  DataNF,');
    InsertSQL.Add('  Status,');
    InsertSQL.Add('  ValorConvertido,');
    InsertSQL.Add('  Recebimento,');
    InsertSQL.Add('  Valor_NF,');
    InsertSQL.Add('  Selecionado,');
    InsertSQL.Add('  MOEDACOMISSAOTAXA,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :Seq,');
    InsertSQL.Add('  :Navio,');
    InsertSQL.Add('  :Cadastro,');
    InsertSQL.Add('  :DataEmbarque,');
    InsertSQL.Add('  :ETADestino,');
    InsertSQL.Add('  :Fatura,');
    InsertSQL.Add('  :QuantidadeExp,');
    InsertSQL.Add('  :Valor,');
    InsertSQL.Add('  :ValorDesconto,');
    InsertSQL.Add('  :FormPago,');
    InsertSQL.Add('  :PrecoFOB,');
    InsertSQL.Add('  :ComisaoSFatura,');
    InsertSQL.Add('  :StDocumento,');
    InsertSQL.Add('  :OBS,');
    InsertSQL.Add('  :Comentario,');
    InsertSQL.Add('  :Rate,');
    InsertSQL.Add('  :DataLiq,');
    InsertSQL.Add('  :NumNFEmit,');
    InsertSQL.Add('  :NumOrdCobranca,');
    InsertSQL.Add('  :DataOrdCobranca,');
    InsertSQL.Add('  :DataNF,');
    InsertSQL.Add('  :Status,');
    InsertSQL.Add('  :ValorConvertido,');
    InsertSQL.Add('  :Recebimento,');
    InsertSQL.Add('  :Valor_NF,');
    InsertSQL.Add('  :Selecionado,');
    InsertSQL.Add('  :MOEDACOMISSAOTAXA,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update ExportadoTransito');
    ModifySQL.Add('set');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  Seq = :Seq,');
    ModifySQL.Add('  Navio = :Navio,');
    ModifySQL.Add('  Cadastro = :Cadastro,');
    ModifySQL.Add('  DataEmbarque = :DataEmbarque,');
    ModifySQL.Add('  ETADestino = :ETADestino,');
    ModifySQL.Add('  Fatura = :Fatura,');
    ModifySQL.Add('  QuantidadeExp = :QuantidadeExp,');
    ModifySQL.Add('  Valor = :Valor,');
    ModifySQL.Add('  ValorDesconto = :ValorDesconto,');
    ModifySQL.Add('  FormPago = :FormPago,');
    ModifySQL.Add('  PrecoFOB = :PrecoFOB,');
    ModifySQL.Add('  ComisaoSFatura = :ComisaoSFatura,');
    ModifySQL.Add('  StDocumento = :StDocumento,');
    ModifySQL.Add('  OBS = :OBS,');
    ModifySQL.Add('  Comentario = :Comentario,');
    ModifySQL.Add('  Rate = :Rate,');
    ModifySQL.Add('  DataLiq = :DataLiq,');
    ModifySQL.Add('  NumNFEmit = :NumNFEmit,');
    ModifySQL.Add('  NumOrdCobranca = :NumOrdCobranca,');
    ModifySQL.Add('  DataOrdCobranca = :DataOrdCobranca,');
    ModifySQL.Add('  DataNF = :DataNF,');
    ModifySQL.Add('  Status = :Status,');
    ModifySQL.Add('  ValorConvertido = :ValorConvertido,');
    ModifySQL.Add('  Recebimento = :Recebimento,');
    ModifySQL.Add('  Valor_NF = :Valor_NF,');
    ModifySQL.Add('  Selecionado = :Selecionado,');
    ModifySQL.Add('  MOEDACOMISSAOTAXA = :MOEDACOMISSAOTAXA,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    ModifySQL.Add('  and Seq = :OLD_Seq');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  ExportadoTransito.Contrato AS Contrato,');
    RefreshSQL.Add('  ExportadoTransito.Seq AS Seq,');
    RefreshSQL.Add('  ExportadoTransito.Navio AS Navio,');
    RefreshSQL.Add('  ExportadoTransito.Cadastro AS Cadastro,');
    RefreshSQL.Add('  ExportadoTransito.DataEmbarque AS DataEmbarque,');
    RefreshSQL.Add('  ExportadoTransito.ETADestino AS ETADestino,');
    RefreshSQL.Add('  ExportadoTransito.Fatura AS Fatura,');
    RefreshSQL.Add('  ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
    RefreshSQL.Add('  ExportadoTransito.Valor AS Valor,');
    RefreshSQL.Add('  ExportadoTransito.ValorDesconto AS ValorDesconto,');
    RefreshSQL.Add('  ExportadoTransito.FormPago AS FormPago,');
    RefreshSQL.Add('  ExportadoTransito.PrecoFOB AS PrecoFOB,');
    RefreshSQL.Add('  ContratoTransporte.FormComissao AS FormComissao,');
    RefreshSQL.Add('  ContratoTransporte.Comissao AS Comissao,');
    RefreshSQL.Add('  ExportadoTransito.ComisaoSFatura AS ComisaoSFatura,');
    RefreshSQL.Add('  ExportadoTransito.StDocumento AS StDocumento,');
    RefreshSQL.Add('  ExportadoTransito.OBS AS OBS,');
    RefreshSQL.Add('  ExportadoTransito.Comentario AS Comentario,');
    RefreshSQL.Add('  ExportadoTransito.Rate AS Rate,');
    RefreshSQL.Add('  ExportadoTransito.DataLiq AS DataLiq,');
    RefreshSQL.Add('  ExportadoTransito.NumNFEmit AS NumNFEmit,');
    RefreshSQL.Add('  ExportadoTransito.NumOrdCobranca AS NumOrdCobranca,');
    RefreshSQL.Add('  ExportadoTransito.DataOrdCobranca AS DataOrdCobranca,');
    RefreshSQL.Add('  ExportadoTransito.DataNF AS DataNF,');
    RefreshSQL.Add('  ExportadoTransito.Status AS Status,');
    RefreshSQL.Add('  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,');
    RefreshSQL.Add('  ExportadoTransito.ValorConvertido AS ValorConvertido,');
    RefreshSQL.Add('  ContratoTransporte.FORCOD AS FORCOD,');
    RefreshSQL.Add('  ContratoTransporte.NomeMix AS NomeMix,');
    RefreshSQL.Add('  Fornecedores.RAZAO AS RAZAO,');
    RefreshSQL.Add('  ExportadoTransito.Recebimento AS Recebimento,');
    RefreshSQL.Add('  ExportadoTransito.Valor_NF AS Valor_NF,');
    RefreshSQL.Add('  ExportadoTransito.Selecionado AS Selecionado,');
    RefreshSQL.Add('  ExportadoTransito.MOEDACOMISSAOTAXA AS MOEDACOMISSAOTAXA,');
    RefreshSQL.Add('  ExportadoTransito.Usuario AS Usuario');
    RefreshSQL.Add('from ExportadoTransito');
    RefreshSQL.Add('Left Outer Join ContratoTransporte on');
    RefreshSQL.Add('  ExportadoTransito.Contrato = ContratoTransporte.Contrato');
    RefreshSQL.Add('Left Outer Join Fornecedores on');
    RefreshSQL.Add('  ContratoTransporte.FORCOD = Fornecedores.FORCOD');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  ExportadoTransito.Contrato = :OLD_Contrato');
    RefreshSQL.Add('  and ExportadoTransito.Seq = :OLD_Seq');
  end;
  TabelasExtras.Add('ContratoTransporte');
  TabelasExtras.Add('Fornecedores');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  ExportadoTransito.Contrato AS Contrato,');
  SqlPrincipal.Add('  ExportadoTransito.Seq AS Seq,');
  SqlPrincipal.Add('  ExportadoTransito.Navio AS Navio,');
  SqlPrincipal.Add('  ExportadoTransito.Cadastro AS Cadastro,');
  SqlPrincipal.Add('  ExportadoTransito.DataEmbarque AS DataEmbarque,');
  SqlPrincipal.Add('  ExportadoTransito.ETADestino AS ETADestino,');
  SqlPrincipal.Add('  ExportadoTransito.Fatura AS Fatura,');
  SqlPrincipal.Add('  ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
  SqlPrincipal.Add('  ExportadoTransito.Valor AS Valor,');
  SqlPrincipal.Add('  ExportadoTransito.ValorDesconto AS ValorDesconto,');
  SqlPrincipal.Add('  ExportadoTransito.FormPago AS FormPago,');
  SqlPrincipal.Add('  ExportadoTransito.PrecoFOB AS PrecoFOB,');
  SqlPrincipal.Add('  ContratoTransporte.FormComissao AS FormComissao,');
  SqlPrincipal.Add('  ContratoTransporte.Comissao AS Comissao,');
  SqlPrincipal.Add('  ExportadoTransito.ComisaoSFatura AS ComisaoSFatura,');
  SqlPrincipal.Add('  ExportadoTransito.StDocumento AS StDocumento,');
  SqlPrincipal.Add('  ExportadoTransito.OBS AS OBS,');
  SqlPrincipal.Add('  ExportadoTransito.Comentario AS Comentario,');
  SqlPrincipal.Add('  ExportadoTransito.Rate AS Rate,');
  SqlPrincipal.Add('  ExportadoTransito.DataLiq AS DataLiq,');
  SqlPrincipal.Add('  ExportadoTransito.NumNFEmit AS NumNFEmit,');
  SqlPrincipal.Add('  ExportadoTransito.NumOrdCobranca AS NumOrdCobranca,');
  SqlPrincipal.Add('  ExportadoTransito.DataOrdCobranca AS DataOrdCobranca,');
  SqlPrincipal.Add('  ExportadoTransito.DataNF AS DataNF,');
  SqlPrincipal.Add('  ExportadoTransito.Status AS Status,');
  SqlPrincipal.Add('  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,');
  SqlPrincipal.Add('  ExportadoTransito.ValorConvertido AS ValorConvertido,');
  SqlPrincipal.Add('  ContratoTransporte.FORCOD AS FORCOD,');
  SqlPrincipal.Add('  ContratoTransporte.NomeMix AS NomeMix,');
  SqlPrincipal.Add('  Fornecedores.RAZAO AS RAZAO,');
  SqlPrincipal.Add('  ExportadoTransito.Recebimento AS Recebimento,');
  SqlPrincipal.Add('  ExportadoTransito.Valor_NF AS Valor_NF,');
  SqlPrincipal.Add('  ExportadoTransito.Selecionado AS Selecionado,');
  SqlPrincipal.Add('  ExportadoTransito.MOEDACOMISSAOTAXA AS MOEDACOMISSAOTAXA,');
  SqlPrincipal.Add('  ExportadoTransito.Usuario AS Usuario');
  SqlPrincipal.Add('from ExportadoTransito');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ContratoTransporte on');
  FiltroExtra.Add('  ExportadoTransito.Contrato = ContratoTransporte.Contrato');
  FiltroExtra.Add('Left Outer Join Fornecedores on');
  FiltroExtra.Add('  ContratoTransporte.FORCOD = Fornecedores.FORCOD');
  Sql.Add('order by ExportadoTransito.Contrato,ExportadoTransito.Seq');
  Contrato := TDExportadoTransito_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  Seq := TDExportadoTransito_Seq.Create(AOwner);
  Seq.Valor.DataSet := Self;
  Navio := TDExportadoTransito_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  Cadastro := TDExportadoTransito_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  DataEmbarque := TDExportadoTransito_DataEmbarque.Create(AOwner);
  DataEmbarque.Valor.DataSet := Self;
  ETADestino := TDExportadoTransito_ETADestino.Create(AOwner);
  ETADestino.Valor.DataSet := Self;
  Fatura := TDExportadoTransito_Fatura.Create(AOwner);
  Fatura.Valor.DataSet := Self;
  QuantidadeExp := TDExportadoTransito_QuantidadeExp.Create(AOwner);
  QuantidadeExp.Valor.DataSet := Self;
  Valor := TDExportadoTransito_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  FormPago := TDExportadoTransito_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  ComisaoSFatura := TDExportadoTransito_ComisaoSFatura.Create(AOwner);
  ComisaoSFatura.Valor.DataSet := Self;
  StDocumento := TDExportadoTransito_StDocumento.Create(AOwner);
  StDocumento.Valor.DataSet := Self;
  OBS := TDExportadoTransito_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  Comentario := TDExportadoTransito_Comentario.Create(AOwner);
  Comentario.Valor.DataSet := Self;
  DataLiq := TDExportadoTransito_DataLiq.Create(AOwner);
  DataLiq.Valor.DataSet := Self;
  Rate := TDExportadoTransito_Rate.Create(AOwner);
  Rate.Valor.DataSet := Self;
  MOEDACOMISSAOTAXA := TDExportadoTransito_MOEDACOMISSAOTAXA.Create(AOwner);
  MOEDACOMISSAOTAXA.Valor.DataSet := Self;
  ValorConvertido := TDExportadoTransito_ValorConvertido.Create(AOwner);
  ValorConvertido.Valor.DataSet := Self;
  NumNFEmit := TDExportadoTransito_NumNFEmit.Create(AOwner);
  NumNFEmit.Valor.DataSet := Self;
  NumOrdCobranca := TDExportadoTransito_NumOrdCobranca.Create(AOwner);
  NumOrdCobranca.Valor.DataSet := Self;
  DataOrdCobranca := TDExportadoTransito_DataOrdCobranca.Create(AOwner);
  DataOrdCobranca.Valor.DataSet := Self;
  DataNF := TDExportadoTransito_DataNF.Create(AOwner);
  DataNF.Valor.DataSet := Self;
  Status := TDExportadoTransito_Status.Create(AOwner);
  Status.Valor.DataSet := Self;
  PrecoFOB := TDExportadoTransito_PrecoFOB.Create(AOwner);
  PrecoFOB.Valor.DataSet := Self;
  ValorDesconto := TDExportadoTransito_ValorDesconto.Create(AOwner);
  ValorDesconto.Valor.DataSet := Self;
  Comissao := TDExportadoTransito_Comissao.Create(AOwner);
  Comissao.Valor.DataSet := Self;
  FormComissao := TDExportadoTransito_FormComissao.Create(AOwner);
  FormComissao.Valor.DataSet := Self;
  FORCOD := TDExportadoTransito_FORCOD.Create(AOwner);
  FORCOD.Valor.DataSet := Self;
  MOEDACOMISSAO := TDExportadoTransito_MOEDACOMISSAO.Create(AOwner);
  MOEDACOMISSAO.Valor.DataSet := Self;
  NomeMix := TDExportadoTransito_NomeMix.Create(AOwner);
  NomeMix.Valor.DataSet := Self;
  RAZAO := TDExportadoTransito_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  Recebimento := TDExportadoTransito_Recebimento.Create(AOwner);
  Recebimento.Valor.DataSet := Self;
  Valor_NF := TDExportadoTransito_Valor_NF.Create(AOwner);
  Valor_NF.Valor.DataSet := Self;
  Usuario := TDExportadoTransito_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
  Selecionado := TDExportadoTransito_Selecionado.Create(AOwner);
  Selecionado.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(Contrato);
  ChavePrimaria.Add(Seq);
//CRIANDO CAMPOS 
  Campos.Add(Contrato);
  Campos.Add(Seq);
  Campos.Add(Navio);
  Campos.Add(Cadastro);
  Campos.Add(DataEmbarque);
  Campos.Add(ETADestino);
  Campos.Add(Fatura);
  Campos.Add(QuantidadeExp);
  Campos.Add(Valor);
  Campos.Add(ValorDesconto);
  Campos.Add(FormPago);
  Campos.Add(PrecoFOB);
  Campos.Add(FormComissao);
  Campos.Add(Comissao);
  Campos.Add(ComisaoSFatura);
  Campos.Add(StDocumento);
  Campos.Add(OBS);
  Campos.Add(Comentario);
  Campos.Add(Rate);
  Campos.Add(DataLiq);
  Campos.Add(NumNFEmit);
  Campos.Add(NumOrdCobranca);
  Campos.Add(DataOrdCobranca);
  Campos.Add(DataNF);
  Campos.Add(Status);
  Campos.Add(MOEDACOMISSAO);
  Campos.Add(ValorConvertido);
  Campos.Add(FORCOD);
  Campos.Add(NomeMix);
  Campos.Add(RAZAO);
  Campos.Add(Recebimento);
  Campos.Add(Valor_NF);
  Campos.Add(Selecionado);
  Campos.Add(MOEDACOMISSAOTAXA);
  Campos.Add(Usuario);
  TituloIndices.Add('Contrato,Seq.');
  Indices.Add('ExportadoTransito.Contrato,ExportadoTransito.Seq');
  Crescente.Add('S');
  TituloPrimaria := 'Contrato,Seq.';
  ChPrimaria     := 'ExportadoTransito.Contrato,ExportadoTransito.Seq';
//CRIANDO TituloIndices 
  TituloIndice   := 'Contrato,Seq.';
  ChaveIndice    := 'ExportadoTransito.Contrato,ExportadoTransito.Seq';
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

procedure TDExportadoTransito.CriaForeignKeys;
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

function TDExportadoTransito.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDExportadoTransito.ExclusaoCascata;
begin
end;

function TDExportadoTransito.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if (UpperCase('Contrato') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if (UpperCase('FORCOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDExportadoTransito.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ExportadoTransito') then
    if PTabela(TabGlobal.DExportadoTransito, ['Contrato','Seq'], [Contrato.Valor.Value,Seq.Valor.Value]) then
      Result := True;
end;

procedure TDExportadoTransito.CalculaCampos;
begin
  ComisaoSFatura.Conteudo := CalculaDExportadoTransito_ComisaoSFatura(Self);
  ValorConvertido.Conteudo := CalculaDExportadoTransito_ValorConvertido(Self);
end;

procedure TDExportadoTransito.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDExportadoTransito.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
    FiltroRelac.Add('ExportadoTransito.Contrato = :ContratoTransporte_Contrato');
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  Contrato.Valor.ReadOnly := Atribui;
  if Atualiza then
    AtualizaSql;
end;

procedure TDExportadoTransito.AtribuiMestre(DataSet: TDataSet);
begin
  Contrato.Valor.Value := TabGlobal.DContratoTransporte.Contrato.Valor.Value;
end;

procedure TDExportadoTransito.ProcessoDireto1(DataSet: TDataSet);
var
  QueryLc: TTabela;
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalExp = ValorTotalExp + :ExportadoTransito_Valor') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QUANTTOTALEXP = QUANTTOTALEXP + :ExportadoTransito_QuantidadeExp') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if (( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO' )  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'EM' ) Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'AB' )) then
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''EM''') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'VALORTOTALCOMISSAOEXECUTADOUS = VALORTOTALCOMISSAOEXECUTADOUS +:ExportadoTransito_ComisaoSFatura') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  {$IFDEF IBX}
  Transaction.CommitRetaining;
  {$ELSE}
  {$ENDIF}
  Inclusao    := False;
  Modificacao := False;
end;

procedure TDExportadoTransito.ProcessoDireto2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalExp = ValorTotalExp + :ExportadoTransito_Valor') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
    if EmEdicao then
      TabGlobal.DContratoTransporte.Modifica;
  end;
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QUANTTOTALEXP = QUANTTOTALEXP + :ExportadoTransito_QuantidadeExp') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
    if EmEdicao then
      TabGlobal.DContratoTransporte.Modifica;
  end;
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if (( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO' )  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'EM' ) Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'AB' )) then
      if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''EM''') then
        MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
    if EmEdicao then
      TabGlobal.DContratoTransporte.Modifica;
  end;
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'VALORTOTALCOMISSAOEXECUTADOUS = VALORTOTALCOMISSAOEXECUTADOUS +:ExportadoTransito_ComisaoSFatura') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
    if EmEdicao then
      TabGlobal.DContratoTransporte.Modifica;
  end;
  {$IFDEF IBX}
  Transaction.CommitRetaining;
  {$ELSE}
  {$ENDIF}
  Inclusao    := False;
  Modificacao := False;
end;

procedure TDExportadoTransito.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDExportadoTransito.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalExp = ValorTotalExp - :ExportadoTransito_Valor') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QUANTTOTALEXP = QUANTTOTALEXP - :ExportadoTransito_QuantidadeExp') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if (( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO' )  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'EM' ) Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'AB' )) then
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''BO''') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'VALORTOTALCOMISSAOEXECUTADOUS = VALORTOTALCOMISSAOEXECUTADOUS -:ExportadoTransito_ComisaoSFatura') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
end;

procedure TDExportadoTransito.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalExp = ValorTotalExp - :ExportadoTransito_Valor') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'QUANTTOTALEXP = QUANTTOTALEXP - :ExportadoTransito_QuantidadeExp') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if (( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'BO' )  Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'EM' ) Or ( TabGlobal.DContratoTransporte.StatusCT.Conteudo = 'AB' )) then
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'StatusCT = ''BO''') then
      MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'VALORTOTALCOMISSAOEXECUTADOUS = VALORTOTALCOMISSAOEXECUTADOUS -:ExportadoTransito_ComisaoSFatura') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  ExclusaoCascata;
end;

procedure TDExportadoTransito.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
