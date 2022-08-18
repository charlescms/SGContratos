{
   Programa.: XMaker CMS Modelo.PAS
   Copyright: CMX
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
}
unit OrdemCobranca;

interface

{$I Princ.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Tabs, BaseD, Db, Grids, DBGrids,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Atributo, dbctrls, Clipbrd, Tabela, Menus, IniFiles, Printers, Calculos,
  {$I LTab.pas}
  JPeg, XLookUp, XDBDate, Mask, XDBEdit, XDBNum, XEdit, XBanner, XDate, XNum;

type
  TFormOrdemCobranca = class(TForm)
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    AbaConsulta: TTabSet;
    AbrirImagem: TMenuItem;
    BitB_Nv_Fatura: TBitBtn;
    BitBtn1: TBitBtn;
    Btn_grava: TBitBtn;
    Btn_imprime: TBitBtn;
    BtnAnterior: TSpeedButton;
    BtnAplicarNF: TBitBtn;
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
    BtnVisualizar: TBitBtn;
    Cadastro: TXDBDateEdit;
    ColarImagem: TMenuItem;
    Comentario: TDBMemo;
    CopiarImagem: TMenuItem;
    CortarImagem: TMenuItem;
    CTTO: TXDBEdit;
    DataFatura: TXDBDateEdit;
    DataLiq: TXDBDateEdit;
    DataNF: TXDBDateEdit;
    DataProtesto: TXDBDateEdit;
    DataSource: TDataSource;
    DataSource_Grid_OrdemCobrancaDescont: TDataSource;
    DataSource_Grid_OrdemCobrncaProdExp: TDataSource;
    Divisao_sup: TPanel;
    DlgAbrirImagem: TOpenDialog;
    DlgSalvarComoImagem: TSaveDialog;
    FATURA: TXDBEdit;
    FORCOD: TXDBNumEdit;
    Grid_OrdemCobrancaDescont: TDBGrid;
    Grid_OrdemCobrncaProdExp: TDBGrid;
    GridConsulta: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    LbcCadastro: TLabel;
    LbcComentario: TLabel;
    LbcCTTO: TLabel;
    LbcDataFatura: TLabel;
    LbcDataLiq: TLabel;
    LbcDataNF: TLabel;
    LbcDataProtesto: TLabel;
    LbcFATURA: TLabel;
    LbcFORCOD: TLabel;
    LbcNOME: TLabel;
    LbcNumNFEmit: TLabel;
    LbcNumOrdCobranca: TLabel;
    LbcRAZAO: TLabel;
    LbcRecebimento: TLabel;
    LbcStatus: TLabel;
    LbcTEXTO_PADRAO: TLabel;
    LbcTextoDsconto: TLabel;
    LbcUsuario: TLabel;
    LbcValor: TLabel;
    LbcVALOR_IRRF: TLabel;
    LbcVALOR_LIQ: TLabel;
    LbcVALOR_NF: TLabel;
    LbcVALOR_NF_LIQ: TLabel;
    LbcVALOR_PIS_COF: TLabel;
    LbcValorDesconto: TLabel;
    LbcVALORRECEBIDO: TLabel;
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
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    NoManutencao: TNotebook;
    NOME: TXDBEdit;
    NumNFEmit: TXDBNumEdit;
    NumOrdCobranca: TXDBEdit;
    PagePrincipal: TPageControl;
    Pagina0: TScrollBox;
    Pagina1: TScrollBox;
    Pagina10: TScrollBox;
    Pagina2: TScrollBox;
    Pagina3: TScrollBox;
    Pagina4: TScrollBox;
    Pagina5: TScrollBox;
    Pagina6: TScrollBox;
    Pagina7: TScrollBox;
    Pagina8: TScrollBox;
    Pagina9: TScrollBox;
    PgPagina1: TScrollBox;
    PnInfConsulta: TPanel;
    PnSalva: TPanel;
    PnSuperior: TPanel;
    PopConsulta: TPopupMenu;
    PopRelacionados: TPopupMenu;
    RAZAO: TXDBEdit;
    Recebimento: TXDBDateEdit;
    SalvarImagem: TMenuItem;
    Status: TDBComboBox;
    TabConsulta: TTabSheet;
    TabManutencao: TTabSheet;
    TabPaginas: TTabSet;
    TEXTO_PADRAO: TDBMemo;
    TextoDsconto: TXDBEdit;
    Usuario: TXDBEdit;
    Valor: TXDBNumEdit;
    VALOR_IRRF: TXDBNumEdit;
    VALOR_LIQ: TXDBNumEdit;
    VALOR_NF: TXDBNumEdit;
    VALOR_NF_LIQ: TXDBNumEdit;
    VALOR_PIS_COF: TXDBNumEdit;
    ValorDesconto: TXDBNumEdit;
    VALORRECEBIDO: TXDBNumEdit;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure NumOrdCobrancaExit(Sender: TObject);
    procedure FORCODExit(Sender: TObject);
    procedure CadastroExit(Sender: TObject);
    procedure StatusExit(Sender: TObject);
    procedure StatusDrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
    procedure FATURAExit(Sender: TObject);
    procedure DataFaturaExit(Sender: TObject);
    procedure CTTOExit(Sender: TObject);
    procedure ValorExit(Sender: TObject);
    procedure ValorDescontoExit(Sender: TObject);
    procedure VALOR_LIQExit(Sender: TObject);
    procedure NumNFEmitExit(Sender: TObject);
    procedure DataNFExit(Sender: TObject);
    procedure ComentarioExit(Sender: TObject);
    procedure VALOR_NFExit(Sender: TObject);
    procedure VALOR_IRRFExit(Sender: TObject);
    procedure VALOR_PIS_COFExit(Sender: TObject);
    procedure VALOR_NF_LIQExit(Sender: TObject);
    procedure DataLiqExit(Sender: TObject);
    procedure DataProtestoExit(Sender: TObject);
    procedure RecebimentoExit(Sender: TObject);
    procedure UsuarioExit(Sender: TObject);
    procedure RAZAOExit(Sender: TObject);
    procedure NOMEExit(Sender: TObject);
    procedure TEXTO_PADRAOExit(Sender: TObject);
    procedure VALORRECEBIDOExit(Sender: TObject);
    procedure MOEDACOMISSAOExit(Sender: TObject);
    procedure MOEDACOMISSAODrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
    procedure TextoDscontoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
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
    procedure BtnAjudaClick(Sender: TObject);
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
    procedure Grid_OrdemCobrncaProdExpDblClick(Sender: TObject);
    procedure Grid_OrdemCobrncaProdExpColEnter(Sender: TObject);
    procedure Grid_OrdemCobrncaProdExpExit(Sender: TObject);
    procedure Grid_OrdemCobrncaProdExpEditButtonClick(Sender: TObject);
    procedure Grid_OrdemCobrancaDescontDblClick(Sender: TObject);
    procedure Grid_OrdemCobrancaDescontColEnter(Sender: TObject);
    procedure Grid_OrdemCobrancaDescontExit(Sender: TObject);
    procedure Grid_OrdemCobrancaDescontEditButtonClick(Sender: TObject);
    procedure BtnVisualizarClick(Sender: TObject);
    procedure Btn_gravaClick(Sender: TObject);
    procedure BitB_Nv_FaturaClick(Sender: TObject);
    procedure Btn_imprimeClick(Sender: TObject);
    procedure BtnAplicarNFClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
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
  public
    { Public declarations }
    {03-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    TabelaPrincipal: TTabela;
    {04-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
  end;

var
  FormOrdemCobranca: TFormOrdemCobranca;
  LastControl: TWinControl;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, RotinaEd, Abertura, GridPesquisa, ORDCOBRANCAPROD, ORDCOBRANCADESC
     , UCMS_CONST,    REL_FATURATAB {, DOrdemCobranca};

procedure TFormOrdemCobranca.FormShow(Sender: TObject);
Var
  I: Integer;
begin
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  TabelaPrincipal    := TabGlobal.DOrdemCobranca;
  TituloModulo       := 'Cadastro Ordem Cobrança';
  Caption            := TituloModulo;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
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
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.TextoDsconto, -2, TextoDscontoExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.MOEDACOMISSAO, -2, MOEDACOMISSAOExit, MOEDACOMISSAODrawItem, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.VALORRECEBIDO, -2, VALORRECEBIDOExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  DataSource_Grid_OrdemCobrancaDescont.DataSet := TabGlobal.DOrdemCobrancaDescont;
{  Grid_OrdemCobrancaDescont.DataSource := DataSource_Grid_OrdemCobrancaDescont;
  AtribuiGridEdicao(TabGlobal.DOrdemCobrancaDescont, Grid_OrdemCobrancaDescont, True, ValidaColunaGrid);
  DataSource_Grid_OrdemCobrncaProdExp.DataSet := TabGlobal.DOrdemCobrncaProdExp;
  Grid_OrdemCobrncaProdExp.DataSource := DataSource_Grid_OrdemCobrncaProdExp;
  AtribuiGridEdicao(TabGlobal.DOrdemCobrncaProdExp, Grid_OrdemCobrncaProdExp, True, ValidaColunaGrid);
 }

  Grid_OrdemCobrancaDescont.DataSource := DataSource_Grid_OrdemCobrancaDescont;
  AtribuiGridEdicao(TabGlobal.DOrdemCobrancaDescont, Grid_OrdemCobrancaDescont, True, ValidaColunaGrid);
  DataSource_Grid_OrdemCobrncaProdExp.DataSet := TabGlobal.DOrdemCobrancaProdExp;
  Grid_OrdemCobrncaProdExp.DataSource := DataSource_Grid_OrdemCobrncaProdExp;
  AtribuiGridEdicao(TabGlobal.DOrdemCobrancaProdExp, Grid_OrdemCobrncaProdExp, True, ValidaColunaGrid);


  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.TEXTO_PADRAO, -2, TEXTO_PADRAOExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.NOME, -2, NOMEExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.RAZAO, -2, RAZAOExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.Usuario, -2, UsuarioExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.Recebimento, -2, RecebimentoExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.DataProtesto, -2, DataProtestoExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.DataLiq, -2, DataLiqExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.VALOR_NF_LIQ, -2, VALOR_NF_LIQExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.VALOR_PIS_COF, -2, VALOR_PIS_COFExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.VALOR_IRRF, -2, VALOR_IRRFExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.VALOR_NF, -2, VALOR_NFExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.Comentario, -2, ComentarioExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.DataNF, -2, DataNFExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.NumNFEmit, -2, NumNFEmitExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.VALOR_LIQ, -2, VALOR_LIQExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.ValorDesconto, -2, ValorDescontoExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.Valor, -2, ValorExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.CTTO, -2, CTTOExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.DataFatura, -2, DataFaturaExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.FATURA, -2, FATURAExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.Status, -2, StatusExit, StatusDrawItem, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.Cadastro, -2, CadastroExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.FORCOD, -2, FORCODExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.NumOrdCobranca, -1, NumOrdCobrancaExit, Nil, ListaCamposEd, FormOrdemCobranca, DataSource, ChamaGridPesquisa);


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
  // inicializao de sistema
  Grid_OrdemCobrancaDescont.Align := alBottom ;
  Grid_OrdemCobrncaProdExp.Align := alClient ;
end;

function TFormOrdemCobranca.AbreTabelas: Boolean;
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  Result := True;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormOrdemCobranca.CamposCalculados;
begin
  {08-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormOrdemCobranca.HabilitaEdicao(Valor: Boolean = true);
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

function TFormOrdemCobranca.ConfirmaInclusao: Boolean;
begin
  Result := True;
end;

function TFormOrdemCobranca.ConfirmaModificacao: Boolean;
begin
  Result := True;
end;

function TFormOrdemCobranca.ConfirmaExclusao: Boolean;
begin
  Result := True;
end;

function TFormOrdemCobranca.ConfirmaGravacao: Boolean;
begin
  Result := True;
end;

procedure TFormOrdemCobranca.TelaManutencao;
begin
  if (TabelaPrincipal.Inclusao) or
     (TabelaPrincipal.Modificacao) then
    HabilitaEdicao
  else
    HabilitaEdicao(False);
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormOrdemCobranca.TelaConsulta;
begin
  HabilitaEdicao(False);

end;

procedure TFormOrdemCobranca.AtribuiValoresPadrao;
begin
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd, True);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormOrdemCobranca.AntesdeSalvar;
begin

end;

procedure TFormOrdemCobranca.AntesdeIncluir;
begin

end;

procedure TFormOrdemCobranca.AntesdeModificar;
begin

end;

procedure TFormOrdemCobranca.AntesdeExcluir;
begin

  PTabela(TabGlobal.DExportadoTransito, ['NumOrdCobranca'], [TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo], 'Selecionado = ' + AtribuiAspas('N'));          // Status
  PTabela(TabGlobal.DExportadoTransito, ['NumOrdCobranca'], [TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo], 'Status = ' + AtribuiAspas(s_ST_CM_F));          // Status
  // este campo ira acaber com o relacionamento

  PTabela(TabGlobal.DExportadoTransito, ['NumOrdCobranca'], [TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo], 'ValorDesconto = 0.0 ') ;
  PTabela(TabGlobal.DExportadoTransito, ['NumOrdCobranca'], [TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo], 'DataOrdCobranca = null '  ) ;
  PTabela(TabGlobal.DExportadoTransito, ['NumOrdCobranca'], [TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo], 'NumNFEmit = 0 ') ;
  PTabela(TabGlobal.DExportadoTransito, ['NumOrdCobranca'], [TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo], 'DataNF = null ' ) ;
  PTabela(TabGlobal.DExportadoTransito, ['NumOrdCobranca'], [TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo], 'VALOR_NF = 0.0 ') ;
  PTabela(TabGlobal.DExportadoTransito, ['NumOrdCobranca'], [TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo], 'NumOrdCobranca = ''''' ) ;
{
// 16/08/2012
           TabGlobal.DFatura.Selecionado. Conteudo       := 'N';
           TabGlobal.DFatura.Status.Conteudo             := s_ST_FA_F ;
           TabGlobal.DFatura.NumOrdCobranca.Conteudo     := TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo ;

           TabGlobal.DFatura.ValorDesconto.Conteudo      := TabGlobal.DOrdemCobranca.ValorDesconto.Conteudo ;
           TabGlobal.DFatura.DataOrdCobranca.Conteudo    := date ;
           TabGlobal.DFatura.NumNFEmit.Conteudo        := TabGlobal.DOrdemCobranca.NumNFEmit.Conteudo ;
           TabGlobal.DFatura.DataNF.Conteudo           := TabGlobal.DOrdemCobranca.DataNF.Conteudo ;
           TabGlobal.DFatura.Valor_NF.Conteudo         := TabGlobal.DOrdemCobranca.VALOR_NF.Conteudo ;
}


  TabGlobal.DFatura.Refresh       ;
  {
  TabGlobal.DFatura.First ;
  while not TabGlobal.DFatura.eof do begin
     if TabGlobal.DFatura.NumOrdCobranca.Conteudo = TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo then begin
        TabGlobal.DFatura.Modifica;
        TabGlobal.DFatura.Selecionado.Conteudo := 'N' ;
        TabGlobal.DFatura.Status.Conteudo := s_ST_CM_F ;
        TabGlobal.DFatura.NumOrdCobranca.Conteudo := '';
        TabGlobal.DFatura.Salva ;
     end;
     TabGlobal.DFatura.Next ;

  end;
  }
end;

procedure TFormOrdemCobranca.DepoisdeIncluir;
begin

end;

procedure TFormOrdemCobranca.DepoisdeModificar;
begin

end;

procedure TFormOrdemCobranca.DepoisdeExcluir;
begin

end;

procedure TFormOrdemCobranca.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSalvar.Enabled then
    TabelaPrincipal.Cancela;
end;

procedure TFormOrdemCobranca.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  I: Integer;
begin
  //TabelaPrincipal.AtribuiRelacionamentos(False); // Habilite esta opção caso seja realmente necessário...

  // limpa o filtro
  TabelaPrincipal.Filtro.Clear;

  if TabelaPrincipal.Active then
     TabelaPrincipal.AtualizaSql
  else
     TabelaPrincipal.AtualizaSql(false);

  DesabilitaFuncoesEd;
  ListaCamposED.Free;
  for I := 0 to ConsultasSalvas.Count - 1 do
    TConsultasSalvas(ConsultasSalvas[I]).Free;
  ConsultasSalvas.Free;
  Action := caFree;
  FormOrdemCobranca := nil;
end;

procedure TFormOrdemCobranca.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormOrdemCobranca.BtnAjudaClick(Sender: TObject);
begin
  application.helpcommand(Help_Finder,HelpContext);
end;

procedure TFormOrdemCobranca.StatusTabela;
begin
 // LbTituloForm.Caption := TituloModulo + '- [ Ordem: '+TabelaPrincipal.TituloIndice+' ]';
end;

procedure TFormOrdemCobranca.FormResize(Sender: TObject);
begin
 // BtnAjuda.Left  := ShapeSup.Width - 37;
 // BtnFechar.Left := ShapeSup.Width - 19;
end;

procedure TFormOrdemCobranca.FormActivate(Sender: TObject);
begin
  {
    Inicializa Menu Manutenção e Barra de Ferramentas
  }
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

procedure TFormOrdemCobranca.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormOrdemCobranca.BtnSalvarClick(Sender: TObject);
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
      if TabelaPrincipal.Salva then
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
    PagePrincipal.ActivePageIndex := 1;
    TelaConsulta;
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
    GridConsulta.SetFocus;
  end;
  SalvarRegistro := False;
end;

procedure TFormOrdemCobranca.BtnDesistirClick(Sender: TObject);
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

procedure TFormOrdemCobranca.GridConsultaDblClick(Sender: TObject);
begin
  if TabelaPrincipal.Eof then
    Incluir(Self)
  else
    Modificar(Self);
end;

procedure TFormOrdemCobranca.VerificaAtualizacoes;
begin
  if not BtnSalvar.Enabled then
    BtnDesistirClick(Self)
  else
    if MessageDlg('Salvar Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      BtnSalvarClick(Self)
    else
      BtnDesistirClick(Self);
end;

procedure TFormOrdemCobranca.Localizar(Sender: TObject);
begin
  Ed_Localizar(TabelaPrincipal, FormOrdemCobranca, GridConsulta);
end;

procedure TFormOrdemCobranca.Incluir(Sender: TObject);
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

procedure TFormOrdemCobranca.Modificar(Sender: TObject);
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

procedure TFormOrdemCobranca.Excluir(Sender: TObject);
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

procedure TFormOrdemCobranca.Primeiro(Sender: TObject);
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

procedure TFormOrdemCobranca.Anterior(Sender: TObject);
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

procedure TFormOrdemCobranca.Proximo(Sender: TObject);
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

procedure TFormOrdemCobranca.Ultimo(Sender: TObject);
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

procedure TFormOrdemCobranca.mnu_FiltrarClick(Sender: TObject);
begin
  Ed_Filtrar(TabelaPrincipal, FormOrdemCobranca, GridConsulta);
  StatusTabela;
end;

procedure TFormOrdemCobranca.mnu_OrdenarClick(Sender: TObject);
begin
  Ed_Ordenar(TabelaPrincipal, FormOrdemCobranca, GridConsulta);
  StatusTabela;
end;

procedure TFormOrdemCobranca.mnu_OrdenarCompostoClick(Sender: TObject);
begin
  Ed_OrdenarComposto(TabelaPrincipal, FormOrdemCobranca, GridConsulta);
  StatusTabela;
end;

procedure TFormOrdemCobranca.mnu_ApagarColunaClick(Sender: TObject);
begin
  Ed_ApagarColuna(TabelaPrincipal, FormOrdemCobranca, GridConsulta);
end;

procedure TFormOrdemCobranca.mnu_QuantificarClick(Sender: TObject);
begin
  Ed_Quantificar(TabelaPrincipal, FormOrdemCobranca, GridConsulta);
end;

procedure TFormOrdemCobranca.mnu_TotalizarColunaClick(Sender: TObject);
begin
  Ed_TotalizarColuna(TabelaPrincipal, FormOrdemCobranca, GridConsulta);
end;

procedure TFormOrdemCobranca.mnu_CalcularMediaClick(Sender: TObject);
begin
  Ed_CalcularMedia(TabelaPrincipal, FormOrdemCobranca, GridConsulta);
end;

procedure TFormOrdemCobranca.mnu_ImprimirClick(Sender: TObject);
begin
  Ed_Imprimir(TabelaPrincipal, FormOrdemCobranca, GridConsulta, DataSource);
end;

procedure TFormOrdemCobranca.mnu_SalvarConsultaClick(Sender: TObject);
begin
  Ed_SalvarConsulta(TabelaPrincipal, FormOrdemCobranca, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormOrdemCobranca.mnu_ExcluirConsultaClick(Sender: TObject);
begin
  Ed_ExcluirConsulta(TabelaPrincipal, FormOrdemCobranca, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormOrdemCobranca.PagePrincipalChange(Sender: TObject);
begin
  if PagePrincipal.ActivePageIndex = 0 then
  begin
    TabPaginas.TabIndex := PaginaIni;
    TelaManutencao;
  end
  else if PagePrincipal.ActivePageIndex = 1 then
  begin
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

procedure TFormOrdemCobranca.AbaConsultaClick(Sender: TObject);
begin
  Ed_AbaConsulta(TabelaPrincipal, AbaConsulta, ConsultasSalvas, GridConsulta);
  StatusTabela;
end;

procedure TFormOrdemCobranca.TabPaginasClick(Sender: TObject);
begin
  if NoManutencao.PageIndex <> TabPaginas.TabIndex then
    NoManutencao.SetFocus;
  NoManutencao.PageIndex := TabPaginas.TabIndex;
end;

procedure TFormOrdemCobranca.PosicionaNoCampo(Campo: TAtributo);
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

procedure TFormOrdemCobranca.ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
begin
  MessageDlg(MsgErro, mtError, [mbOk], 0);
  ErroValidacao := True;
  PosicionaNoCampo(Campo);
end;

procedure TFormOrdemCobranca.MudaSeForUltimo;
begin
  if (NoManutencao.PageIndex <> NoManutencao.Pages.Count - 1) and
     (ActiveControl = BtnSalvar) then
    if TabPaginas.TabIndex + 1 <= TabPaginas.Tabs.Count-1 then
      TabPaginas.TabIndex := TabPaginas.TabIndex + 1;
end;

procedure TFormOrdemCobranca.CortarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CutToClipBoard;
end;

procedure TFormOrdemCobranca.CopiarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CopyToClipBoard;
end;

procedure TFormOrdemCobranca.ColarImagemClick(Sender: TObject);
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

procedure TFormOrdemCobranca.AbrirImagemClick(Sender: TObject);
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

procedure TFormOrdemCobranca.SalvarImagemClick(Sender: TObject);
begin
  if DlgSalvarComoImagem.Execute and (ActiveControl is TDBImage) then
    TDBImage(ActiveControl).Picture.SaveToFile(DlgSalvarComoImagem.FileName);
end;

function TFormOrdemCobranca.AbandonandoEdicao: Boolean;
begin
  Result := (ActiveControl = BtnDesistir) or (ActiveControl = PagePrincipal);
end;

procedure TFormOrdemCobranca.BtnRelac_1Click(Sender: TObject);
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

procedure TFormOrdemCobranca.PopRelacionadosClick(Sender: TObject);
var
  MenuItem: TMenuItem;
begin
  MenuItem := TMenuItem(Sender);
  {10-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormOrdemCobranca.ChamaGridPesquisa(Sender: TObject);
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

procedure TFormOrdemCobranca.ValidaColunaGrid(Sender: TField);
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

procedure TFormOrdemCobranca.BtnIncluirClick(Sender: TObject);
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

procedure TFormOrdemCobranca.BtnModificarClick(Sender: TObject);
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

procedure TFormOrdemCobranca.BtnExcluirClick(Sender: TObject);
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
//      if PageForm.PageIndex = 0 then
      IF PagePrincipal.TABINDEX = 0 THEN
        TelaManutencao;
    end;
  end;

end;

procedure TFormOrdemCobranca.BtnTabelaClick(Sender: TObject);
begin
  if BtnTabela.Tag = 0 then
    TelaConsulta
  else
    TelaManutencao;
  StatusTabela;

end;

procedure TFormOrdemCobranca.BtnLocalizarClick(Sender: TObject);
begin
  Ed_Localizar(TabelaPrincipal, FormOrdemCobranca, GridConsulta);
  StatusTabela;
//  if PageForm.PageIndex = 0 then
  IF PagePrincipal.TABINDEX = 0 THEN
    TelaManutencao;

end;

procedure TFormOrdemCobranca.BtnPrimeiroClick(Sender: TObject);
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
//    if PageForm.PageIndex = 0 then
      IF PagePrincipal.TABINDEX = 0 THEN
        TelaManutencao;
    end;
  end;

end;

procedure TFormOrdemCobranca.BtnAnteriorClick(Sender: TObject);
begin
  Navegando := True;
  VerificaAtualizacoes;
  if not ErroValidacao then
  begin
    TabelaPrincipal.Prior;
    if TabelaPrincipal.Bof then
      MessageDlg('Início dos registros!', mtInformation, [mbOk], 0);
    StatusTabela;
//    if PageForm.PageIndex = 0 then
    IF PagePrincipal.TABINDEX = 0 THEN
      TelaManutencao;
  end;

end;

procedure TFormOrdemCobranca.BtnProximoClick(Sender: TObject);
begin
  Navegando := True;
  VerificaAtualizacoes;
  if not ErroValidacao then
  begin
    TabelaPrincipal.Next;
    if TabelaPrincipal.Eof then
      MessageDlg('Final dos registros!', mtInformation, [mbOk], 0);
    StatusTabela;
//    if PageForm.PageIndex = 0 then
    IF PagePrincipal.TABINDEX = 0 THEN
      TelaManutencao;
  end;

end;

procedure TFormOrdemCobranca.BtnUltimoClick(Sender: TObject);
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
      //if PageForm.PageIndex = 0 then
      IF PagePrincipal.TABINDEX = 0 THEN
        TelaManutencao;
    end;
  end;

end;

procedure TFormOrdemCobranca.BtnRefreshClick(Sender: TObject);
begin
  if MessageDlg('Atualizar registros?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    TabelaPrincipal.AtualizaSql;
    // if PageForm.PageIndex = 0 then
    IF PagePrincipal.TABINDEX = 0 THEN
      TelaManutencao;
  end;

end;

procedure TFormOrdemCobranca.NumOrdCobrancaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.NumOrdCobranca.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.NumOrdCobranca);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.FORCODExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.FORCOD.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.FORCOD);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.CadastroExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.Cadastro.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.Cadastro);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.StatusExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.Status.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.Status);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.StatusDrawItem(Control: TWinControl; Index: Integer;
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
  if TabGlobal.DOrdemCobranca.Status.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DOrdemCobranca.Status.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DOrdemCobranca.Status.DescValorValido[Index]));
end;

procedure TFormOrdemCobranca.FATURAExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.FATURA.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.FATURA);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.DataFaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.DataFatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.DataFatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.CTTOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.CTTO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.CTTO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.ValorExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.Valor.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.Valor);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.ValorDescontoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.ValorDesconto.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.ValorDesconto);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.VALOR_LIQExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.VALOR_LIQ.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.VALOR_LIQ);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.NumNFEmitExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.NumNFEmit.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.NumNFEmit);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.DataNFExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.DataNF.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.DataNF);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.ComentarioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.Comentario.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.Comentario);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.VALOR_NFExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.VALOR_NF.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.VALOR_NF);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.VALOR_IRRFExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.VALOR_IRRF.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.VALOR_IRRF);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.VALOR_PIS_COFExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.VALOR_PIS_COF.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.VALOR_PIS_COF);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.VALOR_NF_LIQExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.VALOR_NF_LIQ.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.VALOR_NF_LIQ);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.DataLiqExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.DataLiq.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.DataLiq);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.DataProtestoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.DataProtesto.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.DataProtesto);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.RecebimentoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.Recebimento.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.Recebimento);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.UsuarioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.Usuario.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.Usuario);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.Grid_OrdemCobrncaProdExpDblClick(Sender: TObject);
begin
  if TabelaPrincipal.Inclusao then  // Garante integridade do uso em rede
  begin                             // salva o registro PAI para depois incluir os registros FILHO
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
    if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
    begin
      MessageDlg('Duplicidade - Registro já cadastrado !',mtWarning,[mbOk],0);
      exit;
    end;
    if MessageDlg('Salvar ('+TabelaPrincipal.Titulo+') ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
      exit;
    if (not CamposDadosValidos(ListaCamposEd, ErroValidacao)) or (not TabelaPrincipal.Salva) then
      exit
    else
      if not TabelaPrincipal.Modifica then
        exit;
  end;
  FormORDCOBRANCAPROD := TFormORDCOBRANCAPROD.Create(Application);
  Try
    FormORDCOBRANCAPROD.ShowModal;
  Finally
    FormORDCOBRANCAPROD.Free;
  end;
end;

procedure TFormOrdemCobranca.Grid_OrdemCobrncaProdExpColEnter(Sender: TObject);
begin
  if (TabGlobal.DOrdemCobrancaProdExp.State = dsInsert) and
     (TabelaPrincipal.Inclusao) then
  begin
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
    if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
    begin
      MessageDlg('Duplicidade - Registro já cadastrado !',mtWarning,[mbOk],0);
      begin
        TabGlobal.DOrdemCobrancaProdExp.Cancel;
        exit;
      end;
    end;
    if MessageDlg('Salvar ('+TabelaPrincipal.Titulo+') ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    begin
      TabGlobal.DOrdemCobrancaProdExp.Cancel;
      exit;
    end;
    if (not CamposDadosValidos(ListaCamposEd, ErroValidacao)) or (not TabelaPrincipal.Salva) then
    begin
      TabGlobal.DOrdemCobrancaProdExp.Cancel;
      exit;
    end
    else
      if not TabelaPrincipal.Modifica then
      begin
        TabGlobal.DOrdemCobrancaProdExp.Cancel;
        exit;
      end
      else
        TabGlobal.DOrdemCobrancaProdExp.AtribuiMestre(TabGlobal.DOrdemCobrancaProdExp);
  end;
  ExecutaPreValidacoesGrid(TabGlobal.DOrdemCobrancaProdExp);
  KeyPreview := False;
end;

procedure TFormOrdemCobranca.Grid_OrdemCobrncaProdExpExit(Sender: TObject);
begin
  KeyPreview := True;
end;

procedure TFormOrdemCobranca.Grid_OrdemCobrncaProdExpEditButtonClick(Sender: TObject);
Var
  I: Integer;
  Campo: TAtributo;
  CampoGrid: TField;
begin
  CampoGrid := Grid_OrdemCobrncaProdExp.SelectedField;
  if CampoGrid = Nil then exit;
  for I:=0 to TabGlobal.DOrdemCobrancaProdExp.Campos.Count-1 do
  begin
    Campo := TAtributo(TabGlobal.DOrdemCobrancaProdExp.Campos[I]);
    if Campo.Valor.FieldName = CampoGrid.FieldName then
      Break;
  end;
  if (Campo = nil) or (Campo.Valor.ReadOnly) then exit;
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    FormGridPesquisa.Atalho := VK_F8;
    FormGridPesquisa.Campo  := Campo;
    if FormGridPesquisa.ShowModal = mrOk then
      ExecutaPreValidacoesGrid(TabGlobal.DOrdemCobrancaProdExp);
  Finally
    FormGridPesquisa.Free;
  end;
end;

procedure TFormOrdemCobranca.Grid_OrdemCobrancaDescontDblClick(Sender: TObject);
begin
  if TabelaPrincipal.Inclusao then  // Garante integridade do uso em rede
  begin                             // salva o registro PAI para depois incluir os registros FILHO
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
    if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
    begin
      MessageDlg('Duplicidade - Registro já cadastrado !',mtWarning,[mbOk],0);
      exit;
    end;
    if MessageDlg('Salvar ('+TabelaPrincipal.Titulo+') ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
      exit;
    if (not CamposDadosValidos(ListaCamposEd, ErroValidacao)) or (not TabelaPrincipal.Salva) then
      exit
    else
      if not TabelaPrincipal.Modifica then
        exit;
  end;
  FormORDCOBRANCADESC := TFormORDCOBRANCADESC.Create(Application);
  Try
    FormORDCOBRANCADESC.ShowModal;
  Finally
    FormORDCOBRANCADESC.Free;
  end;
end;

procedure TFormOrdemCobranca.Grid_OrdemCobrancaDescontColEnter(Sender: TObject);
begin
  if (TabGlobal.DOrdemCobrancaDescont.State = dsInsert) and
     (TabelaPrincipal.Inclusao) then
  begin
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
    if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
    begin
      MessageDlg('Duplicidade - Registro já cadastrado !',mtWarning,[mbOk],0);
      begin
        TabGlobal.DOrdemCobrancaDescont.Cancel;
        exit;
      end;
    end;
    if MessageDlg('Salvar ('+TabelaPrincipal.Titulo+') ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    begin
      TabGlobal.DOrdemCobrancaDescont.Cancel;
      exit;
    end;
    if (not CamposDadosValidos(ListaCamposEd, ErroValidacao)) or (not TabelaPrincipal.Salva) then
    begin
      TabGlobal.DOrdemCobrancaDescont.Cancel;
      exit;
    end
    else
      if not TabelaPrincipal.Modifica then
      begin
        TabGlobal.DOrdemCobrancaDescont.Cancel;
        exit;
      end
      else
        TabGlobal.DOrdemCobrancaDescont.AtribuiMestre(TabGlobal.DOrdemCobrancaDescont);
  end;
  ExecutaPreValidacoesGrid(TabGlobal.DOrdemCobrancaDescont);
  KeyPreview := False;
end;

procedure TFormOrdemCobranca.Grid_OrdemCobrancaDescontExit(Sender: TObject);
begin
  KeyPreview := True;
end;

procedure TFormOrdemCobranca.Grid_OrdemCobrancaDescontEditButtonClick(Sender: TObject);
Var
  I: Integer;
  Campo: TAtributo;
  CampoGrid: TField;
begin
  CampoGrid := Grid_OrdemCobrancaDescont.SelectedField;
  if CampoGrid = Nil then exit;
  for I:=0 to TabGlobal.DOrdemCobrancaDescont.Campos.Count-1 do
  begin
    Campo := TAtributo(TabGlobal.DOrdemCobrancaDescont.Campos[I]);
    if Campo.Valor.FieldName = CampoGrid.FieldName then
      Break;
  end;
  if (Campo = nil) or (Campo.Valor.ReadOnly) then exit;
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    FormGridPesquisa.Atalho := VK_F8;
    FormGridPesquisa.Campo  := Campo;
    if FormGridPesquisa.ShowModal = mrOk then
      ExecutaPreValidacoesGrid(TabGlobal.DOrdemCobrancaDescont);
  Finally
    FormGridPesquisa.Free;
  end;
end;

procedure TFormOrdemCobranca.RAZAOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.RAZAO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.RAZAO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.NOMEExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.NOME.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.NOME);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.TEXTO_PADRAOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.TEXTO_PADRAO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.TEXTO_PADRAO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.BtnVisualizarClick(Sender: TObject);
begin
  {codificação...}
try
if TabGlobal.DOrdemCobranca.FATURA.Conteudo <> '' then begin
   FormREL_FATURATAB := TFormREL_FATURATAB.Create(Application);
   Try
      FormREL_FATURATAB.Set_TipoRelatorio( 0 );
      FormREL_FATURATAB.exibir_rel(TabGlobal.DOrdemCobranca.FATURA.Conteudo)
   Finally
      FormREL_FATURATAB.Free;
   end;
end
else
   MessageDlg( MSG_NaoExisteNumeroFatura ,mtWarning, [mbOK], 0);
except
  on Erro: Exception do
  begin
    MessageDlg('Erro cms0004 : ' + Erro.Message, mtError, [mbOk], 0);
  end;
end;

end;

procedure TFormOrdemCobranca.Btn_gravaClick(Sender: TObject);
var
    s_titulo : string  ;
begin

if TabGlobal.DFatura.Filtro.Text  <> '' then  begin
   if MessageDlg( MSG_ConfirmaAtualizaroNumerodeFaturaemtodasosregistrosselecionadosjaExportados ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Screen.Cursor := crHourGlass      ;
      TabGlobal.DFatura.First ;
      while NOT TabGlobal.DFatura.Eof do begin
        if (( TabGlobal.DFatura.State <>  dsEdit)    and
           (TabGlobal.DFatura.State  <>  dsinsert)) then
           TabGlobal.DFatura.Modifica ;

        if ( TabGlobal.DFatura.NumOrdCobranca.Conteudo = '' ) and
           ( TabGlobal.DFatura.Selecionado. Conteudo = 'S'  )
           then begin
           TabGlobal.DFatura.NumOrdCobranca.Conteudo     := TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo ;
           TabGlobal.DFatura.ValorDesconto.Conteudo      := TabGlobal.DOrdemCobranca.ValorDesconto.Conteudo ;
           TabGlobal.DFatura.Status.Conteudo             := s_ST_FA_F ;
           TabGlobal.DFatura.DataOrdCobranca.Conteudo    := date ;
           TabGlobal.DFatura.Selecionado. Conteudo       := 'N';
        end;
        TabGlobal.DFatura.Salva ;
        TabGlobal.DFatura.Next ;
      end;

      // alterea o status da fatura
      TabGlobal.DOrdemCobranca.Modifica;
      TabGlobal.DOrdemCobranca.Status.Conteudo :=   s_ST_FA_F ;
      TabGlobal.DOrdemCobranca.Salva;
      Screen.Cursor := crDefault ;

      Refresh ;
   end;
end
else
   MessageDlg( msg_AplicacaoSoPodeSerExecutadaNoMomentoDaFatura ,mtWarning,[mbOk],0);
end;


procedure TFormOrdemCobranca.BitB_Nv_FaturaClick(Sender: TObject);
begin
//  if (TabGlobal.DOrdemCobranca.State = dsEdit) or
//     ( TabGlobal.DOrdemCobranca.State = dsinsert ) then
  if TabGlobal.DOrdemCobranca.FATURA.Conteudo = '' then begin
     if TabGlobal.DOrdemCobranca.NumNFEmit.Conteudo = 0 then begin
        if MessageDlg( MSG_ConfirmaCriarNumerodeFatura ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
           TabGlobal.DOrdemCobranca.Modifica;
           TabGlobal.DOrdemCobranca.FATURA.Conteudo := Get_Fatura() ;
           TabGlobal.DOrdemCobranca.DataFatura.Conteudo := date ;
           TabGlobal.DOrdemCobranca.Salva ;
        end
     end
     else
        MessageDlg(MSG_ONumerodaFaturatnaopodesergeradoOrdemCobrancacomNFemitido,mtWarning,[mbOk],0)
  end
  else
     MessageDlg(MSG_ONumerodaFaturatemqueestaemBRANCO,mtWarning,[mbOk],0)
//  end;
//  else
//    MessageDlg(MSG_Obotaomodificartemqueseracionado,mtWarning,[mbOk],0);

end;

procedure TFormOrdemCobranca.Btn_imprimeClick(Sender: TObject);
begin
if TabGlobal.DOrdemCobranca.FATURA.Conteudo <> '' then begin
  FormREL_FATURATAB := TFormREL_FATURATAB.Create(Application);
  Try
    // FormREL_FATURATAB.set_NumOrdCobranca();
    FormREL_FATURATAB.exibir_rel(TabGlobal.DOrdemCobranca.FATURA.Conteudo);
    // FormREL_FATURATAB.ShowModal;
  Finally
    FormREL_FATURATAB.Free;
  end;
end
else
  MessageDlg(MSG_NumeroFaturaEmBranco,mtWarning,[mbOk],0);
end;

procedure TFormOrdemCobranca.VALORRECEBIDOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.VALORRECEBIDO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.VALORRECEBIDO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.MOEDACOMISSAOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.MOEDACOMISSAO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.MOEDACOMISSAO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.MOEDACOMISSAODrawItem(Control: TWinControl; Index: Integer;
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
  if TabGlobal.DOrdemCobranca.MOEDACOMISSAO.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DOrdemCobranca.MOEDACOMISSAO.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DOrdemCobranca.MOEDACOMISSAO.DescValorValido[Index]));
end;

procedure TFormOrdemCobranca.BtnAplicarNFClick(Sender: TObject);
var
    s_titulo : string  ;
    s_Filtro_ativo,s_Filtro  : string ;
begin


if TabGlobal.DOrdemCobranca.NumNFEmit.Conteudo > 0 then  begin
   if MessageDlg( MSG_ConfirmaAtualizaroNumerodeNFparaOrdemdeCobranca ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      Screen.Cursor := crHourGlass      ;
      s_Filtro_ativo := TabGlobal.DFatura.Filtro.Text ;
      TabGlobal.DFatura.Filtro.Clear ;
      s_Filtro := 'Fatura.NumOrdCobranca ='+ AtribuiAspas( TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo ) ;
      TabGlobal.DFatura.Filtro.Add(s_Filtro);
      TabGlobal.DFatura.AtualizaSql(true);
      TabGlobal.DFatura.First ;
      while NOT TabGlobal.DFatura.Eof do begin
        if ( TabGlobal.DFatura.NumNFEmit.Conteudo = 0 )
           then begin
           TabGlobal.DFatura.Modifica ;
           TabGlobal.DFatura.NumNFEmit.Conteudo        := TabGlobal.DOrdemCobranca.NumNFEmit.Conteudo ;
           TabGlobal.DFatura.DataNF.Conteudo           := TabGlobal.DOrdemCobranca.DataNF.Conteudo ;
           TabGlobal.DFatura.Status.Conteudo           := s_ST_NF_F ;
           TabGlobal.DFatura.Valor_NF.Conteudo         := TabGlobal.DOrdemCobranca.VALOR_NF.Conteudo ;
        // TabGlobal.DFatura.Recebimento.Conteudo      := TabGlobal.DOrdemCobranca.Recebimento ;
        //  TabGlobal.DFatura.Selecionado. Conteudo     := 'N';
           TabGlobal.DFatura.Salva ;
        end;
        if TabGlobal.DFatura.Recebimento.Conteudo = 0 then
        begin
           TabGlobal.DFatura.Modifica ;
           TabGlobal.DFatura.Recebimento.Conteudo      := TabGlobal.DOrdemCobranca.Recebimento.Conteudo ;
           TabGlobal.DFatura.Salva ;
        end
        else
        begin
           if TabGlobal.DFatura.Recebimento.Conteudo <> TabGlobal.DOrdemCobranca.Recebimento.Conteudo then
           begin 
              TabGlobal.DFatura.Modifica ;
              TabGlobal.DFatura.Recebimento.Conteudo      := TabGlobal.DOrdemCobranca.Recebimento.Conteudo ;
              TabGlobal.DFatura.Salva ;
           end  ;
        end;


        // isto e efeito para corrigir um erro do componente que ainda nao corrigir
        // nao te, esplicacao ainda mas e necessario
        
        TabGlobal.DFatura.Modifica ;
        TabGlobal.DFatura.Salva ;

        TabGlobal.DFatura.Next ;
      end;

      // alterea o status da fatura
      TabGlobal.DOrdemCobranca.Modifica;
      TabGlobal.DOrdemCobranca.Status.Conteudo :=   s_ST_NF_F ;
      TabGlobal.DOrdemCobranca.Salva;


      TabGlobal.DFatura.close ;
      TabGlobal.DFatura.Filtro.clear ;
      TabGlobal.DFatura.Filtro.Add(s_Filtro_ativo) ;
      TabGlobal.DFatura.AtualizaSql(true);




      Refresh ;
      Screen.Cursor := crDefault ;
   end;



end
else
   MessageDlg( msg_AplicacaoSoPodeSerExecutadaseExistirnumerodeNF ,mtWarning,[mbOk],0);
end;

procedure TFormOrdemCobranca.TextoDscontoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobranca.TextoDsconto.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobranca.TextoDsconto);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdemCobranca.BitBtn1Click(Sender: TObject);
begin
  {codificação...}
try
if TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo <> '' then begin
   FormREL_FATURATAB := TFormREL_FATURATAB.Create(Application);
   Try
      FormREL_FATURATAB.Set_TipoRelatorio( 1 );
      FormREL_FATURATAB.exibir_rel(TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo)
   Finally
      FormREL_FATURATAB.Free;
   end;
end
else
   MessageDlg( MSG_NaoExisteNumeroOrdemCobranca ,mtWarning, [mbOK], 0);
except
  on Erro: Exception do
  begin
    MessageDlg('Erro cms0001 : ' + Erro.Message, mtError, [mbOk], 0);
  end;
end;

end;

end.
