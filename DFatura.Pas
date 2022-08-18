{
 Classe da tabela: Fatura - Cadastro de Faturas
}

unit DFatura;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0006,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDFatura = class(TTabela)
  public
    Contrato: TDFatura_Contrato;
    Seq: TDFatura_Seq;
    Status: TDFatura_Status;
    StatusCT: TDFatura_StatusCT;
    NomeMix: TDFatura_NomeMix;
    Navio: TDFatura_Navio;
    DataEmbarque: TDFatura_DataEmbarque;
    QuantidadeExp: TDFatura_QuantidadeExp;
    Fatura: TDFatura_Fatura;
    StDocumento: TDFatura_StDocumento;
    FormComissao: TDFatura_FormComissao;
    Comissao: TDFatura_Comissao;
    Valor: TDFatura_Valor;
    ValorDesconto: TDFatura_ValorDesconto;
    Cadastro: TDFatura_Cadastro;
    ETADestino: TDFatura_ETADestino;
    FormPago: TDFatura_FormPago;
    PrecoFOB: TDFatura_PrecoFOB;
    ComisaoSFatura: TDFatura_ComisaoSFatura;
    DataOrdCobranca: TDFatura_DataOrdCobranca;
    Rate: TDFatura_Rate;
    ValorConvertido: TDFatura_ValorConvertido;
    NumNFEmit: TDFatura_NumNFEmit;
    NumOrdCobranca: TDFatura_NumOrdCobranca;
    DataNF: TDFatura_DataNF;
    OBS: TDFatura_OBS;
    Comentario: TDFatura_Comentario;
    DataLiq: TDFatura_DataLiq;
    FORCOD: TDFatura_FORCOD;
    MOEDACOMISSAO: TDFatura_MOEDACOMISSAO;
    RAZAO: TDFatura_RAZAO;
    Recebimento: TDFatura_Recebimento;
    Valor_NF: TDFatura_Valor_NF;
    Selecionado: TDFatura_Selecionado;
    MOEDACOMISSAOTAXA: TDFatura_MOEDACOMISSAOTAXA;
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

constructor TDFatura.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ExportadoTransito';
  Titulo           := 'Cadastro de Faturas';
  Name             := 'DFatura';
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
  DataSource.Name  := 'DsFatura';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Fatura';
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
    InsertSQL.Add('  Status,');
    InsertSQL.Add('  Navio,');
    InsertSQL.Add('  DataEmbarque,');
    InsertSQL.Add('  QuantidadeExp,');
    InsertSQL.Add('  Fatura,');
    InsertSQL.Add('  StDocumento,');
    InsertSQL.Add('  Valor,');
    InsertSQL.Add('  ValorDesconto,');
    InsertSQL.Add('  Cadastro,');
    InsertSQL.Add('  ETADestino,');
    InsertSQL.Add('  FormPago,');
    InsertSQL.Add('  PrecoFOB,');
    InsertSQL.Add('  ComisaoSFatura,');
    InsertSQL.Add('  DataOrdCobranca,');
    InsertSQL.Add('  Rate,');
    InsertSQL.Add('  ValorConvertido,');
    InsertSQL.Add('  NumNFEmit,');
    InsertSQL.Add('  NumOrdCobranca,');
    InsertSQL.Add('  DataNF,');
    InsertSQL.Add('  OBS,');
    InsertSQL.Add('  Comentario,');
    InsertSQL.Add('  DataLiq,');
    InsertSQL.Add('  Recebimento,');
    InsertSQL.Add('  Valor_NF,');
    InsertSQL.Add('  Selecionado,');
    InsertSQL.Add('  MOEDACOMISSAOTAXA');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :Seq,');
    InsertSQL.Add('  :Status,');
    InsertSQL.Add('  :Navio,');
    InsertSQL.Add('  :DataEmbarque,');
    InsertSQL.Add('  :QuantidadeExp,');
    InsertSQL.Add('  :Fatura,');
    InsertSQL.Add('  :StDocumento,');
    InsertSQL.Add('  :Valor,');
    InsertSQL.Add('  :ValorDesconto,');
    InsertSQL.Add('  :Cadastro,');
    InsertSQL.Add('  :ETADestino,');
    InsertSQL.Add('  :FormPago,');
    InsertSQL.Add('  :PrecoFOB,');
    InsertSQL.Add('  :ComisaoSFatura,');
    InsertSQL.Add('  :DataOrdCobranca,');
    InsertSQL.Add('  :Rate,');
    InsertSQL.Add('  :ValorConvertido,');
    InsertSQL.Add('  :NumNFEmit,');
    InsertSQL.Add('  :NumOrdCobranca,');
    InsertSQL.Add('  :DataNF,');
    InsertSQL.Add('  :OBS,');
    InsertSQL.Add('  :Comentario,');
    InsertSQL.Add('  :DataLiq,');
    InsertSQL.Add('  :Recebimento,');
    InsertSQL.Add('  :Valor_NF,');
    InsertSQL.Add('  :Selecionado,');
    InsertSQL.Add('  :MOEDACOMISSAOTAXA');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update ExportadoTransito');
    ModifySQL.Add('set');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  Seq = :Seq,');
    ModifySQL.Add('  Status = :Status,');
    ModifySQL.Add('  Navio = :Navio,');
    ModifySQL.Add('  DataEmbarque = :DataEmbarque,');
    ModifySQL.Add('  QuantidadeExp = :QuantidadeExp,');
    ModifySQL.Add('  Fatura = :Fatura,');
    ModifySQL.Add('  StDocumento = :StDocumento,');
    ModifySQL.Add('  Valor = :Valor,');
    ModifySQL.Add('  ValorDesconto = :ValorDesconto,');
    ModifySQL.Add('  Cadastro = :Cadastro,');
    ModifySQL.Add('  ETADestino = :ETADestino,');
    ModifySQL.Add('  FormPago = :FormPago,');
    ModifySQL.Add('  PrecoFOB = :PrecoFOB,');
    ModifySQL.Add('  ComisaoSFatura = :ComisaoSFatura,');
    ModifySQL.Add('  DataOrdCobranca = :DataOrdCobranca,');
    ModifySQL.Add('  Rate = :Rate,');
    ModifySQL.Add('  ValorConvertido = :ValorConvertido,');
    ModifySQL.Add('  NumNFEmit = :NumNFEmit,');
    ModifySQL.Add('  NumOrdCobranca = :NumOrdCobranca,');
    ModifySQL.Add('  DataNF = :DataNF,');
    ModifySQL.Add('  OBS = :OBS,');
    ModifySQL.Add('  Comentario = :Comentario,');
    ModifySQL.Add('  DataLiq = :DataLiq,');
    ModifySQL.Add('  Recebimento = :Recebimento,');
    ModifySQL.Add('  Valor_NF = :Valor_NF,');
    ModifySQL.Add('  Selecionado = :Selecionado,');
    ModifySQL.Add('  MOEDACOMISSAOTAXA = :MOEDACOMISSAOTAXA');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    ModifySQL.Add('  and Seq = :OLD_Seq');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  Fatura.Contrato AS Contrato,');
    RefreshSQL.Add('  Fatura.Seq AS Seq,');
    RefreshSQL.Add('  Fatura.Status AS Status,');
    RefreshSQL.Add('  ContratoTransporte.StatusCT AS StatusCT,');
    RefreshSQL.Add('  ContratoTransporte.NomeMix AS NomeMix,');
    RefreshSQL.Add('  Fatura.Navio AS Navio,');
    RefreshSQL.Add('  Fatura.DataEmbarque AS DataEmbarque,');
    RefreshSQL.Add('  Fatura.QuantidadeExp AS QuantidadeExp,');
    RefreshSQL.Add('  Fatura.Fatura AS Fatura,');
    RefreshSQL.Add('  Fatura.StDocumento AS StDocumento,');
    RefreshSQL.Add('  ContratoTransporte.FormComissao AS FormComissao,');
    RefreshSQL.Add('  ContratoTransporte.Comissao AS Comissao,');
    RefreshSQL.Add('  Fatura.Valor AS Valor,');
    RefreshSQL.Add('  Fatura.ValorDesconto AS ValorDesconto,');
    RefreshSQL.Add('  Fatura.Cadastro AS Cadastro,');
    RefreshSQL.Add('  Fatura.ETADestino AS ETADestino,');
    RefreshSQL.Add('  Fatura.FormPago AS FormPago,');
    RefreshSQL.Add('  Fatura.PrecoFOB AS PrecoFOB,');
    RefreshSQL.Add('  Fatura.ComisaoSFatura AS ComisaoSFatura,');
    RefreshSQL.Add('  Fatura.DataOrdCobranca AS DataOrdCobranca,');
    RefreshSQL.Add('  Fatura.Rate AS Rate,');
    RefreshSQL.Add('  Fatura.ValorConvertido AS ValorConvertido,');
    RefreshSQL.Add('  Fatura.NumNFEmit AS NumNFEmit,');
    RefreshSQL.Add('  Fatura.NumOrdCobranca AS NumOrdCobranca,');
    RefreshSQL.Add('  Fatura.DataNF AS DataNF,');
    RefreshSQL.Add('  Fatura.OBS AS OBS,');
    RefreshSQL.Add('  Fatura.Comentario AS Comentario,');
    RefreshSQL.Add('  Fatura.DataLiq AS DataLiq,');
    RefreshSQL.Add('  ContratoTransporte.FORCOD AS FORCOD,');
    RefreshSQL.Add('  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,');
    RefreshSQL.Add('  Fornecedores.RAZAO AS RAZAO,');
    RefreshSQL.Add('  Fatura.Recebimento AS Recebimento,');
    RefreshSQL.Add('  Fatura.Valor_NF AS Valor_NF,');
    RefreshSQL.Add('  Fatura.Selecionado AS Selecionado,');
    RefreshSQL.Add('  Fatura.MOEDACOMISSAOTAXA AS MOEDACOMISSAOTAXA');
    // CRIANDO SUB-SELECT 1 
    RefreshSQL.Add('from ( SELECT '); // inicio sub-select 
    RefreshSQL.Add('  ExportadoTransito.Contrato AS Contrato,');
    RefreshSQL.Add('  ExportadoTransito.Seq AS Seq,');
    RefreshSQL.Add('  ExportadoTransito.Status AS Status,');
    RefreshSQL.Add('  ExportadoTransito.Navio AS Navio,');
    RefreshSQL.Add('  ExportadoTransito.DataEmbarque AS DataEmbarque,');
    RefreshSQL.Add('  ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
    RefreshSQL.Add('  ExportadoTransito.Fatura AS Fatura,');
    RefreshSQL.Add('  ExportadoTransito.StDocumento AS StDocumento,');
    RefreshSQL.Add('  ExportadoTransito.Valor AS Valor,');
    RefreshSQL.Add('  ExportadoTransito.ValorDesconto AS ValorDesconto,');
    RefreshSQL.Add('  ExportadoTransito.Cadastro AS Cadastro,');
    RefreshSQL.Add('  ExportadoTransito.ETADestino AS ETADestino,');
    RefreshSQL.Add('  ExportadoTransito.FormPago AS FormPago,');
    RefreshSQL.Add('  ExportadoTransito.PrecoFOB AS PrecoFOB,');
    RefreshSQL.Add('  ExportadoTransito.ComisaoSFatura AS ComisaoSFatura,');
    RefreshSQL.Add('  ExportadoTransito.DataOrdCobranca AS DataOrdCobranca,');
    RefreshSQL.Add('  ExportadoTransito.Rate AS Rate,');
    RefreshSQL.Add('  ExportadoTransito.ValorConvertido AS ValorConvertido,');
    RefreshSQL.Add('  ExportadoTransito.NumNFEmit AS NumNFEmit,');
    RefreshSQL.Add('  ExportadoTransito.NumOrdCobranca AS NumOrdCobranca,');
    RefreshSQL.Add('  ExportadoTransito.DataNF AS DataNF,');
    RefreshSQL.Add('  ExportadoTransito.OBS AS OBS,');
    RefreshSQL.Add('  ExportadoTransito.Comentario AS Comentario,');
    RefreshSQL.Add('  ExportadoTransito.DataLiq AS DataLiq,');
    RefreshSQL.Add('  ExportadoTransito.Recebimento AS Recebimento,');
    RefreshSQL.Add('  ExportadoTransito.Valor_NF AS Valor_NF,');
    RefreshSQL.Add('  ExportadoTransito.Selecionado AS Selecionado,');
    RefreshSQL.Add('  ExportadoTransito.MOEDACOMISSAOTAXA AS MOEDACOMISSAOTAXA');
    RefreshSQL.Add('from ExportadoTransito'); // fim sub-select
    RefreshSQL.Add(' ) AS  Fatura' );
    RefreshSQL.Add('Left Outer Join ContratoTransporte on');
    RefreshSQL.Add('  Fatura.Contrato = ContratoTransporte.Contrato');
    RefreshSQL.Add('Left Outer Join Fornecedores on');
    RefreshSQL.Add('  ContratoTransporte.FORCOD = Fornecedores.FORCOD');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  Fatura.Contrato = :OLD_Contrato');
    RefreshSQL.Add('  and Fatura.Seq = :OLD_Seq');
  end;
  TabelasExtras.Add('ContratoTransporte');
  TabelasExtras.Add('Fornecedores');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  Fatura.Contrato AS Contrato,');
  SqlPrincipal.Add('  Fatura.Seq AS Seq,');
  SqlPrincipal.Add('  Fatura.Status AS Status,');
  SqlPrincipal.Add('  ContratoTransporte.StatusCT AS StatusCT,');
  SqlPrincipal.Add('  ContratoTransporte.NomeMix AS NomeMix,');
  SqlPrincipal.Add('  Fatura.Navio AS Navio,');
  SqlPrincipal.Add('  Fatura.DataEmbarque AS DataEmbarque,');
  SqlPrincipal.Add('  Fatura.QuantidadeExp AS QuantidadeExp,');
  SqlPrincipal.Add('  Fatura.Fatura AS Fatura,');
  SqlPrincipal.Add('  Fatura.StDocumento AS StDocumento,');
  SqlPrincipal.Add('  ContratoTransporte.FormComissao AS FormComissao,');
  SqlPrincipal.Add('  ContratoTransporte.Comissao AS Comissao,');
  SqlPrincipal.Add('  Fatura.Valor AS Valor,');
  SqlPrincipal.Add('  Fatura.ValorDesconto AS ValorDesconto,');
  SqlPrincipal.Add('  Fatura.Cadastro AS Cadastro,');
  SqlPrincipal.Add('  Fatura.ETADestino AS ETADestino,');
  SqlPrincipal.Add('  Fatura.FormPago AS FormPago,');
  SqlPrincipal.Add('  Fatura.PrecoFOB AS PrecoFOB,');
  SqlPrincipal.Add('  Fatura.ComisaoSFatura AS ComisaoSFatura,');
  SqlPrincipal.Add('  Fatura.DataOrdCobranca AS DataOrdCobranca,');
  SqlPrincipal.Add('  Fatura.Rate AS Rate,');
  SqlPrincipal.Add('  Fatura.ValorConvertido AS ValorConvertido,');
  SqlPrincipal.Add('  Fatura.NumNFEmit AS NumNFEmit,');
  SqlPrincipal.Add('  Fatura.NumOrdCobranca AS NumOrdCobranca,');
  SqlPrincipal.Add('  Fatura.DataNF AS DataNF,');
  SqlPrincipal.Add('  Fatura.OBS AS OBS,');
  SqlPrincipal.Add('  Fatura.Comentario AS Comentario,');
  SqlPrincipal.Add('  Fatura.DataLiq AS DataLiq,');
  SqlPrincipal.Add('  ContratoTransporte.FORCOD AS FORCOD,');
  SqlPrincipal.Add('  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,');
  SqlPrincipal.Add('  Fornecedores.RAZAO AS RAZAO,');
  SqlPrincipal.Add('  Fatura.Recebimento AS Recebimento,');
  SqlPrincipal.Add('  Fatura.Valor_NF AS Valor_NF,');
  SqlPrincipal.Add('  Fatura.Selecionado AS Selecionado,');
  SqlPrincipal.Add('  Fatura.MOEDACOMISSAOTAXA AS MOEDACOMISSAOTAXA');
  SqlPrincipal.Add('from ( select      ');  // inicio de sub-select
  SqlPrincipal.Add('       ExportadoTransito.Contrato AS Contrato,');
  SqlPrincipal.Add('       ExportadoTransito.Seq AS Seq,');
  SqlPrincipal.Add('       ExportadoTransito.Status AS Status,');
  SqlPrincipal.Add('       ExportadoTransito.Navio AS Navio,');
  SqlPrincipal.Add('       ExportadoTransito.DataEmbarque AS DataEmbarque,');
  SqlPrincipal.Add('       ExportadoTransito.QuantidadeExp AS QuantidadeExp,');
  SqlPrincipal.Add('       ExportadoTransito.Fatura AS Fatura,');
  SqlPrincipal.Add('       ExportadoTransito.StDocumento AS StDocumento,');
  SqlPrincipal.Add('       ExportadoTransito.Valor AS Valor,');
  SqlPrincipal.Add('       ExportadoTransito.ValorDesconto AS ValorDesconto,');
  SqlPrincipal.Add('       ExportadoTransito.Cadastro AS Cadastro,');
  SqlPrincipal.Add('       ExportadoTransito.ETADestino AS ETADestino,');
  SqlPrincipal.Add('       ExportadoTransito.FormPago AS FormPago,');
  SqlPrincipal.Add('       ExportadoTransito.PrecoFOB AS PrecoFOB,');
  SqlPrincipal.Add('       ExportadoTransito.ComisaoSFatura AS ComisaoSFatura,');
  SqlPrincipal.Add('       ExportadoTransito.DataOrdCobranca AS DataOrdCobranca,');
  SqlPrincipal.Add('       ExportadoTransito.Rate AS Rate,');
  SqlPrincipal.Add('       ExportadoTransito.ValorConvertido AS ValorConvertido,');
  SqlPrincipal.Add('       ExportadoTransito.NumNFEmit AS NumNFEmit,');
  SqlPrincipal.Add('       ExportadoTransito.NumOrdCobranca AS NumOrdCobranca,');
  SqlPrincipal.Add('       ExportadoTransito.DataNF AS DataNF,');
  SqlPrincipal.Add('       ExportadoTransito.OBS AS OBS,');
  SqlPrincipal.Add('       ExportadoTransito.Comentario AS Comentario,');
  SqlPrincipal.Add('       ExportadoTransito.DataLiq AS DataLiq,');
  SqlPrincipal.Add('       ExportadoTransito.Recebimento AS Recebimento,');
  SqlPrincipal.Add('       ExportadoTransito.Valor_NF AS Valor_NF,');
  SqlPrincipal.Add('       ExportadoTransito.Selecionado AS Selecionado,');
  SqlPrincipal.Add('       ExportadoTransito.MOEDACOMISSAOTAXA AS MOEDACOMISSAOTAXA');
  SqlPrincipal.Add('       from  ExportadoTransito'); // fim de sub-select
  SqlPrincipal.Add('     ) as  Fatura');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join ContratoTransporte on');
  FiltroExtra.Add('  Fatura.Contrato = ContratoTransporte.Contrato');
  FiltroExtra.Add('Left Outer Join Fornecedores on');
  FiltroExtra.Add('  ContratoTransporte.FORCOD = Fornecedores.FORCOD');
  Sql.Add('order by Fatura.Cadastro DESC');
  Cadastro := TDFatura_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  Contrato := TDFatura_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  Seq := TDFatura_Seq.Create(AOwner);
  Seq.Valor.DataSet := Self;
  Selecionado := TDFatura_Selecionado.Create(AOwner);
  Selecionado.Valor.DataSet := Self;
  Status := TDFatura_Status.Create(AOwner);
  Status.Valor.DataSet := Self;
  StatusCT := TDFatura_StatusCT.Create(AOwner);
  StatusCT.Valor.DataSet := Self;
  NumOrdCobranca := TDFatura_NumOrdCobranca.Create(AOwner);
  NumOrdCobranca.Valor.DataSet := Self;
  NumNFEmit := TDFatura_NumNFEmit.Create(AOwner);
  NumNFEmit.Valor.DataSet := Self;
  Fatura := TDFatura_Fatura.Create(AOwner);
  Fatura.Valor.DataSet := Self;
  NomeMix := TDFatura_NomeMix.Create(AOwner);
  NomeMix.Valor.DataSet := Self;
  Navio := TDFatura_Navio.Create(AOwner);
  Navio.Valor.DataSet := Self;
  DataEmbarque := TDFatura_DataEmbarque.Create(AOwner);
  DataEmbarque.Valor.DataSet := Self;
  QuantidadeExp := TDFatura_QuantidadeExp.Create(AOwner);
  QuantidadeExp.Valor.DataSet := Self;
  StDocumento := TDFatura_StDocumento.Create(AOwner);
  StDocumento.Valor.DataSet := Self;
  FormComissao := TDFatura_FormComissao.Create(AOwner);
  FormComissao.Valor.DataSet := Self;
  Comissao := TDFatura_Comissao.Create(AOwner);
  Comissao.Valor.DataSet := Self;
  Valor := TDFatura_Valor.Create(AOwner);
  Valor.Valor.DataSet := Self;
  ValorDesconto := TDFatura_ValorDesconto.Create(AOwner);
  ValorDesconto.Valor.DataSet := Self;
  ETADestino := TDFatura_ETADestino.Create(AOwner);
  ETADestino.Valor.DataSet := Self;
  FormPago := TDFatura_FormPago.Create(AOwner);
  FormPago.Valor.DataSet := Self;
  PrecoFOB := TDFatura_PrecoFOB.Create(AOwner);
  PrecoFOB.Valor.DataSet := Self;
  ComisaoSFatura := TDFatura_ComisaoSFatura.Create(AOwner);
  ComisaoSFatura.Valor.DataSet := Self;
  DataOrdCobranca := TDFatura_DataOrdCobranca.Create(AOwner);
  DataOrdCobranca.Valor.DataSet := Self;
  Rate := TDFatura_Rate.Create(AOwner);
  Rate.Valor.DataSet := Self;
  MOEDACOMISSAOTAXA := TDFatura_MOEDACOMISSAOTAXA.Create(AOwner);
  MOEDACOMISSAOTAXA.Valor.DataSet := Self;
  ValorConvertido := TDFatura_ValorConvertido.Create(AOwner);
  ValorConvertido.Valor.DataSet := Self;
  DataNF := TDFatura_DataNF.Create(AOwner);
  DataNF.Valor.DataSet := Self;
  OBS := TDFatura_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  Comentario := TDFatura_Comentario.Create(AOwner);
  Comentario.Valor.DataSet := Self;
  DataLiq := TDFatura_DataLiq.Create(AOwner);
  DataLiq.Valor.DataSet := Self;
  FORCOD := TDFatura_FORCOD.Create(AOwner);
  FORCOD.Valor.DataSet := Self;
  MOEDACOMISSAO := TDFatura_MOEDACOMISSAO.Create(AOwner);
  MOEDACOMISSAO.Valor.DataSet := Self;
  RAZAO := TDFatura_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  Recebimento := TDFatura_Recebimento.Create(AOwner);
  Recebimento.Valor.DataSet := Self;
  Valor_NF := TDFatura_Valor_NF.Create(AOwner);
  Valor_NF.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(Contrato);
  ChavePrimaria.Add(Seq);
//CRIANDO CAMPOS 
  Campos.Add(Contrato);
  Campos.Add(Seq);
  Campos.Add(Status);
  Campos.Add(StatusCT);
  Campos.Add(NomeMix);
  Campos.Add(Navio);
  Campos.Add(DataEmbarque);
  Campos.Add(QuantidadeExp);
  Campos.Add(Fatura);
  Campos.Add(StDocumento);
  Campos.Add(FormComissao);
  Campos.Add(Comissao);
  Campos.Add(Valor);
  Campos.Add(ValorDesconto);
  Campos.Add(Cadastro);
  Campos.Add(ETADestino);
  Campos.Add(FormPago);
  Campos.Add(PrecoFOB);
  Campos.Add(ComisaoSFatura);
  Campos.Add(DataOrdCobranca);
  Campos.Add(Rate);
  Campos.Add(ValorConvertido);
  Campos.Add(NumNFEmit);
  Campos.Add(NumOrdCobranca);
  Campos.Add(DataNF);
  Campos.Add(OBS);
  Campos.Add(Comentario);
  Campos.Add(DataLiq);
  Campos.Add(FORCOD);
  Campos.Add(MOEDACOMISSAO);
  Campos.Add(RAZAO);
  Campos.Add(Recebimento);
  Campos.Add(Valor_NF);
  Campos.Add(Selecionado);
  Campos.Add(MOEDACOMISSAOTAXA);
  TituloIndices.Add('Contrato,Seq.');
  Indices.Add('Fatura.Contrato,Fatura.Seq');
  Crescente.Add('S');
  TituloPrimaria := 'Contrato,Seq.';
  ChPrimaria     := 'Fatura.Contrato,Fatura.Seq';
//CRIANDO TituloIndices 
  TituloIndice   := 'Cadastro';
  ChaveIndice    := 'Fatura.Cadastro DESC';
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

procedure TDFatura.CriaForeignKeys;
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

function TDFatura.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDFatura.ExclusaoCascata;
begin
end;

function TDFatura.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
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

function TDFatura.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ExportadoTransito') then
    if PTabela(TabGlobal.DFatura, ['Contrato','Seq'], [Contrato.Valor.Value,Seq.Valor.Value]) then
      Result := True;
end;

procedure TDFatura.CalculaCampos;
begin
  ComisaoSFatura.Conteudo := CalculaDFatura_ComisaoSFatura(Self);
  ValorConvertido.Conteudo := CalculaDFatura_ValorConvertido(Self);
end;

procedure TDFatura.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDFatura.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDFatura.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDFatura.ProcessoDireto1(DataSet: TDataSet);
var
  QueryLc: TTabela;
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissaoExecutado = ValorTotalComissaoExecutado + :Fatura_ValorConvertido') then
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

procedure TDFatura.ProcessoDireto2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if Modificacao then
  begin
    EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
    if EmEdicao then
      TabGlobal.DContratoTransporte.Salva;
    if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissaoExecutado = ValorTotalComissaoExecutado + :Fatura_ValorConvertido') then
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

procedure TDFatura.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDFatura.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissaoExecutado = ValorTotalComissaoExecutado - :Fatura_ValorConvertido') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
end;

procedure TDFatura.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  EmEdicao := TabGlobal.DContratoTransporte.Modificacao;
  if EmEdicao then
    TabGlobal.DContratoTransporte.Salva;
  if not PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value], 'ValorTotalComissaoExecutado = ValorTotalComissaoExecutado - :Fatura_ValorConvertido') then
    MessageDlg('Falha na atualização da Tabela: '+TabGlobal.DContratoTransporte.Titulo, mtError, [mbOk],  0);
  if EmEdicao then
    TabGlobal.DContratoTransporte.Modifica;
  ExclusaoCascata;
end;

procedure TDFatura.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
