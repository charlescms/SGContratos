{
   Programa.: Parametro.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados      RxDBGrid1
   Site.....: htunit Parametro;tp://www.xmaker.com.br
}
unit Parametro;

interface

{$I Princ.inc}


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Tabs, BaseD, Db, Grids, DBGrids,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Atributo, dbctrls, Clipbrd, Tabela, Menus, IniFiles, Printers, Calculos,
  {$I LTab.pas}
  JPeg, XLookUp, XDBDate, Mask, XDBEdit, XDBNum, XEdit, XBanner, XDate, XNum, ColorGrd, 
  XLabel3D, RxCombos, IBQuery, RXDBCtrl, IBCustomDataSet , UCMS_CONST,
  JvExButtons, JvBitBtn;

const
s_analise =
'select * ' +   NOVA_LINHA +
'from ( ' +     NOVA_LINHA +
  'select ' +   NOVA_LINHA +
  '  contratotransporte.contrato , ' +  NOVA_LINHA +
  '  contratotransporte.ValorSCCTotal , ' + NOVA_LINHA +
  '  (( select sum(produtocontratot.ValorSCC) from produtocontratot  where produtocontratot.contrato = contratotransporte.contrato )) as ValorSCC_TOTAL_PRODUTO, ' + NOVA_LINHA +
  '  contratotransporte.ValorTotalExp ,' + NOVA_LINHA +
  '  (( select sum(ExportadoTransito.Valor) from ExportadoTransito  where ExportadoTransito.contrato = contratotransporte.contrato )) as Valor_TOTAL_exportado,' + NOVA_LINHA +
  '  contratotransporte.quantidadetotal as Qunat_Total_Contrato, ' + NOVA_LINHA +
  '  (( select sum(produtocontratot.quantidade) from produtocontratot  where produtocontratot.contrato = contratotransporte.contrato )) as Qunat_Total_Produto, ' + NOVA_LINHA +
  '  contratotransporte.QUANTTOTALEXP as Qunat_Total_Exp_Contrato, ' + NOVA_LINHA +
  '  (( select sum(EXPORTADOTRANSITO.QUANTIDADEEXP)  from EXPORTADOTRANSITO  where EXPORTADOTRANSITO.contrato = contratotransporte.contrato  ))  as Qunat_Total_Ja_Exportada , ' + NOVA_LINHA +
  '  contratotransporte.VALORTOTALCOMISSAO, ' + NOVA_LINHA +
  '  ( SELECT ( SUM(PRODUTOCONTRATOT.ComisaoSFatura)   ) FROM PRODUTOCONTRATOT   WHERE (PRODUTOCONTRATOT.CONTRATO  = CONTRATOTRANSPORTE.CONTRATO ) )     AS VALORTOTALCOMISSAO_CAL_PRODUTO , ' + NOVA_LINHA +
  '   contratotransporte.VALORTOTALCOMISSAOEXECUTADO , ' + NOVA_LINHA +
  '  ( SELECT ( SUM(EXPORTADOTRANSITO.ComisaoSFatura)   ) FROM EXPORTADOTRANSITO   WHERE (EXPORTADOTRANSITO.CONTRATO  = CONTRATOTRANSPORTE.CONTRATO ) )  AS VALORTOTALCOMISSAO_CAL_EXEC_US , ' + NOVA_LINHA +
  '   contratotransporte.VALORTOTALCOMISSAOEXECUTADOUS , ' + NOVA_LINHA +
  '  (SELECT IIF(SUM( EXPORTADOTRANSITO.VALORCONVERTIDO) IS NULL ,0,SUM(EXPORTADOTRANSITO.VALORCONVERTIDO) ) FROM EXPORTADOTRANSITO WHERE  CONTRATOTRANSPORTE.CONTRATO = EXPORTADOTRANSITO.CONTRATO ) AS  VALORTOTALCOMISSAOEXECUTADO_CAL' + NOVA_LINHA +
  'from contratotransporte) as analise '+ NOVA_LINHA +
  ' where ( Qunat_Total_Contrato < Qunat_Total_Produto ) OR '+ NOVA_LINHA +
  '       ( ValorSCCTotal <  ValorSCC_TOTAL_PRODUTO )  OR  '+ NOVA_LINHA +
  '       ( Qunat_Total_Exp_Contrato < 0  ) or '+ NOVA_LINHA +
  '       ( Qunat_Total_Exp_Contrato < Qunat_Total_Ja_Exportada ) or '+ NOVA_LINHA +
  '       ( ValorTotalExp <  Valor_TOTAL_exportado ) or '+ NOVA_LINHA +
  '       ( VALORTOTALCOMISSAO < VALORTOTALCOMISSAO_CAL_PRODUTO ) or '+ NOVA_LINHA +
  '       ( VALORTOTALCOMISSAOEXECUTADO is null)  or  '+ NOVA_LINHA +
  '       ( VALORTOTALCOMISSAOEXECUTADO  < VALORTOTALCOMISSAOEXECUTADO_CAL  ) OR '+ NOVA_LINHA +
  '       ( VALORTOTALCOMISSAOEXECUTADOUS  < VALORTOTALCOMISSAO_CAL_EXEC_US ) '+ NOVA_LINHA +
  ' ORDER BY CONTRATO';

sc_sql_recebimento =
'select '+ NOVA_LINHA +
'       tmp.contrato , '+ NOVA_LINHA +
'       tmp.Fecha_de_Cobro ,'+ NOVA_LINHA +
'       tmp.Fatura ,'+ NOVA_LINHA +
'       tmp.Recebimento '+ NOVA_LINHA +
'from (  '+ NOVA_LINHA +
'SELECT  '+ NOVA_LINHA +
'       ExportadoTransito.contrato as contrato , '+ NOVA_LINHA +
'       ExportadoTransito.Recebimento  as   Fecha_de_Cobro , '+ NOVA_LINHA +
'       ExportadoTransito.Fatura as Fatura ,  '+ NOVA_LINHA +
'      ( select OrdemCobranca.Recebimento from OrdemCobranca where OrdemCobranca.NumOrdCobranca = ExportadoTransito.NumOrdCobranca ) as Recebimento'+ NOVA_LINHA +
' from   ExportadoTransito) as tmp'+ NOVA_LINHA +
' where  tmp.Recebimento is not null  and  tmp.Fatura     <> ''''  '+ NOVA_LINHA +
//' where  tmp.Fecha_de_Cobro is null  and tmp.Recebimento is not null  and  tmp.Fatura     <> ''''  '+ NOVA_LINHA +

' order by   tmp.Recebimento'+ NOVA_LINHA ;

s_analise_FIN =
   'select                                                                                       '+ NOVA_LINHA + 
   'ordemcobrancaprodexp.NUMORDCOBRANCA,                                                         '+ NOVA_LINHA +
   '/* OrdemCobranca.NUMORDCOBRANCA , */                                                         '+ NOVA_LINHA +
   'exportadotransito.NUMORDCOBRANCA ,                                                           '+ NOVA_LINHA +
   '/*ordemcobrancaprodexp.CONTRATO, */                                                          '+ NOVA_LINHA +
   'exportadotransito.CONTRATO ,                                                                 '+ NOVA_LINHA +
   '/* ordemcobrancaprodexp.SEQ, */                                                              '+ NOVA_LINHA +
   'exportadotransito.SEQ ,                                                                      '+ NOVA_LINHA +
   'ordemcobrancaprodexp.COMISAOSFATURA,                                                         '+ NOVA_LINHA +
   'exportadotransito.COMISAOSFATURA ,                                                           '+ NOVA_LINHA +
   'ordemcobrancaprodexp.VALORCONVERTIDO,                                                        '+ NOVA_LINHA +
   'exportadotransito.VALORCONVERTIDO ,                                                          '+ NOVA_LINHA +
   'OrdemCobranca.DATAFATURA,                                                                    '+ NOVA_LINHA +
   'OrdemCobranca.STATUS,                                                                        '+ NOVA_LINHA +
   'exportadotransito.STATUS ,                                                                   '+ NOVA_LINHA +
   'OrdemCobranca.NUMNFEMIT,                                                                     '+ NOVA_LINHA +
   'exportadotransito.NUMNFEMIT ,                                                                '+ NOVA_LINHA +
   'OrdemCobranca.DATANF,                                                                        '+ NOVA_LINHA +
   'exportadotransito.DATANF ,                                                                   '+ NOVA_LINHA +
   'OrdemCobranca.COMENTARIO,                                                                    '+ NOVA_LINHA +
   'exportadotransito.COMENTARIO ,                                                               '+ NOVA_LINHA +
   'OrdemCobranca.VALOR_NF,                                                                      '+ NOVA_LINHA +
   'exportadotransito.VALOR_NF ,                                                                 '+ NOVA_LINHA +
   'OrdemCobranca.DATALIQ,                                                                       '+ NOVA_LINHA +
   'exportadotransito.DATALIQ ,                                                                  '+ NOVA_LINHA +
   'OrdemCobranca.RECEBIMENTO,                                                                   '+ NOVA_LINHA +
   'exportadotransito.RECEBIMENTO                                                                '+ NOVA_LINHA +
   'from                                                                                         '+ NOVA_LINHA +
   '      ordemcobrancaprodexp , ordemcobranca , exportadotransito                               '+ NOVA_LINHA +
   'where                                                                                        '+ NOVA_LINHA +
   '    /* not ( ordemcobranca.NUMNFEMIT = exportadotransito.NUMNFEMIT = null )   and */         '+ NOVA_LINHA +
   '    (( exportadotransito.NUMNFEMIT IS NULL AND  NOT ( ordemcobranca.NUMNFEMIT  IS NULL )) OR '+ NOVA_LINHA +
   '    ( exportadotransito.DATANF IS NULL AND  NOT ( ordemcobranca.DATANF  IS NULL ))) AND      '+ NOVA_LINHA +
   '    ( exportadotransito.contrato = ordemcobrancaprodexp.contrato and                         '+ NOVA_LINHA +
   '     exportadotransito.seq = ordemcobrancaprodexp.seq    and                                 '+ NOVA_LINHA +
   '     ordemcobranca.numordcobranca = ordemcobrancaprodexp.numordcobranca   )                  '+ NOVA_LINHA ;
 //  '    /* AND ordemcobrancaprodexp.contrato = '7439'  ) */                                      '+ NOVA_LINHA ;

type
  TFormParametro = class(TForm)
    AbaConsulta: TTabSet;
    AbrirImagem: TMenuItem;
    BitBtn1: TBitBtn;
    BtnDesistir: TBitBtn;
    BtnModificar: TSpeedButton;
    BtnRefresh: TSpeedButton;
    BtnSalvar: TBitBtn;
    BtnTabela: TSpeedButton;
    ColarImagem: TMenuItem;
    ColorDialog1: TColorDialog;
    ColorGrid1: TColorGrid;
    CopiarImagem: TMenuItem;
    CortarImagem: TMenuItem;
    DataSource: TDataSource;
    DS_analise: TDataSource;
    Divisao_inf: TPanel;
    Divisao_sup: TPanel;
    DlgAbrirImagem: TOpenDialog;
    DlgSalvarComoImagem: TSaveDialog;
    ENDERECOEMPRESA: TDBMemo;
    GridConsulta: TDBGrid;
    IBQuery_Analise: TIBQuery;
    Img_Form: TImage;
    Img_Tabela: TImage;
    IRRF: TXDBNumEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LbcENDERECOEMPRESA: TLabel;
    LbcIRRF: TLabel;
    LbcNumFatura: TLabel;
    LbcNumNFEmit: TLabel;
    LbcNumOrdCobranca: TLabel;
    LbcPIS_COF_CSSL: TLabel;
    LbcSeqPara: TLabel;
    LbcTEXTOFATURA: TLabel;
    LbcUsuario: TLabel;
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
    NumFatura: TXDBNumEdit;
    NumNFEmit: TXDBNumEdit;
    NumOrdCobranca: TXDBEdit;
    PageForm: TNotebook;
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
    PIS_COF_CSSL: TXDBNumEdit;
    PnInferior: TPanel;
    PnSuperior: TPanel;
    PopConsulta: TPopupMenu;
    RxDBGrid1: TRxDBGrid;
    SalvarImagem: TMenuItem;
    SeqPara: TXDBNumEdit;
    StatusBar: TStatusBar;
    TabPaginas: TTabSet;
    TEXTOFATURA: TDBMemo;
    Usuario: TXDBEdit;
    DBNavigator1: TDBNavigator;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    bitbtn_correcao: TJvBitBtn;
    btn_correcao_exp: TButton;
    btn_exib: TButton;
    procedure TEXTOFATURAExit(Sender: TObject);
    procedure NumNFEmitExit(Sender: TObject);
    procedure NumFaturaExit(Sender: TObject);
    procedure ENDERECOEMPRESAExit(Sender: TObject);
    procedure UsuarioExit(Sender: TObject);
    procedure SeqParaExit(Sender: TObject);
    procedure NumOrdCobrancaExit(Sender: TObject);
    procedure IRRFExit(Sender: TObject);
    procedure PIS_COF_CSSLExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnDesistirClick(Sender: TObject);
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
    procedure ChamaGridPesquisa(Sender: TObject);
    procedure ValidaColunaGrid(Sender: TField);
    procedure BtnTabelaClick(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnModificarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnLocalizarClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
    procedure GridConsultaDblClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure TEXTOFATURAChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure bitbtn_correcaoClick(Sender: TObject);
    procedure btn_correcao_expClick(Sender: TObject);
    procedure btn_exibClick(Sender: TObject);
  private
    { Private declarations }
    Navegando: Boolean;
    ListaCamposED: TListaCampos; {Conterá a lista de campos em edição na ED}
    TituloModulo: String;
    ConsultasSalvas: TList;
    PaginaIni: Integer;
    ErroValidacao: Boolean;
    SalvarRegistro: Boolean;
    procedure Inicializa;
    procedure HabilitaBotoesEdicao(Valor: Boolean = True);
    procedure StatusTabela;
    function AbreTabelas: Boolean;
    procedure FechaTabelas;
    procedure MudaSeForUltimo;
    function AbandonandoEdicao: Boolean;
    procedure TelaManutencao;
    procedure TelaConsulta;
    procedure AtribuiValoresPadrao;
    procedure PosicionaNoCampo(Campo: TAtributo);
    procedure VerificaAtualizacoes;
    procedure ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
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
    procedure BotoesManutencao(Habilita: Boolean);
    procedure HabilitaEdicao(Habilita: Boolean = true);
    procedure Correcao_dados;
    procedure Correcao_dados_FATURA ;
  public
    { Public declarations }
    {03-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    TabelaPrincipal: TTabela;
    {04-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
  end;

var
  FormParametro: TFormParametro;
  LastControl: TWinControl;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, RotinaEd, Abertura, GridPesquisa ;

procedure TFormParametro.Inicializa;
begin
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  TabelaPrincipal    := TabGlobal.DPARAMETROS;
  TituloModulo       := 'Cadastro de Parametros';
  Caption            := TituloModulo;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  FormPrincipal.PnImagemFundo.Visible := False;
  Sistema.JanelasMDI := Sistema.JanelasMDI + 01;
  if Sistema.JanelasMDI < 1 then
    Sistema.JanelasMDI := 1;
  Navegando          := False;
  DataSource.DataSet := TabelaPrincipal;
  ListaCamposED      := TListaCampos.Create;
  ConsultasSalvas    := TList.Create;
  PaginaIni          := 0;
  ErroValidacao      := False;
  TabPaginas.TabIndex:= 0;
  if not TabelaPrincipal.Active then
    TabelaPrincipal.AtualizaSql;
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  AtribuiCampoEdicao(TabGlobal.DParametros, TabGlobal.DParametros.PIS_COF_CSSL, -2, PIS_COF_CSSLExit, Nil, ListaCamposEd, FormParametro, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DParametros, TabGlobal.DParametros.IRRF, -2, IRRFExit, Nil, ListaCamposEd, FormParametro, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DParametros, TabGlobal.DParametros.NumOrdCobranca, -2, NumOrdCobrancaExit, Nil, ListaCamposEd, FormParametro, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DParametros, TabGlobal.DParametros.SeqPara, -1, SeqParaExit, Nil, ListaCamposEd, FormParametro, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DParametros, TabGlobal.DParametros.Usuario, -2, UsuarioExit, Nil, ListaCamposEd, FormParametro, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DPARAMETROS, TabGlobal.DPARAMETROS.ENDERECOEMPRESA, -2, ENDERECOEMPRESAExit, Nil, ListaCamposEd, FormParametro, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DPARAMETROS, TabGlobal.DPARAMETROS.NumFatura, -2, NumFaturaExit, Nil, ListaCamposEd, FormParametro, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DPARAMETROS, TabGlobal.DPARAMETROS.NumNFEmit, -2, NumNFEmitExit, Nil, ListaCamposEd, FormParametro, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DPARAMETROS, TabGlobal.DPARAMETROS.TEXTOFATURA, -2, TEXTOFATURAExit, Nil, ListaCamposEd, FormParametro, DataSource, ChamaGridPesquisa);
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  
//  DBRichEdit1.DataSource := DataSource    ;
//  DBRichEdit1.DataField := 'TEXTOFATURA'  ;

//  DBRichEdit2.DataSource := DataSource     ;
//  DBRichEdit2.DataField := 'ENDERECOEMPRESA'  ;
  if TabelaPrincipal.Eof then
  begin
    TabelaPrincipal.Inclui(ListaCamposED);
    TabelaPrincipal.Salva;
  end;
  TabPaginas.Visible  := TabPaginas.Tabs.Count > 1;
  Divisao_inf.Visible := TabPaginas.Tabs.Count <= 1;
  CamposCalculados;
  AjustaColunasConsulta(TabelaPrincipal);
  AbaConsulta.OnClick := Nil;
  AbaConsulta.TabIndex:= 0;
  Ed_AbaConsulta(TabelaPrincipal, AbaConsulta, ConsultasSalvas, GridConsulta, False);
  AbaConsulta.OnClick := AbaConsultaClick;
  BtnSalvar.Enabled   := False;
  BtnDesistir.Enabled := False;
  InicializaConsultasSalvas(TabelaPrincipal, AbaConsulta, ConsultasSalvas);
  PageForm.PageIndex := 0;
  NoManutencao.PageIndex := 0;
  HabilitaEdicao(False);
  HabilitaBotoesEdicao(False);
  if PageForm.PageIndex = 0 then
    TelaManutencao;

  IBQuery_Analise.Database  := TabGlobal.DPARAMETROS.DataBase ;
  IBQuery_Analise.transaction := TabGlobal.DPARAMETROS.Transaction ;

  IBQuery_Analise.SQL.Clear ;
  IBQuery_Analise.SQL.Add(s_analise) ;
  IBQuery_Analise.SQL.SaveToFile('_IBQuery_Analise.SQL');
  IBQuery_Analise.Prepare ;
  IBQuery_Analise.Open ;

end;

procedure TFormParametro.HabilitaBotoesEdicao(Valor: Boolean = True);
begin
  BtnModificar.Enabled := not Valor;
  BtnRefresh.Enabled   := not Valor;
  BtnSalvar.Enabled    := Valor;
  BtnDesistir.Enabled  := Valor;
end;

procedure TFormParametro.FormShow(Sender: TObject);
begin
  Inicializa;
end;

function TFormParametro.AbreTabelas: Boolean;
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  Result := True;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormParametro.FechaTabelas;
begin
  try
    if not TabelaPrincipal.Open_begin then
      TabelaPrincipal.Close;
  except
    on Erro: Exception do
    begin
      MessageDlg('Erro: ' + Erro.Message, mtError, [mbOk], 0);
    end;
  end;
end;

procedure TFormParametro.CamposCalculados;
begin
  {08-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormParametro.BotoesManutencao(Habilita: Boolean);
begin
  FormPrincipal.Manutencao.Enabled := Habilita;
  FormPrincipal.Consulta.Enabled   := Habilita;
  BtnModificar.Enabled := Habilita;
  BtnTabela.Enabled    := Habilita;
  BtnRefresh.Enabled   := Habilita;
end;

procedure TFormParametro.HabilitaEdicao(Habilita: Boolean = true);
var
  I: Integer;
  Comp: TComponent;

  function PosicionaFoco(Indice: Integer): Boolean;
  var
    I: Integer;
    CampoED: TCampoEdicao;
  begin
    PosicionaFoco := False;
    for I:=0 to ListaCamposED.Count-1 do
    begin
      CampoED := TCampoEdicao(ListaCamposED[I]);
      if (CampoED.Controle.TabOrder = Indice) and (CampoED.Controle.CanFocus) and
         (CampoED.Controle.Enabled) and (CampoED.Controle.TabStop) and (CampoED.Pagina <= 0) then
      begin
        CampoED.Controle.SetFocus;
        PosicionaFoco := True;
        Break;
      end;
    end;
  end;

begin
  for I := 0 to 10 do
  begin
    Comp := FindComponent('Pagina' + IntToStr(I));
    if Comp <> nil then
      TScrollBox(Comp).Enabled := Habilita;
  end;
  if TabelaPrincipal.Inclusao or TabelaPrincipal.Modificacao then
    BotoesManutencao(False)
  else
    BotoesManutencao(True);
  HabilitaCamposEdicao(ListaCamposED, Habilita);
  if Habilita then
    for I:=0 to ListaCamposED.Count-1 do
      if PosicionaFoco(I) then
        break;
end;

function TFormParametro.ConfirmaInclusao: Boolean;
begin
  Result := True;
end;

function TFormParametro.ConfirmaModificacao: Boolean;
begin
  Result := True;
end;

function TFormParametro.ConfirmaExclusao: Boolean;
begin
  Result := True;
end;

function TFormParametro.ConfirmaGravacao: Boolean;
begin
  Result := True;
end;

procedure TFormParametro.TelaManutencao;
begin
  AtribuiDataSourceCampos(ListaCamposEd, DataSource);
  PageForm.PageIndex := 0;
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

procedure TFormParametro.TelaConsulta;
begin
  AtribuiDataSourceCampos(ListaCamposEd, Nil);
  HabilitaEdicao(False);
  PageForm.PageIndex := 1;
  GridConsulta.DataSource := DataSource;
  BtnTabela.Caption := 'Formulário';
  BtnTabela.Hint    := 'Visualizar registros em forma de formulário';
  BtnTabela.Glyph   := Img_Form.Picture.Bitmap;
  BtnTabela.Tag     := 1;
  Divisao_sup.Visible   := False;
  GridConsulta.SetFocus;
end;

procedure TFormParametro.AtribuiValoresPadrao;
begin
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd, True);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormParametro.AntesdeSalvar;
begin

end;

procedure TFormParametro.AntesdeIncluir;
begin

end;

procedure TFormParametro.AntesdeModificar;
begin

end;

procedure TFormParametro.AntesdeExcluir;
begin

end;

procedure TFormParametro.DepoisdeIncluir;
begin

end;

procedure TFormParametro.DepoisdeModificar;
begin

end;

procedure TFormParametro.DepoisdeExcluir;
begin

end;

procedure TFormParametro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSalvar.Enabled then
    TabelaPrincipal.Cancela;
end;

procedure TFormParametro.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  I: Integer;
begin
  AbaConsulta.OnClick := Nil;
  AbaConsulta.TabIndex:= 0;
  Ed_AbaConsulta(TabelaPrincipal, AbaConsulta, ConsultasSalvas, GridConsulta, False);
  FechaTabelas;
  DesabilitaFuncoesEd;
  ListaCamposED.Free;
  for I := 0 to ConsultasSalvas.Count - 1 do
    TConsultasSalvas(ConsultasSalvas[I]).Free;
  ConsultasSalvas.Free;
  Action := caFree;
  FormParametro := nil;
end;

procedure TFormParametro.StatusTabela;
begin
  if (TabelaPrincipal.Inclusao) then
    StatusBar.Panels[0].Text := 'Operação: Incluíndo'
  else if (TabelaPrincipal.Modificacao) then
    StatusBar.Panels[0].Text := 'Operação: Modificando'
  else
    StatusBar.Panels[0].Text := 'Operação: Visualizando';
  if (Trim(TabelaPrincipal.Filtro.Text) <> '') or
     (Trim(TabelaPrincipal.FiltroRelac.Text) <> '') or
     (Trim(TabelaPrincipal.FiltroFixo.Text) <> '') then
    StatusBar.Panels[1].Text := 'Filtragem: Habilitada'
  else
    StatusBar.Panels[1].Text := 'Filtragem: Desabilitada';
  StatusBar.Panels[2].Text := 'Ordenação: '+TabelaPrincipal.TituloIndice;
  Application.ProcessMessages;
end;

procedure TFormParametro.FormActivate(Sender: TObject);
begin
  {
    Inicializa Menu Manutenção e Barra de Ferramentas
  }
  FormPrincipal.Localizar.OnClick    := BtnLocalizarClick;
  FormPrincipal.Incluir.OnClick      := BtnIncluirClick;
  FormPrincipal.Modificar.OnClick    := BtnModificarClick;
  FormPrincipal.Excluir.OnClick      := BtnExcluirClick;
  FormPrincipal.Primeiro.OnClick     := BtnPrimeiroClick;
  FormPrincipal.Anterior.OnClick     := BtnAnteriorClick;
  FormPrincipal.Proximo.OnClick      := BtnProximoClick;
  FormPrincipal.Ultimo.OnClick       := BtnUltimoClick;
  {
    Inicializa Menu Consulta
  }
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

  if TabelaPrincipal.Inclusao or TabelaPrincipal.Modificacao then
    BotoesManutencao(False)
  else
    BotoesManutencao(True);
end;

procedure TFormParametro.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormParametro.BtnTabelaClick(Sender: TObject);
begin
  if BtnTabela.Tag = 0 then
    TelaConsulta
  else
    TelaManutencao;
  StatusTabela;
end;

procedure TFormParametro.BtnIncluirClick(Sender: TObject);
begin
  //
end;

procedure TFormParametro.BtnModificarClick(Sender: TObject);
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

procedure TFormParametro.BtnExcluirClick(Sender: TObject);
begin
  //
end;

procedure TFormParametro.BtnLocalizarClick(Sender: TObject);
begin
  //
end;

procedure TFormParametro.BtnPrimeiroClick(Sender: TObject);
begin
  //
end;

procedure TFormParametro.BtnAnteriorClick(Sender: TObject);
begin
  //
end;

procedure TFormParametro.BtnProximoClick(Sender: TObject);
begin
  //
end;

procedure TFormParametro.BtnUltimoClick(Sender: TObject);
begin
  //
end;

procedure TFormParametro.BtnRefreshClick(Sender: TObject);
begin
  if MessageDlg('Atualizar registros?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    TabelaPrincipal.AtualizaSql;
    if PageForm.PageIndex = 0 then
      TelaManutencao;
  end;
end;

procedure TFormParametro.BtnSalvarClick(Sender: TObject);
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
    if Ok then
    begin
      BtnSalvar.Enabled   := False;
      BtnDesistir.Enabled := False;
      ErroValidacao       := False;
      TabPaginas.TabIndex := 0;
      HabilitaEdicao(False);
    end;
  end;
  SalvarRegistro := False;
  StatusTabela;
end;

procedure TFormParametro.BtnDesistirClick(Sender: TObject);
begin
  if TabelaPrincipal.Inclusao then
    TabelaPrincipal.ExclusaoCascata;
  TabelaPrincipal.Cancela;
  BtnSalvar.Enabled   := False;
  BtnDesistir.Enabled := False;
  ErroValidacao       := False;
  TabPaginas.TabIndex := 0;
  HabilitaEdicao(False);
  Navegando := False;
  StatusTabela;
end;

procedure TFormParametro.VerificaAtualizacoes;
begin
  if not BtnSalvar.Enabled then
    BtnDesistirClick(Self)
  else
    if MessageDlg('Salvar Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      BtnSalvarClick(Self)
    else
      BtnDesistirClick(Self);
end;

procedure TFormParametro.mnu_FiltrarClick(Sender: TObject);
begin
  Ed_Filtrar(TabelaPrincipal, FormParametro, GridConsulta);
  StatusTabela;
  if PageForm.PageIndex = 0 then
    TelaManutencao;
end;

procedure TFormParametro.mnu_OrdenarClick(Sender: TObject);
begin
  Ed_Ordenar(TabelaPrincipal, FormParametro, GridConsulta);
  StatusTabela;
  if PageForm.PageIndex = 0 then
    TelaManutencao;
end;

procedure TFormParametro.mnu_OrdenarCompostoClick(Sender: TObject);
begin
  Ed_OrdenarComposto(TabelaPrincipal, FormParametro, GridConsulta);
  StatusTabela;
  if PageForm.PageIndex = 0 then
    TelaManutencao;
end;

procedure TFormParametro.mnu_ApagarColunaClick(Sender: TObject);
begin
  Ed_ApagarColuna(TabelaPrincipal, FormParametro, GridConsulta);
end;

procedure TFormParametro.mnu_QuantificarClick(Sender: TObject);
begin
  Ed_Quantificar(TabelaPrincipal, FormParametro, GridConsulta);
end;

procedure TFormParametro.mnu_TotalizarColunaClick(Sender: TObject);
begin
  Ed_TotalizarColuna(TabelaPrincipal, FormParametro, GridConsulta);
end;

procedure TFormParametro.mnu_CalcularMediaClick(Sender: TObject);
begin
  Ed_CalcularMedia(TabelaPrincipal, FormParametro, GridConsulta);
end;

procedure TFormParametro.mnu_ImprimirClick(Sender: TObject);
begin
  Ed_Imprimir(TabelaPrincipal, FormParametro, GridConsulta, DataSource);
end;

procedure TFormParametro.mnu_SalvarConsultaClick(Sender: TObject);
begin
  Ed_SalvarConsulta(TabelaPrincipal, FormParametro, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormParametro.mnu_ExcluirConsultaClick(Sender: TObject);
begin
  Ed_ExcluirConsulta(TabelaPrincipal, FormParametro, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormParametro.AbaConsultaClick(Sender: TObject);
begin
  Ed_AbaConsulta(TabelaPrincipal, AbaConsulta, ConsultasSalvas, GridConsulta);
  StatusTabela;
end;

procedure TFormParametro.TabPaginasClick(Sender: TObject);
begin
  if NoManutencao.PageIndex <> TabPaginas.TabIndex then
    NoManutencao.SetFocus;
  NoManutencao.PageIndex := TabPaginas.TabIndex;
end;

procedure TFormParametro.PosicionaNoCampo(Campo: TAtributo);
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
  CampoED.Controle.SetFocus;
end;

procedure TFormParametro.ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
begin
  MessageDlg(MsgErro, mtError, [mbOk], 0);
  ErroValidacao := True;
  PosicionaNoCampo(Campo);
end;

procedure TFormParametro.MudaSeForUltimo;
begin
  if (NoManutencao.PageIndex <> NoManutencao.Pages.Count - 1) and
     (ActiveControl = BtnSalvar) then
    if TabPaginas.TabIndex + 1 <= TabPaginas.Tabs.Count-1 then
      TabPaginas.TabIndex := TabPaginas.TabIndex + 1;
end;

procedure TFormParametro.CortarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CutToClipBoard;
end;

procedure TFormParametro.CopiarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CopyToClipBoard;
end;

procedure TFormParametro.ColarImagemClick(Sender: TObject);
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

procedure TFormParametro.AbrirImagemClick(Sender: TObject);
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

procedure TFormParametro.SalvarImagemClick(Sender: TObject);
begin
  if DlgSalvarComoImagem.Execute and (ActiveControl is TDBImage) then
    TDBImage(ActiveControl).Picture.SaveToFile(DlgSalvarComoImagem.FileName);
end;

function TFormParametro.AbandonandoEdicao: Boolean;
begin
  Result := (ActiveControl = BtnDesistir);
end;

procedure TFormParametro.ChamaGridPesquisa(Sender: TObject);
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

procedure TFormParametro.ValidaColunaGrid(Sender: TField);
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

procedure TFormParametro.GridConsultaDblClick(Sender: TObject);
begin
  BtnModificarClick(Self);
end;

procedure TFormParametro.TEXTOFATURAExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DPARAMETROS.TEXTOFATURA.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DPARAMETROS.TEXTOFATURA);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormParametro.NumNFEmitExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DPARAMETROS.NumNFEmit.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DPARAMETROS.NumNFEmit);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormParametro.NumFaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DPARAMETROS.NumFatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DPARAMETROS.NumFatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormParametro.TEXTOFATURAChange(Sender: TObject);
{utilize o "var" para declarar variáveis}
begin
  {codificação...}

end;

procedure TFormParametro.ENDERECOEMPRESAExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DPARAMETROS.ENDERECOEMPRESA.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DPARAMETROS.ENDERECOEMPRESA);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormParametro.UsuarioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DParametros.Usuario.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DParametros.Usuario);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormParametro.SeqParaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DParametros.SeqPara.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DParametros.SeqPara);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormParametro.NumOrdCobrancaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DParametros.NumOrdCobranca.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DParametros.NumOrdCobranca);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormParametro.IRRFExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DParametros.IRRF.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DParametros.IRRF);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormParametro.PIS_COF_CSSLExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DParametros.PIS_COF_CSSL.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DParametros.PIS_COF_CSSL);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormParametro.BitBtn1Click(Sender: TObject);
{utilize o "var" para declarar variáveis}
var
  n_reg : integer ;
begin
  Screen.Cursor := crHourGlass;
  Refresh ;
  {codificação...}
  n_reg :=  IBQuery_Analise.RecordCount;
  if VNivel then begin
     if n_reg > 0 then
        correcao_dados;
  end;
  IBQuery_Analise.close;
  IBQuery_Analise.Open ;
  Screen.Cursor := crDefault;
end;

procedure TFormParametro.correcao_dados;
var
  s_tab : boolean ;
  s_filtro , n_filtro  : string ;
begin
  Screen.Cursor := crHourGlass;
  try
  s_tab := TabGlobal.DContratoTransporte.Active;
  s_filtro := TabGlobal.DContratoTransporte.Filtro.Text ;
  while not IBQuery_Analise.Eof do begin
      TabGlobal.DContratoTransporte.Active := false ;
      n_filtro := 'contrato = '+ AtribuiAspas (IBQuery_Analise.FieldValues['contrato'])  ;

      TabGlobal.DContratoTransporte.Filtro.Clear ;
      TabGlobal.DContratoTransporte.Filtro.Add(n_filtro);
      TabGlobal.DContratoTransporte.AtualizaSql;
      TabGlobal.DContratoTransporte.AtribuiRelacionamentos;
      //contratotransporte.quantidadetotal
      TabGlobal.DContratoTransporte.Modifica ;
      if IBQuery_Analise.FieldValues['Qunat_Total_Produto'] > IBQuery_Analise.FieldValues['Qunat_Total_Contrato'] then
         TabGlobal.DContratoTransporte.QuantidadeTotal.Conteudo := IBQuery_Analise.FieldValues['Qunat_Total_Produto'];
      if IBQuery_Analise.FieldValues['Qunat_Total_Ja_Exportada'] > IBQuery_Analise.FieldValues['Qunat_Total_Exp_Contrato'] then
         TabGlobal.DContratoTransporte.QUANTTOTALEXP.Conteudo := IBQuery_Analise.FieldValues['Qunat_Total_Produto'];

      // modificado 06/01/2012 correcao do problema contrato 7390
      if  IBQuery_Analise.FieldValues['Qunat_Total_Exp_Contrato'] < 0 then
          TabGlobal.DContratoTransporte.QUANTTOTALEXP.Conteudo := 0 ; //IBQuery_Analise.FieldValues['Qunat_Total_Ja_Exportada'];

      // modificado 08/01/2012 correcao do problema contrato 7390
      if ( IBQuery_Analise.FieldValues['Qunat_Total_Exp_Contrato'] < IBQuery_Analise.FieldValues['Qunat_Total_Ja_Exportada'] ) then
          TabGlobal.DContratoTransporte.QUANTTOTALEXP.Conteudo := IBQuery_Analise.FieldValues['Qunat_Total_Ja_Exportada'];

//  '  contratotransporte.ValorSCCTotal , ' +
//  ' (( select sum(produtocontratot.ValorSCC) from produtocontratot  where produtocontratot.contrato = contratotransporte.contrato )) as ValorSCC_TOTAL_PRODUTO, ' +

      if IBQuery_Analise.FieldValues['ValorSCC_TOTAL_PRODUTO'] > IBQuery_Analise.FieldValues['ValorSCCTotal'] then
         TabGlobal.DContratoTransporte.ValorSCCTotal.Conteudo := IBQuery_Analise.FieldValues['ValorSCC_TOTAL_PRODUTO'];
// 20/02/2013 correcao carrina atualizar com a versao 20/02/2013 3.25
      if IBQuery_Analise.FieldValues['Valor_TOTAL_exportado'] > IBQuery_Analise.FieldValues['ValorTotalExp'] then
         TabGlobal.DContratoTransporte.ValorTotalExp.Conteudo := IBQuery_Analise.FieldValues['Valor_TOTAL_exportado'];
//18/10/2013

//      if IBQuery_Analise.FieldValues['VALORTOTALCOMISSAOEXECUTADO'].value  = 0 then
         TabGlobal.DContratoTransporte.VALORTOTALCOMISSAOEXECUTADO.Conteudo := IBQuery_Analise.FieldValues['VALORTOTALCOMISSAOEXECUTADO_CAL'];

//      '       ( VALORTOTALCOMISSAOEXECUTADOUS  < VALORTOTALCOMISSAO_CAL_EXECUTADO_US ) '+ NOVA_LINHA +
      if IBQuery_Analise.FieldValues['VALORTOTALCOMISSAO_CAL_EXEC_US'] > IBQuery_Analise.FieldValues['VALORTOTALCOMISSAOEXECUTADOUS'] then
         TabGlobal.DContratoTransporte.VALORTOTALCOMISSAOEXECUTADOUS.Conteudo := IBQuery_Analise.FieldValues['VALORTOTALCOMISSAO_CAL_EXEC_US'];



      if IBQuery_Analise.FieldValues['VALORTOTALCOMISSAOEXECUTADO_CAL'] > IBQuery_Analise.FieldValues['VALORTOTALCOMISSAOEXECUTADO'] then
         TabGlobal.DContratoTransporte.VALORTOTALCOMISSAOEXECUTADO.Conteudo := IBQuery_Analise.FieldValues['VALORTOTALCOMISSAOEXECUTADO_CAL'];

      if IBQuery_Analise.FieldValues['VALORTOTALCOMISSAO_CAL_PRODUTO'] > IBQuery_Analise.FieldValues['VALORTOTALCOMISSAO'] then
         TabGlobal.DContratoTransporte.ValorTotalComissao.Conteudo := IBQuery_Analise.FieldValues['VALORTOTALCOMISSAO_CAL_PRODUTO'];
         

{
  '  contratotransporte.VALORTOTALCOMISSAO, ' + NOVA_LINHA +
  '  ( SELECT ( SUM(PRODUTOCONTRATOT.ComisaoSFatura)   ) FROM PRODUTOCONTRATOT   WHERE (PRODUTOCONTRATOT.CONTRATO  = CONTRATOTRANSPORTE.CONTRATO ) )  AS VALORTOTALCOMISSAO_CAL_PRODUTO , ' + NOVA_LINHA +
  ' contratotransporte.VALORTOTALCOMISSAOEXECUTADO , ' + NOVA_LINHA +
  ' (SELECT IIF(SUM( EXPORTADOTRANSITO.VALORCONVERTIDO) IS NULL ,0,SUM(EXPORTADOTRANSITO.VALORCONVERTIDO) ) FROM EXPORTADOTRANSITO WHERE  CONTRATOTRANSPORTE.CONTRATO = EXPORTADOTRANSITO.CONTRATO ) AS  VALORTOTALCOMISSAOEXECUTADO_CALCULADO_EXPORTADO' + NOVA_LINHA +
}



      TabGlobal.DContratoTransporte.Salva ;

      TabGlobal.DProdutoContratoT.First ;
      while not TabGlobal.DProdutoContratoT.Eof do begin
         TabGlobal.DProdutoContratoT.Modifica;
         TabGlobal.DProdutoContratoT.Salva ;
         TabGlobal.DProdutoContratoT.Next ;
      end;

      TabGlobal.DEXPORTADOTRANSITO.First ;
      while not TabGlobal.DEXPORTADOTRANSITO.Eof do begin
         TabGlobal.DEXPORTADOTRANSITO.Modifica;
         TabGlobal.DEXPORTADOTRANSITO.Salva ;
         TabGlobal.DEXPORTADOTRANSITO.Next ;
      end;

      IBQuery_Analise.Next ;
  end;
  // retorna a condicao anterior
  TabGlobal.DContratoTransporte.Active := false;
  TabGlobal.DContratoTransporte.Filtro.Clear ;
  TabGlobal.DContratoTransporte.Filtro.add(s_filtro) ;
  if not s_tab then
     TabGlobal.DContratoTransporte.AtualizaSql(false)
  else begin
     TabGlobal.DContratoTransporte.AtualizaSql();
     TabGlobal.DContratoTransporte.AtribuiRelacionamentos();
  end;
  finally
  Screen.Cursor := crDefault;
  end;
end;
// 01/05/2012
procedure TFormParametro.bitbtn_correcaoClick(Sender: TObject);
var
   t_tabela : TTabela ;
   s_contrato , s_fatura , s_filtro , s_tmp : string ;
   n_ind , n_reg : Integer ;
begin
   n_ind := 0;
   n_reg := 0  ;
   Screen.Cursor := crHourGlass;
   t_tabela := TTabela.Create(Self) ;
   t_tabela.DataBase:= TabGlobal.DParametros.DataBase;
   t_tabela.Transaction := TabGlobal.DParametros.Transaction;
   t_tabela.SQL.Clear ;
   t_tabela.SQL.Add(sc_sql_recebimento) ;
   t_tabela.SQL.SaveToFile('sc_sql_recebimento.sql') ;
   t_tabela.Prepare ;
   t_tabela.Open ;

   t_tabela.Last ;
   n_reg := t_tabela.RecNo ;
   t_tabela.First ;
   s_tmp := bitbtn_correcao.Caption ;
   while not t_tabela.Eof do
   begin
     n_ind := n_ind + 1 ;
     bitbtn_correcao.Caption := 'Num:= '+   formatfloat ( '00.00 %',( n_ind/ n_reg * 100) ) ; // + '%' ;
     bitbtn_correcao.Refresh ;

     s_contrato := AtribuiAspas(t_tabela.FieldByName('contrato').Value) ;
     s_Fatura   := AtribuiAspas(t_tabela.FieldByName('Fatura').Value );
     s_filtro := ' Fatura.contrato = '+s_contrato + ' and Fatura.fatura = '  +  s_Fatura ;
     TabGlobal.DFatura.close ;
     TabGlobal.DFatura.Filtro.Clear ;
     TabGlobal.DFatura.Filtro.Add(s_filtro)   ;
     TabGlobal.DFatura.AtualizaSql;
     TabGlobal.DFatura.SQL.SaveToFile('l_fatura.sql');
    // l_fatura.Prepare ;
    // l_fatura.Open  ;
     while not TabGlobal.DFatura.Eof do begin
        TabGlobal.DFatura.Modifica ;
        // TabGlobal.DFatura.ComisaoSFatura.Conteudo := 0 ;
        TabGlobal.DFatura.Recebimento.Conteudo :=  t_tabela.FieldByName('Recebimento').Value ;
        TabGlobal.DFatura.Salva ;
        TabGlobal.DFatura.Next ;
     end;
     TabGlobal.DFatura.Close ;

     t_tabela.Next ;

   end;

   TabGlobal.DFatura.Filtro.Clear ;
   TabGlobal.DFatura.AtualizaSql;
   t_tabela.Close ;
   t_tabela.Free ;
   bitbtn_correcao.Caption := s_tmp  ;
   Screen.Cursor := crDefault ;
end;
{
procedure TFormParametro.bitbtn_correcaoClick(Sender: TObject);
var
   t_tabela : TTabela ;
   s_contrato , s_fatura , s_filtro , s_tmp : string ;
//   l_fatura : TDExportadoTransito ;
   n_ind , n_reg : Integer ;
begin
   n_ind := 0;
   n_reg := 0  ;
   Screen.Cursor := crHourGlass;
//   l_fatura := TDExportadoTransito.Create(Self) ;
//   l_fatura.DataBase:= TabGlobal.DParametros.DataBase;
//   l_fatura.Transaction := TabGlobal.DParametros.Transaction;
   t_tabela := TTabela.Create(Self) ;
   t_tabela.DataBase:= TabGlobal.DParametros.DataBase;
   t_tabela.Transaction := TabGlobal.DParametros.Transaction;
   t_tabela.SQL.Clear ;
   t_tabela.SQL.Add(sc_sql_recebimento) ;
   t_tabela.SQL.SaveToFile('sc_sql_recebimento.sql') ;
   t_tabela.Prepare ;
   t_tabela.Open ;
 //  n_reg := t_tabela.RecNo ;
 //  n_reg := t_tabela.RecordCount ;

   t_tabela.Last ;
   n_reg := t_tabela.RecNo ;
   //n_reg := t_tabela.RecordCount ;
   t_tabela.First ;
   s_tmp := bitbtn_correcao.Caption ;
   while not t_tabela.Eof do
   begin
     n_ind := n_ind + 1 ;
    // s_texto := 'Numero := '+ trim (floattostr( n_ind/ n_reg * 100) ) + '%' ;
     bitbtn_correcao.Caption := 'Numero := '+ trim (floattostr( n_ind/ n_reg * 100) ) + '%' ;
     bitbtn_correcao.Refresh ;

     s_contrato := AtribuiAspas(t_tabela.FieldByName('contrato').Value) ;
     s_Fatura   := AtribuiAspas(t_tabela.FieldByName('Fatura').Value );
     s_filtro := ' Fatura.contrato = '+s_contrato + ' and Fatura.fatura = '  +  s_Fatura ;
     l_fatura.Filtro.Clear ;
     l_fatura.Filtro.Add(s_filtro)   ;
     l_fatura.AtualizaSql;
     l_fatura.SQL.SaveToFile('l_fatura.sql');
    // l_fatura.Prepare ;
    // l_fatura.Open  ;
     while not l_fatura.Eof do begin
        l_fatura.Modifica ;
        TabGlobal.DFatura.ComisaoSFatura.Conteudo = 0
        l_fatura.Recebimento.Conteudo :=  t_tabela.FieldByName('Recebimento').Value ;
        l_fatura.Salva ;
        l_fatura.Next ;
     end;
     l_fatura.Close ;
     t_tabela.Next ;

   end;
   l_fatura.Free;
   t_tabela.Close ;
   t_tabela.Free ;
   bitbtn_correcao.Caption := s_tmp  ;
   Screen.Cursor := crDefault ;
end;

}


procedure TFormParametro.Correcao_dados_FATURA;
var
  s_tab : boolean ;
  s_filtro , n_filtro  : string ;
begin
  Screen.Cursor := crHourGlass;
  try
  IBQuery_Analise.CLOSE ;
  IBQuery_Analise.SQL.Clear ;
  IBQuery_Analise.SQL.Add(s_analise_FIN) ;
  IBQuery_Analise.SQL.SaveToFile('IBQuery_Analise_2.SQL');
  IBQuery_Analise.Prepare ;
  IBQuery_Analise.Open ;

  s_tab := TabGlobal.DExportadoTransito.Active;
  s_filtro := TabGlobal.DExportadoTransito.Filtro.Text ;

  while not IBQuery_Analise.Eof do begin

      n_filtro := 'ExportadoTransito.contrato = '+ AtribuiAspas (IBQuery_Analise.FieldByName('contrato').AsString )  ;
      n_filtro := n_filtro + ' AND  ExportadoTransito.SEQ = '+ AtribuiAspas (IBQuery_Analise.FieldByName('SEQ').AsString )  ;

      TabGlobal.DExportadoTransito.Close ;
      TabGlobal.DExportadoTransito.Filtro.Clear ;
      TabGlobal.DExportadoTransito.Filtro.Add(n_filtro);
      TabGlobal.DExportadoTransito.AtualizaSql;

      //contratotransporte.quantidadetotal
      TabGlobal.DExportadoTransito.Modifica ;
      // ANALISE DA INFORMACAO
      // NUMORDCOBRANCA
      IF TabGlobal.DExportadoTransito.FieldByName('NUMORDCOBRANCA').IsNull then
         TabGlobal.DExportadoTransito.NUMORDCOBRANCA.Conteudo := IBQuery_Analise.FieldByName('NUMORDCOBRANCA').Value ;

         
      // VALORCONVERTIDO


      IF TabGlobal.DExportadoTransito.FieldByName('VALORCONVERTIDO').IsNull then
         TabGlobal.DExportadoTransito.VALORCONVERTIDO.Conteudo := IBQuery_Analise.FieldByName('VALORCONVERTIDO').Value
      else
         IF TabGlobal.DExportadoTransito.FieldByName('VALORCONVERTIDO').Value = 0 then
            TabGlobal.DExportadoTransito.VALORCONVERTIDO.Conteudo := IBQuery_Analise.FieldByName('VALORCONVERTIDO').Value ;

      //NUMNFEMIT
      IF TabGlobal.DExportadoTransito.FieldByName('NUMNFEMIT').IsNull then
         TabGlobal.DExportadoTransito.NUMNFEMIT.Conteudo := IBQuery_Analise.FieldByName('NUMNFEMIT').Value ;
      // DATANF
      IF TabGlobal.DExportadoTransito.FieldByName('DATANF').IsNull then
         TabGlobal.DExportadoTransito.DATANF.Conteudo := IBQuery_Analise.FieldByName('DATANF').Value ;
      // VALOR_NF
      IF TabGlobal.DExportadoTransito.FieldByName('VALOR_NF').IsNull then
         TabGlobal.DExportadoTransito.VALOR_NF.Conteudo := IBQuery_Analise.FieldByName('VALOR_NF').Value ;
      // DATALIQ
      IF TabGlobal.DExportadoTransito.FieldByName('DATALIQ').IsNull then
         TabGlobal.DExportadoTransito.DATALIQ.Conteudo := IBQuery_Analise.FieldByName('DATALIQ').Value ;
      // STATUS
      IF not IBQuery_Analise.FieldByName('NUMNFEMIT').IsNull then
         TabGlobal.DExportadoTransito.STATUS.Conteudo := '2';
      // RECEBIMENTO
      IF TabGlobal.DExportadoTransito.FieldByName('RECEBIMENTO').IsNull then
         TabGlobal.DExportadoTransito.RECEBIMENTO.Conteudo := IBQuery_Analise.FieldByName('RECEBIMENTO').Value ;

      TabGlobal.DExportadoTransito.Salva ;
      IBQuery_Analise.Next ;
  end;


  // retorna a condicao anterior

  TabGlobal.DExportadoTransito.Active := false;
  TabGlobal.DExportadoTransito.Filtro.Clear ;
  TabGlobal.DExportadoTransito.Filtro.add(s_filtro) ;
  if not s_tab then
     TabGlobal.DExportadoTransito.AtualizaSql(false)
  else begin
     TabGlobal.DExportadoTransito.AtualizaSql();
     TabGlobal.DExportadoTransito.AtribuiRelacionamentos();
  end;
  finally
  Screen.Cursor := crDefault;
  end;
end;

procedure TFormParametro.btn_correcao_expClick(Sender: TObject);
begin
  Correcao_dados_FATURA ;
end;

procedure TFormParametro.btn_exibClick(Sender: TObject);
begin
  IBQuery_Analise.CLOSE ;
  IBQuery_Analise.SQL.Clear ;
  IBQuery_Analise.SQL.Add(s_analise_FIN) ;
  IBQuery_Analise.SQL.SaveToFile('IBQuery_Analise_2.SQL');
  IBQuery_Analise.Prepare ;
  IBQuery_Analise.Open ;
end;

end.
