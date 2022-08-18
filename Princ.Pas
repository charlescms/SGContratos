{
 Empresa....: CMS
 Módulo.....: Princ.Pas - Formulário Principal
 Sistema....: 
 Data.......: 05/01/2011
 Versão.....: 1.0001
 Analista...: Charles
 Programador: Charles
 Criação....: xMaker 5.0 Release: R04
 
 // VERSAO 2.09
 // correcao na data 18/11/2011
 // erro so ocorre quando e seleciona so um registro correcao esta
 // implementada em baixo
 // MODIFICADO PARA INCLUIR REGRA QUE NAO FICOU CLARA NO ARQUIVO Rel_Agente
 //  REL_NF.PAS
 FOI MODIFICADO O FILTRO DE DATA DE CADASTRO PARA DATANF
 // versao 2.10
 // correcao no relatorio REL_FATURATAB.PAS
 // campos numero de farura estava com o numero da ordem de cobranca
 // o somatorio estava no local errado
 // VERSAO 2.11   25/11/2011
 // FOI REALIZADA MODIFICACOES NO RELATORIO ARQUIVO = Informe
 // ERRO NO FILTRO FOI CORRIGIDO E O LEIALE FOI MODIFICADO POR SOLICITACAO DA KARINA
 // INICIO 14:00 TERMINO AS 21:00
 // VERSAO 2.12   25/11/2011
 // correcao do relatorio de fatura e
 // criacao do relatorio de ordem de compra
 // modificacao da tela de ordem de cobrnacao com a criancao do  novo botao
 // de relatorio de ordem de cobrnacao
 // 06/12/2011
 // foi transferido 2 relatorio e a estrutura o banco foi modificado
 // foi criado um campo para colocacao do texto de desconto por solicitacao da elaine
 // ------
 // foi corrigido o erro do relatorio de con  sulta informe da Karina
 // CORRECAO DO SISTEMA DE COR CO A INICIALIZACAO DA VARIAVEL C_RET NAO ERA INICIALIZADA
 // 07/12/2011
 // CORRECAO DO RELATORIO DE FATURA E ORDEM DE COMPRA O RELATORIO NAO ESTAVA EXIBINDO A FIGURA
 // CORRECAO DO PROBLEMA DO CAMPO STATUScT  ESTA EM BRNACAO CASO ISTO OCORRA O SISTEMA IRA EXECUTA UM NA
 // VERIFICACAO SE O CAMPO ESTA EM BRANCO E DETERNIMA O  STADO DESTE CAMPO
 // modificado o relatorio rel_nf com erro de trunc e o layout do relatorio modificado para
 // aparecer o periodo do filtro do relatorio
 // // VERSAO 2.13   07/12/2011
 // correcao de erro 05/01/2012
 // correcao do relatorio de informe que esta gerendo com duplicidade
 // arquivo modificado unit Informe;
 // modificado 06/01/2012 correcao do problema contrato 7390  manutencao no arquivo unit Parametro;
 // modificado 08/01/2012 correcao do problema contrato 7390  manutencao no arquivo unit Parametro;
  // CONTRATO 08/01/2012
  // ESTE FILTRO FOI INCLUIDO PARA FACILITAR O TRABALHO DE PESQUIZA DE PROBLEMA
  // CORRECAO DO RELATORIO AGENTE  ERRO NO SQL
  // ERRO NO RELATORIO REL_nf CORRECAO DE UM SOMATORIO QUE NAO ESTAVA APARECENDO
  // A DATA
  // MODIFICACAO 09/01/2012
  // MODIFICAO O LAYOUT DO S RELATORIOS RETIRADO O NOME O PROJETISTA DO RELATORIO
  // TODOS OS RELATORIO FORRAM TESTADOS E NAO APRESENTAO PROBLEMA

  // MODIFICACAO 23/04/2012    '3.16';
  // MODIFICADO O ARQUIVO Informe CORRECAO NO FILTRO E NO CALCULO DO RELATORIO O LYALT FOI MODIFICADO PARA CORRECAO
  // AS QUERES FORAM MODIFCADA PARA ATENDER A REALIDADE QUE A KARINA EXPLICOU
  // 
  // MODIFICACAO 19/06/2012   '3.17';
  // RESUMENCONTRATA
  // RESUMEN
  // Rel_Diversos
  // MODIFICACAO 26/06/2012   '3.18';
  // INFOMECOMERCIAL
  // FORAM CRIADOS 2 CAOMPOS DE DATA PARA DELIMITAR O INICIO DE ANALIXE
  // PARA ACUMULO DOS VALORES
  // Rel_Diversos  CORRECAO DO FILTRO
  
  // MODIFICACAO 29/06/2012   '3.19';
  //  INFOMECOMERCIAL
  // 2906/2012 trocado o campo VALORCONVERTIDO pelo campo ComisaoSFatura

  // MODIFICACAO 29/06/2012   '3.20';
  //  CORRECAO DO PROBLEMA DO  unit Informe;
  // OBJETO
      RxMemoryData_Excel_DT1: TClientDataSet;
    RxMemoryData_Excel1: TClientDataSet;
  // MODIFICACAO  16/08/2012 3.201
  // arquivo modificado OrdemCobranca incluida
  // foi incluida uma consistencia no momento de excluir o processo que nao existia
  //  Rel_Diversos; foi incluida um somatorio no relatorio 


 
    // 28/08/2012  3.21
    Rel_Diversos
    mudado o criterio para este filtro solicitacao carina arquivo
    modifiacao do titulo  do relatorio
  // S_FILTRO3   := '' ;
  // 28/08/2012  3.22
  INFOMECOMERCIAL
  24/10/2012
  correcao no relatorio de
  //  arquivo = Informe
  mudanca no select principal do sistema
  metodo modificado BitB_FiltroClick
  25/10/2012 3.24
  correcao de dados uma analizador e correto  foi criado no arquivo de parametros
  continua o arquivo de   Informe
  Karina encontrou um novo problema
  20/02/2013 3.25
  // errono relatorio INFOMECOMERCIAL problema na rotina   UltimoDiaDoMes
  // arquivo modificado Rotinas
  10/08/2013 3.26  Versao         := '3.26';
  // correcao de erro do relatorio  arquivo => Informe
  // campos nao estavam corretos os campos estao conciderando o campo data de cadsatro para corrigi os
  // relatorio os dados
// VERSAO   08/10/2013 3.26  Versao         := '3.32';
// CORRECAO DOS ARQUIVOS
unit RESUMEN;
unit Informe;
unit Infome;
unit RESUMENCONTRATA; PENDENTE CONTINUAR NESTE ARQUIVO
// VERSAO   08/10/2013 3.26  Versao         := '3.33';
// CORRECAO DOS ARQUIVOS
unit RESUMEN;      funcionando e testado
unit Informe;
unit Infome;
unit RESUMENCONTRATA; PENDENTE CONTINUAR NESTE ARQUIVO
unit RelSitucaoCred;
Versao         := '3.35';
unit RelSitucaoCred;
Versao         := '3.36';

=> arquivo modificado INFOMECOMERCIAL
Versao         := '3.37';
17/10/2013
Versao         := '3.38';

Parametro  foi criado uma nova versao de criterio do arquivo 
18/10/2013
Versao         := '3.39';
24/10/2013
criacao do campo VALORTOTALCOMISSAOEXECUTADOUS na tabela ContratoTransporte
para atender a uma nessecidade da karina
Versao         := '3.40';
Versao         := '3.41';
Versao         := '3.42';

21/11/2013
alteracao no formulario produto exibindo os campos quantidade prevista e valor previsto
alterando o relatorio informe geral compo comicao anterior com o campo date errado
relatorio nf da elanie com o campo pendente com o conteudo errado foi corrigido o aqr. de relatorio

Versao         := '3.43';
// 10/01/2014
foi informado pela karina que neste relatorio nao entra o fornecedor surimpex que posuui o codifo de munero 17
      Versao         := '3.44
}

                       
unit Princ;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, Menus, Buttons, ExtCtrls, StdCtrls, Extras, Jpeg, ImgList,
  IniFiles, XPMenu, XBanner;

const
 TAM_MENU_LATERAL = 230 ;
   
type
  TFormPrincipal = class(TForm)
    Mnu_1: TMenuItem;
    Mnu_2: TMenuItem;
    Mnu_3: TMenuItem;
    Mnu_4: TMenuItem;
    Mnu_5: TMenuItem;
    Mnu_6: TMenuItem;
    Mnu_7: TMenuItem;
    Mnu_8: TMenuItem;
    Mnu_9: TMenuItem;
    Mnu_10: TMenuItem;
    Mnu_11: TMenuItem;
    Mnu_12: TMenuItem;
    Mnu_13: TMenuItem;
    Mnu_14: TMenuItem;
    Mnu_15: TMenuItem;
    Mnu_16: TMenuItem;
    Mnu_17: TMenuItem;
    Mnu_18: TMenuItem;
    Mnu_19: TMenuItem;
    Mnu_20: TMenuItem;
    Mnu_21: TMenuItem;
    Mnu_22: TMenuItem;
    Mnu_23: TMenuItem;
    Mnu_24: TMenuItem;
    Mnu_25: TMenuItem;
    Mnu_26: TMenuItem;
    Mnu_27: TMenuItem;
    Mnu_28: TMenuItem;
    Mnu_29: TMenuItem;
    Mnu_30: TMenuItem;
    Mnu_31: TMenuItem;
    Mnu_32: TMenuItem;
    Mnu_33: TMenuItem;
    Mnu_34: TMenuItem;
    Mnu_35: TMenuItem;
    Mnu_36: TMenuItem;
    Mnu_37: TMenuItem;
    Mnu_38: TMenuItem;
    Mnu_39: TMenuItem;
    Mnu_40: TMenuItem;
    Mnu_41: TMenuItem;
    Mnu_42: TMenuItem;
    Mnu_43: TMenuItem;
    Mnu_44: TMenuItem;
    Mnu_45: TMenuItem;
    Mnu_46: TMenuItem;
    Mnu_47: TMenuItem;
    Mnu_48: TMenuItem;
    Mnu_49: TMenuItem;
    Mnu_50: TMenuItem;
    Manutencao: TMenuItem;
    Localizar: TMenuItem;
    Incluir: TMenuItem;
    Modificar: TMenuItem;
    Excluir: TMenuItem;
    Mnu_56: TMenuItem;
    Primeiro: TMenuItem;
    Anterior: TMenuItem;
    Proximo: TMenuItem;
    Ultimo: TMenuItem;
    Consulta: TMenuItem;
    Filtrar: TMenuItem;
    Ordenar: TMenuItem;
    OrdenarComposto: TMenuItem;
    Mnu_65: TMenuItem;
    ApagarColuna: TMenuItem;
    Mnu_67: TMenuItem;
    Quantificar: TMenuItem;
    TotalizarColuna: TMenuItem;
    CalcularMedia: TMenuItem;
    Mnu_71: TMenuItem;
    Imprimir: TMenuItem;
    SalvarConsulta: TMenuItem;
    ExcluirConsulta: TMenuItem;
    mnu_Janelas: TMenuItem;
    Mnu_76: TMenuItem;
    Mnu_77: TMenuItem;
    Mnu_78: TMenuItem;
    Mnu_79: TMenuItem;
    Mnu_80: TMenuItem;
    Mnu_81: TMenuItem;
    Mnu_82: TMenuItem;
    Mnu_83: TMenuItem;
    Mnu_84: TMenuItem;
    Mnu_85: TMenuItem;
    Bar_2: TToolButton;
    Bar_3: TToolButton;
    Bar_4: TToolButton;
    Bar_5: TToolButton;
    Bar_6: TToolButton;
    Bar_7: TToolButton;
    Bar_8: TToolButton;
    Bar_9: TToolButton;
    Bar_10: TToolButton;
    BarraFerramentas: TToolBar;
    BarraPrincipal: TPanel;
    BtnAnterior: TSpeedButton;
    BtnExcluir: TSpeedButton;
    BtnIncluir: TSpeedButton;
    BtnLocalizar: TSpeedButton;
    BtnMinimiza: TSpeedButton;
    BtnModificar: TSpeedButton;
    BtnPrimeiro: TSpeedButton;
    BtnProximo: TSpeedButton;
    BtnUltimo: TSpeedButton;
    Divisor: TSplitter;
    ImagemFundo: TImage;
    ListaImagem: TImageList;
    MenuPrincipal: TMainMenu;
    PnImagemFundo: TPanel;
    PnLateral1: TPanel;
    PnLateral2: TPanel;
    PnLista1: TPanel;
    PnLista2: TPanel;
    PnOpcoes: TPanel;
    PnTitulo: TPanel;
    PopRelacionados: TPopupMenu;
    SetupImpressora: TPrinterSetupDialog;
    ShapeOpcoes: TShape;
    StatusBarPrincipal: TStatusBar;
    TreeMenuSup: TTreeView;
    TreeOpcoes: TTreeView;
    procedure ShowHint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject;
      var Action: TCloseAction);
    procedure PnOpcoesResize(Sender: TObject);
    procedure TreeOpcoesClick(Sender: TObject);
    procedure TreeOpcoesKeyPress(Sender: TObject; var Key: Char);
    {02-Início do Bloco Modular. Modificações não serão preservadas}
    procedure Mnu_2Click(Sender: TObject);
    procedure Mnu_3Click(Sender: TObject);
    procedure Mnu_5Click(Sender: TObject);
    procedure Mnu_6Click(Sender: TObject);
    procedure Mnu_7Click(Sender: TObject);
    procedure Mnu_8Click(Sender: TObject);
    procedure Mnu_10Click(Sender: TObject);
    procedure Mnu_12Click(Sender: TObject);
    procedure Mnu_13Click(Sender: TObject);
    procedure Mnu_14Click(Sender: TObject);
    procedure Mnu_16Click(Sender: TObject);
    procedure Mnu_17Click(Sender: TObject);
    procedure Mnu_18Click(Sender: TObject);
    procedure Mnu_19Click(Sender: TObject);
    procedure Mnu_20Click(Sender: TObject);
    procedure Mnu_21Click(Sender: TObject);
    procedure Mnu_22Click(Sender: TObject);
    procedure Mnu_24Click(Sender: TObject);
    procedure Mnu_25Click(Sender: TObject);
    procedure Mnu_26Click(Sender: TObject);
    procedure Mnu_28Click(Sender: TObject);
    procedure Mnu_29Click(Sender: TObject);
    procedure Mnu_30Click(Sender: TObject);
    procedure Mnu_31Click(Sender: TObject);
    procedure Mnu_33Click(Sender: TObject);
    procedure Mnu_34Click(Sender: TObject);
    procedure Mnu_35Click(Sender: TObject);
    procedure Mnu_36Click(Sender: TObject);
    procedure Mnu_38Click(Sender: TObject);
    procedure Mnu_39Click(Sender: TObject);
    procedure Mnu_40Click(Sender: TObject);
    procedure Mnu_41Click(Sender: TObject);
    procedure Mnu_42Click(Sender: TObject);
    procedure Mnu_43Click(Sender: TObject);
    procedure Mnu_45Click(Sender: TObject);
    procedure Mnu_46Click(Sender: TObject);
    procedure Mnu_47Click(Sender: TObject);
    procedure Mnu_48Click(Sender: TObject);
    procedure Mnu_50Click(Sender: TObject);
    procedure Mnu_76Click(Sender: TObject);
    procedure Mnu_77Click(Sender: TObject);
    procedure Mnu_78Click(Sender: TObject);
    procedure Mnu_79Click(Sender: TObject);
    procedure Mnu_80Click(Sender: TObject);
    procedure Mnu_82Click(Sender: TObject);
    procedure Mnu_83Click(Sender: TObject);
    procedure Mnu_85Click(Sender: TObject);
    procedure Bar_2Click(Sender: TObject);
    procedure Bar_3Click(Sender: TObject);
    procedure Bar_5Click(Sender: TObject);
    procedure Bar_6Click(Sender: TObject);
    procedure Bar_7Click(Sender: TObject);
    procedure Bar_8Click(Sender: TObject);
    procedure Bar_10Click(Sender: TObject);
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure GradientePaint(Sender: TObject);
    procedure BtnMinimizaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Declarações Privadas }
    {10-Início do Bloco Modular. Modificações não serão preservadas}
    procedure Menu_3Click(Opcao: Integer);
    procedure Menu_4Click(Opcao: Integer);
    procedure Menu_5Click(Opcao: Integer);
    procedure Menu_7Click(Opcao: Integer);
    procedure Menu_8Click(Opcao: Integer);
    procedure Menu_9Click(Opcao: Integer);
    procedure Menu_10Click(Opcao: Integer);
    procedure Menu_11Click(Opcao: Integer);
    procedure Menu_12Click(Opcao: Integer);
    procedure Menu_13Click(Opcao: Integer);
    procedure Menu_15Click(Opcao: Integer);
    procedure Menu_16Click(Opcao: Integer);
    procedure Menu_17Click(Opcao: Integer);
    procedure Menu_19Click(Opcao: Integer);
    procedure Menu_20Click(Opcao: Integer);
    procedure Menu_21Click(Opcao: Integer);
    procedure Menu_22Click(Opcao: Integer);
    procedure Menu_23Click(Opcao: Integer);
    procedure Menu_24Click(Opcao: Integer);
    procedure Menu_25Click(Opcao: Integer);
    procedure Menu_26Click(Opcao: Integer);
    procedure Menu_27Click(Opcao: Integer);
    procedure Menu_29Click(Opcao: Integer);
    procedure Menu_30Click(Opcao: Integer);
    procedure Menu_31Click(Opcao: Integer);
    procedure Menu_32Click(Opcao: Integer);
    procedure Menu_33Click(Opcao: Integer);
    procedure Menu_34Click(Opcao: Integer);
    {99-Final do Bloco Modular. Modificações não serão preservadas}
  protected
    { Declarações Protegidas }

  public
    { Declarações Públicas }
    ErronoSistema: Boolean;
    procedure FechaJanelasFilhas;
  end;

var
  FormPrincipal: TFormPrincipal;
  HintBalao: THintDesign;
  MenuXP: TXPMenu;
  XBanner_Lateral: TXBanner;
  Gradiente: TXBanner;

implementation

{$R *.DFM}
{$R *.RES}

uses Rotinas, Publicas, Splash, Interno,USEGURANCA,
     {20-Início do Bloco Modular. Modificações não serão preservadas}
     Exportacao,
     ProdutoContrato,
     TbPorto,
     TbCondicaoCompr,
     TbFormaPagament,
     Divisao,
     Atividades,
     Boocking,
     ClienteN,
     PaisN,
     ExportadorN,
     TbCategClienteN,
     TbSitClientesN,
     ContratoN,
     Produtos,
     Parametro,
     FaturaN,
     RELCOMPEN,
     RELFATURA,
     Infome,
     RESUMEN,
     INFOMECOMERCIAL,
     RELINFCOMDIRETO,
     Informe,
     RESUMENCONTRATA,
     Rel_Diversos,
     RelSitucaoCred,
     ResumenContForm,
     REL_FATURATAB,
     OrdemCobranca,
     OrdCobrancaDesc,
     OrdCobrancaProd,
     Rel_Agente,
     REL_NF,
     Rel_ValorFatura,
     Rel_ValorRecebi,
     TrocaContrato,
     RelOrdemCobranc,
     FRM_Previsao,
     {99-Final do Bloco Modular. Modificações não serão preservadas}
     Acesso, LogPrograma ;

procedure TFormPrincipal.ShowHint(Sender: TObject);
begin
  Atualiza_Status;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
Var
  ArqIni: TIniFile;
//  Seguranca :TSeguranca ;
//  op_ok : integer ;
//  msg_pcha : pansichar ;
  //msg : string ;
  // Msg: PAnsiChar;
begin
  {
    Inicializa variáveis públicas e ambiente de trabalho
  }
  {
  
  Seguranca := TSeguranca.create ;
  op_ok := Seguranca.dll_ok ;
  if op_ok <> 0 then begin
     msg:= PAnsiChar( Seguranca.MSG_Erro())  ;
     FatalAppExit(0,msg );
     Application.Terminate;
  end;

  if Seguranca.get_sEmpresa <> cont_empresa_surimpes then begin
     msg:= PAnsiChar( const_MSG_ERRO_EMPRESA )  ;
     FatalAppExit(0,msg );
     Application.Terminate;
  end;

  }
  DateSeparator       := '/';
  ShortDateFormat     := Sistema.EstiloData;
  Application.OnHint  := ShowHint;
  Caption             := Sistema.Titulo;
  if not Sistema.SelecionaUsr then
  begin
    ErronoSistema       := False;
    ArqIni              := TInifile.Create(Sistema.Pasta + 'SYSEMP.DAT');
    Sistema.EmpresaUsr  := ArqIni.ReadString('EMPRESA 00', 'Nome', '');
    Sistema.EnderecoUsr := ArqIni.ReadString('EMPRESA 00', 'Endereco', '');
    Sistema.BairroUsr   := ArqIni.ReadString('EMPRESA 00', 'Bairro', '');
    Sistema.CidadeUsr   := ArqIni.ReadString('EMPRESA 00', 'Cidade', '');
    Sistema.UfUsr       := ArqIni.ReadString('EMPRESA 00', 'UF', '');
    Sistema.CEPUsr      := ArqIni.ReadString('EMPRESA 00', 'CEP', '');
    Sistema.CNPJUsr     := ArqIni.ReadString('EMPRESA 00', 'CNPJ', '');
    Sistema.IEUsr       := ArqIni.ReadString('EMPRESA 00', 'Inscricao', '');
    Sistema.FonesUsr    := ArqIni.ReadString('EMPRESA 00', 'Fones', '');
    Sistema.LogoUsr     := ArqIni.ReadString('EMPRESA 00', 'Logo', '');
    ArqIni.Free;
  end;
  if (ErronoSistema) or (Sistema.ErroFatal) then
  begin
    Close;
    exit;
  end;

  Atualiza_Status;
  {
    Ajusta Barra de Ferramentas
  }
  BtnLocalizar.Visible   := False;
  BtnIncluir.Visible     := False;
  BtnModificar.Visible   := False;
  BtnExcluir.Visible     := False;
  BtnPrimeiro.Visible    := False;
  BtnAnterior.Visible    := False;
  BtnProximo.Visible     := False;
  BtnUltimo.Visible      := False;
  Manutencao.Enabled     := False;
  Consulta.Enabled       := False;
  {
    Define o ícone da aplicação
  }
  Application.Icon.Handle := LoadIcon(HInstance, 'ICONESISTEMA');
  Application.HelpFile    := Sistema.Pasta + 'Ajuda.Hlp';
  Application.Title       := Sistema.Titulo;
  {
    Controle de acesso habilitado ?
  }
  if Sistema.ControleAcesso then
  begin
    FormAcesso := TFormAcesso.Create(Application);
    try
      try
        FormAcesso.VerificaTabelas;
      except
        MessageDlg('Acesso Negado !', mtError, [mbOk], 0);
        ErronoSistema := True;
        Exit;
      end;
      FormAcesso.SenhaInicial := Sistema.SenhaInicial;
      FormAcesso.Tentativas   := 03;
      FormAcesso.QtdTentativas:= 01;
      FormAcesso.Liberacao    := False;
      if FormAcesso.ShowModal = mrCancel then
        ErronoSistema := True;
    finally
      FormAcesso.Free;
    end;
  end;
  {
    Erro no acesso ao sistema, cancela execução
  }
  if (ErronoSistema) or (Sistema.ErroFatal) then
  begin
    Close;
    exit;
  end;
  {
    Habilita/Desabilita opções de acesso ao usuário
  }
  Sistema.Menu  := TreeOpcoes;
  {
    Hint no estilo de balão ?
  }
  if Sistema.HintBalao then
  Begin
    HintBalao  := THintDesign.Create(Self);
    with HintBalao do
    begin
      Font.Charset := DEFAULT_CHARSET;
      Font.Color := clBlack;
      Font.Height := -13;
      Font.Name := 'Arial';
      Font.Style := [];
      Color := 14548735;
      Position := hiBottomRight;
      Shadow := True;
      ShadowQuality := quLow;
      ShadowIntensity := 70;
      ShadowWidth := 4;
      Delay := 500;
      HintStyle := hiRoundrect;
      linkStyle := liArrow;
      Border := True;
      BorderColor := clBlack;
      Loaded;
    end;
  End;
  XBanner_Lateral := TXBanner.Create(Self);
  with XBanner_Lateral do
  begin
    Parent       := FormPrincipal;
    Left         := 0;
    Top          := 56;
    Width        := 20;
    Height       := 253;
    Align        := alLeft;
    Alignment    := AtaLeftJustify;
    Angle        := 90;
    Caption      := '  ' + Sistema.Titulo;
    ColorOf      := clWhite;
    ColorFor     := clBlack;
    Font.Charset := DEFAULT_CHARSET;
    Font.Color   := clWhite;
    Font.Height  := -13;
    Font.Name    := 'MS Sans Serif';
    Font.Style   := [fsBold];
    Horizontal   := True;
    ParentFont   := False;
    ShadeLTSet   := False;
    Style3D      := A3dNormal;
    if Sistema.BannerVertical then
      Visible := True
    else
      Visible := False;
  end;
  Gradiente := TXBanner.Create(Self);
  with Gradiente do
  begin
    Parent     := BarraPrincipal;
    Align      := alClient;
    Angle      := 0;
    ColorOf    := clNavy;
    ColorFor   := 15244408;
    Horizontal := True;
    ShadeLTSet := False;
    Style3D    := A3dNormal;
    SendToBack;
  end;
  {
    Menu no estilo do Windows XP ?
  }
  if Sistema.MenuXP then
  Begin
    MenuXP  := TXPMenu.Create(Self);
    with MenuXP do
    begin
      DimLevel := 30;
      GrayLevel := 10;
      Font.Charset := DEFAULT_CHARSET;
      Font.Color := clWindowText;
      Font.Height := -11;
      Font.Name := 'Tahoma';
      Font.Style := [];
      Color := clBtnFace;
      DrawMenuBar := False;
      IconBackColor := clBtnFace;
      MenuBarColor := clBtnFace;
      SelectColor := clHighlight;
      SelectBorderColor := clHighlight;
      SelectFontColor := clWindowText;
      DisabledColor := clInactiveCaption;
      SeparatorColor := clBtnFace;
      CheckedColor := clHighlight;
      IconWidth := 24;
      DrawSelect := True;
      UseSystemColors := True;
      UseDimColor := False;
      OverrideOwnerDraw := False;
      Gradient := False;
      FlatMenu := False;
      AutoDetect := False;
      XPContainers := [xccToolbar, xccCoolbar, xccControlbar];
      XPControls := [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar];
      Active := True;
    end;
  End;
  {
    Ajusta menu principal
  }
  if Sistema.MenuVertical then
  begin
    Sistema.Menu  := TreeOpcoes;
    TreeOpcoes.FullExpand;
    if TreeOpcoes.Items.Count > 0 then
      TreeOpcoes.Items[0].Selected := True;
    TreeOpcoes.SetFocus;
  end
  else
  begin
    PnOpcoes.Visible   := False;
    Divisor.Visible    := False;
    PnLateral1.Visible := False;
    PnLateral2.Visible := False;
  end;
  if Sistema.BarraF then
    BarraFerramentas.Visible := True
  else
    BarraFerramentas.Visible := False;
  BarraPrincipal.Visible := False;  
  {
    Atualiza posicionamento dos componentes
  }
  PnOpcoes.width := TAM_MENU_LATERAL ; // 230;
  PnOpcoesResize(Self);
end;

procedure TFormPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  Fechar: Boolean;
begin
  Fechar := True;
  if (Sistema.ConfirmaSaida) and (not ErroNoSistema) and (not Sistema.ErroFatal) then
  begin
    if MessageDlg('Finalizar Sistema ?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    begin
      Action := caNone;
      Fechar := False;
    end;
  end;
  If Fechar then
  Begin
    FechaJanelasFilhas;
    if Sistema.HintBalao then
      HintBalao.Free;
    if Sistema.MenuXP then
      MenuXP.Free;
    XBanner_Lateral.Free;
    Gradiente.Free;
  End;
end;

procedure TFormPrincipal.FechaJanelasFilhas;
var
  I: Integer;
begin
  for I := MDIChildCount - 1 downto 0 do
    MDIChildren[I].Close;
end;

procedure TFormPrincipal.PnOpcoesResize(Sender: TObject);
begin
  PnLista1.Width    := PnOpcoes.Width     - 20;
  PnLista2.Width    := PnOpcoes.Width     - 20;
  BtnMinimiza.Left  := PnTitulo.Width     - 13;
  if PnTitulo.Width <= 30 then
  begin
    BtnMinimiza.Caption := '>';
    BtnMinimiza.Hint    := 'Expande Opções de Acesso';
  end
  else
  begin
    BtnMinimiza.Caption := '<';
    BtnMinimiza.Hint    := 'Minimiza Opções de Acesso';
  end;
  TreeOpcoes.Left   := ShapeOpcoes.Left   + 01;
  TreeOpcoes.Top    := ShapeOpcoes.Top    + 01;
  TreeOpcoes.Height := ShapeOpcoes.Height - 02;
  TreeOpcoes.Width  := ShapeOpcoes.Width  - 02;
end;

procedure TFormPrincipal.TreeOpcoesClick(Sender: TObject);
begin
  {30-Início do Bloco Modular. Modificações não serão preservadas}
  if TreeOpcoes.Selected.AbsoluteIndex = 2 then
    Menu_3Click(3)
  else if TreeOpcoes.Selected.AbsoluteIndex = 3 then
    Menu_4Click(31)
  else if TreeOpcoes.Selected.AbsoluteIndex = 4 then
    Menu_5Click(41)
  else if TreeOpcoes.Selected.AbsoluteIndex = 6 then
    Menu_7Click(33)
  else if TreeOpcoes.Selected.AbsoluteIndex = 7 then
    Menu_8Click(35)
  else if TreeOpcoes.Selected.AbsoluteIndex = 8 then
    Menu_9Click(36)
  else if TreeOpcoes.Selected.AbsoluteIndex = 9 then
    Menu_10Click(37)
  else if TreeOpcoes.Selected.AbsoluteIndex = 10 then
    Menu_11Click(38)
  else if TreeOpcoes.Selected.AbsoluteIndex = 11 then
    Menu_12Click(39)
  else if TreeOpcoes.Selected.AbsoluteIndex = 12 then
    Menu_13Click(40)
  else if TreeOpcoes.Selected.AbsoluteIndex = 14 then
    Menu_15Click(13)
  else if TreeOpcoes.Selected.AbsoluteIndex = 15 then
    Menu_16Click(14)
  else if TreeOpcoes.Selected.AbsoluteIndex = 16 then
    Menu_17Click(19)
  else if TreeOpcoes.Selected.AbsoluteIndex = 18 then
    Menu_19Click(9)
  else if TreeOpcoes.Selected.AbsoluteIndex = 19 then
    Menu_20Click(5)
  else if TreeOpcoes.Selected.AbsoluteIndex = 20 then
    Menu_21Click(6)
  else if TreeOpcoes.Selected.AbsoluteIndex = 21 then
    Menu_22Click(7)
  else if TreeOpcoes.Selected.AbsoluteIndex = 22 then
    Menu_23Click(18)
  else if TreeOpcoes.Selected.AbsoluteIndex = 23 then
    Menu_24Click(15)
  else if TreeOpcoes.Selected.AbsoluteIndex = 24 then
    Menu_25Click(16)
  else if TreeOpcoes.Selected.AbsoluteIndex = 25 then
    Menu_26Click(17)
  else if TreeOpcoes.Selected.AbsoluteIndex = 26 then
    Menu_27Click(20)
  else if TreeOpcoes.Selected.AbsoluteIndex = 28 then
    Menu_29Click(23)
  else if TreeOpcoes.Selected.AbsoluteIndex = 29 then
    Menu_30Click(24)
  else if TreeOpcoes.Selected.AbsoluteIndex = 30 then
    Menu_31Click(28)
  else if TreeOpcoes.Selected.AbsoluteIndex = 31 then
    Menu_32Click(25)
  else if TreeOpcoes.Selected.AbsoluteIndex = 32 then
    Menu_33Click(29)
  else if TreeOpcoes.Selected.AbsoluteIndex = 33 then
    Menu_34Click(30);
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormPrincipal.TreeOpcoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then  // Enter
    TreeOpcoesClick(Self);
end;

procedure TFormPrincipal.GradientePaint(Sender: TObject);
var
  RGBDesde, RGBHasta, RGBDif : array[0..2] of byte;  // Cor inicial e final - diferença de cores
  contador, Vermelho, Verde, Azul : integer;
  Banda : TRect;                                     // Coordenadas do requadro a pintar
  Factor : array[0..2] of shortint;                  // +1 se gradiente é crescente e -1 caso decrescente
  FColorDesde, FColorHasta: TColor;
  FDireccion: String;
begin
  FColorDesde := $002D4373;
  FColorHasta := $00D6E3EF;
  FDireccion  := 'H';                                // V=Vertical, H=Horizontal
  RGBDesde[0]:=GetRValue(ColorToRGB(FColorDesde));
  RGBDesde[1]:=GetGValue(ColorToRGB(FColorDesde));
  RGBDesde[2]:=GetBValue(ColorToRGB(FColorDesde));
  RGBHasta[0]:=GetRValue(ColorToRGB(FColorHasta));
  RGBHasta[1]:=GetGValue(ColorToRGB(FColorHasta));
  RGBHasta[2]:=GetBValue(ColorToRGB(FColorHasta));
  with TPaintBox(Sender) do
  begin
    for contador:=0 to 2 do                          // Calculo de RGBDif[] e factor[]
    begin
      RGBDif[contador]:=Abs(RGBHasta[contador]-RGBDesde[contador]);
      If RGBHasta[contador]>RGBDesde[contador] then factor[contador]:=1 else factor[contador]:=-1;
    end;
    Canvas.Pen.Style:=psSolid;
    Canvas.Pen.Mode:=pmCopy;
    if FDireccion = 'H' then
    begin
      Banda.Left:=0;
      Banda.Right:=Width;
      for contador:=0 to 255 do
      begin
        Banda.Top:=MulDiv(contador,height,256);
        Banda.Bottom:=MulDIv(contador+1,height,256);
        Vermelho:=RGBDesde[0]+factor[0]*MulDiv(contador,RGBDif[0],255);
        Verde:=RGBDesde[1]+factor[1]*MulDiv(contador,RGBDif[1],255);
        Azul:=RGBDesde[2]+factor[2]*MulDiv(contador,RGBDif[2],255);
        Canvas.Brush.Color:=RGB(Vermelho,Verde,Azul);
        Canvas.FillRect(Banda);
      end;
    end
    else if FDireccion = 'V' then
    begin
      Banda.Top:=0;
      Banda.Bottom:=Height;
      for contador:=0 to 255 do
      begin
        Banda.Left:=MulDiv(contador,width,256);
        Banda.Right:=MulDIv(contador+1,width,256);
        Vermelho:=RGBDesde[0]+factor[0]*MulDiv(contador,RGBDif[0],255);
        Verde:=RGBDesde[1]+factor[1]*MulDiv(contador,RGBDif[1],255);
        Azul:=RGBDesde[2]+factor[2]*MulDiv(contador,RGBDif[2],255);
        Canvas.Brush.Color:=RGB(Vermelho,Verde,Azul);
        Canvas.FillRect(Banda);
      end;
    end;
  end;
end;

procedure TFormPrincipal.BtnMinimizaClick(Sender: TObject);
begin
  if BtnMinimiza.Caption = '>' then
    PnOpcoes.Width := TAM_MENU_LATERAL // 141
  else
    PnOpcoes.Width := 30;
  PnOpcoesResize(Self);
end;

{40-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormPrincipal.Menu_3Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormContratoN,FormContratoN);
end;

procedure TFormPrincipal.Menu_4Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormInforme,FormInforme);
end;

procedure TFormPrincipal.Menu_5Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormTrocaContrato,FormTrocaContrato);
end;

procedure TFormPrincipal.Menu_7Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormFaturaN,FormFaturaN);
end;

procedure TFormPrincipal.Menu_8Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormOrdemCobranca,FormOrdemCobranca);
end;

procedure TFormPrincipal.Menu_9Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  FormREL_FATURATAB := TFormREL_FATURATAB.Create(Application);
  Try
    FormREL_FATURATAB.ShowModal;
  Finally
    FormREL_FATURATAB.Free;
  end;
end;

procedure TFormPrincipal.Menu_10Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  FormRel_Agente := TFormRel_Agente.Create(Application);
  Try
    FormRel_Agente.ShowModal;
  Finally
    FormRel_Agente.Free;
  end;
end;

procedure TFormPrincipal.Menu_11Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  FormREL_NF := TFormREL_NF.Create(Application);
  Try
    FormREL_NF.ShowModal;
  Finally
    FormREL_NF.Free;
  end;
end;

procedure TFormPrincipal.Menu_12Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  FormRel_ValorRecebi := TFormRel_ValorRecebi.Create(Application);
  Try
    FormRel_ValorRecebi.ShowModal;
  Finally
    FormRel_ValorRecebi.Free;
  end;
end;

procedure TFormPrincipal.Menu_13Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  FormRel_ValorFatura := TFormRel_ValorFatura.Create(Application);
  Try
    FormRel_ValorFatura.ShowModal;
  Finally
    FormRel_ValorFatura.Free;
  end;
end;

procedure TFormPrincipal.Menu_15Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormClienteN,FormClienteN);
end;

procedure TFormPrincipal.Menu_16Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormExportadorN,FormExportadorN);
end;

procedure TFormPrincipal.Menu_17Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormProdutos,FormProdutos);
end;

procedure TFormPrincipal.Menu_19Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormPaisN,FormPaisN);
end;

procedure TFormPrincipal.Menu_20Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormTbPorto,FormTbPorto);
end;

procedure TFormPrincipal.Menu_21Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormTbFormaPagament,FormTbFormaPagament);
end;

procedure TFormPrincipal.Menu_22Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormTbCondicaoCompr,FormTbCondicaoCompr);
end;

procedure TFormPrincipal.Menu_23Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;

end;

procedure TFormPrincipal.Menu_24Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormAtividades,FormAtividades);
end;

procedure TFormPrincipal.Menu_25Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormTbCategClienteN,FormTbCategClienteN);
end;

procedure TFormPrincipal.Menu_26Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormTbSitClientesN,FormTbSitClientesN);
end;

procedure TFormPrincipal.Menu_27Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  ExecutaForm(TFormParametro,FormParametro);
end;

procedure TFormPrincipal.Menu_29Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  FormINFOMECOMERCIAL := TFormINFOMECOMERCIAL.Create(Application);
  Try
    FormINFOMECOMERCIAL.ShowModal;
  Finally
    FormINFOMECOMERCIAL.Free;
  end;
end;

procedure TFormPrincipal.Menu_30Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  FormRESUMEN := TFormRESUMEN.Create(Application);
  Try
    FormRESUMEN.ShowModal;
  Finally
    FormRESUMEN.Free;
  end;
end;

procedure TFormPrincipal.Menu_31Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  FormRESUMENCONTRATA := TFormRESUMENCONTRATA.Create(Application);
  Try
    FormRESUMENCONTRATA.ShowModal;
  Finally
    FormRESUMENCONTRATA.Free;
  end;
end;

procedure TFormPrincipal.Menu_32Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  FormInfome := TFormInfome.Create(Application);
  Try
    FormInfome.ShowModal;
  Finally
    FormInfome.Free;
  end;
end;

procedure TFormPrincipal.Menu_33Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  FormRel_Diversos := TFormRel_Diversos.Create(Application);
  Try
    FormRel_Diversos.ShowModal;
  Finally
    FormRel_Diversos.Free;
  end;
end;

procedure TFormPrincipal.Menu_34Click(Opcao: Integer);
begin
  if not LiberaAcesso(Opcao) then
    Abort;
  FormRelSitucaoCred := TFormRelSitucaoCred.Create(Application);
  Try
    FormRelSitucaoCred.ShowModal;
  Finally
    FormRelSitucaoCred.Free;
  end;
end;

{99-Final do Bloco Modular. Modificações não serão preservadas}

{50-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormPrincipal.Mnu_2Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO101;
end;

procedure TFormPrincipal.Mnu_3Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO102;
end;

procedure TFormPrincipal.Mnu_5Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO103;
end;

procedure TFormPrincipal.Mnu_6Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO104;
end;

procedure TFormPrincipal.Mnu_7Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO105;
end;

procedure TFormPrincipal.Mnu_8Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO106;
end;

procedure TFormPrincipal.Mnu_10Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO107;
end;

procedure TFormPrincipal.Mnu_12Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  ExecutaForm(TFormContratoN,FormContratoN);
end;
procedure TFormPrincipal.Mnu_13Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormInfome := TFormInfome.Create(Application);
  Try
    FormInfome.ShowModal;
  Finally
    FormInfome.Free;
  end;
end;
procedure TFormPrincipal.Mnu_14Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  ExecutaForm(TFormTrocaContrato,FormTrocaContrato);
end;
procedure TFormPrincipal.Mnu_16Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  ExecutaForm(TFormFaturaN,FormFaturaN);
end;
procedure TFormPrincipal.Mnu_17Click(Sender: TObject);
// variáveis ...


begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  ExecutaForm(TFormOrdemCobranca,FormOrdemCobranca);
//  ExecutaForm(TFormFaturaTab,FormFaturaTab);
end;
procedure TFormPrincipal.Mnu_18Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormREL_FATURATAB := TFormREL_FATURATAB.Create(Application);
  Try
    FormREL_FATURATAB.ShowModal;
  Finally
    FormREL_FATURATAB.Free;
  end;
end;
procedure TFormPrincipal.Mnu_19Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormRel_Agente := TFormRel_Agente.Create(Application);
  Try
    FormRel_Agente.ShowModal;
  Finally
    FormRel_Agente.Free;
  end;
end;
procedure TFormPrincipal.Mnu_20Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormREL_NF := TFormREL_NF.Create(Application);
  Try
    FormREL_NF.ShowModal;
  Finally
    FormREL_NF.Free;
  end;
end;
procedure TFormPrincipal.Mnu_21Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormRel_ValorRecebi := TFormRel_ValorRecebi.Create(Application);
  Try
    FormRel_ValorRecebi.ShowModal;
  Finally
    FormRel_ValorRecebi.Free;
  end;
end;
procedure TFormPrincipal.Mnu_22Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormRel_ValorFatura := TFormRel_ValorFatura.Create(Application);
  Try
    FormRel_ValorFatura.ShowModal;
  Finally
    FormRel_ValorFatura.Free;
  end;
end;
procedure TFormPrincipal.Mnu_24Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  ExecutaForm(TFormClienteN,FormClienteN);
  


end;
procedure TFormPrincipal.Mnu_25Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormExportacao := TFormExportacao.Create(Application);
  Try
    FormExportacao.ShowModal;
  Finally
    FormExportacao.Free;
  end;
end;
procedure TFormPrincipal.Mnu_26Click(Sender: TObject);
// variáveis ...


begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
//  ExecutaForm(TFormProduto,FormProduto);
  ExecutaForm(TFormProdutos,FormProdutos);
end;
procedure TFormPrincipal.Mnu_28Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  ExecutaForm(TFormPaisN,FormPaisN);
end;
procedure TFormPrincipal.Mnu_29Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  ExecutaForm(TFormTbPorto,FormTbPorto);
end;
procedure TFormPrincipal.Mnu_30Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  ExecutaForm(TFormTbFormaPagament,FormTbFormaPagament);
end;
procedure TFormPrincipal.Mnu_31Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  ExecutaForm(TFormTbCondicaoCompr,FormTbCondicaoCompr);
end;
procedure TFormPrincipal.Mnu_33Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...

  ExecutaForm(TFormAtividades,FormAtividades);
end;
procedure TFormPrincipal.Mnu_34Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  ExecutaForm(TFormTbCategClienteN,FormTbCategClienteN);
end;
procedure TFormPrincipal.Mnu_35Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  ExecutaForm(TFormTbSitClientesN,FormTbSitClientesN);
end;
procedure TFormPrincipal.Mnu_36Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  ExecutaForm(TFormParametro,FormParametro);
end;
procedure TFormPrincipal.Mnu_38Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormINFOMECOMERCIAL := TFormINFOMECOMERCIAL.Create(Application);
  Try
    FormINFOMECOMERCIAL.ShowModal;
  Finally
    FormINFOMECOMERCIAL.Free;
  end;
end;
procedure TFormPrincipal.Mnu_39Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormRESUMEN := TFormRESUMEN.Create(Application);
  Try
    FormRESUMEN.ShowModal;
  Finally
    FormRESUMEN.Free;
  end;
end;
procedure TFormPrincipal.Mnu_40Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormRESUMENCONTRATA := TFormRESUMENCONTRATA.Create(Application);
  Try
    FormRESUMENCONTRATA.ShowModal;
  Finally
    FormRESUMENCONTRATA.Free;
  end;
end;
procedure TFormPrincipal.Mnu_41Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormInfome := TFormInfome.Create(Application);
  Try
    FormInfome.ShowModal;
  Finally
    FormInfome.Free;
  end;
end;
procedure TFormPrincipal.Mnu_42Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormRel_Diversos := TFormRel_Diversos.Create(Application);
  Try
    FormRel_Diversos.ShowModal;
  Finally
    FormRel_Diversos.Free;
  end;
end;
procedure TFormPrincipal.Mnu_43Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  FormRelSitucaoCred := TFormRelSitucaoCred.Create(Application);
  Try
    FormRelSitucaoCred.ShowModal;
  Finally
    FormRelSitucaoCred.Free;
  end;
end;
procedure TFormPrincipal.Mnu_45Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO120;
end;

procedure TFormPrincipal.Mnu_46Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO108;
end;

procedure TFormPrincipal.Mnu_47Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO109;
end;

procedure TFormPrincipal.Mnu_48Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO110;
end;

procedure TFormPrincipal.Mnu_50Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO121;
end;

procedure TFormPrincipal.Mnu_76Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO112;
end;

procedure TFormPrincipal.Mnu_77Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO113;
end;

procedure TFormPrincipal.Mnu_78Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO114;
end;

procedure TFormPrincipal.Mnu_79Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO115;
end;

procedure TFormPrincipal.Mnu_80Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO116;
end;

procedure TFormPrincipal.Mnu_82Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO117;
end;

procedure TFormPrincipal.Mnu_83Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO118;
end;

procedure TFormPrincipal.Mnu_85Click(Sender: TObject);
begin
  if not LiberaAcesso(TMenuItem(Sender).Tag, 1) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO119;
end;

procedure TFormPrincipal.Bar_2Click(Sender: TObject);
begin
  if not LiberaAcesso(TToolButton(Sender).Tag, 2) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO106;
end;

procedure TFormPrincipal.Bar_3Click(Sender: TObject);
// variáveis ...

begin
  if not LiberaAcesso(TToolButton(Sender).Tag, 2) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  
  // ExecutaForm(TFormFaturaTab,FormFaturaTab);
  
  ExecutaForm(TFormOrdemCobranca,FormOrdemCobranca);
end;
procedure TFormPrincipal.Bar_5Click(Sender: TObject);
begin
  if not LiberaAcesso(TToolButton(Sender).Tag, 2) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO108;
end;

procedure TFormPrincipal.Bar_6Click(Sender: TObject);
begin
  if not LiberaAcesso(TToolButton(Sender).Tag, 2) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO109;
end;

procedure TFormPrincipal.Bar_7Click(Sender: TObject);
begin
  if not LiberaAcesso(TToolButton(Sender).Tag, 2) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO110;
end;

procedure TFormPrincipal.Bar_8Click(Sender: TObject);
begin
  if not LiberaAcesso(TToolButton(Sender).Tag, 2) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO121;
end;

procedure TFormPrincipal.Bar_10Click(Sender: TObject);
begin
  if not LiberaAcesso(TToolButton(Sender).Tag, 2) then  // usuário possui acesso ?
    Abort;  // acesso negado, retorna ...
  INTERNO107;
end;

{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
  log_cms := TLogPrograma.Create()  ;
end;

end.
