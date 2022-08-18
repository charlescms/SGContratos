{
 Classe da tabela: ContratoTransporte - Contra Transporte
}

unit DContratoTransporte;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0003,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDContratoTransporte = class(TTabela)
  public
    Contrato: TDContratoTransporte_Contrato;
    Cadastro: TDContratoTransporte_Cadastro;
    StatusCT: TDContratoTransporte_StatusCT;
    CLICOD: TDContratoTransporte_CLICOD;
    RAZAO: TDContratoTransporte_RAZAO;
    seq: TDContratoTransporte_seq;
    NOME: TDContratoTransporte_NOME;
    FORCOD: TDContratoTransporte_FORCOD;
    RAZAOEXPOSTADOR: TDContratoTransporte_RAZAOEXPOSTADOR;
    ID: TDContratoTransporte_ID;
    NOME_PAIS: TDContratoTransporte_NOME_PAIS;
    C_C: TDContratoTransporte_C_C;
    SDataEmbarque: TDContratoTransporte_SDataEmbarque;
    PrecoFOBTotal: TDContratoTransporte_PrecoFOBTotal;
    QuantidadeTotal: TDContratoTransporte_QuantidadeTotal;
    QUANTTOTALEXP: TDContratoTransporte_QUANTTOTALEXP;
    QuantadePendente: TDContratoTransporte_QuantadePendente;
    ValorSCCTotal: TDContratoTransporte_ValorSCCTotal;
    ValorTotalExp: TDContratoTransporte_ValorTotalExp;
    ValorTotalPendente: TDContratoTransporte_ValorTotalPendente;
    Comissao: TDContratoTransporte_Comissao;
    FormComissao: TDContratoTransporte_FormComissao;
    ValorTotalComissao: TDContratoTransporte_ValorTotalComissao;
    VALORTOTALCOMISSAOEXECUTADOUS: TDContratoTransporte_VALORTOTALCOMISSAOEXECUTADOUS;
    ValorTotalComissaoExecutado: TDContratoTransporte_ValorTotalComissaoExecutado;
    OBS: TDContratoTransporte_OBS;
    DataAss: TDContratoTransporte_DataAss;
    NomeMix: TDContratoTransporte_NomeMix;
    Comentario: TDContratoTransporte_Comentario;
    MOEDACOMISSAO: TDContratoTransporte_MOEDACOMISSAO;
    QUANT_PREVISTA: TDContratoTransporte_QUANT_PREVISTA;
    VALOR_PREVISTO: TDContratoTransporte_VALOR_PREVISTO;
    VlTotalComissaoPendente: TDContratoTransporte_VlTotalComissaoPendente;
    ID_FORN: TDContratoTransporte_ID_FORN;
    Usuario: TDContratoTransporte_Usuario;
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

constructor TDContratoTransporte.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'ContratoTransporte';
  Titulo           := 'Contra Transporte';
  Name             := 'DContratoTransporte';
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
  DataSource.Name  := 'DsContratoTransporte';
  with UpdateSql do
  begin
    Name           := 'UpdSql_ContratoTransporte';
    // Exclusão de Registro
    DeleteSQL.Add('delete from ContratoTransporte');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  Contrato = :OLD_Contrato');
    // Inserção de Registro
    InsertSQL.Add('insert into ContratoTransporte');
    InsertSQL.Add('  (');
    InsertSQL.Add('  Contrato,');
    InsertSQL.Add('  Cadastro,');
    InsertSQL.Add('  StatusCT,');
    InsertSQL.Add('  CLICOD,');
    InsertSQL.Add('  seq,');
    InsertSQL.Add('  FORCOD,');
    InsertSQL.Add('  ID,');
    InsertSQL.Add('  C_C,');
    InsertSQL.Add('  SDataEmbarque,');
    InsertSQL.Add('  PrecoFOBTotal,');
    InsertSQL.Add('  QuantidadeTotal,');
    InsertSQL.Add('  QUANTTOTALEXP,');
    InsertSQL.Add('  QuantadePendente,');
    InsertSQL.Add('  ValorSCCTotal,');
    InsertSQL.Add('  ValorTotalExp,');
    InsertSQL.Add('  ValorTotalPendente,');
    InsertSQL.Add('  Comissao,');
    InsertSQL.Add('  FormComissao,');
    InsertSQL.Add('  ValorTotalComissao,');
    InsertSQL.Add('  VALORTOTALCOMISSAOEXECUTADOUS,');
    InsertSQL.Add('  ValorTotalComissaoExecutado,');
    InsertSQL.Add('  OBS,');
    InsertSQL.Add('  DataAss,');
    InsertSQL.Add('  NomeMix,');
    InsertSQL.Add('  Comentario,');
    InsertSQL.Add('  VlTotalComissaoPendente,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :Contrato,');
    InsertSQL.Add('  :Cadastro,');
    InsertSQL.Add('  :StatusCT,');
    InsertSQL.Add('  :CLICOD,');
    InsertSQL.Add('  :seq,');
    InsertSQL.Add('  :FORCOD,');
    InsertSQL.Add('  :ID,');
    InsertSQL.Add('  :C_C,');
    InsertSQL.Add('  :SDataEmbarque,');
    InsertSQL.Add('  :PrecoFOBTotal,');
    InsertSQL.Add('  :QuantidadeTotal,');
    InsertSQL.Add('  :QUANTTOTALEXP,');
    InsertSQL.Add('  :QuantadePendente,');
    InsertSQL.Add('  :ValorSCCTotal,');
    InsertSQL.Add('  :ValorTotalExp,');
    InsertSQL.Add('  :ValorTotalPendente,');
    InsertSQL.Add('  :Comissao,');
    InsertSQL.Add('  :FormComissao,');
    InsertSQL.Add('  :ValorTotalComissao,');
    InsertSQL.Add('  :VALORTOTALCOMISSAOEXECUTADOUS,');
    InsertSQL.Add('  :ValorTotalComissaoExecutado,');
    InsertSQL.Add('  :OBS,');
    InsertSQL.Add('  :DataAss,');
    InsertSQL.Add('  :NomeMix,');
    InsertSQL.Add('  :Comentario,');
    InsertSQL.Add('  :VlTotalComissaoPendente,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update ContratoTransporte');
    ModifySQL.Add('set');
    ModifySQL.Add('  Contrato = :Contrato,');
    ModifySQL.Add('  Cadastro = :Cadastro,');
    ModifySQL.Add('  StatusCT = :StatusCT,');
    ModifySQL.Add('  CLICOD = :CLICOD,');
    ModifySQL.Add('  seq = :seq,');
    ModifySQL.Add('  FORCOD = :FORCOD,');
    ModifySQL.Add('  ID = :ID,');
    ModifySQL.Add('  C_C = :C_C,');
    ModifySQL.Add('  SDataEmbarque = :SDataEmbarque,');
    ModifySQL.Add('  PrecoFOBTotal = :PrecoFOBTotal,');
    ModifySQL.Add('  QuantidadeTotal = :QuantidadeTotal,');
    ModifySQL.Add('  QUANTTOTALEXP = :QUANTTOTALEXP,');
    ModifySQL.Add('  QuantadePendente = :QuantadePendente,');
    ModifySQL.Add('  ValorSCCTotal = :ValorSCCTotal,');
    ModifySQL.Add('  ValorTotalExp = :ValorTotalExp,');
    ModifySQL.Add('  ValorTotalPendente = :ValorTotalPendente,');
    ModifySQL.Add('  Comissao = :Comissao,');
    ModifySQL.Add('  FormComissao = :FormComissao,');
    ModifySQL.Add('  ValorTotalComissao = :ValorTotalComissao,');
    ModifySQL.Add('  VALORTOTALCOMISSAOEXECUTADOUS = :VALORTOTALCOMISSAOEXECUTADOUS,');
    ModifySQL.Add('  ValorTotalComissaoExecutado = :ValorTotalComissaoExecutado,');
    ModifySQL.Add('  OBS = :OBS,');
    ModifySQL.Add('  DataAss = :DataAss,');
    ModifySQL.Add('  NomeMix = :NomeMix,');
    ModifySQL.Add('  Comentario = :Comentario,');
    ModifySQL.Add('  VlTotalComissaoPendente = :VlTotalComissaoPendente,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  Contrato = :OLD_Contrato');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  ContratoTransporte.Contrato AS Contrato,');
    RefreshSQL.Add('  ContratoTransporte.Cadastro AS Cadastro,');
    RefreshSQL.Add('  ContratoTransporte.StatusCT AS StatusCT,');
    RefreshSQL.Add('  ContratoTransporte.CLICOD AS CLICOD,');
    RefreshSQL.Add('  Clientes.RAZAO AS RAZAO,');
    RefreshSQL.Add('  ContratoTransporte.seq AS seq,');
    RefreshSQL.Add('  DIVISOES.NOME AS NOME,');
    RefreshSQL.Add('  ContratoTransporte.FORCOD AS FORCOD,');
    RefreshSQL.Add('  Fornecedores.RAZAO AS RAZAOEXPOSTADOR,');
    RefreshSQL.Add('  ContratoTransporte.ID AS ID,');
    RefreshSQL.Add('  TAB_PAIS.NOME AS NOME_PAIS,');
    RefreshSQL.Add('  ContratoTransporte.C_C AS C_C,');
    RefreshSQL.Add('  ContratoTransporte.SDataEmbarque AS SDataEmbarque,');
    RefreshSQL.Add('  ContratoTransporte.PrecoFOBTotal AS PrecoFOBTotal,');
    RefreshSQL.Add('  ContratoTransporte.QuantidadeTotal AS QuantidadeTotal,');
    RefreshSQL.Add('  ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,');
    RefreshSQL.Add('  ContratoTransporte.QuantadePendente AS QuantadePendente,');
    RefreshSQL.Add('  ContratoTransporte.ValorSCCTotal AS ValorSCCTotal,');
    RefreshSQL.Add('  ContratoTransporte.ValorTotalExp AS ValorTotalExp,');
    RefreshSQL.Add('  ContratoTransporte.ValorTotalPendente AS ValorTotalPendente,');
    RefreshSQL.Add('  ContratoTransporte.Comissao AS Comissao,');
    RefreshSQL.Add('  ContratoTransporte.FormComissao AS FormComissao,');
    RefreshSQL.Add('  ContratoTransporte.ValorTotalComissao AS ValorTotalComissao,');
    RefreshSQL.Add('  ContratoTransporte.VALORTOTALCOMISSAOEXECUTADOUS AS VALORTOTALCOMISSAOEXECUTADOUS,');
    RefreshSQL.Add('  ContratoTransporte.ValorTotalComissaoExecutado AS ValorTotalComissaoExecutado,');
    RefreshSQL.Add('  ContratoTransporte.OBS AS OBS,');
    RefreshSQL.Add('  ContratoTransporte.DataAss AS DataAss,');
    RefreshSQL.Add('  ContratoTransporte.NomeMix AS NomeMix,');
    RefreshSQL.Add('  ContratoTransporte.Comentario AS Comentario,');
    RefreshSQL.Add('  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,');
    RefreshSQL.Add('  Produtos.QUANT_PREVISTA AS QUANT_PREVISTA,');
    RefreshSQL.Add('  Produtos.VALOR_PREVISTO AS VALOR_PREVISTO,');
    RefreshSQL.Add('  ContratoTransporte.VlTotalComissaoPendente AS VlTotalComissaoPendente,');
    RefreshSQL.Add('  Fornecedores.ID AS ID_FORN,');
    RefreshSQL.Add('  ContratoTransporte.Usuario AS Usuario');
    RefreshSQL.Add('from ContratoTransporte');
    RefreshSQL.Add('Left Outer Join TbCondicaoCompra on');
    RefreshSQL.Add('  ContratoTransporte.C_C = TbCondicaoCompra.C_C');
    RefreshSQL.Add('Left Outer Join Clientes on');
    RefreshSQL.Add('  ContratoTransporte.CLICOD = Clientes.CLICOD');
    RefreshSQL.Add('Left Outer Join Fornecedores on');
    RefreshSQL.Add('  ContratoTransporte.FORCOD = Fornecedores.FORCOD');
    RefreshSQL.Add('Left Outer Join DIVISOES on');
    RefreshSQL.Add('  ContratoTransporte.seq = DIVISOES.seq');
    RefreshSQL.Add('  and ContratoTransporte.CLICOD = DIVISOES.CLICOD');
    RefreshSQL.Add('Left Outer Join TAB_PAIS on');
    RefreshSQL.Add('  ContratoTransporte.ID = TAB_PAIS.ID');
    RefreshSQL.Add('Left Outer Join Produtos on');
    RefreshSQL.Add('  ContratoTransporte.NomeMix = Produtos.Produto');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  ContratoTransporte.Contrato = :OLD_Contrato');
  end;
  TabelasExtras.Add('TbCondicaoCompra');
  TabelasExtras.Add('Clientes');
  TabelasExtras.Add('Fornecedores');
  TabelasExtras.Add('DIVISOES');
  TabelasExtras.Add('TAB_PAIS');
  TabelasExtras.Add('Produtos');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  ContratoTransporte.Contrato AS Contrato,');
  SqlPrincipal.Add('  ContratoTransporte.Cadastro AS Cadastro,');
  SqlPrincipal.Add('  ContratoTransporte.StatusCT AS StatusCT,');
  SqlPrincipal.Add('  ContratoTransporte.CLICOD AS CLICOD,');
  SqlPrincipal.Add('  Clientes.RAZAO AS RAZAO,');
  SqlPrincipal.Add('  ContratoTransporte.seq AS seq,');
  SqlPrincipal.Add('  DIVISOES.NOME AS NOME,');
  SqlPrincipal.Add('  ContratoTransporte.FORCOD AS FORCOD,');
  SqlPrincipal.Add('  Fornecedores.RAZAO AS RAZAOEXPOSTADOR,');
  SqlPrincipal.Add('  ContratoTransporte.ID AS ID,');
  SqlPrincipal.Add('  TAB_PAIS.NOME AS NOME_PAIS,');
  SqlPrincipal.Add('  ContratoTransporte.C_C AS C_C,');
  SqlPrincipal.Add('  ContratoTransporte.SDataEmbarque AS SDataEmbarque,');
  SqlPrincipal.Add('  ContratoTransporte.PrecoFOBTotal AS PrecoFOBTotal,');
  SqlPrincipal.Add('  ContratoTransporte.QuantidadeTotal AS QuantidadeTotal,');
  SqlPrincipal.Add('  ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,');
  SqlPrincipal.Add('  ContratoTransporte.QuantadePendente AS QuantadePendente,');
  SqlPrincipal.Add('  ContratoTransporte.ValorSCCTotal AS ValorSCCTotal,');
  SqlPrincipal.Add('  ContratoTransporte.ValorTotalExp AS ValorTotalExp,');
  SqlPrincipal.Add('  ContratoTransporte.ValorTotalPendente AS ValorTotalPendente,');
  SqlPrincipal.Add('  ContratoTransporte.Comissao AS Comissao,');
  SqlPrincipal.Add('  ContratoTransporte.FormComissao AS FormComissao,');
  SqlPrincipal.Add('  ContratoTransporte.ValorTotalComissao AS ValorTotalComissao,');
  SqlPrincipal.Add('  ContratoTransporte.VALORTOTALCOMISSAOEXECUTADOUS AS VALORTOTALCOMISSAOEXECUTADOUS,');
  SqlPrincipal.Add('  ContratoTransporte.ValorTotalComissaoExecutado AS ValorTotalComissaoExecutado,');
  SqlPrincipal.Add('  ContratoTransporte.OBS AS OBS,');
  SqlPrincipal.Add('  ContratoTransporte.DataAss AS DataAss,');
  SqlPrincipal.Add('  ContratoTransporte.NomeMix AS NomeMix,');
  SqlPrincipal.Add('  ContratoTransporte.Comentario AS Comentario,');
  SqlPrincipal.Add('  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,');
  SqlPrincipal.Add('  Produtos.QUANT_PREVISTA AS QUANT_PREVISTA,');
  SqlPrincipal.Add('  Produtos.VALOR_PREVISTO AS VALOR_PREVISTO,');
  SqlPrincipal.Add('  ContratoTransporte.VlTotalComissaoPendente AS VlTotalComissaoPendente,');
  SqlPrincipal.Add('  Fornecedores.ID AS ID_FORN,');
  SqlPrincipal.Add('  ContratoTransporte.Usuario AS Usuario');
  SqlPrincipal.Add('from ContratoTransporte');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join TbCondicaoCompra on');
  FiltroExtra.Add('  ContratoTransporte.C_C = TbCondicaoCompra.C_C');
  FiltroExtra.Add('Left Outer Join Clientes on');
  FiltroExtra.Add('  ContratoTransporte.CLICOD = Clientes.CLICOD');
  FiltroExtra.Add('Left Outer Join Fornecedores on');
  FiltroExtra.Add('  ContratoTransporte.FORCOD = Fornecedores.FORCOD');
  FiltroExtra.Add('Left Outer Join DIVISOES on');
  FiltroExtra.Add('  ContratoTransporte.seq = DIVISOES.seq');
  FiltroExtra.Add('  and ContratoTransporte.CLICOD = DIVISOES.CLICOD');
  FiltroExtra.Add('Left Outer Join TAB_PAIS on');
  FiltroExtra.Add('  ContratoTransporte.ID = TAB_PAIS.ID');
  FiltroExtra.Add('Left Outer Join Produtos on');
  FiltroExtra.Add('  ContratoTransporte.NomeMix = Produtos.Produto');
  Sql.Add('order by ContratoTransporte.Cadastro DESC');
  Cadastro := TDContratoTransporte_Cadastro.Create(AOwner);
  Cadastro.Valor.DataSet := Self;
  Contrato := TDContratoTransporte_Contrato.Create(AOwner);
  Contrato.Valor.DataSet := Self;
  StatusCT := TDContratoTransporte_StatusCT.Create(AOwner);
  StatusCT.Valor.DataSet := Self;
  NomeMix := TDContratoTransporte_NomeMix.Create(AOwner);
  NomeMix.Valor.DataSet := Self;
  RAZAOEXPOSTADOR := TDContratoTransporte_RAZAOEXPOSTADOR.Create(AOwner);
  RAZAOEXPOSTADOR.Valor.DataSet := Self;
  NOME_PAIS := TDContratoTransporte_NOME_PAIS.Create(AOwner);
  NOME_PAIS.Valor.DataSet := Self;
  C_C := TDContratoTransporte_C_C.Create(AOwner);
  C_C.Valor.DataSet := Self;
  FormComissao := TDContratoTransporte_FormComissao.Create(AOwner);
  FormComissao.Valor.DataSet := Self;
  QuantidadeTotal := TDContratoTransporte_QuantidadeTotal.Create(AOwner);
  QuantidadeTotal.Valor.DataSet := Self;
  SDataEmbarque := TDContratoTransporte_SDataEmbarque.Create(AOwner);
  SDataEmbarque.Valor.DataSet := Self;
  PrecoFOBTotal := TDContratoTransporte_PrecoFOBTotal.Create(AOwner);
  PrecoFOBTotal.Valor.DataSet := Self;
  ValorSCCTotal := TDContratoTransporte_ValorSCCTotal.Create(AOwner);
  ValorSCCTotal.Valor.DataSet := Self;
  ValorTotalComissao := TDContratoTransporte_ValorTotalComissao.Create(AOwner);
  ValorTotalComissao.Valor.DataSet := Self;
  Comissao := TDContratoTransporte_Comissao.Create(AOwner);
  Comissao.Valor.DataSet := Self;
  RAZAO := TDContratoTransporte_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  NOME := TDContratoTransporte_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  DataAss := TDContratoTransporte_DataAss.Create(AOwner);
  DataAss.Valor.DataSet := Self;
  QUANTTOTALEXP := TDContratoTransporte_QUANTTOTALEXP.Create(AOwner);
  QUANTTOTALEXP.Valor.DataSet := Self;
  QuantadePendente := TDContratoTransporte_QuantadePendente.Create(AOwner);
  QuantadePendente.Valor.DataSet := Self;
  ValorTotalExp := TDContratoTransporte_ValorTotalExp.Create(AOwner);
  ValorTotalExp.Valor.DataSet := Self;
  ValorTotalPendente := TDContratoTransporte_ValorTotalPendente.Create(AOwner);
  ValorTotalPendente.Valor.DataSet := Self;
  QUANT_PREVISTA := TDContratoTransporte_QUANT_PREVISTA.Create(AOwner);
  QUANT_PREVISTA.Valor.DataSet := Self;
  VALOR_PREVISTO := TDContratoTransporte_VALOR_PREVISTO.Create(AOwner);
  VALOR_PREVISTO.Valor.DataSet := Self;
  ValorTotalComissaoExecutado := TDContratoTransporte_ValorTotalComissaoExecutado.Create(AOwner);
  ValorTotalComissaoExecutado.Valor.DataSet := Self;
  VlTotalComissaoPendente := TDContratoTransporte_VlTotalComissaoPendente.Create(AOwner);
  VlTotalComissaoPendente.Valor.DataSet := Self;
  MOEDACOMISSAO := TDContratoTransporte_MOEDACOMISSAO.Create(AOwner);
  MOEDACOMISSAO.Valor.DataSet := Self;
  OBS := TDContratoTransporte_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  Comentario := TDContratoTransporte_Comentario.Create(AOwner);
  Comentario.Valor.DataSet := Self;
  seq := TDContratoTransporte_seq.Create(AOwner);
  seq.Valor.DataSet := Self;
  CLICOD := TDContratoTransporte_CLICOD.Create(AOwner);
  CLICOD.Valor.DataSet := Self;
  ID := TDContratoTransporte_ID.Create(AOwner);
  ID.Valor.DataSet := Self;
  FORCOD := TDContratoTransporte_FORCOD.Create(AOwner);
  FORCOD.Valor.DataSet := Self;
  ID_FORN := TDContratoTransporte_ID_FORN.Create(AOwner);
  ID_FORN.Valor.DataSet := Self;
  Usuario := TDContratoTransporte_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
  VALORTOTALCOMISSAOEXECUTADOUS := TDContratoTransporte_VALORTOTALCOMISSAOEXECUTADOUS.Create(AOwner);
  VALORTOTALCOMISSAOEXECUTADOUS.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(Contrato);
//CRIANDO CAMPOS 
  Campos.Add(Contrato);
  Campos.Add(Cadastro);
  Campos.Add(StatusCT);
  Campos.Add(CLICOD);
  Campos.Add(RAZAO);
  Campos.Add(seq);
  Campos.Add(NOME);
  Campos.Add(FORCOD);
  Campos.Add(RAZAOEXPOSTADOR);
  Campos.Add(ID);
  Campos.Add(NOME_PAIS);
  Campos.Add(C_C);
  Campos.Add(SDataEmbarque);
  Campos.Add(PrecoFOBTotal);
  Campos.Add(QuantidadeTotal);
  Campos.Add(QUANTTOTALEXP);
  Campos.Add(QuantadePendente);
  Campos.Add(ValorSCCTotal);
  Campos.Add(ValorTotalExp);
  Campos.Add(ValorTotalPendente);
  Campos.Add(Comissao);
  Campos.Add(FormComissao);
  Campos.Add(ValorTotalComissao);
  Campos.Add(VALORTOTALCOMISSAOEXECUTADOUS);
  Campos.Add(ValorTotalComissaoExecutado);
  Campos.Add(OBS);
  Campos.Add(DataAss);
  Campos.Add(NomeMix);
  Campos.Add(Comentario);
  Campos.Add(MOEDACOMISSAO);
  Campos.Add(QUANT_PREVISTA);
  Campos.Add(VALOR_PREVISTO);
  Campos.Add(VlTotalComissaoPendente);
  Campos.Add(ID_FORN);
  Campos.Add(Usuario);
  TituloIndices.Add('Contrato');
  Indices.Add('ContratoTransporte.Contrato');
  Crescente.Add('S');
  TituloPrimaria := 'Contrato';
  ChPrimaria     := 'ContratoTransporte.Contrato';
//CRIANDO TituloIndices 
  TituloIndice   := 'Cadastro';
  ChaveIndice    := 'ContratoTransporte.Cadastro DESC';
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

procedure TDContratoTransporte.CriaForeignKeys;
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

function TDContratoTransporte.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDContratoTransporte.ExclusaoCascata;
begin
  // Exclusão em Cascata Tabela: DProdutoContratoT
  TabGlobal.DProdutoContratoT.Filtro.Clear;
  TabGlobal.DProdutoContratoT.Filtro.Add('ProdutoContratoT.Contrato = :ContratoTransporte_Contrato');
  TabGlobal.DProdutoContratoT.AtualizaSql;
  while not TabGlobal.DProdutoContratoT.Eof do
    if not TabGlobal.DProdutoContratoT.Exclui then
      TabGlobal.DProdutoContratoT.Next;
  // Exclusão em Cascata Tabela: DExportadoTransito
  TabGlobal.DExportadoTransito.Filtro.Clear;
  TabGlobal.DExportadoTransito.Filtro.Add('ExportadoTransito.Contrato = :ContratoTransporte_Contrato');
  TabGlobal.DExportadoTransito.AtualizaSql;
  while not TabGlobal.DExportadoTransito.Eof do
    if not TabGlobal.DExportadoTransito.Exclui then
      TabGlobal.DExportadoTransito.Next;
  // Exclusão em Cascata Tabela: DBoocking
  TabGlobal.DBoocking.Filtro.Clear;
  TabGlobal.DBoocking.Filtro.Add('Boocking.Contrato = :ContratoTransporte_Contrato');
  TabGlobal.DBoocking.AtualizaSql;
  while not TabGlobal.DBoocking.Eof do
    if not TabGlobal.DBoocking.Exclui then
      TabGlobal.DBoocking.Next;
end;

function TDContratoTransporte.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Clientes') then
    if (UpperCase('CLICOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DClientes, ['CLICOD'], [CLICOD.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('DIVISOES') then
    if (UpperCase('seq') = UpperCase(CampoFoco)) or (UpperCase('CLICOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DDIVISOES, ['seq','CLICOD'], [seq.Valor.Value,CLICOD.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if (UpperCase('FORCOD') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('TAB_PAIS') then
    if (UpperCase('ID') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DTAB_PAIS, ['ID'], [ID.Valor.Value], [Campo], Retorno) then
        Result := True;

  if UpperCase(Tabela) = UpperCase('Produtos') then
    if (UpperCase('NomeMix') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DProdutos, ['Produto'], [NomeMix.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDContratoTransporte.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('Clientes') then
    if PTabela(TabGlobal.DClientes, ['CLICOD'], [CLICOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('DIVISOES') then
    if PTabela(TabGlobal.DDIVISOES, ['seq','CLICOD'], [seq.Valor.Value,CLICOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('TAB_PAIS') then
    if PTabela(TabGlobal.DTAB_PAIS, ['ID'], [ID.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Produtos') then
    if PTabela(TabGlobal.DProdutos, ['Produto'], [NomeMix.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('TbCondicaoCompra') then
    if PTabela(TabGlobal.DTbCondicaoCompra, ['C_C'], [C_C.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('ContratoTransporte') then
    if PTabela(TabGlobal.DContratoTransporte, ['Contrato'], [Contrato.Valor.Value]) then
      Result := True;
end;

procedure TDContratoTransporte.CalculaCampos;
begin
  StatusCT.Conteudo := CalculaDContratoTransporte_StatusCT(Self);
  QuantadePendente.Conteudo := CalculaDContratoTransporte_QuantadePendente(Self);
  ValorTotalPendente.Conteudo := CalculaDContratoTransporte_ValorTotalPendente(Self);
  VlTotalComissaoPendente.Conteudo := CalculaDContratoTransporte_VlTotalComissaoPendente(Self);
end;

procedure TDContratoTransporte.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
  TabGlobal.DProdutoContratoT.AtribuiFiltroMestre(Atribui);
  TabGlobal.DExportadoTransito.AtribuiFiltroMestre(Atribui);
  TabGlobal.DBoocking.AtribuiFiltroMestre(Atribui);
end;

procedure TDContratoTransporte.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDContratoTransporte.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDContratoTransporte.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDContratoTransporte.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDContratoTransporte.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (Contrato.SempreAtribui) and (Contrato.AutoIncremento > 0) then
      AutoIncremento('Contrato', True, Contrato.AutoIncremento);
end;

procedure TDContratoTransporte.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDContratoTransporte.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDContratoTransporte.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
