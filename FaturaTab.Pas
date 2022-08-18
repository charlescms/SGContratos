{
   Programa.: XMaker CMS Modelo.PAS
   Copyright: CMX
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
}
unit FaturaTab;

interface

{$I Princ.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Tabs, BaseD, Db, Grids, DBGrids,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Atributo, dbctrls, Clipbrd, Tabela, Menus, IniFiles, Printers, Calculos,
  {$I LTab.pas}
  JPeg, XLookUp, XDBDate, Mask, XDBEdit, XDBNum, XEdit, XBanner, XDate, XNum,
  FR_DSet, FR_DBSet, FR_Desgn, FR_Class;

type
  TFormFaturaTab = class(TForm)
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    AbaConsulta: TTabSet;
    AbrirImagem: TMenuItem;
    Btn_grava: TBitBtn;
    Btn_imprime: TBitBtn;
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
    BtnVisualizar: TBitBtn;
    Cadastro: TXDBDateEdit;
    ColarImagem: TMenuItem;
    Comentario: TDBMemo;
    CopiarImagem: TMenuItem;
    CortarImagem: TMenuItem;
    CTTO: TXDBEdit;
    DataFatura: TXDBDateEdit;
    DataNF: TXDBDateEdit;
    DataProtesto: TXDBDateEdit;
    DataSource: TDataSource;
    DataSource_Grid_ComplementoFatura: TDataSource;
    DataSource_Grid_FaturaProdExp: TDataSource;
    Divisao_sup: TPanel;
    DlgAbrirImagem: TOpenDialog;
    DlgSalvarComoImagem: TSaveDialog;
    DS_Descontos: TDataSource;
    DS_Fatura: TDataSource;
    DS_FaturaTab: TDataSource;
    FORCOD: TXDBNumEdit;
    frDBDataSet: TfrDBDataSet;
    frDBDataSet_DComplementoFatura: TfrDBDataSet;
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    Grid_ComplementoFatura: TDBGrid;
    Grid_FaturaProdExp: TDBGrid;
    GridConsulta: TDBGrid;
    GroupBox_Fatura: TGroupBox;
    GroupBox_NF: TGroupBox;
    LbcCadastro: TLabel;
    LbcComentario: TLabel;
    LbcCTTO: TLabel;
    LbcDataFatura: TLabel;
    LbcDataNF: TLabel;
    LbcDataProtesto: TLabel;
    LbcFORCOD: TLabel;
    LbcNumFatura: TLabel;
    LbcNumNFEmit: TLabel;
    LbcRecebimento: TLabel;
    LbcStatus: TLabel;
    LbcTEXTO_PADRAO: TLabel;
    LbcValor: TLabel;
    LbcVALOR_IRRF: TLabel;
    LbcVALOR_LIQ: TLabel;
    LbcVALOR_NF: TLabel;
    LbcVALOR_NF_LIQ: TLabel;
    LbcVALOR_PIS_COF: TLabel;
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
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    NoManutencao: TNotebook;
    NumFatura: TXDBEdit;
    NumNFEmit: TXDBNumEdit;
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
    Recebimento: TXDBDateEdit;
    SalvarImagem: TMenuItem;
    Status: TDBComboBox;
    TabConsulta: TTabSheet;
    TabManutencao: TTabSheet;
    TabPaginas: TTabSet;
    TEXTO_PADRAO: TDBMemo;
    Valor: TXDBNumEdit;
    VALOR_IRRF: TXDBNumEdit;
    VALOR_LIQ: TXDBNumEdit;
    VALOR_NF: TXDBNumEdit;
    VALOR_NF_LIQ: TXDBNumEdit;
    VALOR_PIS_COF: TXDBNumEdit;
    ValorDesconto: TXDBNumEdit;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure NumFaturaExit(Sender: TObject);
    procedure CadastroExit(Sender: TObject);
    procedure StatusExit(Sender: TObject);
    procedure StatusDrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
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
    procedure DataProtestoExit(Sender: TObject);
    procedure RecebimentoExit(Sender: TObject);
    procedure FORCODExit(Sender: TObject);
    procedure TEXTO_PADRAOExit(Sender: TObject);
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
    procedure Grid_FaturaProdExpDblClick(Sender: TObject);
    procedure Grid_FaturaProdExpColEnter(Sender: TObject);
    procedure Grid_FaturaProdExpExit(Sender: TObject);
    procedure Grid_FaturaProdExpEditButtonClick(Sender: TObject);
    procedure Grid_ComplementoFaturaDblClick(Sender: TObject);
    procedure Grid_ComplementoFaturaColEnter(Sender: TObject);
    procedure Grid_ComplementoFaturaExit(Sender: TObject);
    procedure Grid_ComplementoFaturaEditButtonClick(Sender: TObject);
    procedure Btn_gravaClick(Sender: TObject);
    procedure GridConsultaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DS_FaturaDataChange(Sender: TObject; Field: TField);
    procedure DataSource_Grid_ComplementoFaturaDataChange(Sender: TObject;
      Field: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnVisualizarClick(Sender: TObject);
  private
    DFatura: TDFatura;
    DComplementoFatura :TDComplementoFatura ;
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
    function AntesdeSalvar:boolean;
    procedure AntesdeIncluir;
    procedure AntesdeModificar;
    function AntesdeExcluir: boolean;
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
  FormFaturaTab: TFormFaturaTab;
  LastControl: TWinControl;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, RotinaEd, Abertura, GridPesquisa, FATURAPRODEXP, FATURACOMPLFATU, UCMS_CONST,
  REL_FATURATAB;

procedure TFormFaturaTab.FormShow(Sender: TObject);
Var
  I: Integer;
begin
  DFatura := TDFatura.Create(Self);
  DComplementoFatura := TDComplementoFatura.Create(Self);

  DS_Fatura.DataSet     := TabGlobal.DFaturaProdExp ;
  DS_Descontos.DataSet  := DComplementoFatura ;
  DS_FaturaTab.DataSet  := TabGlobal.DFaturaTab ;

  frDBDataSet_DComplementoFatura.DataSet := DComplementoFatura ;
  
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  TabelaPrincipal    := TabGlobal.DFaturaTab;
  TituloModulo       := 'Cadastro de Fatura';
  Caption            := TituloModulo;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  TabGlobal.DFaturaTab.AtribuiRelacionamentos ;
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
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.TEXTO_PADRAO, -2, TEXTO_PADRAOExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  DataSource_Grid_ComplementoFatura.DataSet := TabGlobal.DComplementoFatura;
  Grid_ComplementoFatura.DataSource := DataSource_Grid_ComplementoFatura;
  AtribuiGridEdicao(TabGlobal.DComplementoFatura, Grid_ComplementoFatura, True, ValidaColunaGrid);
  DataSource_Grid_FaturaProdExp.DataSet := TabGlobal.DFaturaProdExp;
  Grid_FaturaProdExp.DataSource := DataSource_Grid_FaturaProdExp;

  AtribuiGridEdicao(TabGlobal.DFaturaProdExp, Grid_FaturaProdExp, True, ValidaColunaGrid);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.FORCOD, -2, FORCODExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.Recebimento, -2, RecebimentoExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.DataProtesto, -2, DataProtestoExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.VALOR_NF_LIQ, -2, VALOR_NF_LIQExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.VALOR_PIS_COF, -2, VALOR_PIS_COFExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.VALOR_IRRF, -2, VALOR_IRRFExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.VALOR_NF, -2, VALOR_NFExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.Comentario, -2, ComentarioExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.DataNF, -2, DataNFExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.NumNFEmit, -2, NumNFEmitExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.VALOR_LIQ, -2, VALOR_LIQExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.ValorDesconto, -2, ValorDescontoExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.Valor, -2, ValorExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.CTTO, -2, CTTOExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.DataFatura, -2, DataFaturaExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.Status, -2, StatusExit, StatusDrawItem, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.Cadastro, -2, CadastroExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaTab, TabGlobal.DFaturaTab.NumFatura, -1, NumFaturaExit, Nil, ListaCamposEd, FormFaturaTab, DataSource, ChamaGridPesquisa);
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
//  GroupBox1.Align := alTop ;
//  Grid_ComplementoFatura
  Grid_ComplementoFatura.Align :=  alBottom ;
  Grid_FaturaProdExp.Align := alClient ;
  GroupBox_Fatura.Align := altop;
  GroupBox_NF.Align := altop;

  Btn_grava.Hint   := 'Grava Fatura e desconto';

end;

function TFormFaturaTab.AbreTabelas: Boolean;
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  Result := True;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormFaturaTab.CamposCalculados;
begin
  {08-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormFaturaTab.HabilitaEdicao(Valor: Boolean = true);
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

function TFormFaturaTab.ConfirmaInclusao: Boolean;
begin
  Result := True;
end;

function TFormFaturaTab.ConfirmaModificacao: Boolean;
begin
  Result := True;
end;

function TFormFaturaTab.ConfirmaExclusao: Boolean;
begin
  Result := True;
end;

function TFormFaturaTab.ConfirmaGravacao: Boolean;
begin
  Result := True;
end;

procedure TFormFaturaTab.TelaManutencao;
begin
  if (TabelaPrincipal.Inclusao) or
     (TabelaPrincipal.Modificacao) then
    HabilitaEdicao
  else
    HabilitaEdicao(False);
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormFaturaTab.TelaConsulta;
begin
  HabilitaEdicao(False);

end;

procedure TFormFaturaTab.AtribuiValoresPadrao;
begin
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd, True);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

function TFormFaturaTab.AntesdeSalvar: boolean ;
var
  l_Ret : boolean ;
begin
try
 l_Ret := true ;
 Screen.Cursor := crHourGlass      ;

  // TabGlobal.DFaturaTab.DataNF
 // n analise de nota fiscal
 try
 if ((TabGlobal.DFaturaTab.NumNFEmit.Conteudo > 0) and
     (TabGlobal.DFaturaTab.DataNF.Conteudo <>  -693594  )) then begin
     if TabGlobal.DFatura.Filtro.Text  <> '' then  begin
        TabGlobal.DFatura.First ;
        while NOT TabGlobal.DFatura.Eof do begin
            if (( TabGlobal.DFatura.State <>  dsEdit)    and
                (TabGlobal.DFatura.State  <>  dsinsert)) then
                 TabGlobal.DFatura.Modifica ;

            if TabGlobal.DFatura.NumFatura.Conteudo = '' then begin
               TabGlobal.DFatura.NumNFEmit.Conteudo     := TabGlobal.DFaturaTab.NumNFEmit.Conteudo ;
               TabGlobal.DFatura.DataNF.Conteudo        := TabGlobal.DFaturaTab.DataNF.Conteudo ;
               TabGlobal.DFatura.Valor_NF.Conteudo      := TabGlobal.DFaturaTab.VALOR_NF_LIQ.Conteudo ;
               TabGlobal.DFatura.ValorDesconto.Conteudo := TabGlobal.DFaturaTab.ValorDesconto.Conteudo ;
               TabGlobal.DFatura.Status.Conteudo        := s_ST_NF_F ;
               TabGlobal.DFatura.DataFatura.Conteudo    := date ;
            end;
            TabGlobal.DFatura.Salva ;
            TabGlobal.DFatura.Next ;
          end;

        // alterea o status da fatura
        TabGlobal.DFaturaTab.Modifica;
        TabGlobal.DFaturaTab.Status.Conteudo :=   s_ST_NF_F ;
        TabGlobal.DFaturaTab.Salva;

      end;
 end;
 except
  l_Ret := false ;
 end;

 try
 // analise de conclusao
 if (TabGlobal.DFaturaTab.Recebimento.Conteudo <>  -693594 ) then begin
     if TabGlobal.DFatura.Filtro.Text  <> '' then  begin
        TabGlobal.DFatura.First ;
        while NOT TabGlobal.DFatura.Eof do begin
            if (( TabGlobal.DFatura.State <>  dsEdit)    and
                (TabGlobal.DFatura.State  <>  dsinsert)) then
                 TabGlobal.DFatura.Modifica ;

            if TabGlobal.DFatura.NumFatura.Conteudo = '' then begin
 //              TabGlobal.DFatura.NumFatura.Conteudo     := TabGlobal.DFaturaTab.NumFatura.Conteudo ;
               TabGlobal.DFatura.Recebimento.Conteudo := TabGlobal.DFaturaTab.Recebimento.Conteudo ;

               TabGlobal.DFatura.Status.Conteudo        := s_ST_OK_F ;
//              TabGlobal.DFatura.DataFatura.Conteudo    := date ;
            end;
            TabGlobal.DFatura.Salva ;
            TabGlobal.DFatura.Next ;
          end;

        // alterea o status da fatura
        TabGlobal.DFaturaTab.Modifica;
        TabGlobal.DFaturaTab.Status.Conteudo :=   s_ST_OK_F ;
        TabGlobal.DFaturaTab.Salva;

      end;
 end;
 except
  l_Ret := false ;
 end;
 try
 // analise de protesto
 if (TabGlobal.DFaturaTab.DataProtesto.Conteudo <>  -693594 ) then begin
     if TabGlobal.DFatura.Filtro.Text  <> '' then  begin
        TabGlobal.DFatura.First ;

        while NOT TabGlobal.DFatura.Eof do begin
            if (( TabGlobal.DFatura.State <>  dsEdit)    and
                (TabGlobal.DFatura.State  <>  dsinsert)) then
                 TabGlobal.DFatura.Modifica ;

            if TabGlobal.DFatura.NumFatura.Conteudo = '' then begin
 //              TabGlobal.DFatura.NumFatura.Conteudo     := TabGlobal.DFaturaTab.NumFatura.Conteudo ;
//               TabGlobal.DFatura.ValorDesconto.Conteudo := TabGlobal.DFaturaTab.ValorDesconto.Conteudo ;
               TabGlobal.DFatura.Status.Conteudo        := s_ST_PR_F ;
//              TabGlobal.DFatura.DataFatura.Conteudo    := date ;
            end;
            TabGlobal.DFatura.Salva ;
            TabGlobal.DFatura.Next ;
          end;

        // alterea o status da fatura
        TabGlobal.DFaturaTab.Modifica;
        TabGlobal.DFaturaTab.Status.Conteudo :=   s_ST_PR_F ;
        TabGlobal.DFaturaTab.Salva;

      end;
 end;

 except
  l_Ret := false ;
 end;


finally
  Screen.Cursor := crDefault ;
  AntesdeSalvar := l_Ret ;
end;


end;

procedure TFormFaturaTab.AntesdeIncluir;
begin

end;

procedure TFormFaturaTab.AntesdeModificar;
begin

end;

function TFormFaturaTab.AntesdeExcluir: boolean;
var
  l_Ret : boolean ;
begin
try
 l_Ret := true ;
 Screen.Cursor := crHourGlass      ;

 try
 // analise de protesto
// if (TabGlobal.DFaturaTab.DataProtesto.Conteudo <>  -693594 ) then begin
     if TabGlobal.DFatura.Filtro.Text  <> '' then  begin
        TabGlobal.DFatura.First ;

        while NOT TabGlobal.DFatura.Eof do begin
            if (( TabGlobal.DFatura.State <>  dsEdit)    and
                (TabGlobal.DFatura.State  <>  dsinsert)) then
                 TabGlobal.DFatura.Modifica ;

            if TabGlobal.DFatura.NumFatura.Conteudo = TabGlobal.DFaturaTab.NumFatura.Conteudo then begin
               TabGlobal.DFatura.NumNFEmit.Conteudo     := 0  ;
               TabGlobal.DFatura.DataNF.Conteudo        := 0 ; // -693594 ;
               TabGlobal.DFatura.Valor_NF.Conteudo      := 0 ;
               TabGlobal.DFatura.Status.Conteudo        := s_ST_EX_F ;
               TabGlobal.DFatura.NumFatura.Conteudo     := ''; // null ;
               TabGlobal.DFatura.ValorDesconto.Conteudo := 0 ;
               TabGlobal.DFatura.DataFatura.Conteudo    := 0 ; //  -693594 ;
            end;
            TabGlobal.DFatura.Salva ;
            TabGlobal.DFatura.Next ;
          end;

        // alterea o status da fatura
        TabGlobal.DFaturaTab.Modifica;
        TabGlobal.DFaturaTab.Status.Conteudo :=   s_ST_PR_F ;
        TabGlobal.DFaturaTab.Salva;

      end;
// end;

 except
  l_Ret := false ;
 end;


finally
  Screen.Cursor := crDefault ;
  AntesdeExcluir := l_Ret ;
end;


end;


procedure TFormFaturaTab.DepoisdeIncluir;
begin

end;

procedure TFormFaturaTab.DepoisdeModificar;
begin

end;

procedure TFormFaturaTab.DepoisdeExcluir;
begin

end;

procedure TFormFaturaTab.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSalvar.Enabled then
    TabelaPrincipal.Cancela;
end;

procedure TFormFaturaTab.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  I: Integer;
begin
  //TabelaPrincipal.AtribuiRelacionamentos(False); // Habilite esta opção caso seja realmente necessário...
  DFatura.Free ;
  DComplementoFatura.Free ;

  DesabilitaFuncoesEd;
  ListaCamposED.Free;
  for I := 0 to ConsultasSalvas.Count - 1 do
    TConsultasSalvas(ConsultasSalvas[I]).Free;
  ConsultasSalvas.Free;
  Action := caFree;
  FormFaturaTab := nil;
end;

procedure TFormFaturaTab.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormFaturaTab.BtnAjudaClick(Sender: TObject);
begin
  application.helpcommand(Help_Finder,HelpContext);
end;

procedure TFormFaturaTab.StatusTabela;
begin
//  LbTituloForm.Caption := TituloModulo + '- [ Ordem: '+TabelaPrincipal.TituloIndice+' ]';
end;

procedure TFormFaturaTab.FormResize(Sender: TObject);
begin
//  BtnAjuda.Left  := ShapeSup.Width - 37;
//  BtnFechar.Left := ShapeSup.Width - 19;
end;

procedure TFormFaturaTab.FormActivate(Sender: TObject);
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

procedure TFormFaturaTab.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormFaturaTab.BtnSalvarClick(Sender: TObject);
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
      if AntesdeSalvar = false  then  begin
         BtnDesistirClick(self);
         exit   ;
      end;

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

procedure TFormFaturaTab.BtnDesistirClick(Sender: TObject);
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

procedure TFormFaturaTab.GridConsultaDblClick(Sender: TObject);
begin
  if TabelaPrincipal.Eof then
    Incluir(Self)
  else
    Modificar(Self);
end;

procedure TFormFaturaTab.VerificaAtualizacoes;
begin
  if not BtnSalvar.Enabled then
    BtnDesistirClick(Self)
  else
    if MessageDlg('Salvar Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      BtnSalvarClick(Self)
    else
      BtnDesistirClick(Self);
end;

procedure TFormFaturaTab.Localizar(Sender: TObject);
begin
  Ed_Localizar(TabelaPrincipal, FormFaturaTab, GridConsulta);
end;

procedure TFormFaturaTab.Incluir(Sender: TObject);
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

procedure TFormFaturaTab.Modificar(Sender: TObject);
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

procedure TFormFaturaTab.Excluir(Sender: TObject);
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

procedure TFormFaturaTab.Primeiro(Sender: TObject);
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

procedure TFormFaturaTab.Anterior(Sender: TObject);
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

procedure TFormFaturaTab.Proximo(Sender: TObject);
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

procedure TFormFaturaTab.Ultimo(Sender: TObject);
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

procedure TFormFaturaTab.mnu_FiltrarClick(Sender: TObject);
begin
  Ed_Filtrar(TabelaPrincipal, FormFaturaTab, GridConsulta);
  StatusTabela;
end;

procedure TFormFaturaTab.mnu_OrdenarClick(Sender: TObject);
begin
  Ed_Ordenar(TabelaPrincipal, FormFaturaTab, GridConsulta);
  StatusTabela;
end;

procedure TFormFaturaTab.mnu_OrdenarCompostoClick(Sender: TObject);
begin
  Ed_OrdenarComposto(TabelaPrincipal, FormFaturaTab, GridConsulta);
  StatusTabela;
end;

procedure TFormFaturaTab.mnu_ApagarColunaClick(Sender: TObject);
begin
  Ed_ApagarColuna(TabelaPrincipal, FormFaturaTab, GridConsulta);
end;

procedure TFormFaturaTab.mnu_QuantificarClick(Sender: TObject);
begin
  Ed_Quantificar(TabelaPrincipal, FormFaturaTab, GridConsulta);
end;

procedure TFormFaturaTab.mnu_TotalizarColunaClick(Sender: TObject);
begin
  Ed_TotalizarColuna(TabelaPrincipal, FormFaturaTab, GridConsulta);
end;

procedure TFormFaturaTab.mnu_CalcularMediaClick(Sender: TObject);
begin
  Ed_CalcularMedia(TabelaPrincipal, FormFaturaTab, GridConsulta);
end;

procedure TFormFaturaTab.mnu_ImprimirClick(Sender: TObject);
begin
  Ed_Imprimir(TabelaPrincipal, FormFaturaTab, GridConsulta, DataSource);
end;

procedure TFormFaturaTab.mnu_SalvarConsultaClick(Sender: TObject);
begin
  Ed_SalvarConsulta(TabelaPrincipal, FormFaturaTab, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormFaturaTab.mnu_ExcluirConsultaClick(Sender: TObject);
begin
  Ed_ExcluirConsulta(TabelaPrincipal, FormFaturaTab, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormFaturaTab.PagePrincipalChange(Sender: TObject);
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

procedure TFormFaturaTab.AbaConsultaClick(Sender: TObject);
begin
  Ed_AbaConsulta(TabelaPrincipal, AbaConsulta, ConsultasSalvas, GridConsulta);
  StatusTabela;
end;

procedure TFormFaturaTab.TabPaginasClick(Sender: TObject);
begin
  if NoManutencao.PageIndex <> TabPaginas.TabIndex then
    NoManutencao.SetFocus;
  NoManutencao.PageIndex := TabPaginas.TabIndex;
end;

procedure TFormFaturaTab.PosicionaNoCampo(Campo: TAtributo);
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

procedure TFormFaturaTab.ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
begin
  MessageDlg(MsgErro, mtError, [mbOk], 0);
  ErroValidacao := True;
  PosicionaNoCampo(Campo);
end;

procedure TFormFaturaTab.MudaSeForUltimo;
begin
  if (NoManutencao.PageIndex <> NoManutencao.Pages.Count - 1) and
     (ActiveControl = BtnSalvar) then
    if TabPaginas.TabIndex + 1 <= TabPaginas.Tabs.Count-1 then
      TabPaginas.TabIndex := TabPaginas.TabIndex + 1;
end;

procedure TFormFaturaTab.CortarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CutToClipBoard;
end;

procedure TFormFaturaTab.CopiarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CopyToClipBoard;
end;

procedure TFormFaturaTab.ColarImagemClick(Sender: TObject);
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

procedure TFormFaturaTab.AbrirImagemClick(Sender: TObject);
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

procedure TFormFaturaTab.SalvarImagemClick(Sender: TObject);
begin
  if DlgSalvarComoImagem.Execute and (ActiveControl is TDBImage) then
    TDBImage(ActiveControl).Picture.SaveToFile(DlgSalvarComoImagem.FileName);
end;

function TFormFaturaTab.AbandonandoEdicao: Boolean;
begin
  Result := (ActiveControl = BtnDesistir) or (ActiveControl = PagePrincipal);
end;

procedure TFormFaturaTab.BtnRelac_1Click(Sender: TObject);
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

procedure TFormFaturaTab.PopRelacionadosClick(Sender: TObject);
var
  MenuItem: TMenuItem;
begin
  MenuItem := TMenuItem(Sender);
  {10-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormFaturaTab.ChamaGridPesquisa(Sender: TObject);
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

procedure TFormFaturaTab.ValidaColunaGrid(Sender: TField);
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

procedure TFormFaturaTab.BtnIncluirClick(Sender: TObject);
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

procedure TFormFaturaTab.BtnModificarClick(Sender: TObject);
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

procedure TFormFaturaTab.BtnExcluirClick(Sender: TObject);
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

procedure TFormFaturaTab.BtnTabelaClick(Sender: TObject);
begin
  if BtnTabela.Tag = 0 then
    TelaConsulta
  else
    TelaManutencao;
  StatusTabela;

end;

procedure TFormFaturaTab.BtnLocalizarClick(Sender: TObject);
begin
  Ed_Localizar(TabelaPrincipal, FormFaturaTab, GridConsulta);
  StatusTabela;
//  if PageForm.PageIndex = 0 then
  IF PagePrincipal.TABINDEX = 0 THEN
    TelaManutencao;

end;

procedure TFormFaturaTab.BtnPrimeiroClick(Sender: TObject);
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

procedure TFormFaturaTab.BtnAnteriorClick(Sender: TObject);
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

procedure TFormFaturaTab.BtnProximoClick(Sender: TObject);
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

procedure TFormFaturaTab.BtnUltimoClick(Sender: TObject);
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

procedure TFormFaturaTab.BtnRefreshClick(Sender: TObject);
begin
  if MessageDlg('Atualizar registros?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    TabelaPrincipal.AtualizaSql;
    // if PageForm.PageIndex = 0 then
    IF PagePrincipal.TABINDEX = 0 THEN
      TelaManutencao;
  end;

end;

procedure TFormFaturaTab.NumFaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.NumFatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.NumFatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.CadastroExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.Cadastro.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.Cadastro);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.StatusExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.Status.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.Status);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.StatusDrawItem(Control: TWinControl; Index: Integer;
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
  if TabGlobal.DFaturaTab.Status.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DFaturaTab.Status.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DFaturaTab.Status.DescValorValido[Index]));
end;

procedure TFormFaturaTab.DataFaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.DataFatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.DataFatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.CTTOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.CTTO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.CTTO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.ValorExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.Valor.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.Valor);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.ValorDescontoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.ValorDesconto.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.ValorDesconto);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.VALOR_LIQExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.VALOR_LIQ.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.VALOR_LIQ);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.NumNFEmitExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.NumNFEmit.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.NumNFEmit);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.DataNFExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.DataNF.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.DataNF);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.ComentarioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.Comentario.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.Comentario);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.VALOR_NFExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.VALOR_NF.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.VALOR_NF);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.VALOR_IRRFExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.VALOR_IRRF.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.VALOR_IRRF);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.VALOR_PIS_COFExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.VALOR_PIS_COF.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.VALOR_PIS_COF);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.VALOR_NF_LIQExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.VALOR_NF_LIQ.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.VALOR_NF_LIQ);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.Grid_FaturaProdExpDblClick(Sender: TObject);
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
  FormFATURAPRODEXP := TFormFATURAPRODEXP.Create(Application);
  Try
    FormFATURAPRODEXP.ShowModal;
  Finally
    FormFATURAPRODEXP.Free;
  end;
end;

procedure TFormFaturaTab.Grid_FaturaProdExpColEnter(Sender: TObject);
begin
  if (TabGlobal.DFaturaProdExp.State = dsInsert) and
     (TabelaPrincipal.Inclusao) then
  begin
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
    if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
    begin
      MessageDlg('Duplicidade - Registro já cadastrado !',mtWarning,[mbOk],0);
      begin
        TabGlobal.DFaturaProdExp.Cancel;
        exit;
      end;
    end;
    if MessageDlg('Salvar ('+TabelaPrincipal.Titulo+') ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    begin
      TabGlobal.DFaturaProdExp.Cancel;
      exit;
    end;
    if (not CamposDadosValidos(ListaCamposEd, ErroValidacao)) or (not TabelaPrincipal.Salva) then
    begin
      TabGlobal.DFaturaProdExp.Cancel;
      exit;
    end
    else
      if not TabelaPrincipal.Modifica then
      begin
        TabGlobal.DFaturaProdExp.Cancel;
        exit;
      end
      else
        TabGlobal.DFaturaProdExp.AtribuiMestre(TabGlobal.DFaturaProdExp);
  end;
  ExecutaPreValidacoesGrid(TabGlobal.DFaturaProdExp);
  KeyPreview := False;
end;

procedure TFormFaturaTab.Grid_FaturaProdExpExit(Sender: TObject);
begin
  KeyPreview := True;
end;

procedure TFormFaturaTab.Grid_FaturaProdExpEditButtonClick(Sender: TObject);
Var
  I: Integer;
  Campo: TAtributo;
  CampoGrid: TField;
begin
  CampoGrid := Grid_FaturaProdExp.SelectedField;
  if CampoGrid = Nil then exit;
  for I:=0 to TabGlobal.DFaturaProdExp.Campos.Count-1 do
  begin
    Campo := TAtributo(TabGlobal.DFaturaProdExp.Campos[I]);
    if Campo.Valor.FieldName = CampoGrid.FieldName then
      Break;
  end;
  if (Campo = nil) or (Campo.Valor.ReadOnly) then exit;
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    FormGridPesquisa.Atalho := VK_F8;
    FormGridPesquisa.Campo  := Campo;
    if FormGridPesquisa.ShowModal = mrOk then
      ExecutaPreValidacoesGrid(TabGlobal.DFaturaProdExp);
  Finally
    FormGridPesquisa.Free;
  end;
end;

procedure TFormFaturaTab.Grid_ComplementoFaturaDblClick(Sender: TObject);
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
  FormFATURACOMPLFATU := TFormFATURACOMPLFATU.Create(Application);
  Try
    FormFATURACOMPLFATU.ShowModal;
  Finally
    FormFATURACOMPLFATU.Free;
  end;
end;

procedure TFormFaturaTab.Grid_ComplementoFaturaColEnter(Sender: TObject);
begin
  if (TabGlobal.DComplementoFatura.State = dsInsert) and
     (TabelaPrincipal.Inclusao) then
  begin
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
    if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
    begin
      MessageDlg('Duplicidade - Registro já cadastrado !',mtWarning,[mbOk],0);
      begin
        TabGlobal.DComplementoFatura.Cancel;
        exit;
      end;
    end;
    if MessageDlg('Salvar ('+TabelaPrincipal.Titulo+') ?',mtConfirmation,[mbYes,mbNo],0) <> mrYes then
    begin
      TabGlobal.DComplementoFatura.Cancel;
      exit;
    end;
    if (not CamposDadosValidos(ListaCamposEd, ErroValidacao)) or (not TabelaPrincipal.Salva) then
    begin
      TabGlobal.DComplementoFatura.Cancel;
      exit;
    end
    else
      if not TabelaPrincipal.Modifica then
      begin
        TabGlobal.DComplementoFatura.Cancel;
        exit;
      end
      else
        TabGlobal.DComplementoFatura.AtribuiMestre(TabGlobal.DComplementoFatura);
  end;
  ExecutaPreValidacoesGrid(TabGlobal.DComplementoFatura);
  KeyPreview := False;
end;

procedure TFormFaturaTab.Grid_ComplementoFaturaExit(Sender: TObject);
begin
  KeyPreview := True;
end;

procedure TFormFaturaTab.Grid_ComplementoFaturaEditButtonClick(Sender: TObject);
Var
  I: Integer;
  Campo: TAtributo;
  CampoGrid: TField;
begin
  CampoGrid := Grid_ComplementoFatura.SelectedField;
  if CampoGrid = Nil then exit;
  for I:=0 to TabGlobal.DComplementoFatura.Campos.Count-1 do
  begin
    Campo := TAtributo(TabGlobal.DComplementoFatura.Campos[I]);
    if Campo.Valor.FieldName = CampoGrid.FieldName then
      Break;
  end;
  if (Campo = nil) or (Campo.Valor.ReadOnly) then exit;
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    FormGridPesquisa.Atalho := VK_F8;
    FormGridPesquisa.Campo  := Campo;
    if FormGridPesquisa.ShowModal = mrOk then
      ExecutaPreValidacoesGrid(TabGlobal.DComplementoFatura);
  Finally
    FormGridPesquisa.Free;
  end;
end;

procedure TFormFaturaTab.DataProtestoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.DataProtesto.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.DataProtesto);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.RecebimentoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.Recebimento.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.Recebimento);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.Btn_gravaClick(Sender: TObject);
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

        if TabGlobal.DFatura.NumFatura.Conteudo = '' then begin
           TabGlobal.DFatura.NumFatura.Conteudo     := TabGlobal.DFaturaTab.NumFatura.Conteudo ;
           TabGlobal.DFatura.ValorDesconto.Conteudo := TabGlobal.DFaturaTab.ValorDesconto.Conteudo ;
           TabGlobal.DFatura.Status.Conteudo        := s_ST_FA_F ;
           TabGlobal.DFatura.DataFatura.Conteudo    := date ;
        end;
        TabGlobal.DFatura.Salva ;
        TabGlobal.DFatura.Next ;
      end;

      // alterea o status da fatura
      TabGlobal.DFaturaTab.Modifica;
      TabGlobal.DFaturaTab.Status.Conteudo :=   s_ST_FA_F ;
      TabGlobal.DFaturaTab.Salva;
      Screen.Cursor := crDefault ;

      Refresh ;
   end;
end
else
   MessageDlg( msg_AplicacaoSoPodeSerExecutadaNoMomentoDaFatura ,mtWarning,[mbOk],0);
end;

procedure TFormFaturaTab.GridConsultaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
//  GRID FIGURAS
    GridConsulta.Canvas.Font.Color:= clBlack;
    GridConsulta.Canvas.Brush.Color :=  RetCorFundoFatura(TabGlobal.DFaturaTab.Status.CONTEUDO) ; // $00FFF4DF;
    GridConsulta.DefaultDrawDataCell(Rect, GridConsulta.columns[datacol].field, State);

end;

procedure TFormFaturaTab.DS_FaturaDataChange(Sender: TObject;
  Field: TField);
VAR
 S_LFILTRO : STRING ;
 n_fatura : Double ;
begin
 S_LFILTRO := 'NumFatura =' + AtribuiAspas( DFatura.NumFatura.Conteudo );
 DComplementoFatura.Close ;
 DComplementoFatura.Filtro.Clear ;
 DComplementoFatura.Filtro.Add(S_LFILTRO);
 DComplementoFatura.AtualizaSql;
 DComplementoFatura.First ;
 n_fatura := 0;

 while not DComplementoFatura.Eof do begin
    n_fatura := n_fatura + DComplementoFatura.Valor.Conteudo   ;
    DComplementoFatura.Next ;
 end;
 DComplementoFatura.First ;
// XNumDesc.Value := n_fatura ;
// XNumEd_geral.Value :=  XNumEd_Prod.Value + XNumDesc.Value ;

end;


procedure TFormFaturaTab.DataSource_Grid_ComplementoFaturaDataChange(
  Sender: TObject; Field: TField);
begin
  DFatura.close;
  DFatura.Filtro.Clear;
  if TabGlobal.DFaturaTab.FORCOD.Conteudo > 0 then begin
     DFatura.Filtro.Add('(ContratoTransporte.FORCOD >= '+ TabGlobal.DFaturaTab.FORCOD.ValorString + ')');
     DFatura.Filtro.Add('AND (ContratoTransporte.FORCOD <= '+ TabGlobal.DFaturaTab.FORCOD.ValorString + ')');
  end;
  DFatura.AtualizaSql(False);

end;

procedure TFormFaturaTab.FORCODExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.FORCOD.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.FORCOD);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.BitBtn1Click(Sender: TObject);
{utilize o "var" para declarar variáveis}
begin
  {codificação...}

  FormREL_FATURATAB := TFormREL_FATURATAB.Create(Application);
  Try
    FormREL_FATURATAB.ShowModal;
  Finally
    FormREL_FATURATAB.Free;
  end;
end;

procedure TFormFaturaTab.TEXTO_PADRAOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaTab.TEXTO_PADRAO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaTab.TEXTO_PADRAO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaTab.BtnVisualizarClick(Sender: TObject);
begin
  {codificação...}

  FormREL_FATURATAB := TFormREL_FATURATAB.Create(Application);
  Try
    FormREL_FATURATAB.set_NumFatura(TabGlobal.DFaturaTab.NumFatura.Conteudo);
    FormREL_FATURATAB.ShowModal;
  Finally
    FormREL_FATURATAB.Free;
  end;
end;

end.
