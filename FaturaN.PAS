{
   Programa.: FaturaN.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
}
unit FaturaN;

interface

{$I Princ.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, 
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Tabs, BaseD, Db, Grids, DBGrids,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Atributo, dbctrls, Clipbrd, Tabela, Menus, IniFiles, Printers, Calculos,
  {$I LTab.pas} UCMS_CONST , 
  JPeg, XLookUp, XDBDate, Mask, XDBEdit, XDBNum, XEdit, XBanner, XDate, XNum, ToolEdit;
  {$IFDEF ERRO_LOG}
  {$ENDIF}
{
const
 MSG_ConfirmaAtualizaroRATEemtodososregistroselecionados = 'Confirma Atualizar o RATE em todos os registro selecionados' ;
 MSG_ConfirmaAtualizaroNumerodaNotaFiscalemtodososregistroselecionados = 'Confirma Atualizar o Número da Nota Fiscal em todos os registro selecionados' ;
 MSG_FILTROTEMQUESERCRIADO = 'Filtro tem que ser criado! ' ;
 MSG_FATURASURIMPEXJACRIADA = 'Fatura surimpex já criada! ' ;
}

type
  TFormFaturaN = class(TForm)
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    AbaConsulta: TTabSet;
    AbrirImagem: TMenuItem;
    BitBtn_NotaFiscal: TBitBtn;
    BitBtn_Rate: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BtnAnterior: TSpeedButton;
    BtnDesistir: TBitBtn;
    BtnExcluir: TSpeedButton;
    BtnIncluir: TSpeedButton;
    BtnLocalizar: TSpeedButton;
    BtnModificar: TSpeedButton;
    BtnPrimeiro: TSpeedButton;
    BtnProximo: TSpeedButton;
    BtnRefresh: TSpeedButton;
    BtnRelac_1: TBitBtn;
    BtnRelac_2: TBitBtn;
    BtnSalvar: TBitBtn;
    BtnTabela: TSpeedButton;
    BtnUltimo: TSpeedButton;
    Button1: TButton;
    Cadastro: TXDBDateEdit;
    Ck_Selecionado: TDBCheckBox;
    CMB_EXP: TComboBox;
    CMB_FATURA: TComboBox;
    cmb_moeda: TComboBox;
    CMB_SITUACAO: TComboBox;
    ColarImagem: TMenuItem;
    Comentario: TDBMemo;
    ComisaoSFatura: TXDBNumEdit;
    Comissao: TXDBNumEdit;
    Contrato: TXDBEdit;
    CopiarImagem: TMenuItem;
    CortarImagem: TMenuItem;
    DataEmbarque: TXDBDateEdit;
    DataLiq: TXDBDateEdit;
    DataNF: TXDBDateEdit;
    DataOrdCobranca: TXDBDateEdit;
    DataSource: TDataSource;
    DBG_FATURA: TDBGrid;
    Divisao_sup: TPanel;
    DlgAbrirImagem: TOpenDialog;
    DlgSalvarComoImagem: TSaveDialog;
    DT_FINAL: TDateEdit;
    DT_INCIAL: TDateEdit;
    ETADestino: TXDBDateEdit;
    Fatura: TXDBEdit;
    FORCOD: TXDBNumEdit;
    FormComissao: TDBComboBox;
    FormPago: TXDBLookUp;
    GridConsulta: TDBGrid;
    GroupBox_CalcularRate: TGroupBox;
    GroupBox_Contrato: TGroupBox;
    GroupBox_Fatura: TGroupBox;
    GroupBox_NotaF: TGroupBox;
    GroupBox_notaFiscal: TGroupBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Img_Form: TImage;
    Img_Tabela: TImage;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LbcCadastro: TLabel;
    LbcComentario: TLabel;
    LbcComisaoSFatura: TLabel;
    LbcComissao: TLabel;
    LbcContrato: TLabel;
    LbcDataEmbarque: TLabel;
    LbcDataLiq: TLabel;
    LbcDataNF: TLabel;
    LbcDataOrdCobranca: TLabel;
    LbcETADestino: TLabel;
    LbcFatura: TLabel;
    LbcFORCOD: TLabel;
    LbcFormComissao: TLabel;
    LbcFormPago: TLabel;
    LbcMOEDACOMISSAO: TLabel;
    LbcMOEDACOMISSAOTAXA: TLabel;
    LbcNavio: TLabel;
    LbcNomeMix: TLabel;
    LbcNumNFEmit: TLabel;
    LbcNumOrdCobranca: TLabel;
    LbcOBS: TLabel;
    LbcPrecoFOB: TLabel;
    LbcQuantidade: TLabel;
    LbcRate: TLabel;
    LbcRAZAO: TLabel;
    LbcRecebimento: TLabel;
    LbcSeq: TLabel;
    LbcStatus: TLabel;
    LbcValor: TLabel;
    LbcValor_NF: TLabel;
    LbcValorConvertido: TLabel;
    LbcValorDesconto: TLabel;
    MenuImagem: TPopupMenu;
    MnSep01: TMenuItem;
    mnu_ApagarColuna: TMenuItem;
    mnu_CalcularMedia: TMenuItem;
    mnu_ExcluirConsulta: TMenuItem;
    mnu_Filtrar: TMenuItem;
    mnu_Imprimir: TMenuItem;
    mnu_Ordenar: TMenuItem;
    mnu_OrdenarComposto: TMenuItem;
    mnu_Quantificar: TMenuItem;
    mnu_SalvarConsulta: TMenuItem;
    mnu_TotalizarColuna: TMenuItem;
    MOEDACOMISSAO: TDBComboBox;
    MOEDACOMISSAOTAXA: TDBComboBox;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Navio: TXDBEdit;
    NoManutencao: TNotebook;
    NomeMix: TXDBLookUp;
    NumNFEmit: TXDBNumEdit;
    NumOrdCobranca: TXDBEdit;
    OBS: TXDBEdit;
    PagePrincipal: TPageControl;
    Pagina0: TScrollBox;
    Pagina1: TScrollBox;
    Pagina2: TScrollBox;
    Pagina3: TScrollBox;
    Pagina4: TScrollBox;
    Panel1: TPanel;
    Panel2: TPanel;
    PgPagina1: TScrollBox;
    PnInfConsulta: TPanel;
    PnSalva: TPanel;
    PnSuperior: TPanel;
    PopConsulta: TPopupMenu;
    PopRelacionados: TPopupMenu;
    PrecoFOB: TXDBNumEdit;
    QuantidadeExp: TXDBNumEdit;
    Rate: TXDBNumEdit;
    RAZAO: TXDBEdit;
    Recebimento: TXDBDateEdit;
    SalvarImagem: TMenuItem;
    Selecionado: TDBCheckBox;
    Seq: TXDBNumEdit;
    Status: TDBComboBox;
    StDocumento: TDBRadioGroup;
    TabConsulta: TTabSheet;
    TabManutencao: TTabSheet;
    TabPaginas: TTabSet;
    Valor: TXDBNumEdit;
    Valor_NF: TXDBNumEdit;
    ValorConvertido: TXDBNumEdit;
    ValorDesconto: TXDBNumEdit;
    XDateEdit_DataLiq: TXDateEdit;
    XDateEdit_DataNF: TXDateEdit;
    XNumEdit_NotaFiscal: TXNumEdit;
    XNumEdit_Rate: TXNumEdit;
    XNumEdit_ValorNF: TXNumEdit;
    BitBtn28: TBitBtn;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure ContratoExit(Sender: TObject);
    procedure SeqExit(Sender: TObject);
    procedure NavioExit(Sender: TObject);
    procedure CadastroExit(Sender: TObject);
    procedure DataEmbarqueExit(Sender: TObject);
    procedure ETADestinoExit(Sender: TObject);
    procedure FaturaExit(Sender: TObject);
    procedure ValorExit(Sender: TObject);
    procedure ValorDescontoExit(Sender: TObject);
    procedure FormPagoExit(Sender: TObject);
    procedure PrecoFOBExit(Sender: TObject);
    procedure FormComissaoExit(Sender: TObject);
    procedure FormComissaoDrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
    procedure ComissaoExit(Sender: TObject);
    procedure ComisaoSFaturaExit(Sender: TObject);
    procedure StDocumentoExit(Sender: TObject);
    procedure OBSExit(Sender: TObject);
    procedure ComentarioExit(Sender: TObject);
    procedure RateExit(Sender: TObject);
    procedure DataLiqExit(Sender: TObject);
    procedure NumNFEmitExit(Sender: TObject);
    procedure DataNFExit(Sender: TObject);
    procedure MOEDACOMISSAOExit(Sender: TObject);
    procedure MOEDACOMISSAODrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
    procedure ValorConvertidoExit(Sender: TObject);
    procedure FORCODExit(Sender: TObject);
    procedure NomeMixExit(Sender: TObject);
    procedure StatusExit(Sender: TObject);
    procedure StatusDrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
    procedure RAZAOExit(Sender: TObject);
    procedure RecebimentoExit(Sender: TObject);
    procedure Valor_NFExit(Sender: TObject);
    procedure QuantidadeExpExit(Sender: TObject);
    procedure SelecionadoExit(Sender: TObject);
    procedure DataOrdCobrancaExit(Sender: TObject);
    procedure NumOrdCobrancaExit(Sender: TObject);
    procedure MOEDACOMISSAOTAXAExit(Sender: TObject);
    procedure MOEDACOMISSAOTAXADrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnDesistirClick(Sender: TObject);
    procedure GridConsultaDblClick(Sender: TObject);
    procedure PagePrincipalChange(Sender: TObject);
    procedure mnu_FiltrarClick(Sender: TObject);
    procedure mnu_OrdenarClick(Sender: TObject);
    procedure mnu_OrdenarCompostoClick(Sender: TObject);
    procedure mnu_ApagarColunaClick(Sender: TObject);
    procedure mnu_QuantificarClick(Sender: TObject);
    procedure mnu_TotalizarColunaClick(Sender: TObject);
    procedure mnu_CalcularMediaClick(Sender: TObject);
    procedure mnu_ImprimirClick(Sender: TObject);
    procedure mnu_SalvarConsultaClick(Sender: TObject);
    procedure mnu_ExcluirConsultaClick(Sender: TObject);
    procedure AbaConsultaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TabPaginasClick(Sender: TObject);
    procedure CortarImagemClick(Sender: TObject);
    procedure CopiarImagemClick(Sender: TObject);
    procedure ColarImagemClick(Sender: TObject);
    procedure AbrirImagemClick(Sender: TObject);
    procedure SalvarImagemClick(Sender: TObject);
    procedure BtnRelac_1Click(Sender: TObject);
    procedure PopRelacionadosClick(Sender: TObject);
    procedure ChamaGridPesquisa(Sender: TObject);
    procedure ValidaColunaGrid(Sender: TField);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnModificarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnTabelaClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CMB_EXPChange(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn_RateClick(Sender: TObject);
    procedure BitBtn_NotaFiscalClick(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure GridConsultaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBG_FATURADrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure DBG_FATURADblClick(Sender: TObject);
    procedure DBG_FATURAColExit(Sender: TObject);
    procedure DBG_FATURAKeyPress(Sender: TObject; var Key: Char);
    procedure Ck_SelecionadoClick(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure SelecionadoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
  private
    { Private declarations }
    S_FILTRO : STRING ;
    pi_CODFOR : integer ;
    Navegando: Boolean;
    ListaCamposED: TListaCampos; {Conterá a lista de campos em edição na ED}
    TituloModulo: String;
    ConsultasSalvas: TList;
    PaginaIni: Integer;
    ErroValidacao: Boolean;
    SalvarRegistro: Boolean;
    procedure StatusTabela;
    function AbreTabelas: Boolean;
    procedure MudaSeForUltimo;
    function AbandonandoEdicao: Boolean;
    procedure TelaManutencao;
    procedure TelaConsulta;
    procedure AtribuiValoresPadrao;
    procedure PosicionaNoCampo(Campo: TAtributo);
    procedure VerificaAtualizacoes;
    procedure ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
    procedure Localizar(Sender: TObject);
    procedure Incluir(Sender: TObject);
    procedure Modificar(Sender: TObject);
    procedure Excluir(Sender: TObject);
    procedure Primeiro(Sender: TObject);
    procedure Anterior(Sender: TObject);
    procedure Proximo(Sender: TObject);
    procedure Ultimo(Sender: TObject);
    procedure AntesdeSalvar;
    procedure AntesdeIncluir;
    procedure AntesdeModificar;
    procedure AntesdeExcluir;
    procedure DepoisdeIncluir;
    procedure DepoisdeModificar;
    procedure DepoisdeExcluir;
    function ConfirmaInclusao: Boolean;
    function ConfirmaModificacao: Boolean;
    function ConfirmaExclusao: Boolean;
    function ConfirmaGravacao: Boolean;
    procedure CamposCalculados;
    procedure HabilitaEdicao(Valor: Boolean = true);
    function Existe_selecionados() : boolean ;
    procedure Deselecionar_reg();
    function Existe_Rate():boolean ;
  public
    { Public declarations }
    {03-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    TabelaPrincipal: TTabela;
    {04-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
  end;

var
  FormFaturaN: TFormFaturaN;
  LastControl: TWinControl;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, RotinaEd, Abertura, GridPesquisa, RELCOMPEN, RELFATURA,
   REL_FATURATAB, OrdemCobranca;

procedure TFormFaturaN.FormShow(Sender: TObject);
Var
  I: Integer;
  TMP_TAB : TTabela ;
  S_ITENS : STRING ;
begin
  // atualiza estrutura 
  TabGlobal.DOrdemCobranca.Close;
  TabGlobal.DOrdemCobranca.Filtro.Clear;
  TabGlobal.DOrdemCobranca.AtualizaSql;

  pi_CODFOR := 0 ;
  TMP_TAB := TTabela.Create(NIL) ;
  TMP_TAB.DataBase  := TabGlobal.DFATURA.DataBase ;
  TMP_TAB.Transaction := TabGlobal.DFATURA.Transaction ;

{
  CMB_SITUACAO.ITEMS.Add('                ') ;
  CMB_SITUACAO.ITEMS.Add('Em processamento') ;
  CMB_SITUACAO.ITEMS.Add('Fatura Surimpex') ;
  CMB_SITUACAO.ITEMS.Add('NF Emitida') ;
  CMB_SITUACAO.ITEMS.Add('NF Pago') ;
  CMB_SITUACAO.ITEMS.Add('Protesto');
  CMB_SITUACAO.ITEMS.Add('Comissões Pendentes');
  CMB_SITUACAO.ITEMS.Add('Ordem Cobrança');
  CMB_SITUACAO.ITEMS.Add('Aplicar Rate');
}
  CMB_SITUACAO.ITEMS.Add('                ') ;

  CMB_SITUACAO.ITEMS.Add(cmb_Em_processamento);         // '0', 'Em processamento');
  CMB_SITUACAO.ITEMS.Add(cmb_Fatura_Surimpex);          // '1', 'Fatura Surimpex');
  CMB_SITUACAO.ITEMS.Add(cmb_NF_Emitida);               // '2', 'NF Emitida');
  CMB_SITUACAO.ITEMS.Add(cmb_NF_Paga);                  // '3', 'NF Paga');
  CMB_SITUACAO.ITEMS.Add(cmb_Protesto);                 // '4', 'Protesto');
  CMB_SITUACAO.ITEMS.Add(cmb_Conciliacao_Emitida);      // '5', 'Conciliação Emitida');
  CMB_SITUACAO.ITEMS.Add(cmb_Conciliacao_Realizada);    // '6', 'Conciliação Realizada');
  CMB_SITUACAO.ITEMS.Add(cmb_Aplicar_Rate);             // '7', 'Aplicar Rate');
  CMB_SITUACAO.ITEMS.Add(cmb_Fatura_Escluido);          // '8', 'Fatura Escluido');
  CMB_SITUACAO.ITEMS.Add(cmb_Boocking);                 // '9', 'Boocking');
  CMB_SITUACAO.ITEMS.Add(cmb_Em_Execucao);              // 'A', 'Em Execução');
  CMB_SITUACAO.ITEMS.Add(cmb_Exportacao_Bloqueada);     // 'B', 'Exportação Bloqueada');

  CMB_EXP.ITEMS.CLEAR;

  TMP_TAB.SQL.Clear ;
  TMP_TAB.SQL.ADD('SELECT FORCOD,RAZAO FROM Fornecedores ORDER BY RAZAO');
  TMP_TAB.Prepare ;
  TMP_TAB.Open ;
  WHILE NOT TMP_TAB.Eof DO BEGIN
     S_ITENS := TMP_TAB.FieldValues['RAZAO'] +  StrZero (TMP_TAB.FieldValues['FORCOD']  ,6 ) ;
     CMB_EXP.ITEMS.Add(S_ITENS) ;
     TMP_TAB.Next;
  END;
  TMP_TAB.Close ;
  TMP_TAB.Free ;


  

  {05-Início do Bloco Modular. Modificações não serão preservadas}
  TabelaPrincipal    := TabGlobal.DFatura;
  TituloModulo       := 'Faturas';
  Caption            := TituloModulo;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  
  TabelaPrincipal.filtro.Clear  ;
  TabelaPrincipal.AtualizaSql;

  CMB_FATURA.Items.Clear;
  CMB_FATURA.Items.Add('') ;
  TabelaPrincipal.First ;
  WHILE NOT TabelaPrincipal.Eof DO BEGIN
   CMB_FATURA.Items.ADD(TabelaPrincipal.FieldValues['Fatura']);
   TabelaPrincipal.NEXT ;
  END;
  TabelaPrincipal.First ;

  FormPrincipal.PnImagemFundo.Visible := False;
  Sistema.JanelasMDI := Sistema.JanelasMDI + 01;
  if Sistema.JanelasMDI < 1 then   // Pouco provável + ...
    Sistema.JanelasMDI := 1;
  Navegando          := False;
  DataSource.DataSet := TabelaPrincipal;
  ListaCamposED      := TListaCampos.Create;
  ConsultasSalvas    := TList.Create;
  PaginaIni          := 0;
  ErroValidacao      := False;
  TabPaginas.TabIndex:= 0;

  DBG_FATURA.DataSource   := DataSource ;

  //DBG_FATURA:= GridConsulta ;
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  AtribuiCampoEdicao(TabGlobal.DFatura, TabGlobal.DFatura.MOEDACOMISSAOTAXA, -3, MOEDACOMISSAOTAXAExit, MOEDACOMISSAOTAXADrawItem, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFatura, TabGlobal.DFatura.NumOrdCobranca, -3, NumOrdCobrancaExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFatura, TabGlobal.DFatura.DataOrdCobranca, -3, DataOrdCobrancaExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFatura, TabGlobal.DFatura.Selecionado, -3, SelecionadoExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFatura, TabGlobal.DFatura.QuantidadeExp, -3, QuantidadeExpExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.Valor_NF, -3, Valor_NFExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.Recebimento, -3, RecebimentoExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.RAZAO, -3, RAZAOExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.Status, -3, StatusExit, StatusDrawItem, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.NomeMix, -3, NomeMixExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.FORCOD, -3, FORCODExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.ValorConvertido, -3, ValorConvertidoExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.MOEDACOMISSAO, -3, MOEDACOMISSAOExit, MOEDACOMISSAODrawItem, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.DataNF, -3, DataNFExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.NumNFEmit, -3, NumNFEmitExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.DataLiq, -3, DataLiqExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.Rate, -3, RateExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.Comentario, -3, ComentarioExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.OBS, -3, OBSExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.StDocumento, -3, StDocumentoExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.ComisaoSFatura, -3, ComisaoSFaturaExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.Comissao, -3, ComissaoExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.FormComissao, -3, FormComissaoExit, FormComissaoDrawItem, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.PrecoFOB, -3, PrecoFOBExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.FormPago, -3, FormPagoExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.ValorDesconto, -3, ValorDescontoExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.Valor, -3, ValorExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.Fatura, -3, FaturaExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.ETADestino, -3, ETADestinoExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.DataEmbarque, -3, DataEmbarqueExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.Cadastro, -3, CadastroExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.Navio, -3, NavioExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.Seq, -1, SeqExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFATURA, TabGlobal.DFATURA.Contrato, -1, ContratoExit, Nil, ListaCamposEd, FormFaturaN, DataSource, ChamaGridPesquisa);
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  CamposCalculados;
  if not AbreTabelas then exit;
  AjustaColunasConsulta(TabelaPrincipal);
  TabelaPrincipal.AtualizaSql;
  StatusTabela;
  TabelaPrincipal.First;
  FormResize(Self);
  BtnSalvar.Enabled   := False;
  BtnDesistir.Enabled := False;
  InicializaConsultasSalvas(TabelaPrincipal, AbaConsulta, ConsultasSalvas);
  PagePrincipal.ActivePageIndex := 1;
  NoManutencao.PageIndex        := 0;
  PagePrincipal.OnChange        := PagePrincipalChange;
  TelaConsulta;
  GridConsulta.SetFocus;
  DBG_FATURA.Align   := alClient ;
  Panel1.Align       := alTop ;

//  DT_INCIAL.Text := '01/05/2011';
//  DT_FINAL.Text :=  '31/05/2011';

  BitBtn4.Hint:= 'ORDEM DE COBRNAÇA';
  BitBtn2.Hint:= 'RELATÓRIO DE COMISSÕES PENDENTES';
  GroupBox_Contrato.Align := alTop ;
  GroupBox_Fatura.Align := alTop ;
  GroupBox_NotaF.Align := alTop ;
  BitBtn_Rate.Hint := 'Aplicar Rate a Dados Selecionados';
  GroupBox_CalcularRate.Visible := false ;
  GroupBox_CalcularRate.Left := 410 ; //336;       GroupBox_NotaF
  GroupBox_CalcularRate.Top := GroupBox_NotaF.Top ;  // GroupBox_Fatura.Top ;
  BitBtn_NotaFiscal.Hint := 'Aplicar número de Nota Fiscal a todos os Dadosc Selecionados';
  GroupBox_notaFiscal.Left :=  464 ;
  GroupBox_notaFiscal.Top :=  GroupBox_NotaF.Top ;
  GroupBox_notaFiscal.Visible := false ;

  // charles
  Ck_Selecionado.DataSource :=  Selecionado.DataSource ;
  Ck_Selecionado.DataField  :=  Selecionado.DataField ;
  Ck_Selecionado.Visible := False;
  Ck_Selecionado.Color := DBG_FATURA.Color;
  Ck_Selecionado.Caption := '';
  Ck_Selecionado.ValueChecked   := 'Sim';
  Ck_Selecionado.ValueUnChecked := 'Nao';
  
  TabGlobal.DOrdemCobranca.Open ;
  TabGlobal.DOrdemCobranca.AtribuiRelacionamentos();
  TabGlobal.DOrdemCobrancaProdExp.Open ;

  cmb_moeda.Items.Clear ;
  cmb_moeda.Items := MOEDACOMISSAO.Items ;


end;
                                                        
function TFormFaturaN.AbreTabelas: Boolean;
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  Result := True;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormFaturaN.CamposCalculados;
begin
  {08-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormFaturaN.HabilitaEdicao(Valor: Boolean = true);
var
  I: Integer;
  Comp: TComponent;
  CampoED: TCampoEdicao;
begin
  for I := 0 to 10 do
  begin
    Comp := FindComponent('Pagina' + IntToStr(I));
    if Comp <> nil then
      TScrollBox(Comp).Enabled := Valor;
  end;
  if Valor then
    for I:=0 to ListaCamposED.Count-1 do
    begin
      CampoED := TCampoEdicao(ListaCamposED[I]);
      if (CampoED.Controle.TabOrder = 0) and (CampoED.Controle.CanFocus) then
      begin
        CampoED.Controle.SetFocus;
        Break;
      end;
    end;
end;

function TFormFaturaN.ConfirmaInclusao: Boolean;
begin
  Result := True;
end;

function TFormFaturaN.ConfirmaModificacao: Boolean;
begin
  Result := True;
end;

function TFormFaturaN.ConfirmaExclusao: Boolean;
begin
  Result := True;
end;

function TFormFaturaN.ConfirmaGravacao: Boolean;
begin
  Result := True;
end;

procedure TFormFaturaN.TelaManutencao;
begin
{
  if (TabelaPrincipal.Inclusao) or
     (TabelaPrincipal.Modificacao) then
    HabilitaEdicao
  else
    HabilitaEdicao(False);
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
  TabelaPrincipal.AtribuiRelacionamentos;
}

  AtribuiDataSourceCampos(ListaCamposEd, DataSource);
  PagePrincipal.TABINDEX := 0;
  GridConsulta.DataSource := Nil;
  if (TabelaPrincipal.Inclusao) or
     (TabelaPrincipal.Modificacao) then
    HabilitaEdicao
  else
    HabilitaEdicao(False);
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
  TabelaPrincipal.AtribuiRelacionamentos;
  BtnTabela.Caption := 'Tabela';
  BtnTabela.Hint    := 'Visualizar registros em forma de tabela';
  BtnTabela.Glyph   := Img_Tabela.Picture.Bitmap;
  BtnTabela.Tag     := 0;
  Divisao_sup.Visible   := True;  
end;

procedure TFormFaturaN.TelaConsulta;
begin
  AtribuiDataSourceCampos(ListaCamposEd, Nil);
  HabilitaEdicao(False);
  PagePrincipal.TABINDEX := 1;
  GridConsulta.DataSource := DataSource;
  BtnTabela.Caption := 'Formulário';
  BtnTabela.Hint    := 'Visualizar registros em forma de formulário';
  BtnTabela.Glyph   := Img_Form.Picture.Bitmap;
  BtnTabela.Tag     := 1;
  Divisao_sup.Visible   := False;
  GridConsulta.SetFocus;
end;

procedure TFormFaturaN.AtribuiValoresPadrao;
begin
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd, True);
  TabelaPrincipal.AtribuiRelacionamentos;
  TabGlobal.DFATURA.FormComissao.Conteudo := TabGlobal.DContratoTransporte.FormComissao.Conteudo ;
  TabGlobal.DFATURA.Comissao.Conteudo := TabGlobal.DContratoTransporte.Comissao.Conteudo ;


end;

procedure TFormFaturaN.AntesdeSalvar;
begin

end;

procedure TFormFaturaN.AntesdeIncluir;
begin

end;

procedure TFormFaturaN.AntesdeModificar;
begin

end;

procedure TFormFaturaN.AntesdeExcluir;
begin

end;

procedure TFormFaturaN.DepoisdeIncluir;
begin

end;

procedure TFormFaturaN.DepoisdeModificar;
begin

  IF ( TabGlobal.DFatura.NumNFEmit.Conteudo > 0 ) AND
     ( TabGlobal.DFatura.Valor_NF.conteudo > 0 ) THEN
     Atualiza_ST(TabGlobal.DFatura.Contrato.Conteudo,S_ST_NF);


end;

procedure TFormFaturaN.DepoisdeExcluir;
begin

end;

procedure TFormFaturaN.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSalvar.Enabled then
    TabelaPrincipal.Cancela;
end;

procedure TFormFaturaN.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  I: Integer;
begin

  DesabilitaFuncoesEd;
  ListaCamposED.Free;
  for I := 0 to ConsultasSalvas.Count - 1 do
    TConsultasSalvas(ConsultasSalvas[I]).Free;
  ConsultasSalvas.Free;
  Action := caFree;
  FormFaturaN := nil;
end;

procedure TFormFaturaN.StatusTabela;
begin
//  LbTituloForm.Caption := TituloModulo + '- [ Ordem: '+TabelaPrincipal.TituloIndice+' ]';
end;

procedure TFormFaturaN.FormResize(Sender: TObject);
begin
//  BtnAjuda.Left  := ShapeSup.Width - 37;
//  BtnFechar.Left := ShapeSup.Width - 19;
end;

procedure TFormFaturaN.FormActivate(Sender: TObject);
begin
  {
    Inicializa Menu Manutenção e Barra de Ferramentas
  }
//  foi retirado
//  FormPrincipal.BarraPrincipal.Visible := True;
  FormPrincipal.BtnLocalizar.Visible := True;
  FormPrincipal.BtnIncluir.Visible   := True;
  FormPrincipal.BtnModificar.Visible := True;
  FormPrincipal.BtnExcluir.Visible   := True;
  FormPrincipal.BtnPrimeiro.Visible  := True;
  FormPrincipal.BtnAnterior.Visible  := True;
  FormPrincipal.BtnProximo.Visible   := True;
  FormPrincipal.BtnUltimo.Visible    := True;
  FormPrincipal.Manutencao.Enabled   := True;
  FormPrincipal.BtnLocalizar.OnClick := Localizar;
  FormPrincipal.Localizar.OnClick    := Localizar;
  FormPrincipal.BtnIncluir.OnClick   := Incluir;
  FormPrincipal.Incluir.OnClick      := Incluir;
  FormPrincipal.BtnModificar.OnClick := Modificar;
  FormPrincipal.Modificar.OnClick    := Modificar;
  FormPrincipal.BtnExcluir.OnClick   := Excluir;
  FormPrincipal.Excluir.OnClick      := Excluir;
  FormPrincipal.Primeiro.OnClick     := Primeiro;
  FormPrincipal.BtnPrimeiro.OnClick  := Primeiro;
  FormPrincipal.Anterior.OnClick     := Anterior;
  FormPrincipal.BtnAnterior.OnClick  := Anterior;
  FormPrincipal.Proximo.OnClick      := Proximo;
  FormPrincipal.BtnProximo.OnClick   := Proximo;
  FormPrincipal.Ultimo.OnClick       := Ultimo;
  FormPrincipal.BtnUltimo.OnClick    := Ultimo;
  {
    Inicializa Menu Consulta
  }
  FormPrincipal.Consulta.Enabled         := True;
  FormPrincipal.Filtrar.OnClick          := mnu_FiltrarClick;
  FormPrincipal.Ordenar.OnClick          := mnu_OrdenarClick;
  FormPrincipal.OrdenarComposto.OnClick  := mnu_OrdenarCompostoClick;
  FormPrincipal.ApagarColuna.OnClick     := mnu_ApagarColunaClick;
  FormPrincipal.Quantificar.OnClick      := mnu_QuantificarClick;
  FormPrincipal.TotalizarColuna.OnClick  := mnu_TotalizarColunaClick;
  FormPrincipal.CalcularMedia.OnClick    := mnu_CalcularMediaClick;
  FormPrincipal.Imprimir.OnClick         := mnu_ImprimirClick;
  FormPrincipal.SalvarConsulta.OnClick   := mnu_SalvarConsultaClick;
  FormPrincipal.ExcluirConsulta.OnClick  := mnu_ExcluirConsultaClick;
end;

procedure TFormFaturaN.FormKeyPress(Sender: TObject; var Key: Char);
var
  ControleCampo: TWinControl;
begin
  ControleCampo := ActiveControl;
  while (ControleCampo <> nil) and (ControleCampo.Owner <> Self) do
    ControleCampo := ControleCampo.Parent;
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
      LastControl := ControleCampo;
      MudaSeForUltimo;
    end;
end;

procedure TFormFaturaN.BtnSalvarClick(Sender: TObject);
Var
  EInclusao, Ok: Boolean;
begin
  if Not ConfirmaGravacao then
  begin
    MessageDlg('Gravação Cancelada !',mtError,[mbOk],0);
    exit;
  end;
  SalvarRegistro := True;
  if CamposDadosValidos(ListaCamposEd, ErroValidacao) then  // Validações Ok ?!
  begin
    EInclusao := TabelaPrincipal.Inclusao;
    Screen.Cursor := crHourGlass;
    try
      Ok := False;
      if EInclusao then
        if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
        begin
          ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd, False, True);
          if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
          begin
            MessageDlg('Duplicidade - Registro já cadastrado !',mtWarning,[mbOk],0);
            exit;
          end;
        end;
      AntesdeSalvar;
      if (( TabelaPrincipal.State = DSEDIT) OR ( TabelaPrincipal.State = DSEDIT)) AND TabelaPrincipal.Salva then
        Ok := True;
    finally
      if Ok then
        if EInclusao then
          DepoisdeIncluir
        else
          DepoisdeModificar;
      Screen.Cursor := crDefault;
    end;
    BtnSalvar.Enabled   := False;
    BtnDesistir.Enabled := False;
//    PagePrincipal.ActivePageIndex := 1;
//  TelaConsulta;
    if EInclusao then
    begin
      if not Sistema.Rede then
      begin
        TabelaPrincipal.AtualizaSql;
        StatusTabela;
      end;
      Ultimo(Self);
    end;
    ErroValidacao := False;
//    GridConsulta.SetFocus;
  end;
  SalvarRegistro := False;


end;

procedure TFormFaturaN.BtnDesistirClick(Sender: TObject);
begin
  if TabelaPrincipal.Inclusao then
    TabelaPrincipal.ExclusaoCascata;
  TabelaPrincipal.Cancela;
  BtnSalvar.Enabled   := False;
  BtnDesistir.Enabled := False;
  ErroValidacao       := False;
  if not Navegando then
  begin
    PagePrincipal.ActivePageIndex := 1;
    TelaConsulta;
    GridConsulta.SetFocus;
  end
  else
    HabilitaEdicao(False);
  Navegando := False;
end;

procedure TFormFaturaN.GridConsultaDblClick(Sender: TObject);
begin
  if TabelaPrincipal.Eof then
    Incluir(Self)
  else
    Modificar(Self);
end;

procedure TFormFaturaN.VerificaAtualizacoes;
begin
  if not BtnSalvar.Enabled then
    BtnDesistirClick(Self)
  else
    if MessageDlg('Salvar Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      BtnSalvarClick(Self)
    else
      BtnDesistirClick(Self);
end;

procedure TFormFaturaN.Localizar(Sender: TObject);
begin
  Ed_Localizar(TabelaPrincipal, FormFaturaN, GridConsulta);
end;

procedure TFormFaturaN.Incluir(Sender: TObject);
begin
  if ProcuraRestricao(TabelaPrincipal.NomeTabela,'I') then
  begin
    MessageDlg('Inclusão não Permitida !',mtError,[mbOk],0);
    exit;
  end;
  if Not ConfirmaInclusao then
  begin
    MessageDlg('Inclusão Cancelada !',mtError,[mbOk],0);
    exit;
  end;
  if TabelaPrincipal.Inclusao then
  begin
    MessageDlg('Operação de Inclusão já Ativa !',mtError,[mbOk],0);
    exit;
  end
  else if TabelaPrincipal.Modificacao then
  begin
    MessageDlg('Operação de Modificação está Ativa !',mtError,[mbOk],0);
    exit;
  end;
  HabilitaCamposChave(ListaCamposEd);
  PagePrincipal.ActivePageIndex := 0;
  TabPaginas.TabIndex:= 0;
  TelaManutencao;
  AntesdeIncluir;
  TabelaPrincipal.Inclui(ListaCamposED);
  BtnSalvar.Enabled   := True;
  BtnDesistir.Enabled := True;
  HabilitaEdicao;
  AtribuiValoresPadrao;
end;

procedure TFormFaturaN.Modificar(Sender: TObject);
begin
  if ProcuraRestricao(TabelaPrincipal.NomeTabela,'M') then
  begin
    MessageDlg('Modificação não Permitida !',mtError,[mbOk],0);
    exit;
  end;
  if Not ConfirmaModificacao then
  begin
    MessageDlg('Modificação Cancelada !',mtError,[mbOk],0);
    exit;
  end;
  if TabelaPrincipal.Inclusao then
  begin
    MessageDlg('Operação de Inclusão está Ativa !',mtError,[mbOk],0);
    exit;
  end
  else if TabelaPrincipal.Modificacao then
  begin
    MessageDlg('Operação de Modificação já Ativa !',mtError,[mbOk],0);
    exit;
  end;
  DesabilitaCamposChave(ListaCamposEd);
  PagePrincipal.ActivePageIndex := 0;
  TabPaginas.TabIndex:= 0;
  TelaManutencao;
  Screen.Cursor := crHourGlass;
  try
    if Sistema.Rede then
      TabelaPrincipal.Refresh;
    AntesdeModificar;
    TabelaPrincipal.Modifica;
    HabilitaEdicao;
  finally
    Screen.Cursor := crDefault;
  end;
  BtnSalvar.Enabled   := True;
  BtnDesistir.Enabled := True;
end;

procedure TFormFaturaN.Excluir(Sender: TObject);
begin
  if ProcuraRestricao(TabelaPrincipal.NomeTabela,'E') then
  begin
    MessageDlg('Exclusão não Permitida !',mtError,[mbOk],0);
    exit;
  end;
  if Not ConfirmaExclusao then
  begin
    MessageDlg('Exclusão Cancelada !',mtError,[mbOk],0);
    exit;
  end;
  if TabelaPrincipal.Inclusao then
  begin
    MessageDlg('Operação de Inclusão está Ativa !'+^M+^M+'Clique em Desistir para Cancelar Inclusão ...',mtError,[mbOk],0);
    exit;
  end
  else if TabelaPrincipal.Modificacao then
  begin
    MessageDlg('Operação de Modificação está Ativa !',mtError,[mbOk],0);
    exit;
  end;
  if MessageDlg('Excluir Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    Screen.Cursor := crHourGlass;
    try
      if Sistema.Rede then
        TabelaPrincipal.Refresh;
      AntesdeExcluir;
      TabelaPrincipal.Exclui;
    finally
      DepoisdeExcluir;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFormFaturaN.Primeiro(Sender: TObject);
begin
  Navegando := True;
  VerificaAtualizacoes;
  if not ErroValidacao then
  begin
    Screen.Cursor := crHourGlass;
    try
      if Sistema.Rede then
      begin
        TabelaPrincipal.AtualizaSql;
        StatusTabela;
      end;
      TabelaPrincipal.First;
      if PagePrincipal.ActivePageIndex = 0 then
        TelaManutencao;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFormFaturaN.Anterior(Sender: TObject);
begin
  Navegando := True;
  VerificaAtualizacoes;
  if not ErroValidacao then
  begin
    TabelaPrincipal.Prior;
    if PagePrincipal.ActivePageIndex = 0 then
      TelaManutencao;
  end;
end;

procedure TFormFaturaN.Proximo(Sender: TObject);
begin
  Navegando := True;
  VerificaAtualizacoes;
  if not ErroValidacao then
  begin
    TabelaPrincipal.Next;
    if PagePrincipal.ActivePageIndex = 0 then
      TelaManutencao;
  end;
end;

procedure TFormFaturaN.Ultimo(Sender: TObject);
begin
  Navegando := True;
  VerificaAtualizacoes;
  if not ErroValidacao then
  begin
    try
      if Sistema.Rede then
      begin
        TabelaPrincipal.AtualizaSql;
        StatusTabela;
      end;
      TabelaPrincipal.Last;
      if TabelaPrincipal.Eof then
      begin
        TabelaPrincipal.Prior;
        TabelaPrincipal.Next;
      end;
      if PagePrincipal.ActivePageIndex = 0 then
        TelaManutencao;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFormFaturaN.mnu_FiltrarClick(Sender: TObject);
begin
  Ed_Filtrar(TabelaPrincipal, FormFaturaN, GridConsulta);
  StatusTabela;
end;

procedure TFormFaturaN.mnu_OrdenarClick(Sender: TObject);
begin
  Ed_Ordenar(TabelaPrincipal, FormFaturaN, GridConsulta);
  StatusTabela;
end;

procedure TFormFaturaN.mnu_OrdenarCompostoClick(Sender: TObject);
begin
  Ed_OrdenarComposto(TabelaPrincipal, FormFaturaN, GridConsulta);
  StatusTabela;
end;

procedure TFormFaturaN.mnu_ApagarColunaClick(Sender: TObject);
begin
  Ed_ApagarColuna(TabelaPrincipal, FormFaturaN, GridConsulta);
end;

procedure TFormFaturaN.mnu_QuantificarClick(Sender: TObject);
begin
  Ed_Quantificar(TabelaPrincipal, FormFaturaN, GridConsulta);
end;

procedure TFormFaturaN.mnu_TotalizarColunaClick(Sender: TObject);
begin
  Ed_TotalizarColuna(TabelaPrincipal, FormFaturaN, GridConsulta);
end;

procedure TFormFaturaN.mnu_CalcularMediaClick(Sender: TObject);
begin
  Ed_CalcularMedia(TabelaPrincipal, FormFaturaN, GridConsulta);
end;

procedure TFormFaturaN.mnu_ImprimirClick(Sender: TObject);
begin
  Ed_Imprimir(TabelaPrincipal, FormFaturaN, GridConsulta, DataSource);
end;

procedure TFormFaturaN.mnu_SalvarConsultaClick(Sender: TObject);
begin
  Ed_SalvarConsulta(TabelaPrincipal, FormFaturaN, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormFaturaN.mnu_ExcluirConsultaClick(Sender: TObject);
begin
  Ed_ExcluirConsulta(TabelaPrincipal, FormFaturaN, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormFaturaN.PagePrincipalChange(Sender: TObject);
begin
  // USADO PARA DESABILITADO EM CASO DE INSTANCAI 
  // BtnDesistirClick(Sender);
  if PagePrincipal.ActivePageIndex = 0 then
  begin
    TabPaginas.TabIndex := PaginaIni;
    TelaManutencao;
  end
  else if PagePrincipal.ActivePageIndex = 1 then
  begin
    BtnDesistirClick(Sender);
    VerificaAtualizacoes;
    if Not ErroValidacao then
    begin
      TelaConsulta;
      GridConsulta.SetFocus;
    end
    else
      PagePrincipal.ActivePageIndex := 0;
  end;
end;

procedure TFormFaturaN.AbaConsultaClick(Sender: TObject);
begin
  Ed_AbaConsulta(TabelaPrincipal, AbaConsulta, ConsultasSalvas, GridConsulta);
  StatusTabela;
end;

procedure TFormFaturaN.TabPaginasClick(Sender: TObject);
begin
  if NoManutencao.PageIndex <> TabPaginas.TabIndex then
    NoManutencao.SetFocus;
  NoManutencao.PageIndex := TabPaginas.TabIndex;
end;

procedure TFormFaturaN.PosicionaNoCampo(Campo: TAtributo);
var
  I: Integer;
  CampoED: TCampoEdicao;
begin
  I := ListaCamposED.ProcuraCampoED(Campo);
  if I = -1 then
    Exit;
  CampoED := TCampoEdicao(ListaCamposED[I]);
  if (CampoED.Pagina <> -1) then
    TabPaginas.TabIndex := CampoED.Pagina;
  PagePrincipal.ActivePageIndex := 0;
  CampoED.Controle.SetFocus;
end;

procedure TFormFaturaN.ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
begin
  MessageDlg(MsgErro, mtError, [mbOk], 0);
  ErroValidacao := True;
  PosicionaNoCampo(Campo);
end;

procedure TFormFaturaN.MudaSeForUltimo;
begin
  if (NoManutencao.PageIndex <> NoManutencao.Pages.Count - 1) and
     (ActiveControl = BtnSalvar) then
    if TabPaginas.TabIndex + 1 <= TabPaginas.Tabs.Count-1 then
      TabPaginas.TabIndex := TabPaginas.TabIndex + 1;
end;

procedure TFormFaturaN.CortarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CutToClipBoard;
end;

procedure TFormFaturaN.CopiarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CopyToClipBoard;
end;

procedure TFormFaturaN.ColarImagemClick(Sender: TObject);
begin
  if (ActiveControl is TDBImage) and Clipboard.HasFormat(CF_PICTURE) then
  begin
    (ActiveControl as TDBImage).PasteFromClipBoard;
    if TDBImage(ActiveControl).Picture.Graphic is TBitmap then
      TDBImage(ActiveControl).DataSource.DataSet.UpdateRecord
    else
    begin
      MessageDlg('Formato Inválido !', mtError, [mbOk], 0);
      TDBImage(ActiveControl).DataSource.DataSet.Cancel;
    end;
  end
  else
    MessageDlg('Área de Transferência não contém imagem !', mtError, [mbOk], 0);
end;

procedure TFormFaturaN.AbrirImagemClick(Sender: TObject);
var
  image_BD : TPicture;
begin
  if DlgAbrirImagem.Execute and FileExists(DlgAbrirImagem.FileName) and
    (ActiveControl is TDBImage) then
  begin
    image_BD := TPicture.Create();
    try
      image_BD.LoadFromFile(DlgAbrirImagem.FileName);
      Clipboard.Assign(image_BD);
      TDBImage(ActiveControl).PasteFromClipboard;
      Clipboard.Clear;
    finally
      image_BD.Free;
    end;
  end;
end;

procedure TFormFaturaN.SalvarImagemClick(Sender: TObject);
begin
  if DlgSalvarComoImagem.Execute and (ActiveControl is TDBImage) then
    TDBImage(ActiveControl).Picture.SaveToFile(DlgSalvarComoImagem.FileName);
end;

function TFormFaturaN.AbandonandoEdicao: Boolean;
begin
  Result := (ActiveControl = BtnDesistir) or (ActiveControl = PagePrincipal);
end;

procedure TFormFaturaN.BtnRelac_1Click(Sender: TObject);
var
  Pt: TPoint;

  procedure AddMenuItem(Menu:TPopupMenu; ItemName:string; Name:string; Enable:Boolean; ImgIndex: Integer; Tag: Integer);
  var
    NewMenuItem: TMenuItem;
  begin
    NewMenuItem         := TMenuItem.Create(Application);
    NewMenuItem.Name    := Name;
    NewMenuItem.Caption := ItemName;
    NewMenuItem.Enabled := Enable;
    NewMenuItem.OnClick := PopRelacionadosClick;
    NewMenuItem.Tag     := Tag;
    if ImgIndex <> -1 then
      NewMenuItem.ImageIndex := ImgIndex;
    Menu.Items.Add(NewMenuItem);
  end;

begin
  PopRelacionados.Items.Clear;
  {09-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  GetCursorPos(Pt);
  PopRelacionados.Popup(Pt.X, Pt.Y);
end;

procedure TFormFaturaN.PopRelacionadosClick(Sender: TObject);
var
  MenuItem: TMenuItem;
begin
  MenuItem := TMenuItem(Sender);
  {10-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormFaturaN.ChamaGridPesquisa(Sender: TObject);
Var
  I: Integer;
  CampoED: TCampoEdicao;
  Campo: TAtributo;
begin
  for I:=0 to ListaCamposED.Count-1 do
  begin
    CampoED := TCampoEdicao(ListaCamposED[I]);
    if CampoED.Controle = Sender then
    begin
      Campo := CampoED.Campo;
      Break;
    end;
  end;
  if (Campo = nil) or (Campo.Valor.ReadOnly) then exit;
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    if Sender is TXDBEdit then
      FormGridPesquisa.Atalho := TXDBEdit(Sender).ClickKey
    else if Sender is TXDBNumEdit then
      FormGridPesquisa.Atalho := TXDBNumEdit(Sender).ClickKey
    else if Sender is TXDBDateEdit then
      FormGridPesquisa.Atalho := TXDBDateEdit(Sender).ClickKey;
    FormGridPesquisa.Campo  := Campo;
    FormGridPesquisa.ShowModal;
  Finally
    FormGridPesquisa.Free;
  end;
end;

procedure TFormFaturaN.ValidaColunaGrid(Sender: TField);
var
  MsgErro : String;
  I: Integer;
  Campo: TAtributo;
begin
  if AbandonandoEdicao then
    Exit;
  for I:=0 to TTabela(Sender.DataSet).Campos.Count-1 do
  begin
    Campo := TAtributo(TTabela(Sender.DataSet).Campos[I]);
    if Campo.Valor = Sender then
      Break;
  end;
  if Campo = nil then exit;
  if not Campo.Valido(MsgErro) then
    raise Exception.Create(MsgErro);
end;

{11-Início do Bloco Modular. Modificações não serão preservadas}
{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormFaturaN.BtnIncluirClick(Sender: TObject);
begin
  if ProcuraRestricao(TabelaPrincipal.NomeTabela,'I') then
  begin
    MessageDlg('Inclusão não Permitida !',mtError,[mbOk],0);
    exit;
  end;
  if Not ConfirmaInclusao then
  begin
    MessageDlg('Inclusão Cancelada !',mtError,[mbOk],0);
    exit;
  end;
  if TabelaPrincipal.Inclusao then
  begin
    MessageDlg('Operação de Inclusão já Ativa !',mtError,[mbOk],0);
    exit;
  end
  else if TabelaPrincipal.Modificacao then
  begin
    MessageDlg('Operação de Modificação está Ativa !',mtError,[mbOk],0);
    exit;
  end;
  HabilitaCamposChave(ListaCamposEd);
  PagePrincipal.ActivePageIndex := 0;
  TabPaginas.TabIndex:= 0;
  TelaManutencao;
  AntesdeIncluir;
  TabelaPrincipal.Inclui(ListaCamposED);
  BtnSalvar.Enabled   := True;
  BtnDesistir.Enabled := True;
  HabilitaEdicao;
  AtribuiValoresPadrao;
  StatusTabela;


end;

procedure TFormFaturaN.BtnModificarClick(Sender: TObject);
begin
  if TabelaPrincipal.Eof then
  begin
    TabelaPrincipal.Prior;
    TabelaPrincipal.Next;
  end;
  if TabelaPrincipal.Eof then
  begin
    MessageDlg('Registro não encontrado !',mtError,[mbOk],0);
    exit;
  end;
  if ProcuraRestricao(TabelaPrincipal.NomeTabela,'M') then
  begin
    MessageDlg('Modificação não Permitida !',mtError,[mbOk],0);
    exit;
  end;
  if Not ConfirmaModificacao then
  begin
    MessageDlg('Modificação Cancelada !',mtError,[mbOk],0);
    exit;
  end;
  if TabelaPrincipal.Inclusao then
  begin
    MessageDlg('Operação de Inclusão está Ativa !',mtError,[mbOk],0);
    exit;
  end
  else if TabelaPrincipal.Modificacao then
  begin
    MessageDlg('Operação de Modificação já Ativa !',mtError,[mbOk],0);
    exit;
  end;
  DesabilitaCamposChave(ListaCamposEd);
  PagePrincipal.ActivePageIndex := 0;
  TabPaginas.TabIndex:= 0;
  TelaManutencao;
  Screen.Cursor := crHourGlass;
  try
    AntesdeModificar;
    TabelaPrincipal.Modifica;
    HabilitaEdicao;
  finally
    Screen.Cursor := crDefault;
  end;
  BtnSalvar.Enabled   := True;
  BtnDesistir.Enabled := True;
  StatusTabela;

end;

procedure TFormFaturaN.BtnExcluirClick(Sender: TObject);
begin
  if TabelaPrincipal.Eof then
  begin
    TabelaPrincipal.Prior;
    TabelaPrincipal.Next;
  end;
  if TabelaPrincipal.Eof then
  begin
    MessageDlg('Registro não encontrado !',mtError,[mbOk],0);
    exit;
  end;
  if ProcuraRestricao(TabelaPrincipal.NomeTabela,'E') then
  begin
    MessageDlg('Exclusão não Permitida !',mtError,[mbOk],0);
    exit;
  end;
  if Not ConfirmaExclusao then
  begin
    MessageDlg('Exclusão Cancelada !',mtError,[mbOk],0);
    exit;
  end;
  if TabelaPrincipal.Inclusao then
  begin
    MessageDlg('Operação de Inclusão está Ativa !'+^M+^M+'Clique em Desistir para Cancelar Inclusão ...',mtError,[mbOk],0);
    exit;
  end
  else if TabelaPrincipal.Modificacao then
  begin
    MessageDlg('Operação de Modificação está Ativa !',mtError,[mbOk],0);
    exit;
  end;
  if MessageDlg('Excluir Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    Screen.Cursor := crHourGlass;
    try
      AntesdeExcluir;
      PagePrincipal.ActivePageIndex := 0;
      TabelaPrincipal.Exclui;
    finally
      DepoisdeExcluir;
      Screen.Cursor := crDefault;
      StatusTabela;
      IF PagePrincipal.TABINDEX = 0 THEN
        TelaManutencao;
    end;
  end;

end;

procedure TFormFaturaN.BtnTabelaClick(Sender: TObject);
begin
  if BtnTabela.Tag = 0 then
    TelaConsulta
  else
    TelaManutencao;
  StatusTabela;

end;

procedure TFormFaturaN.BtnLocalizarClick(Sender: TObject);
begin
  Ed_Localizar(TabelaPrincipal, FormFaturaN, GridConsulta);
  StatusTabela;
  IF PagePrincipal.TABINDEX = 0 THEN
    TelaManutencao;

end;

procedure TFormFaturaN.BtnPrimeiroClick(Sender: TObject);
begin
  Navegando := True;
  VerificaAtualizacoes;
  if not ErroValidacao then
  begin
    Screen.Cursor := crHourGlass;
    try
      TabelaPrincipal.First;
    finally
      Screen.Cursor := crDefault;
      StatusTabela;
      IF PagePrincipal.TABINDEX = 0 THEN
        TelaManutencao;
    end;
  end;

end;

procedure TFormFaturaN.BtnAnteriorClick(Sender: TObject);
begin
  Navegando := True;
  VerificaAtualizacoes;
  if not ErroValidacao then
  begin
    TabelaPrincipal.Prior;
    if TabelaPrincipal.Bof then
      MessageDlg('Início dos registros!', mtInformation, [mbOk], 0);
    StatusTabela;
    IF PagePrincipal.TABINDEX = 0 THEN
      TelaManutencao;
  end;

end;

procedure TFormFaturaN.BtnProximoClick(Sender: TObject);
begin
  Navegando := True;
  VerificaAtualizacoes;
  if not ErroValidacao then
  begin
    TabelaPrincipal.Next;
    if TabelaPrincipal.Eof then
      MessageDlg('Final dos registros!', mtInformation, [mbOk], 0);
    StatusTabela;
    IF PagePrincipal.TABINDEX = 0 THEN
      TelaManutencao;
  end;

end;

procedure TFormFaturaN.BtnUltimoClick(Sender: TObject);
begin
  Navegando := True;
  VerificaAtualizacoes;
  if not ErroValidacao then
  begin
    try
      TabelaPrincipal.Last;
      if TabelaPrincipal.Eof then
      begin
        TabelaPrincipal.Prior;
        TabelaPrincipal.Next;
      end;
    finally
      Screen.Cursor := crDefault;
      StatusTabela;
      IF PagePrincipal.TABINDEX = 0 THEN
        TelaManutencao;
    end;
  end;

end;

procedure TFormFaturaN.BtnRefreshClick(Sender: TObject);
begin
  if MessageDlg('Atualizar registros?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    TabelaPrincipal.AtualizaSql;
    IF PagePrincipal.TABINDEX = 0 THEN
      TelaManutencao;
  end;

end;

procedure TFormFaturaN.ContratoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.Contrato.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.Contrato);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.SeqExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.Seq.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.Seq);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.NavioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.Navio.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.Navio);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.CadastroExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.Cadastro.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.Cadastro);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.DataEmbarqueExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.DataEmbarque.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.DataEmbarque);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.ETADestinoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.ETADestino.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.ETADestino);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.FaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.Fatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.Fatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.ValorExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.Valor.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.Valor);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.ValorDescontoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.ValorDesconto.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.ValorDesconto);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.FormPagoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.FormPago.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.FormPago);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.PrecoFOBExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.PrecoFOB.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.PrecoFOB);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.FormComissaoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.FormComissao.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.FormComissao);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.FormComissaoDrawItem(Control: TWinControl; Index: Integer;
                                        Rect: TRect; State: TOwnerDrawState);
var Canvas : TCanvas;
begin
  if Control is TDBListBox then
    Canvas  := (Control as TDBListBox).Canvas
  else if Control is TDBComboBox then
    Canvas  := (Control as TDBComboBox).Canvas
  else
    Canvas  := (Control as TComboBox).Canvas;
  Canvas.FillRect(Rect);
  if TabGlobal.DFATURA.FormComissao.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DFATURA.FormComissao.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DFATURA.FormComissao.DescValorValido[Index]));
end;

procedure TFormFaturaN.ComissaoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.Comissao.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.Comissao);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.ComisaoSFaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.ComisaoSFatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.ComisaoSFatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.StDocumentoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.StDocumento.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.StDocumento);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.OBSExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.OBS.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.OBS);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.ComentarioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.Comentario.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.Comentario);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.RateExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.Rate.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.Rate);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
  // nova regra
  if DataLiq.DateValue = CMS_Data_vazia then
     if (TabGlobal.DFATURA.State = dsEdit) or ( TabGlobal.DFATURA.State = dsInsert ) then
         TabGlobal.DFATURA.DataLiq.Conteudo := date ;



end;

procedure TFormFaturaN.DataLiqExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.DataLiq.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.DataLiq);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.NumNFEmitExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.NumNFEmit.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.NumNFEmit);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.DataNFExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.DataNF.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.DataNF);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.MOEDACOMISSAOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.MOEDACOMISSAO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.MOEDACOMISSAO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.MOEDACOMISSAODrawItem(Control: TWinControl; Index: Integer;
                                        Rect: TRect; State: TOwnerDrawState);
var Canvas : TCanvas;
begin
  if Control is TDBListBox then
    Canvas  := (Control as TDBListBox).Canvas
  else if Control is TDBComboBox then
    Canvas  := (Control as TDBComboBox).Canvas
  else
    Canvas  := (Control as TComboBox).Canvas;
  Canvas.FillRect(Rect);
  if TabGlobal.DFATURA.MOEDACOMISSAO.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DFATURA.MOEDACOMISSAO.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DFATURA.MOEDACOMISSAO.DescValorValido[Index]));
end;

procedure TFormFaturaN.ValorConvertidoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.ValorConvertido.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.ValorConvertido);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.FORCODExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.FORCOD.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.FORCOD);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.NomeMixExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.NomeMix.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.NomeMix);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.StatusExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.Status.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.Status);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.StatusDrawItem(Control: TWinControl; Index: Integer;
                                        Rect: TRect; State: TOwnerDrawState);
var Canvas : TCanvas;
begin
  if Control is TDBListBox then
    Canvas  := (Control as TDBListBox).Canvas
  else if Control is TDBComboBox then
    Canvas  := (Control as TDBComboBox).Canvas
  else
    Canvas  := (Control as TComboBox).Canvas;
  Canvas.FillRect(Rect);
  if TabGlobal.DFATURA.Status.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DFATURA.Status.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DFATURA.Status.DescValorValido[Index]));
end;

procedure TFormFaturaN.RAZAOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.RAZAO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.RAZAO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.BitBtn2Click(Sender: TObject);
{utilize o "var" para declarar variáveis}
var
  s_titulo , s_nFiltro : string ;
  l_criar_ordrmCobranca : boolean ;
begin
  {codificação.1..}
//  s_sql_old := TabGlobal.DFATURA.SQL.Text ;

if S_FILTRO = '' then begin
 // MessageDlg( MSG_FILTROTEMQUESERCRIADO ,mtConfirmation, [mbYes, mbNo], 0) ;
  MessageDlg( MSG_FILTROTEMQUESERCRIADO,mtWarning,[mbOk],0);
  exit ;
end
else begin
  FormRELCOMPEN := TFormRELCOMPEN.Create(Application);
  Try
    l_criar_ordrmCobranca := Existe_selecionados()  ;
    if l_criar_ordrmCobranca then  begin


       if (S_FILTRO = '' ) then
           s_nFiltro :=      ' ((Fatura.Status = ' + AtribuiAspas( s_ST_CM_F ) + ') or ((Fatura.Selecionado =' + AtribuiAspas('S')+ ')'+' and (( Fatura.Status = '+AtribuiAspas(s_ST_OC_F)+') or (Fatura.Status = ' + AtribuiAspas( '0' ) + '))))'
       else
           s_nFiltro :=  ' and ((Fatura.Status = ' + AtribuiAspas( s_ST_CM_F ) + ') or ((Fatura.Selecionado =' + AtribuiAspas('S')+ ')'+' and (( Fatura.Status = '+AtribuiAspas(s_ST_OC_F)+') or (Fatura.Status = ' + AtribuiAspas( '0' )  + '))))' ;



       FormRELCOMPEN.set_filtro(S_FILTRO + s_nFiltro ) ;

    end
    else begin
       s_nFiltro :=  ' and (( Fatura.Status = ' + AtribuiAspas( s_ST_CM_F ) + ' ) or ( Fatura.Status = ' + AtribuiAspas( s_ST_OC_F ) + ' ) or ( Fatura.Status = ' + AtribuiAspas( '0' ) + ') ) ' ;
       FormRELCOMPEN.set_filtro(S_FILTRO  + s_nFiltro );
    end;

    if ( DT_INCIAL.Text <> '' ) and ( DT_FINAL.Text <> '' ) then
       s_titulo := 'REF. EMBARQUE ' +  DT_INCIAL.Text  + ' ATE ' +  DT_FINAL.Text ;

    FormRELCOMPEN.set_TIPO_REL(S_CONT_REL_COMISSAO);
//    25/04/2012 MODIFICADO PELA ELANINE
//    FormRELCOMPEN.set_titulo('RELATÓRIOS DE COMISSÕES PENDENTES - CONOSUR');
    FormRELCOMPEN.set_titulo('RELATÓRIOS DE COMISSÕES PENDENTES');
    FormRELCOMPEN.set_titulo2(s_titulo);
    FormRELCOMPEN.ShowModal;

//    TabGlobal.DFATURA.Close ;
//    TabGlobal.DFATURA.SQL.Add(s_sql_old); // s_sql_old := TabGlobal.DFATURA.SQL ;
//    TabGlobal.DFATURA.Open ;


//    BitBtn17Click(Self);
    Deselecionar_reg();
  Finally
    FormRELCOMPEN.Free;
  end;


  BitBtn1Click(SELF);
  Refresh;
end;
end;

procedure TFormFaturaN.BitBtn1Click(Sender: TObject);
var
  S_CODFOR , S_SITUACAO : STRING ;
begin

S_FILTRO := '' ;
S_CODFOR := '' ;

if CMB_EXP.text <> '' then begin
   S_CODFOR := TRIM ( copy ( CMB_EXP.text , lengTH(CMB_EXP.text) -  5 , 6 ))  ;
   pi_CODFOR :=  strtoint(S_CODFOR) ;
end;

IF S_CODFOR <> '' THEN
   S_FILTRO := ' ContratoTransporte.FORCOD = '  + S_CODFOR ;

IF DT_INCIAL.Text <> '  /  /    '  THEN
   IF S_FILTRO = '' THEN
      S_FILTRO := ' Fatura.DataEmbarque >= ''' + COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2) + ''''
   ELSE
      S_FILTRO := S_FILTRO + ' AND Fatura.DataEmbarque >= ''' + COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2) + '''' ;

IF DT_FINAL.Text <> '  /  /    '   THEN
   IF S_FILTRO = '' THEN
      S_FILTRO := ' Fatura.DataEmbarque <= ''' + COPY( DT_FINAL.Text , 7, 4)+ '/'+ COPY( DT_FINAL.Text , 4,2)+'/'+ COPY( DT_FINAL.Text , 1,2) + ''''
   ELSE
      S_FILTRO := S_FILTRO +' AND Fatura.DataEmbarque <= ''' + COPY( DT_FINAL.Text , 7, 4)+ '/'+ COPY( DT_FINAL.Text , 4,2)+'/'+ COPY( DT_FINAL.Text , 1,2) + ''''  ;

IF CMB_FATURA.Text <> ''   THEN
   IF S_FILTRO = '' THEN
      S_FILTRO := ' Fatura.Fatura = '+ AtribuiAspas(CMB_FATURA.Text)
   ELSE
      S_FILTRO := S_FILTRO +' AND Fatura.Fatura = ' + AtribuiAspas(CMB_FATURA.Text)  ;


IF CMB_SITUACAO.Text = CMB_Em_processamento THEN
   S_SITUACAO := 'Fatura.Status = ''0'' ' ;
IF CMB_SITUACAO.Text = CMB_Fatura_Surimpex  THEN
   S_SITUACAO := 'Fatura.Status = ''1'' ' ;
IF CMB_SITUACAO.Text = CMB_NF_Emitida  THEN
   S_SITUACAO := 'Fatura.Status = ''2'' '  ;
IF CMB_SITUACAO.Text = CMB_NF_Paga THEN
   S_SITUACAO := 'Fatura.Status = ''3'' ' ;
IF CMB_SITUACAO.Text = CMB_Protesto THEN
   S_SITUACAO := 'Fatura.Status = ''4'' ' ;
IF CMB_SITUACAO.Text = CMB_Conciliacao_Emitida THEN
   S_SITUACAO := 'Fatura.Status = ''5'' ' ;
IF CMB_SITUACAO.Text = CMB_Conciliacao_Realizada THEN
   S_SITUACAO := 'Fatura.Status = ''6'' ' ;
IF CMB_SITUACAO.Text = CMB_Aplicar_Rate THEN
   S_SITUACAO := 'Fatura.Status = ''7'' ' ;
IF CMB_SITUACAO.Text = CMB_Fatura_Escluido THEN
   S_SITUACAO := 'Fatura.Status = ''8'' ' ;
IF CMB_SITUACAO.Text = CMB_Boocking THEN
   S_SITUACAO := 'Fatura.Status = ''9'' ' ;
IF CMB_SITUACAO.Text = CMB_Em_Execucao THEN
   S_SITUACAO := 'Fatura.Status = ''A'' ' ;
IF CMB_SITUACAO.Text = CMB_Exportacao_Bloqueada THEN
   S_SITUACAO := 'Fatura.Status = ''B'' ' ;




IF S_SITUACAO <> '' THEN
   IF S_FILTRO = '' THEN
      S_FILTRO := S_SITUACAO
   ELSE
      S_FILTRO := S_FILTRO + ' AND '+ S_SITUACAO ;



TabelaPrincipal.Filtro.Clear;
TabelaPrincipal.Filtro.Add(S_FILTRO);
TabelaPrincipal.AtualizaSql(TRUE);


CMB_FATURA.Items.Clear;
CMB_FATURA.Items.Add('') ;

WHILE NOT TabelaPrincipal.Eof DO BEGIN
   CMB_FATURA.Items.ADD(TabelaPrincipal.FieldValues['Fatura']);
   TabelaPrincipal.NEXT ;
END;

// correcao na data 18/11/2011
// erro so ocorre quando e seleciona so um registro correcao esta
// implementada em baixo

BtnPrimeiroClick(self);

end;

procedure TFormFaturaN.RecebimentoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.Recebimento.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.Recebimento);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.Valor_NFExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFATURA.Valor_NF.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFATURA.Valor_NF);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.BitBtn3Click(Sender: TObject);
{utilize o "var" para declarar variáveis}
var
 s_NumFaturaInc , s_NumFaturaFim , sn_Fatura : string ;
 n_selecionados : integer ;
begin
n_selecionados := 0 ;
if S_FILTRO = '' then begin
  MessageDlg( MSG_FILTROTEMQUESERCRIADO,mtWarning,[mbOk],0);
  exit ;
end;



   if MessageDlg( MSG_ConfirmaTrocadeSituacao ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Screen.Cursor := crHourGlass      ;
      TabGlobal.DFatura.First ;
      while NOT TabGlobal.DFatura.Eof do begin
        if (( TabGlobal.DFatura.State <>  dsEdit)    and
           (TabGlobal.DFatura.State  <>  dsinsert)) then
           TabGlobal.DFatura.Modifica ;

        if ( TabGlobal.DFatura.NumOrdCobranca.Conteudo = '' ) and
           ( TabGlobal.DFatura.Selecionado. Conteudo = 'S'  ) and
           ( TabGlobal.DFatura.Status.Conteudo  = s_ST_CM_F )
           then begin
           TabGlobal.DFatura.Status.Conteudo := s_ST_AB_F ;
        end
        else
           n_selecionados := n_selecionados + 1 ;
        TabGlobal.DFatura.Salva ;
        TabGlobal.DFatura.Next ;
      end;

      Screen.Cursor := crDefault ;

      Refresh ;
   end;

   if n_selecionados > 0 then
      MessageDlg( trim(inttostr(n_selecionados)) + CONT_registros_nAo_foram_selecionados,mtWarning,[mbOk],0);
end;

procedure TFormFaturaN.CMB_EXPChange(Sender: TObject);
begin
// variavel sempre com o numero do exportador
if CMB_EXP.text <> '' then
   pi_CODFOR :=  strtoint(TRIM ( copy ( CMB_EXP.text , lengTH(CMB_EXP.text) -  5 , 6 )) ) ;

end;


procedure TFormFaturaN.QuantidadeExpExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFatura.QuantidadeExp.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFatura.QuantidadeExp);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.BitBtn4Click(Sender: TObject);
var
  s_titulo , s_nFiltro : string ;
  l_criar_ordrmCobranca : boolean ;
begin

if S_FILTRO = '' then begin
  MessageDlg( MSG_FILTROTEMQUESERCRIADO,mtWarning,[mbOk],0);
  exit ;
end;

if not Existe_Rate() then begin
   MessageDlg( MSG_RateTemqueSerAtualizado ,mtWarning, [mbOK], 0);
   //exit ;
end
else begin
  FormRELCOMPEN := TFormRELCOMPEN.Create(Application);
  Try
    l_criar_ordrmCobranca := Existe_selecionados()  ;
    if  l_criar_ordrmCobranca then  begin

        if ( S_FILTRO = '' ) then
             s_nFiltro :=  '  ( Fatura.rate is not null) and  ( Fatura.Selecionado =' + AtribuiAspas('S') + ' or Fatura.Status = ' + AtribuiAspas( s_ST_CM_F )  + ' or Fatura.Status = ' + AtribuiAspas( s_ST_OC_F )  + ' ) '
        else
             s_nFiltro :=  ' and ( Fatura.rate is not null) and ( Fatura.Selecionado =' + AtribuiAspas('S') + ' or Fatura.Status = ' + AtribuiAspas( s_ST_CM_F ) + ' or Fatura.Status = ' + AtribuiAspas( s_ST_OC_F )  +' ) ' ;

        FormRELCOMPEN.set_filtro(S_FILTRO + s_nFiltro ) ;
    end
    else
        FormRELCOMPEN.set_filtro(S_FILTRO + ' and ( Fatura.rate is not null) ' );

 // FormRELCOMPEN.set_filtro(S_FILTRO);
 
    if ( DT_INCIAL.Text <> '' ) and ( DT_FINAL.Text <> '' ) then
       s_titulo := 'REF. EMBARQUE ' +  DT_INCIAL.Text  + ' ATE ' +  DT_FINAL.Text ;
    FormRELCOMPEN.set_TIPO_REL(S_CONT_REL_ORCAMENT);
    FormRELCOMPEN.set_titulo('ORDEM DE COBRANÇA - '+ TabGlobal.DFatura.NumOrdCobranca.Conteudo );
    FormRELCOMPEN.set_titulo2(s_titulo);
    FormRELCOMPEN.ShowModal;



  Finally
    FormRELCOMPEN.Free;
  end;
//  erro a corrigir

  Deselecionar_reg();

end;
end;

procedure TFormFaturaN.BitBtn12Click(Sender: TObject);
begin
GroupBox_CalcularRate.Visible := false ;
BTNSALVARclick(self) ;
end;

procedure TFormFaturaN.BitBtn11Click(Sender: TObject);
begin
try

//  DataLiq.Text := XDateEdit_DataLiq.Text ;
//  Rate.Text:= XNumEdit_Rate.Text ;
//  MOEDACOMISSAOTAXA.Text :=  cmb_moeda.Text;

  if cmb_moeda.Text = '' then begin
     MessageDlg( MSG_MoedaInformacaoObrigatoria,mtWarning,[mbOk],0);
     exit ;
  end;

  Screen.Cursor := crHourGlass      ;
  if MessageDlg( MSG_ConfirmaAtualizaroRATEemtodososregistroselecionados ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     TabGlobal.DFatura.First;
     while not TabGlobal.DFatura.Eof do begin
       if ( TabGlobal.DFatura.ValorConvertido.conteudo = 0 ) AND  //continua
          ( TabGlobal.DFatura.Selecionado.Conteudo = 'S' ) then begin
          TabGlobal.DFatura.Modifica ;
          TabGlobal.DFatura.Rate.conteudo :=  XNumEdit_Rate.Value ;
          {
          if cmb_moeda.Text = 'Dolar' then
             TabGlobal.DFatura.MOEDACOMISSAOTAXA.Conteudo := 'USR';

          if cmb_moeda.Text = 'Real' then
             TabGlobal.DFatura.MOEDACOMISSAOTAXA.Conteudo := 'R$';

          if cmb_moeda.Text = 'Euro' then
             TabGlobal.DFatura.MOEDACOMISSAOTAXA.Conteudo := 'EUR';
          }

          TabGlobal.DFatura.MOEDACOMISSAOTAXA.Conteudo := cmb_moeda.Text;

          TabGlobal.DFatura.DataLiq.conteudo := XDateEdit_DataLiq.DateValue ;
          TabGlobal.DFatura.Status.Conteudo := s_ST_RT_F ; // '7';
          TabGlobal.DFatura.Selecionado.Conteudo := 'N' ;
          TabGlobal.DFatura.Salva;
          
          TabGlobal.DFatura.Modifica ;
          TabGlobal.DFatura.Salva;

       end;
       TabGlobal.DFatura.Next ;
     end ;
  end;
  BitBtn1Click(SELF);
  Refresh;

finally
  Screen.Cursor := crDefault ;
  GroupBox_CalcularRate.Visible := false ;
  IF TabelaPrincipal.Modificacao THEN
     BTNSALVARclick (self);
end;

end;

procedure TFormFaturaN.BitBtn_RateClick(Sender: TObject);
begin

if S_FILTRO = '' then begin
  MessageDlg( MSG_FILTROTEMQUESERCRIADO,mtWarning,[mbOk],0);
  exit ;
end;
// GroupBox_CalcularRate
GroupBox_CalcularRate.Visible := true ;
XNumEdit_Rate.Value := 0;
XDateEdit_DataLiq.Text := datetostr(date)  ;
BtnModificarClick  (self);
end;

procedure TFormFaturaN.BitBtn_NotaFiscalClick(Sender: TObject);
begin

XNumEdit_NotaFiscal.ValueInt := 0;
XDateEdit_DataNF.DateValue := date ;
XNumEdit_ValorNF.Value := 0;
GroupBox_notaFiscal.Visible := true ;
BtnModificarClick (self);

end;

procedure TFormFaturaN.BitBtn13Click(Sender: TObject);
begin
try
  Screen.Cursor := crHourGlass      ;
  if MessageDlg( MSG_ConfirmaAtualizaroNumerodaNotaFiscalemtodososregistroselecionados ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     TabGlobal.DFatura.First;
     while not TabGlobal.DFatura.Eof do begin
       if TabGlobal.DFatura.NumNFEmit.conteudo = 0 then begin
          TabGlobal.DFatura.Edit ;
          TabGlobal.DFatura.NumNFEmit.conteudo :=  XNumEdit_NotaFiscal.ValueInt ;
          TabGlobal.DFatura.DataNF.conteudo := XDateEdit_DataNF.DateValue ;
          TabGlobal.DFatura.Valor_NF.conteudo := XNumEdit_ValorNF.Value ;
          // ATUALIZA O STATUS DO DA FATURA
          TabGlobal.DFatura.Status.Conteudo := S_ST_NF_F ; // '1';
          TabGlobal.DFatura.Post;

          // ATUALIZA O STATUS DO PROCESSO
          // Atualiza_ST(TabGlobal.DFatura.Contrato.Conteudo,S_ST_NF);
       end;
       TabGlobal.DFatura.Next ;
     end ;
  end;

  BitBtn1Click(SELF);
  Refresh;


finally
  Screen.Cursor := crDefault ;
  GroupBox_CalcularRate.Visible := false ;
  IF TabelaPrincipal.Modificacao THEN
     BTNSALVARclick  (self);
end;

end;

procedure TFormFaturaN.BitBtn14Click(Sender: TObject);
begin
GroupBox_notaFiscal.Visible := false ;
BTNSALVARclick (self);
end;

procedure TFormFaturaN.GridConsultaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//  GRID FIGURAS
    GridConsulta.Canvas.Font.Color:= clBlack;
    GridConsulta.Canvas.Brush.Color :=  RetCorFundoFatura(TabGlobal.DFatura.Status.CONTEUDO) ; // $00FFF4DF;
    GridConsulta.DefaultDrawDataCell(Rect, GridConsulta.columns[datacol].field, State);
end;

procedure TFormFaturaN.DBG_FATURADrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

const IsChecked : array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
    DBG_FATURA.Canvas.Font.Color:= clBlack;
    DBG_FATURA.Canvas.Brush.Color :=  RetCorFundoFatura(TabGlobal.DFatura.Status.CONTEUDO) ; // $00FFF4DF;
    DBG_FATURA.DefaultDrawDataCell(Rect, DBG_FATURA.columns[datacol].field, State);

    // dbcheck
   {
  if (gdFocused in State) then
  begin
    if (Column.Field.FieldName = Ck_Selecionado.DataField) then
    begin
     Ck_Selecionado.Left := Rect.Left + DBG_FATURA.Left + 2;
     Ck_Selecionado.Top := Rect.Top + DBG_FATURA.top + 2;
     Ck_Selecionado.Width := Rect.Right - Rect.Left;
     Ck_Selecionado.Height := Rect.Bottom - Rect.Top;
     Ck_Selecionado.Visible := True;
    end
  end
  else
  begin
    if (Column.Field.FieldName = Ck_Selecionado.DataField) then
    begin

      DrawRect:=Rect;
      InflateRect(DrawRect,-1,-1);
      DrawState := ISChecked[Column.Field.AsBoolean];
      DBG_FATURA.Canvas.FillRect(Rect);
      DrawFrameControl(DBG_FATURA.Canvas.Handle, DrawRect,DFC_BUTTON, DrawState);

    end;

  end;

    }
end;

procedure TFormFaturaN.BitBtn8Click(Sender: TObject);
var
 
 s_NumFaturaInc , s_NumFaturaFim , sn_Fatura : string ;
 valor_Fatura : double ;
 l_criar_ordrmCobranca : boolean ;
begin

if S_FILTRO = '' then begin
  MessageDlg( MSG_FILTROTEMQUESERCRIADO,mtWarning,[mbOk],0);
  exit ;
end ;

//if TabGlobal.DFatura.Rate.isnull then begin
//if TabelaPrincipal.FieldByName('Rate').isnull  then begin
// mtError if MessageDlg( MSG_ConfirmaGerarFaturasemoRATE ,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
// verificar se os dados ja forma atualizados no rate


if not Existe_Rate() then begin
   MessageDlg( MSG_RateTemqueSerAtualizado ,mtWarning, [mbOK], 0);
   exit ;
end;

l_criar_ordrmCobranca := false ;
IF S_FILTRO <> '' THEN BEGIN

//  if TabGlobal.DFatura.NumFatura.Conteudo = '' then begin
    {codificação... Rel. Fatura }
    s_NumFaturaInc := '' ;
    s_NumFaturaFim := '' ;
    sn_Fatura := '';
   // FormRELFATURA := TFormRELFATURA.Create(Application);
    Try
      TabGlobal.DOrdemCobranca.AtribuiRelacionamentos;
      // verificar se existe fatura
      if ( TabelaPrincipal.FieldByName('Numordcobranca').isnull ) or
         ( TabelaPrincipal.FieldByName('Numordcobranca').Value = '') then begin
         l_criar_ordrmCobranca := Existe_selecionados()  ;

         if l_criar_ordrmCobranca then begin
            //  if ( TabelaPrincipal.FieldByName('NumFatura').Value = '' ) then begin
            // cria um nova fatura
            sn_Fatura := Get_NumOrdCobranca() ; // Get_Fatura();
            // criar produtos exportador fatura
            TabelaPrincipal.First ;
            valor_Fatura := 0 ;
            while not TabelaPrincipal.eof do begin
              // nova regra
              if ( TabelaPrincipal.FindField('Selecionado').Value = 'S' ) and
                 ( not TabelaPrincipal.FieldByName('Rate').isnull ) then begin
                 TabGlobal.DOrdemCobrancaProdExp.Inclui(nil);
                 TabGlobal.DOrdemCobrancaProdExp.NumOrdCobranca.Conteudo := sn_Fatura ;
                 TabGlobal.DOrdemCobrancaProdExp.Contrato.Conteudo := TabelaPrincipal.FieldValues['Contrato'];
                 TabGlobal.DOrdemCobrancaProdExp.Seq.conteudo := TabelaPrincipal.FieldValues['Seq'];
                 TabGlobal.DOrdemCobrancaProdExp.Valor.conteudo := TabelaPrincipal.FieldValues['Valor'];

                 if TabelaPrincipal.FindField('ValorDesconto').IsNull then
                    TabGlobal.DOrdemCobrancaProdExp.ValorDesconto.ValorPadrao
                 else
                    TabGlobal.DOrdemCobrancaProdExp.ValorDesconto.conteudo := TabelaPrincipal.FieldValues['ValorDesconto'];

                 if not  TabelaPrincipal.FindField('MOEDACOMISSAOTAXA').IsNull  then
                    TabGlobal.DOrdemCobrancaProdExp.MOEDACOMISSAO.conteudo := TabelaPrincipal.FieldValues['MOEDACOMISSAOTAXA'];

                 if not  TabelaPrincipal.FindField('COMISAOSFATURA').IsNull then
                    TabGlobal.DOrdemCobrancaProdExp.COMISAOSFATURA.conteudo := TabelaPrincipal.FieldValues['COMISAOSFATURA'];

                 if not  TabelaPrincipal.FindField('Rate').IsNull then
                    TabGlobal.DOrdemCobrancaProdExp.TAXACONVERCAO.conteudo := TabelaPrincipal.FieldValues['Rate'];

                 if not  TabelaPrincipal.FindField('ValorConvertido').IsNull then
                    valor_Fatura := valor_Fatura + TabelaPrincipal.FieldValues['ValorConvertido'];

                 TabGlobal.DOrdemCobrancaProdExp.Salva;
              end ;

              TabelaPrincipal.Modifica ;
              TabelaPrincipal.FieldByName('Numordcobranca').Value := sn_Fatura ;
              TabelaPrincipal.FindField('Selecionado').Value := 'N' ;
              TabelaPrincipal.Salva;
              
              // correcao de problema de objeto
              TabelaPrincipal.Modifica ;
              TabelaPrincipal.Salva;


              TabelaPrincipal.Next;
            end;


            {
            TabGlobal.DFaturaTab.DataFatura
            TabGlobal.DFaturaTab.CTTO
            TabGlobal.DFaturaTab.ValorDesconto
            TabGlobal.DFaturaTab.VALOR_LIQ
            TabGlobal.DFaturaTab.NumNFEmit
            TabGlobal.DFaturaTab.VALOR_NF
            TabGlobal.DFaturaTab.Comentario
            TabGlobal.DFaturaTab.DataNF
            }

            // incluir fatuar na tabela de fatura
            TabGlobal.DOrdemCobranca.Inclui(nil);
            TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo := sn_Fatura ;
            TabGlobal.DOrdemCobranca.FORCOD.Conteudo := TabelaPrincipal.FieldValues['FORCOD'];
            TabGlobal.DOrdemCobranca.Cadastro.Conteudo := date ;
            TabGlobal.DOrdemCobranca.Status.Conteudo := s_ST_AB_F ; // '0' ;
            TabGlobal.DOrdemCobranca.TEXTO_PADRAO.Conteudo :=  TabGlobal.DParametros.TEXTOFATURA.Conteudo;
            TabGlobal.DOrdemCobranca.Valor.Conteudo := valor_Fatura ;
          //  TabGlobal.DOrdemCobranca.DataLiq.Conteudo := 
            TabGlobal.DOrdemCobranca.Salva;



         end
         else begin
             MessageDlg( MSG_NaoExistemRegistrosSelecionados ,mtWarning, [mbOk],0);
             exit;
         end;


      end
      else
        sn_Fatura := TabelaPrincipal.FieldByName('Numordcobranca').Value ;

        TabGlobal.DOrdemCobranca.Close ;
        TabGlobal.DOrdemCobranca.Filtro.Clear ;
        TabGlobal.DOrdemCobranca.Filtro.Add('Numordcobranca ='+AtribuiAspas(sn_Fatura)) ;
        TabGlobal.DOrdemCobranca.AtualizaSql;



        TabGlobal.DOrdemCobrancaProdExp.Close;
        TabGlobal.DOrdemCobrancaProdExp.Filtro.Clear ;
        TabGlobal.DOrdemCobrancaProdExp.Filtro.Add('OrdemCobrancaProdExp.Numordcobranca ='+AtribuiAspas(sn_Fatura)) ;

        TabGlobal.DOrdemCobrancaProdExp.AtualizaSql;

        s_NumFaturaFim := ( trim (copy(sn_Fatura,1,4))+'/'+trim(copy(sn_Fatura,5,4))) ;
        s_NumFaturaInc := s_NumFaturaFim ;

        ExecutaForm(TFormOrdemCobranca,FormOrdemCobranca);

        // ExecutaForm(TFormFaturaTab,FormFaturaTab);
        BitBtn1Click(SELF);

        Refresh;

        // fazer os
        //if l_criar_ordrmCobranca then begin
        //   Deselecionar_reg();
        //end;


    Finally
      FormRELFATURA.Free;
    end;
//   end
//   else
//      MessageDlg( MSG_FATURASURIMPEXJACRIADA,mtWarning,[mbOk],0);
END
ELSE
 // MessageDlg( MSG_FILTROTEMQUESERCRIADO ,mtConfirmation, [mbYes, mbNo], 0) ;
  MessageDlg( MSG_FILTROTEMQUESERCRIADO,mtWarning,[mbOk],0);
end;

procedure TFormFaturaN.BitBtn15Click(Sender: TObject);
var
 s_NumFaturaInc , s_NumFaturaFim , sn_Fatura : string ;
begin
{
IF S_FILTRO <> '' THEN BEGIN
    s_NumFaturaInc := '' ;
    s_NumFaturaFim := '' ;
    sn_Fatura := '';
//    FormRELFATURA := TFormRELFATURA.Create(Application);
    Try
      TabGlobal.DFaturaTab.AtribuiRelacionamentos;
      // verificar se existe fatura
      if TabelaPrincipal.FieldByName('NumFatura').isnull  then begin
        sn_Fatura := Get_Fatura();
        TabGlobal.DFaturaTab.Inclui(nil);
        TabGlobal.DFaturaTab.NumFatura.Conteudo := sn_Fatura ;
        TabGlobal.DFaturaTab.Cadastro.Conteudo := date ;
        TabGlobal.DFaturaTab.Salva;
        TabelaPrincipal.First ;
        while not TabelaPrincipal.eof do begin
           TabGlobal.DFaturaProdExp.Inclui(nil);
           TabGlobal.DFaturaProdExp.NumFatura.Conteudo := sn_Fatura ;
           TabGlobal.DFaturaProdExp.Contrato.Conteudo := TabelaPrincipal.FieldValues['Contrato']    ;
           TabGlobal.DFaturaProdExp.Seq.conteudo := TabelaPrincipal.FieldValues['Seq'];
           TabGlobal.DFaturaProdExp.Salva;
           TabelaPrincipal.Next;
        end;
      end
      else
        sn_Fatura := TabelaPrincipal.FieldByName('NumFatura').Value ;

        TabGlobal.DFaturaTab.Close ;
        TabGlobal.DFaturaTab.Filtro.Clear ;
        TabGlobal.DFaturaTab.Filtro.Add('NumFatura ='+AtribuiAspas(sn_Fatura)) ;
        TabGlobal.DFaturaTab.AtualizaSql;



        TabGlobal.DFaturaProdExp.Close;
        TabGlobal.DFaturaProdExp.Filtro.Clear ;
        TabGlobal.DFaturaProdExp.Filtro.Add('FaturaProdExp.NumFatura ='+AtribuiAspas(sn_Fatura)) ;

        TabGlobal.DFaturaProdExp.AtualizaSql;
        s_NumFaturaFim := ( trim (copy(sn_Fatura,1,4))+'/'+trim(copy(sn_Fatura,5,4))) ;
        s_NumFaturaInc := s_NumFaturaFim ;

       // FormRELFATURA.set_filtro(S_FILTRO);
       // FormRELFATURA.set_cod_exportador(pi_CODFOR, pi_CODFOR);
        if (s_NumFaturaInc <> '') or  (s_NumFaturaInc <> '') then
            ExecutaForm(TFormFaturaTab,FormFaturaTab);
          // FormRELFATURA.set_Fatura(s_NumFaturaInc,s_NumFaturaFim);
       // FormRELFATURA.ShowModal;

        BitBtn1Click(SELF);
        Refresh;

    Finally
      //FormRELFATURA.Free;
    end;

END
ELSE
  MessageDlg( MSG_FILTROTEMQUESERCRIADO,mtWarning,[mbOk],0);
  }
end;

{ antigo codigo
procedure TFormFaturaN.BitBtn8Click(Sender: TObject);
var
  ExecutaForm(TFormFaturaTab,FormFaturaTab);
 s_NumFaturaInc , s_NumFaturaFim , sn_Fatura : string ;
 valor_Fatura : double ;
begin
//if TabGlobal.DFatura.Rate.isnull then begin
if TabelaPrincipal.FieldByName('Rate').isnull  then begin
  if MessageDlg( MSG_ConfirmaGerarFaturasemoRATE ,mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
     exit ;
end;

IF S_FILTRO <> '' THEN BEGIN

//  if TabGlobal.DFatura.NumFatura.Conteudo = '' then begin
    {codificação... Rel. Fatura }
{    s_NumFaturaInc := '' ;
    s_NumFaturaFim := '' ;
    sn_Fatura := '';
   // FormRELFATURA := TFormRELFATURA.Create(Application);
    Try
      TabGlobal.DFaturaTab.AtribuiRelacionamentos;
      // verificar se existe fatura
      if TabelaPrincipal.FieldByName('NumFatura').isnull  then begin
       //  if ( TabelaPrincipal.FieldByName('NumFatura').Value = '' ) then begin
        // cria um nova fatura
        // sn_Fatura := FormRELFATURA.Get_Fatura();
        sn_Fatura := FormRELFATURA.Get_Fatura();


        // criar produtos exportador fatura
        TabelaPrincipal.First ;
        valor_Fatura := 0 ;
        while not TabelaPrincipal.eof do begin
           TabGlobal.DFaturaProdExp.Inclui(nil);
           TabGlobal.DFaturaProdExp.NumFatura.Conteudo := sn_Fatura ;
           TabGlobal.DFaturaProdExp.Contrato.Conteudo := TabelaPrincipal.FieldValues['Contrato'];
           TabGlobal.DFaturaProdExp.Seq.conteudo := TabelaPrincipal.FieldValues['Seq'];
           valor_Fatura := valor_Fatura + TabelaPrincipal.FieldValues['ValorConvertido'];
           TabGlobal.DFaturaProdExp.Salva;
           TabelaPrincipal.Next;
        end;

        // incluir fatuar na tabela de fatura
        TabGlobal.DFaturaTab.Inclui(nil);
        TabGlobal.DFaturaTab.NumFatura.Conteudo := sn_Fatura ;
        TabGlobal.DFaturaTab.FORCOD.Conteudo := TabelaPrincipal.FieldValues['FORCOD'];
        TabGlobal.DFaturaTab.Cadastro.Conteudo := date ;
        TabGlobal.DFaturaTab.Status.Conteudo := s_ST_AB_F ; // '0' ;
        TabGlobal.DFaturaTab.TEXTO_PADRAO.Conteudo :=  TabGlobal.DParametros.TEXTOFATURA.Conteudo;
        TabGlobal.DFaturaTab.Valor.Conteudo := valor_Fatura ;

        {
        TabGlobal.DFaturaTab.DataFatura
        TabGlobal.DFaturaTab.CTTO
        TabGlobal.DFaturaTab.ValorDesconto
        TabGlobal.DFaturaTab.VALOR_LIQ
        TabGlobal.DFaturaTab.NumNFEmit
        TabGlobal.DFaturaTab.VALOR_NF
        TabGlobal.DFaturaTab.Comentario
        TabGlobal.DFaturaTab.DataNF
        }

{        TabGlobal.DFaturaTab.Salva;



      end
      else
        sn_Fatura := TabelaPrincipal.FieldByName('NumFatura').Value ;

        TabGlobal.DFaturaTab.Close ;
        TabGlobal.DFaturaTab.Filtro.Clear ;
        TabGlobal.DFaturaTab.Filtro.Add('NumFatura ='+AtribuiAspas(sn_Fatura)) ;
        TabGlobal.DFaturaTab.AtualizaSql;



        TabGlobal.DFaturaProdExp.Close;
        TabGlobal.DFaturaProdExp.Filtro.Clear ;
        TabGlobal.DFaturaProdExp.Filtro.Add('FaturaProdExp.NumFatura ='+AtribuiAspas(sn_Fatura)) ;

        TabGlobal.DFaturaProdExp.AtualizaSql;

        {
        TabelaPrincipal.First ;
        if TabGlobal.DFatura.NumFatura.Conteudo <> '' then
           s_NumFaturaInc := ( trim (copy(TabGlobal.DFatura.NumFatura.Conteudo,1,4))+'/'+trim(copy(TabGlobal.DFatura.NumFatura.Conteudo,5,4)))      ;
        TabelaPrincipal.Last ;
        if TabGlobal.DFatura.NumFatura.Conteudo <> '' then
           s_NumFaturaFim := ( trim (copy(TabGlobal.DFatura.NumFatura.Conteudo,1,4))+'/'+trim(copy(TabGlobal.DFatura.NumFatura.Conteudo,5,4))) ;
        }

{        s_NumFaturaFim := ( trim (copy(sn_Fatura,1,4))+'/'+trim(copy(sn_Fatura,5,4))) ;
        s_NumFaturaInc := s_NumFaturaFim ;

        { foi retirado para faciliades futuras
        //FormRELFATURA.DFatura := TabGlobal.DFatura ;
        FormRELFATURA.set_filtro(S_FILTRO);
        FormRELFATURA.set_cod_exportador(pi_CODFOR, pi_CODFOR);
        if (s_NumFaturaInc <> '') or  (s_NumFaturaInc <> '') then
           FormRELFATURA.set_Fatura(s_NumFaturaInc,s_NumFaturaFim);
        FormRELFATURA.ShowModal;
        //FormRELFATURA.EXIBIR_REL;
        }


{        ExecutaForm(TFormFaturaTab,FormFaturaTab);
        BitBtn1Click(SELF);
        Refresh;

    Finally
      FormRELFATURA.Free;
    end;
//   end
//   else
//      MessageDlg( MSG_FATURASURIMPEXJACRIADA,mtWarning,[mbOk],0);
END
ELSE
 // MessageDlg( MSG_FILTROTEMQUESERCRIADO ,mtConfirmation, [mbYes, mbNo], 0) ;
  MessageDlg( MSG_FILTROTEMQUESERCRIADO,mtWarning,[mbOk],0);
end;

}
procedure TFormFaturaN.DBG_FATURADblClick(Sender: TObject);
begin
 DBG_FATURA.SelectedRows.CurrentRowSelected := true ;
end;

procedure TFormFaturaN.SelecionadoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFatura.Selecionado.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFatura.Selecionado);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.DBG_FATURAColExit(Sender: TObject);
begin
{
  if DBG_FATURA.SelectedField.FieldName = Ck_Selecionado.DataField then
    Ck_Selecionado.Visible := False
}
end;

procedure TFormFaturaN.DBG_FATURAKeyPress(Sender: TObject; var Key: Char);
begin
{
  if (key = Chr(9)) then
    Exit;

  if (DBG_FATURA.SelectedField.FieldName = Ck_Selecionado.DataField) then
  begin
    Ck_Selecionado.SetFocus;
    SendMessage(Ck_Selecionado.Handle, WM_Char, word(Key), 0);
  end;
}
end;

procedure TFormFaturaN.Ck_SelecionadoClick(Sender: TObject);
begin
{
  if Ck_Selecionado.Checked then
     Ck_Selecionado.Caption := Ck_Selecionado.ValueChecked
  else
     Ck_Selecionado.Caption := Ck_Selecionado.ValueUnChecked;
}
end;

procedure TFormFaturaN.BitBtn16Click(Sender: TObject);
begin
// selecionar
  Screen.Cursor := crHourGlass;
  TabGlobal.DFatura.First ;
  while not TabGlobal.DFatura.Eof do begin
     TabGlobal.DFatura.Modifica;
     TabGlobal.DFatura.Selecionado.Conteudo := 'S' ;
     // 07/10/2013 modificado encontrado o erro
     // esta regra de negocio esta erra
     // TabGlobal.DFatura.ComisaoSFatura.Conteudo := 0 ;

     TabGlobal.DFatura.Salva ;
     TabGlobal.DFatura.Next;
  end;
  TabGlobal.DFatura.First ;
  Screen.Cursor := crDefault ;
end;

procedure TFormFaturaN.Deselecionar_reg();
begin
  Screen.Cursor := crHourGlass;
  TabGlobal.DFatura.First ;
  while not TabGlobal.DFatura.Eof do begin
     TabGlobal.DFatura.Modifica;
     TabGlobal.DFatura.Selecionado.Conteudo := 'N' ;
     TabGlobal.DFatura.Salva ;
     TabGlobal.DFatura.Next;
  end;
  TabGlobal.DFatura.First ;
  Screen.Cursor := crDefault ;
end;


procedure TFormFaturaN.BitBtn17Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
// selecionar
  TabGlobal.DFatura.First ;
  while not TabGlobal.DFatura.Eof do begin
     TabGlobal.DFatura.Modifica;
     TabGlobal.DFatura.Selecionado.Conteudo := 'N' ;
     TabGlobal.DFatura.Salva ;
     TabGlobal.DFatura.Next;
  end;
  TabGlobal.DFatura.First ;
// selecionar
//  Deselecionar_reg();
  Screen.Cursor := crDefault ;
end;

procedure TFormFaturaN.DataOrdCobrancaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFatura.DataOrdCobranca.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFatura.DataOrdCobranca);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.NumOrdCobrancaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFatura.NumOrdCobranca.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFatura.NumOrdCobranca);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

function TFormFaturaN.Existe_selecionados() : boolean ;
var
l_criar_ordrmCobranca : boolean ;
begin
  l_criar_ordrmCobranca := false  ;
  TabelaPrincipal.First ;
  while not TabelaPrincipal.eof do begin
    if TabelaPrincipal.FieldValues['Selecionado'] = 'S' then begin
       l_criar_ordrmCobranca := true ;

    end ;

    TabelaPrincipal.Next;
  end;
  Existe_selecionados := l_criar_ordrmCobranca ;
end;



function TFormFaturaN.Existe_Rate():boolean ;
var
 ret : boolean ;
begin
  ret := false ;
  TabelaPrincipal.First ;

  while (( not TabelaPrincipal.Eof ) and ( ret = false )) do begin
     if ( TabelaPrincipal.FindField('Selecionado').Value = 'S' ) and
        ( not TabelaPrincipal.FieldByName('Rate').isnull ) then begin
        ret := true ;
     end;
     TabelaPrincipal.Next;
  end;
  
  TabelaPrincipal.First ;
  Existe_Rate := ret ;
end;


procedure TFormFaturaN.SelecionadoClick(Sender: TObject);
begin

// TabGlobal.DFatura.Salva ;

end;

procedure TFormFaturaN.Button1Click(Sender: TObject);
begin

if TabGlobal.DFatura.MOEDACOMISSAOTAXA.Conteudo = '' then
begin
   if not ( ( TabGlobal.DFatura.State = dsedit ) or ( TabGlobal.DFatura.State = dsinsert )) then
   begin
      TabGlobal.DFatura.Modifica       ;
      TabGlobal.DFatura.MOEDACOMISSAOTAXA.Conteudo := TabGlobal.DFatura.MOEDACOMISSAO.Conteudo ;
   end
   else
      TabGlobal.DFatura.MOEDACOMISSAOTAXA.Conteudo := TabGlobal.DFatura.MOEDACOMISSAO.Conteudo ;

end;


BTNSALVARclick(SENDER) ;
BTNMODIFICARclick (SENDER) ;
TabelaPrincipal.Next ;

end;

procedure TFormFaturaN.MOEDACOMISSAOTAXAExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFatura.MOEDACOMISSAOTAXA.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFatura.MOEDACOMISSAOTAXA);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaN.MOEDACOMISSAOTAXADrawItem(Control: TWinControl; Index: Integer;
                                        Rect: TRect; State: TOwnerDrawState);
var Canvas : TCanvas;
begin
  if Control is TDBListBox then
    Canvas  := (Control as TDBListBox).Canvas
  else if Control is TDBComboBox then
    Canvas  := (Control as TDBComboBox).Canvas
  else
    Canvas  := (Control as TComboBox).Canvas;
  Canvas.FillRect(Rect);
  if TabGlobal.DFatura.MOEDACOMISSAOTAXA.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DFatura.MOEDACOMISSAOTAXA.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DFatura.MOEDACOMISSAOTAXA.DescValorValido[Index]));
end;

procedure TFormFaturaN.BitBtn10Click(Sender: TObject);
begin
// gerar o relatorio
if TabGlobal.DFatura.NumOrdCobranca.Conteudo <> '' then begin
  FormREL_FATURATAB := TFormREL_FATURATAB.Create(Application);
  Try
    FormREL_FATURATAB.set_NumOrdCobranca(TabGlobal.DFatura.NumOrdCobranca.Conteudo);
    FormREL_FATURATAB.ShowModal;
  Finally
    FormREL_FATURATAB.Free;
  end;
end;
end;

procedure TFormFaturaN.BitBtn28Click(Sender: TObject);
begin
  if MessageDlg('Confirma recalculo da Comissão?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin

    // selecionar
    Screen.Cursor := crHourGlass;
    TabGlobal.DFatura.First ;
    while not TabGlobal.DFatura.Eof do begin
       TabGlobal.DFatura.Modifica;
       TabGlobal.DFatura.ComisaoSFatura.Conteudo := 0 ;
       TabGlobal.DFatura.Salva ;
       TabGlobal.DFatura.Next;
    end;
    TabGlobal.DFatura.First ;
    Screen.Cursor := crDefault ;
    end
end;

end.
