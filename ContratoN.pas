{
   Programa.: ContratoN.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
}
unit ContratoN;

interface

{$I Princ.inc}

uses
  Windows ,Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Tabs, BaseD, Db, Grids, DBGrids,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Atributo, dbctrls, Clipbrd, Tabela, Menus, IniFiles, Printers, Calculos,
  {$I LTab.pas}
  JPeg, XLookUp, XDBDate, Mask, XDBEdit, XDBNum, XEdit, XBanner, XDate, XNum;

type
  TFormContratoN = class(TForm)
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    AbaConsulta: TTabSet;
    AbrirImagem: TMenuItem;
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
    C_C: TXDBLookUp;
    Cadastro: TXDBDateEdit;
    CLICOD: TXDBNumEdit;
    ColarImagem: TMenuItem;
    Comentario: TDBMemo;
    Comissao: TXDBNumEdit;
    Contrato: TXDBEdit;
    CopiarImagem: TMenuItem;
    CortarImagem: TMenuItem;
    DataAss: TXDBDateEdit;
    DataSource: TDataSource;
    DataSource_Grid_Boocking: TDataSource;
    DataSource_Grid_ExportadoTransito: TDataSource;
    DataSource_Grid_PrudutoContratoT: TDataSource;
    Divisao_sup: TPanel;
    DlgAbrirImagem: TOpenDialog;
    DlgSalvarComoImagem: TSaveDialog;
    FORCOD: TXDBNumEdit;
    FormComissao: TDBComboBox;
    Grid_Boocking: TDBGrid;
    Grid_ExportadoTransito: TDBGrid;
    Grid_PrudutoContratoT: TDBGrid;
    GridConsulta: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    ID_FORN: TXDBLookUp;
    Img_Form: TImage;
    Img_Tabela: TImage;
    LbcC_C: TLabel;
    LbcCadastro: TLabel;
    LbcCLICOD: TLabel;
    LbcComissao: TLabel;
    LbcContrato: TLabel;
    LbcDataAss: TLabel;
    LbcDataEmbarque: TLabel;
    LbcFormComissao: TLabel;
    LbcID: TLabel;
    LbcNOME: TLabel;
    LbcNomeMix: TLabel;
    LbcOBS: TLabel;
    LbcPrecoFOBTotal: TLabel;
    LbcQuantadePendente: TLabel;
    LbcQuantidadeTotal: TLabel;
    LbcQUANTTOTALEXP: TLabel;
    LbcRAZAOEXPOSTADOR: TLabel;
    Lbcseq: TLabel;
    LbcStatusCT: TLabel;
    LbcUsuario: TLabel;
    LbcValorSCCTotal: TLabel;
    LbcValorTotalComissao: TLabel;
    LbcValorTotalComissaoExecutado: TLabel;
    LbcValorTotalExp: TLabel;
    LbcValorTotalPendente: TLabel;
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
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    NoManutencao: TNotebook;
    NOME: TXDBEdit;
    NomeMix: TXDBLookUp;
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
    PrecoFOBTotal: TXDBNumEdit;
    QuantadePendente: TXDBNumEdit;
    QuantidadeTotal: TXDBNumEdit;
    QUANTTOTALEXP: TXDBNumEdit;
    RAZAO: TXDBEdit;
    RAZAOEXPOSTADOR: TXDBEdit;
    SalvarImagem: TMenuItem;
    SDataEmbarque: TXDBEdit;
    seq: TXDBNumEdit;
    StatusCT: TDBComboBox;
    TabConsulta: TTabSheet;
    TabManutencao: TTabSheet;
    TabPaginas: TTabSet;
    Usuario: TXDBEdit;
    ValorSCCTotal: TXDBNumEdit;
    ValorTotalComissao: TXDBNumEdit;
    ValorTotalComissaoExecutado: TXDBNumEdit;
    ValorTotalExp: TXDBNumEdit;
    ValorTotalPendente: TXDBNumEdit;
    XNumEdit1: TXNumEdit;
    XNumEdit2: TXNumEdit;
    GroupBox4: TGroupBox;
    btn_Corrig: TBitBtn;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure ContratoExit(Sender: TObject);
    procedure CadastroExit(Sender: TObject);
    procedure StatusCTExit(Sender: TObject);
    procedure StatusCTDrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
    procedure CLICODExit(Sender: TObject);
    procedure RAZAOExit(Sender: TObject);
    procedure seqExit(Sender: TObject);
    procedure NOMEExit(Sender: TObject);
    procedure FORCODExit(Sender: TObject);
    procedure RAZAOEXPOSTADORExit(Sender: TObject);
    procedure C_CExit(Sender: TObject);
    procedure PrecoFOBTotalExit(Sender: TObject);
    procedure QuantidadeTotalExit(Sender: TObject);
    procedure ValorSCCTotalExit(Sender: TObject);
    procedure ComissaoExit(Sender: TObject);
    procedure FormComissaoExit(Sender: TObject);
    procedure FormComissaoDrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
    procedure ValorTotalComissaoExit(Sender: TObject);
    procedure OBSExit(Sender: TObject);
    procedure DataAssExit(Sender: TObject);
    procedure ComentarioExit(Sender: TObject);
    procedure NomeMixExit(Sender: TObject);
    procedure QUANTTOTALEXPExit(Sender: TObject);
    procedure QuantadePendenteExit(Sender: TObject);
    procedure ValorTotalExpExit(Sender: TObject);
    procedure ValorTotalPendenteExit(Sender: TObject);
    procedure ValorTotalComissaoExecutadoExit(Sender: TObject);
    procedure SDataEmbarqueExit(Sender: TObject);
    procedure ID_FORNExit(Sender: TObject);
    procedure UsuarioExit(Sender: TObject);
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
    procedure Grid_PrudutoContratoTDblClick(Sender: TObject);
    procedure Grid_PrudutoContratoTColEnter(Sender: TObject);
    procedure Grid_PrudutoContratoTExit(Sender: TObject);
    procedure Grid_PrudutoContratoTEditButtonClick(Sender: TObject);
    procedure Grid_BoockingDblClick(Sender: TObject);
    procedure Grid_BoockingColEnter(Sender: TObject);
    procedure Grid_BoockingExit(Sender: TObject);
    procedure Grid_BoockingEditButtonClick(Sender: TObject);
    procedure Grid_ExportadoTransitoDblClick(Sender: TObject);
    procedure Grid_ExportadoTransitoColEnter(Sender: TObject);
    procedure Grid_ExportadoTransitoExit(Sender: TObject);
    procedure Grid_ExportadoTransitoEditButtonClick(Sender: TObject);
    procedure CLICODClick(Sender: TObject);
    procedure FORCODChange(Sender: TObject);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure ValorTotalExpChange(Sender: TObject);
    procedure GridConsultaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure btn_CorrigClick(Sender: TObject);
    procedure DataSource_Grid_PrudutoContratoTDataChange(Sender: TObject;
      Field: TField);
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
  FormContratoN: TFormContratoN;
  LastControl: TWinControl;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, RotinaEd, Abertura, GridPesquisa, PRODUTOCONTRATO, BOOCKING, EXPORTACAO;

procedure TFormContratoN.FormShow(Sender: TObject);
Var
  I: Integer;
begin

  {05-Início do Bloco Modular. Modificações não serão preservadas}
  TabelaPrincipal    := TabGlobal.DContratoTransporte;
  TituloModulo       := 'Cadastro de Contrato';
  Caption            := TituloModulo;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  TabelaPrincipal.AtribuiRelacionamentos(TRUE);  
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
  // posicione
  Grid_Boocking.height := Trunc( Pagina2.height /2) ;
  Grid_ExportadoTransito.align := alClient ;
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.Usuario, -2, UsuarioExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.ID_FORN, -2, ID_FORNExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.SDataEmbarque, -2, SDataEmbarqueExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.ValorTotalComissaoExecutado, -2, ValorTotalComissaoExecutadoExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.ValorTotalPendente, -2, ValorTotalPendenteExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.ValorTotalExp, -2, ValorTotalExpExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.QuantadePendente, -2, QuantadePendenteExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.QUANTTOTALEXP, -2, QUANTTOTALEXPExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.NomeMix, -2, NomeMixExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);


  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.Comentario, -2, ComentarioExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.DataAss, -2, DataAssExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.OBS, -2, OBSExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.ValorTotalComissao, -2, ValorTotalComissaoExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.FormComissao, -2, FormComissaoExit, FormComissaoDrawItem, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.Comissao, -2, ComissaoExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.ValorSCCTotal, -2, ValorSCCTotalExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.QuantidadeTotal, -2, QuantidadeTotalExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.PrecoFOBTotal, -2, PrecoFOBTotalExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.C_C, -2, C_CExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.RAZAOEXPOSTADOR, -2, RAZAOEXPOSTADORExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.FORCOD, -2, FORCODExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.NOME, -2, NOMEExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.seq, -2, seqExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.RAZAO, -2, RAZAOExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.CLICOD, -2, CLICODExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.StatusCT, -2, StatusCTExit, StatusCTDrawItem, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.Cadastro, -2, CadastroExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DContratoTransporte, TabGlobal.DContratoTransporte.Contrato, -1, ContratoExit, Nil, ListaCamposEd, FormContratoN, DataSource, ChamaGridPesquisa);
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

  Panel1.Align := alTop ;
  GroupBox1.Align := alTop ;
  Panel2.Align := alClient ;
  GroupBox2.Align := alLeft ;
  GroupBox3.Align := alClient ;
  StatusCT.Enabled := false ;

  DataSource_Grid_ExportadoTransito.DataSet := TabGlobal.DExportadoTransito;
  Grid_ExportadoTransito.DataSource := DataSource_Grid_ExportadoTransito;
  AtribuiGridEdicao(TabGlobal.DExportadoTransito, Grid_ExportadoTransito, false, ValidaColunaGrid);
  DataSource_Grid_Boocking.DataSet := TabGlobal.DBoocking;
  Grid_Boocking.DataSource := DataSource_Grid_Boocking;
  AtribuiGridEdicao(TabGlobal.DBoocking, Grid_Boocking, false, ValidaColunaGrid);
  DataSource_Grid_PrudutoContratoT.DataSet := TabGlobal.DProdutoContratoT;
  Grid_PrudutoContratoT.DataSource := DataSource_Grid_PrudutoContratoT;
  AtribuiGridEdicao(TabGlobal.DProdutoContratoT, Grid_PrudutoContratoT, false, ValidaColunaGrid);
  
  

  if TabGlobal.DContratoTransporte.ValorSCCTotal.Conteudo < TabGlobal.DContratoTransporte.ValorTotalExp.Conteudo then
    btn_Corrig.Visible := True
 else
    btn_Corrig.Visible := False  ;

end;

function TFormContratoN.AbreTabelas: Boolean;
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  Result := True;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormContratoN.CamposCalculados;
begin
  {08-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormContratoN.HabilitaEdicao(Valor: Boolean = true);
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

function TFormContratoN.ConfirmaInclusao: Boolean;
begin
  Result := True;
end;

function TFormContratoN.ConfirmaModificacao: Boolean;
begin
  Result := True;
end;

function TFormContratoN.ConfirmaExclusao: Boolean;
begin
  Result := True;
end;

function TFormContratoN.ConfirmaGravacao: Boolean;
begin
  Result := True;
end;

procedure TFormContratoN.TelaManutencao;
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

procedure TFormContratoN.TelaConsulta;
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

procedure TFormContratoN.AtribuiValoresPadrao;
begin
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd, True);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormContratoN.AntesdeSalvar;
begin

end;

procedure TFormContratoN.AntesdeIncluir;
begin

end;

procedure TFormContratoN.AntesdeModificar;
begin

end;

procedure TFormContratoN.AntesdeExcluir;
begin

end;

procedure TFormContratoN.DepoisdeIncluir;
begin

end;

procedure TFormContratoN.DepoisdeModificar;
begin
  TabGlobal.DContratoTransporte.Edit ;
  TabGlobal.DContratoTransporte.ID.Conteudo := TabGlobal.DContratoTransporte.ID_FORN.Conteudo ;
  TabGlobal.DContratoTransporte.Post ;
end;

procedure TFormContratoN.DepoisdeExcluir;
begin

end;

procedure TFormContratoN.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSalvar.Enabled then
    TabelaPrincipal.Cancela;
end;

procedure TFormContratoN.FormClose(Sender: TObject;
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
  FormContratoN := nil;
end;

procedure TFormContratoN.StatusTabela;
begin
//  LbTituloForm.Caption := TituloModulo + '- [ Ordem: '+TabelaPrincipal.TituloIndice+' ]';
end;

procedure TFormContratoN.FormResize(Sender: TObject);
begin
//  BtnAjuda.Left  := ShapeSup.Width - 37;
//  BtnFechar.Left := ShapeSup.Width - 19;
end;

procedure TFormContratoN.FormActivate(Sender: TObject);
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

procedure TFormContratoN.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormContratoN.BtnSalvarClick(Sender: TObject);
Var
  EInclusao, Ok: Boolean;
begin
   // esta redundancia existe para compatibilizar o que ja foi desenolvido
  TabGlobal.DContratoTransporte.ID.Conteudo := TabGlobal.DContratoTransporte.ID_FORN.Conteudo ;
  
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

procedure TFormContratoN.BtnDesistirClick(Sender: TObject);
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

procedure TFormContratoN.GridConsultaDblClick(Sender: TObject);
begin
  if TabelaPrincipal.Eof then
    Incluir(Self)
  else
    Modificar(Self);
end;

procedure TFormContratoN.VerificaAtualizacoes;
begin
  if not BtnSalvar.Enabled then
    BtnDesistirClick(Self)
  else
    if MessageDlg('Salvar Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      BtnSalvarClick(Self)
    else
      BtnDesistirClick(Self);
end;

procedure TFormContratoN.Localizar(Sender: TObject);
begin
  Ed_Localizar(TabelaPrincipal, FormContratoN, GridConsulta);
end;

procedure TFormContratoN.Incluir(Sender: TObject);
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

procedure TFormContratoN.Modificar(Sender: TObject);
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

procedure TFormContratoN.Excluir(Sender: TObject);
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

procedure TFormContratoN.Primeiro(Sender: TObject);
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

procedure TFormContratoN.Anterior(Sender: TObject);
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

procedure TFormContratoN.Proximo(Sender: TObject);
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

procedure TFormContratoN.Ultimo(Sender: TObject);
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

procedure TFormContratoN.mnu_FiltrarClick(Sender: TObject);
begin
  Ed_Filtrar(TabelaPrincipal, FormContratoN, GridConsulta);
  StatusTabela;
end;

procedure TFormContratoN.mnu_OrdenarClick(Sender: TObject);
begin
  Ed_Ordenar(TabelaPrincipal, FormContratoN, GridConsulta);
  StatusTabela;
end;

procedure TFormContratoN.mnu_OrdenarCompostoClick(Sender: TObject);
begin
  Ed_OrdenarComposto(TabelaPrincipal, FormContratoN, GridConsulta);
  StatusTabela;
end;

procedure TFormContratoN.mnu_ApagarColunaClick(Sender: TObject);
begin
  Ed_ApagarColuna(TabelaPrincipal, FormContratoN, GridConsulta);
end;

procedure TFormContratoN.mnu_QuantificarClick(Sender: TObject);
begin
  Ed_Quantificar(TabelaPrincipal, FormContratoN, GridConsulta);
end;

procedure TFormContratoN.mnu_TotalizarColunaClick(Sender: TObject);
begin
  Ed_TotalizarColuna(TabelaPrincipal, FormContratoN, GridConsulta);
end;

procedure TFormContratoN.mnu_CalcularMediaClick(Sender: TObject);
begin
  Ed_CalcularMedia(TabelaPrincipal, FormContratoN, GridConsulta);
end;

procedure TFormContratoN.mnu_ImprimirClick(Sender: TObject);
begin
  Ed_Imprimir(TabelaPrincipal, FormContratoN, GridConsulta, DataSource);
end;

procedure TFormContratoN.mnu_SalvarConsultaClick(Sender: TObject);
begin
  Ed_SalvarConsulta(TabelaPrincipal, FormContratoN, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormContratoN.mnu_ExcluirConsultaClick(Sender: TObject);
begin
  Ed_ExcluirConsulta(TabelaPrincipal, FormContratoN, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormContratoN.PagePrincipalChange(Sender: TObject);
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

procedure TFormContratoN.AbaConsultaClick(Sender: TObject);
begin
  Ed_AbaConsulta(TabelaPrincipal, AbaConsulta, ConsultasSalvas, GridConsulta);
  StatusTabela;
end;

procedure TFormContratoN.TabPaginasClick(Sender: TObject);
begin
  if NoManutencao.PageIndex <> TabPaginas.TabIndex then
    NoManutencao.SetFocus;
  NoManutencao.PageIndex := TabPaginas.TabIndex;
end;

procedure TFormContratoN.PosicionaNoCampo(Campo: TAtributo);
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

procedure TFormContratoN.ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
begin
  MessageDlg(MsgErro, mtError, [mbOk], 0);
  ErroValidacao := True;
  PosicionaNoCampo(Campo);
end;

procedure TFormContratoN.MudaSeForUltimo;
begin
  if (NoManutencao.PageIndex <> NoManutencao.Pages.Count - 1) and
     (ActiveControl = BtnSalvar) then
    if TabPaginas.TabIndex + 1 <= TabPaginas.Tabs.Count-1 then
      TabPaginas.TabIndex := TabPaginas.TabIndex + 1;
end;

procedure TFormContratoN.CortarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CutToClipBoard;
end;

procedure TFormContratoN.CopiarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CopyToClipBoard;
end;

procedure TFormContratoN.ColarImagemClick(Sender: TObject);
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

procedure TFormContratoN.AbrirImagemClick(Sender: TObject);
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

procedure TFormContratoN.SalvarImagemClick(Sender: TObject);
begin
  if DlgSalvarComoImagem.Execute and (ActiveControl is TDBImage) then
    TDBImage(ActiveControl).Picture.SaveToFile(DlgSalvarComoImagem.FileName);
end;

function TFormContratoN.AbandonandoEdicao: Boolean;
begin
  Result := (ActiveControl = BtnDesistir) or (ActiveControl = PagePrincipal);
end;

procedure TFormContratoN.BtnRelac_1Click(Sender: TObject);
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

procedure TFormContratoN.PopRelacionadosClick(Sender: TObject);
var
  MenuItem: TMenuItem;
begin
  MenuItem := TMenuItem(Sender);
  {10-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormContratoN.ChamaGridPesquisa(Sender: TObject);
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

procedure TFormContratoN.ValidaColunaGrid(Sender: TField);
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

procedure TFormContratoN.BtnIncluirClick(Sender: TObject);
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

procedure TFormContratoN.BtnModificarClick(Sender: TObject);
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

procedure TFormContratoN.BtnExcluirClick(Sender: TObject);
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

procedure TFormContratoN.BtnTabelaClick(Sender: TObject);
begin
  if BtnTabela.Tag = 0 then
    TelaConsulta
  else
    TelaManutencao;
  StatusTabela;

end;

procedure TFormContratoN.BtnLocalizarClick(Sender: TObject);
begin
  Ed_Localizar(TabelaPrincipal, FormContratoN, GridConsulta);
  StatusTabela;
  IF PagePrincipal.TABINDEX = 0 THEN
    TelaManutencao;

end;

procedure TFormContratoN.BtnPrimeiroClick(Sender: TObject);
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

procedure TFormContratoN.BtnAnteriorClick(Sender: TObject);
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

procedure TFormContratoN.BtnProximoClick(Sender: TObject);
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

procedure TFormContratoN.BtnUltimoClick(Sender: TObject);
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

procedure TFormContratoN.BtnRefreshClick(Sender: TObject);
begin
  if MessageDlg('Atualizar registros?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    TabelaPrincipal.AtualizaSql;
    IF PagePrincipal.TABINDEX = 0 THEN
      TelaManutencao;
  end;

end;

procedure TFormContratoN.ContratoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.Contrato.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.Contrato);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.CadastroExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.Cadastro.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.Cadastro);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.StatusCTExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.StatusCT.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.StatusCT);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.StatusCTDrawItem(Control: TWinControl; Index: Integer;
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
  if TabGlobal.DContratoTransporte.StatusCT.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DContratoTransporte.StatusCT.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DContratoTransporte.StatusCT.DescValorValido[Index]));
end;

procedure TFormContratoN.CLICODExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.CLICOD.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.CLICOD);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);

//  CLICOD.OnEnter(sender);
  TabelaPrincipal.AtribuiRelacionamentos;
//  CLICOD.OnEnter(sender);
  RAZAO.Refresh ;
  TabGlobal.DContratoTransporte.ID.Conteudo := TabGlobal.DFornecedores.ID.Conteudo ;


end;

procedure TFormContratoN.RAZAOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.RAZAO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.RAZAO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.seqExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.seq.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.seq);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
    
  TabelaPrincipal.AtribuiRelacionamentos;
  NOME.Refresh ;
end;

procedure TFormContratoN.NOMEExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.NOME.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.NOME);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.FORCODExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.FORCOD.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.FORCOD);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);

  TabelaPrincipal.AtribuiRelacionamentos;
  RAZAOEXPOSTADOR.Refresh;
  RAZAOEXPOSTADOR.Refresh;
  
  if (TabGlobal.DContratoTransporte.State = dsInsert) or
     ( TabGlobal.DContratoTransporte.State = dsedit  ) then
  TabGlobal.DContratoTransporte.ID.AtribuiValorPadrao ;

end;

procedure TFormContratoN.RAZAOEXPOSTADORExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.RAZAOEXPOSTADOR.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.RAZAOEXPOSTADOR);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.C_CExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.C_C.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.C_C);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.PrecoFOBTotalExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.PrecoFOBTotal.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.PrecoFOBTotal);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.QuantidadeTotalExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.QuantidadeTotal.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.QuantidadeTotal);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.ValorSCCTotalExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.ValorSCCTotal.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.ValorSCCTotal);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.ComissaoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.Comissao.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.Comissao);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.FormComissaoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.FormComissao.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.FormComissao);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.FormComissaoDrawItem(Control: TWinControl; Index: Integer;
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
  if TabGlobal.DContratoTransporte.FormComissao.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DContratoTransporte.FormComissao.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DContratoTransporte.FormComissao.DescValorValido[Index]));
end;

procedure TFormContratoN.ValorTotalComissaoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.ValorTotalComissao.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.ValorTotalComissao);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.OBSExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.OBS.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.OBS);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.DataAssExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.DataAss.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.DataAss);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.ComentarioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.Comentario.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.Comentario);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.Grid_PrudutoContratoTDblClick(Sender: TObject);
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
  FormPRODUTOCONTRATO := TFormPRODUTOCONTRATO.Create(Application);
  Try
    FormPRODUTOCONTRATO.ShowModal;
  Finally
    FormPRODUTOCONTRATO.Free;
  end;
end;

procedure TFormContratoN.Grid_PrudutoContratoTColEnter(Sender: TObject);
begin
  if (TabGlobal.DProdutoContratoT.State = dsInsert) and
     (TabelaPrincipal.Inclusao) then
  begin
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
    if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
    begin
      MessageDlg('Duplicidade - Registro já cadastrado !',mtWarning,[mbOk],0);
      begin
        TabGlobal.DProdutoContratoT.Cancel;
        exit;
      end;
    end;
    if MessageDlg('Salvar ('+TabelaPrincipal.Titulo+') ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    begin
      TabGlobal.DProdutoContratoT.Cancel;
      exit;
    end;
    if (not CamposDadosValidos(ListaCamposEd, ErroValidacao)) or (not TabelaPrincipal.Salva) then
    begin
      TabGlobal.DProdutoContratoT.Cancel;
      exit;
    end
    else
      if not TabelaPrincipal.Modifica then
      begin
        TabGlobal.DProdutoContratoT.Cancel;
        exit;
      end
      else
        TabGlobal.DProdutoContratoT.AtribuiMestre(TabGlobal.DProdutoContratoT);
  end;
  ExecutaPreValidacoesGrid(TabGlobal.DProdutoContratoT);
  KeyPreview := False;
end;

procedure TFormContratoN.Grid_PrudutoContratoTExit(Sender: TObject);
begin
  KeyPreview := True;
end;

procedure TFormContratoN.Grid_PrudutoContratoTEditButtonClick(Sender: TObject);
Var
  I: Integer;
  Campo: TAtributo;
  CampoGrid: TField;
begin
  CampoGrid := Grid_PrudutoContratoT.SelectedField;
  if CampoGrid = Nil then exit;
  for I:=0 to TabGlobal.DProdutoContratoT.Campos.Count-1 do
  begin
    Campo := TAtributo(TabGlobal.DProdutoContratoT.Campos[I]);
    if Campo.Valor.FieldName = CampoGrid.FieldName then
      Break;
  end;
  if (Campo = nil) or (Campo.Valor.ReadOnly) then exit;
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    FormGridPesquisa.Atalho := VK_F8;
    FormGridPesquisa.Campo  := Campo;
    if FormGridPesquisa.ShowModal = mrOk then
      ExecutaPreValidacoesGrid(TabGlobal.DProdutoContratoT);
  Finally
    FormGridPesquisa.Free;
  end;
end;

procedure TFormContratoN.Grid_BoockingDblClick(Sender: TObject);
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
  FormBOOCKING := TFormBOOCKING.Create(Application);
  Try
    FormBOOCKING.ShowModal;
  Finally
    FormBOOCKING.Free;
  end;
end;

procedure TFormContratoN.Grid_BoockingColEnter(Sender: TObject);
begin
  if (TabGlobal.DBoocking.State = dsInsert) and
     (TabelaPrincipal.Inclusao) then
  begin
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
    if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
    begin
      MessageDlg('Duplicidade - Registro já cadastrado !',mtWarning,[mbOk],0);
      begin
        TabGlobal.DBoocking.Cancel;
        exit;
      end;
    end;
    if MessageDlg('Salvar ('+TabelaPrincipal.Titulo+') ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    begin
      TabGlobal.DBoocking.Cancel;
      exit;
    end;
    if (not CamposDadosValidos(ListaCamposEd, ErroValidacao)) or (not TabelaPrincipal.Salva) then
    begin
      TabGlobal.DBoocking.Cancel;
      exit;
    end
    else
      if not TabelaPrincipal.Modifica then
      begin
        TabGlobal.DBoocking.Cancel;
        exit;
      end
      else
        TabGlobal.DBoocking.AtribuiMestre(TabGlobal.DBoocking);
  end;
  ExecutaPreValidacoesGrid(TabGlobal.DBoocking);
  KeyPreview := False;
end;

procedure TFormContratoN.Grid_BoockingExit(Sender: TObject);
begin
  KeyPreview := True;
end;

procedure TFormContratoN.Grid_BoockingEditButtonClick(Sender: TObject);
Var
  I: Integer;
  Campo: TAtributo;
  CampoGrid: TField;
begin
  CampoGrid := Grid_Boocking.SelectedField;
  if CampoGrid = Nil then exit;
  for I:=0 to TabGlobal.DBoocking.Campos.Count-1 do
  begin
    Campo := TAtributo(TabGlobal.DBoocking.Campos[I]);
    if Campo.Valor.FieldName = CampoGrid.FieldName then
      Break;
  end;
  if (Campo = nil) or (Campo.Valor.ReadOnly) then exit;
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    FormGridPesquisa.Atalho := VK_F8;
    FormGridPesquisa.Campo  := Campo;
    if FormGridPesquisa.ShowModal = mrOk then
      ExecutaPreValidacoesGrid(TabGlobal.DBoocking);
  Finally
    FormGridPesquisa.Free;
  end;
end;

procedure TFormContratoN.Grid_ExportadoTransitoDblClick(Sender: TObject);
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
  FormEXPORTACAO := TFormEXPORTACAO.Create(Application);
  Try
    FormEXPORTACAO.ShowModal;
  Finally
    FormEXPORTACAO.Free;
  end;
  
end;

procedure TFormContratoN.Grid_ExportadoTransitoColEnter(Sender: TObject);
begin
  if (TabGlobal.DExportadoTransito.State = dsInsert) and
     (TabelaPrincipal.Inclusao) then
  begin
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
    if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
    begin
      MessageDlg('Duplicidade - Registro já cadastrado !',mtWarning,[mbOk],0);
      begin
        TabGlobal.DExportadoTransito.Cancel;
        exit;
      end;
    end;
    if MessageDlg('Salvar ('+TabelaPrincipal.Titulo+') ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    begin
      TabGlobal.DExportadoTransito.Cancel;
      exit;
    end;
    if (not CamposDadosValidos(ListaCamposEd, ErroValidacao)) or (not TabelaPrincipal.Salva) then
    begin
      TabGlobal.DExportadoTransito.Cancel;
      exit;
    end
    else
      if not TabelaPrincipal.Modifica then
      begin
        TabGlobal.DExportadoTransito.Cancel;
        exit;
      end
      else
        TabGlobal.DExportadoTransito.AtribuiMestre(TabGlobal.DExportadoTransito);
  end;
  ExecutaPreValidacoesGrid(TabGlobal.DExportadoTransito);
  KeyPreview := False;
end;

procedure TFormContratoN.Grid_ExportadoTransitoExit(Sender: TObject);
begin
  KeyPreview := True;
end;

procedure TFormContratoN.Grid_ExportadoTransitoEditButtonClick(Sender: TObject);
Var
  I: Integer;
  Campo: TAtributo;
  CampoGrid: TField;
begin
  CampoGrid := Grid_ExportadoTransito.SelectedField;
  if CampoGrid = Nil then exit;
  for I:=0 to TabGlobal.DExportadoTransito.Campos.Count-1 do
  begin
    Campo := TAtributo(TabGlobal.DExportadoTransito.Campos[I]);
    if Campo.Valor.FieldName = CampoGrid.FieldName then
      Break;
  end;
  if (Campo = nil) or (Campo.Valor.ReadOnly) then exit;
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    FormGridPesquisa.Atalho := VK_F8;
    FormGridPesquisa.Campo  := Campo;
    if FormGridPesquisa.ShowModal = mrOk then
      ExecutaPreValidacoesGrid(TabGlobal.DExportadoTransito);
  Finally
    FormGridPesquisa.Free;
  end;
end;

procedure TFormContratoN.NomeMixExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.NomeMix.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.NomeMix);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.QUANTTOTALEXPExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.QUANTTOTALEXP.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.QUANTTOTALEXP);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.QuantadePendenteExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.QuantadePendente.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.QuantadePendente);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.ValorTotalExpExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.ValorTotalExp.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.ValorTotalExp);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.ValorTotalPendenteExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.ValorTotalPendente.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.ValorTotalPendente);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.ValorTotalComissaoExecutadoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.ValorTotalComissaoExecutado.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.ValorTotalComissaoExecutado);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.CLICODClick(Sender: TObject);
{utilize o "var" para declarar variáveis}
begin
  {codificação...}
  // atyribuir pais para fascilitar a digitacao
  
  TabGlobal.DContratoTransporte.ID.Conteudo := TabGlobal.DFornecedores.ID.Conteudo ;
end;

procedure TFormContratoN.SDataEmbarqueExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.SDataEmbarque.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.SDataEmbarque);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.FORCODChange(Sender: TObject);
begin
//  if (TabGlobal.DContratoTransporte.State = dsInsert) or
//     ( TabGlobal.DContratoTransporte.State = dsedit  ) then
//      FORCODExit(sender) ;
end;

procedure TFormContratoN.ID_FORNExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.ID_FORN.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.ID_FORN);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
 XNumEdit1.Value := TabGlobal.DContratoTransporte.ValorSCCTotal.Conteudo - TabGlobal.DContratoTransporte.ValorTotalExp.Conteudo ;
 XNumEdit2.Value := TabGlobal.DContratoTransporte.QuantidadeTotal.Conteudo - TabGlobal.DContratoTransporte.QUANTTOTALEXP.Conteudo ;
end;

procedure TFormContratoN.ValorTotalExpChange(Sender: TObject);
begin
 DataSourceDataChange(Sender, nil );
end;

procedure TFormContratoN.GridConsultaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

//  if (TabGlobal.DPonto.SITUACAO.Conteudo = 'P') and (TabGlobal.DPonto.DATA.Conteudo <> DataAtual) then begin
    GridConsulta.Canvas.Font.Color:= clBlack;
//    GridConsulta.DefaultDrawDataCell(Rect, GridConsulta.columns[datacol].field, State);
//  end;
//  if (TabGlobal.DPonto.SITUACAO.Conteudo = 'P') and (TabGlobal.DPonto.DATA.Conteudo = DataAtual) then begin
    GridConsulta.Canvas.Brush.Color :=  RetCorFundo(TabGlobal.DContratoTransporte.StatusCT.CONTEUDO) ; // $00FFF4DF;
    GridConsulta.DefaultDrawDataCell(Rect, GridConsulta.columns[datacol].field, State);
//  end;

end;

procedure TFormContratoN.UsuarioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DContratoTransporte.Usuario.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DContratoTransporte.Usuario);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormContratoN.btn_CorrigClick(Sender: TObject);
begin
  if TabGlobal.DContratoTransporte.ValorSCCTotal.Conteudo < TabGlobal.DContratoTransporte.ValorTotalExp.Conteudo then
  begin
     if MessageDlg('O Valor Total Exp. e maior que o Valor SCC Total. Corrigir?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
       if TabGlobal.DContratoTransporte.Modificacao = False then
       begin
          //TabGlobal.DContratoTransporte.Edit;
          BtnModificarClick(Self) ;
          TabGlobal.DContratoTransporte.ValorTotalExp.Conteudo := TabGlobal.DContratoTransporte.ValorSCCTotal.Conteudo ;
         // TabGlobal.DContratoTransporte.Post;
          BtnSalvarClick(Self) ;

       end
       else
       begin
       //   BtnModificarClick(Self) ;
          TabGlobal.DContratoTransporte.ValorTotalExp.Conteudo := TabGlobal.DContratoTransporte.ValorSCCTotal.Conteudo ;
          TabGlobal.DContratoTransporte.Post;
      //    BtnSalvarClick(Self) ;
       end

       ;
     end;
  end;
end;

procedure TFormContratoN.DataSource_Grid_PrudutoContratoTDataChange(
  Sender: TObject; Field: TField);
begin
 if TabGlobal.DContratoTransporte.ValorSCCTotal.Conteudo < TabGlobal.DContratoTransporte.ValorTotalExp.Conteudo then
    btn_Corrig.Visible := True
 else
    btn_Corrig.Visible := False  ;
end;

end.
