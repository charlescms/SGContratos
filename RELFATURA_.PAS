{
   Programa.: RELFATURA.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
   concluido 08/06/2011
   
}
unit RELFATURA;

interface

{$I Princ.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,  DateUtils,
  StdCtrls, Buttons, ExtCtrls, BaseD, Atributo, Tabela, Menus, Calculos, db,
  {$I LTab.pas}
  XLookUp, XDBDate, Mask, XDate, XEdit, XNum, FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Tabs, comctrls, XBanner, checklst, Grids, DBGrids, DBCtrls,
  IBCustomDataSet, IBQuery, RXDBCtrl, XDBNum, XDBEdit;

// const
//  NOVA_LINHA = CHR(13)+CHR(10) ;
//  // select distinct SUBSTRING( NumFatura from 1 for 4 ) || '/' || SUBSTRING( NumFatura from 5 for 8 ) AS  CAMPOS from  ExportadoTransito WHERE NumFatura IS NOT NULL
//  MSG_DescontonaopodeserIncluidoFaturaembranco = 'O Desconto não pode ser Incluido. '+NOVA_LINHA+'O número da Fatura esta em branco !' ;

type
  TFormRELFATURA = class(TForm)
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    Btn_GetFat: TBitBtn;
    Btn_grava: TBitBtn;
    Btn_imprime: TBitBtn;
    BtnCancelar: TBitBtn;
    BtnVisualizar: TBitBtn;
    Divisao: TTabSet;
    frDBDataSet: TfrDBDataSet;
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Selecao_1: TScrollBox;
    XNumE_desconto: TXNumEdit;
    XNumE_fatura: TMaskEdit;
    XNumE_Final: TXNumEdit;
    XNumE_Inicial: TXNumEdit;
    GBox_Exportador: TGroupBox;
    PageControl_Fat: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GBox_Fatura: TGroupBox;
    GBox_Prod: TGroupBox;
    GBox_desconto: TGroupBox;
    GBox_Total: TGroupBox;
    DBNavProd: TDBNavigator;
    DBNavDescontos: TDBNavigator;
    DBGridDescontos: TDBGrid;
    DBGrid_Prod: TDBGrid;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    XNumEd_Prod: TXNumEdit;
    XNumDesc: TXNumEdit;
    XNumEd_geral: TXNumEdit;
    DS_Fatura: TDataSource;
    DS_Descontos: TDataSource;
    CmbBox_Fatura_Inicial: TComboBox;
    GroupBox_cont: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    CmbBox_Fatura_Final: TComboBox;
    DComplementoFatura22: TIBQuery;
    DComplementoFatura22SEQ: TIntegerField;
    DComplementoFatura22NUMFATURA: TIBStringField;
    DComplementoFatura22OBSERVACAO: TIBStringField;
    DComplementoFatura22VALOR: TFloatField;
    BitBtn1: TBitBtn;
    GroupBox_FATURA: TGroupBox;
    DBNavFatura: TDBNavigator;
    DS_FaturaTab: TDataSource;
    RxDBGrid_Fatura: TDBGrid;
    GB_Fatura: TGroupBox;
    LbcComentario: TLabel;
    LbcVALOR_NF_LIQ: TLabel;
    LbcVALOR_PIS_COF: TLabel;
    LbcVALOR_IRRF: TLabel;
    LbcVALOR_NF: TLabel;
    LbcDataNF: TLabel;
    LbcNumNFEmit: TLabel;
    LbcNumFatura: TLabel;
    LbcCadastro: TLabel;
    LbcStatus: TLabel;
    LbcDataFatura: TLabel;
    LbcCTTO: TLabel;
    LbcValor: TLabel;
    LbcValorDesconto: TLabel;
    LbcVALOR_LIQ: TLabel;
    CTTO: TXDBEdit;
    Comentario: TDBMemo;
    NumNFEmit: TXDBNumEdit;
    DataNF: TXDBDateEdit;
    VALOR_NF: TXDBNumEdit;
    VALOR_IRRF: TXDBNumEdit;
    VALOR_PIS_COF: TXDBNumEdit;
    VALOR_NF_LIQ: TXDBNumEdit;
    NumFatura: TXDBEdit;
    Cadastro: TXDBDateEdit;
    Status: TDBComboBox;
    DataFatura: TXDBDateEdit;
    Valor: TXDBNumEdit;
    ValorDesconto: TXDBNumEdit;
    VALOR_LIQ: TXDBNumEdit;
    BitBtn_NotaFiscal: TBitBtn;
    GB_nfiscal: TGroupBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Recebimento: TXDBDateEdit;
    LbcRecebimento: TLabel;
    DataProtesto: TXDBDateEdit;
    LbcDataProtesto: TLabel;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnFecharClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BtnVisualizarClick(Sender: TObject);
    procedure FuncoesExtras(const Name: String; p1, p2, p3: Variant;
      var Val: String);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_GetFatClick(Sender: TObject);
    procedure Btn_gravaClick(Sender: TObject);
    procedure XNumE_InicialBtnClick(Sender: TObject);
    procedure XNumE_FinalBtnClick(Sender: TObject);
    procedure Btn_imprimeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DS_FaturaDataChange(Sender: TObject; Field: TField);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn_NotaFiscalClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StatusDrawItem(Control: TWinControl; Index: Integer;Rect: TRect; State: TOwnerDrawState);


  private
    ListaCamposED: TListaCampos; {Conterá a lista de campos em edição na ED}
    s_Pfiltro : string ;
    ENDERECO_EXP: TStringList;
//    s_filtro : string;
//    ENDERECO_REL: string;;
//    TEXTO_PADRAO: string;

    { Private declarations }
    QyRelatorio: TTabela;
    {02-Início do Bloco Modular. Modificações não serão preservadas}
    DFatura: TDFatura;
    procedure CalculosDFatura(DataSet: TDataSet);
    procedure AtualizaDetalhe_DFatura(Sender: TObject; Field: TField);
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure ConstroiSql;
    procedure InicializaVariaveis;
    procedure Parametros(Tabela: TTabela);
    procedure ConstroiSql_NOVO;
    procedure Get_End_Export(i_cod: integer );

    procedure Incluir_Desconto(DataSet: TDataSet);
//    procedure Valida_Desconto(DataSet: TDataSet);

    procedure Atualiza_totais() ;
    procedure ValidaColunaGrid(Sender: TField);
    function AbandonandoEdicao: Boolean;
    procedure ApagaFaturaemProdExp(DataSet: TDataSet);
  public
    { Public declarations }

    {03-Início do Bloco Modular. Modificações não serão preservadas}



    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure EXIBIR_REL;
    procedure set_cod_exportador(cod_ini, cod_final : integer );
    procedure set_filtro(sl_filtro : string );
    procedure set_Fatura(sl_FaturaInicial,sl_FaturaFinal : string );
//    function  Get_Fatura( ) : string ;

  end;

var
  FormRELFATURA: TFormRELFATURA;

implementation

{$R *.DFM}


uses Publicas, Princ, Rotinas, Abertura, GridPesquisa, Interno, RotinaEd, UCMS_CONST;

// apara o numero da fatura e da nfiscal dos processos exportados
procedure TFormRELFATURA.ApagaFaturaemProdExp(DataSet: TDataSet);
var
  sNumFatura, sValor: string ;
  iNumNFEmit  : integer ;
begin
  if MessageDlg( MSG_ConfirmaExcluirFatura ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     sNumFatura := TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo  ;
     iNumNFEmit := TabGlobal.DOrdemCobranca.NumNFEmit.Conteudo  ;
     // TabGlobal.DExportadoTransito
     // sContrato  := TabGlobal.DFaturaProdExp.Contrato.Conteudo   ;
     // svalor := '0' ;
     PTabela(TabGlobal.DExportadoTransito, ['NumNFEmit'],[iNumNFEmit], 'NumNFEmit = 0 ' )  ;

   //  PTabela(TabGlobal.DExportadoTransito, ['ValorConvertido'] , ExpressaoFiltro: String; var ValoresRetornar: Variant): Boolean; overload;

   //  PTabela(TabGlobal.DExportadoTransito, ['NumFatura'],[sNumFatura],sValor)  ;


    // sValor := '''' ;
     PTabela(TabGlobal.DExportadoTransito, ['NumFatura'],[sNumFatura],'NumFatura = '' ')  ;

     {
     while not TabGlobal.DFaturaProdExp.Eof do begin

         TabGlobal.DFaturaProdExp.Next ;
     end;
     }
  end;

end;

procedure TFormRELFATURA.set_filtro(sl_filtro : string );
begin
  s_Pfiltro := sl_filtro ;
end ;

procedure TFormRELFATURA.ConstroiSql;
var
  s_filtro, n_fatura : string ;
begin

  s_filtro := '';
  if XNumE_Inicial.ValueInt > 0 then
     s_filtro := ' (ContratoTransporte.FORCOD >= '+inttostr(XNumE_Inicial.ValueInt)+') ' ;

  if XNumE_Final.ValueInt > 0 then
     if s_filtro = '' then
        s_filtro := ' (ContratoTransporte.FORCOD <= '+inttostr(XNumE_Final.ValueInt)+') '
     else
        s_filtro := s_filtro + ' and  (ContratoTransporte.FORCOD <= '+inttostr(XNumE_Final.ValueInt)+') ' ;

  IF CmbBox_Fatura_Inicial.Text <> '' THEN BEGIN
     n_fatura :=  ( trim (copy(CmbBox_Fatura_Inicial.Text,1,4))+ trim(copy(CmbBox_Fatura_Inicial.Text,6,4))) ;
     if s_filtro = '' then
        s_filtro := ' Fatura.NumFatura >= ' + AtribuiAspas(n_fatura)
     else
        s_filtro := s_filtro +  ' AND  Fatura.NumFatura >= ' + AtribuiAspas(n_fatura) ;
  END;

  IF CmbBox_Fatura_Final.Text <> '' THEN BEGIN
     n_fatura := ( trim (copy(CmbBox_Fatura_Final.Text,1,4))+ trim(copy(CmbBox_Fatura_Final.Text,6,4))) ;
     if s_filtro = '' then
        s_filtro := ' Fatura.NumFatura <= '+AtribuiAspas(n_fatura )
     else
        s_filtro := s_filtro +  ' AND  Fatura.NumFatura <= ' + AtribuiAspas(n_fatura) ;
  END;

  {04-Início do Bloco Modular. Modificações não serão preservadas}
  DFatura.Filtro.Clear;
  DFatura.Filtro.Add('(ContratoTransporte.FORCOD >= :ComboBox1)');
  DFatura.Filtro.Add('AND (ContratoTransporte.FORCOD <= :ComboBox2)');
  DFatura.AtualizaSql(False);
  Parametros(DFatura);
  DFatura.Open;
  frDBDataSet.DataSet := DFatura;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  DFatura.close ;
  DFatura.Filtro.Clear;
  DFatura.Filtro.Add(s_filtro);
  DFatura.AtualizaSql(False);
  Parametros(DFatura);
  DFatura.Open;
  atualiza_totais() ;
  frDBDataSet.DataSet := DFatura;

end;

procedure TFormRELFATURA.atualiza_totais()    ;
var
  n_fatura : Double ;
begin
  n_fatura := 0;
  DFatura.First ;

  while not DFatura.Eof do begin
     n_fatura := n_fatura + DFatura.ValorConvertido.Conteudo ;
     DFatura.Next ;
  end;

  DFatura.First ;
  XNumEd_Prod.Value := n_fatura ;
  XNumEd_geral.Value :=  XNumEd_Prod.Value + XNumDesc.Value ;

end;


procedure TFormRELFATURA.ConstroiSql_NOVO;
var
  I: Integer;
begin

//  DFatura.Filtro.Clear;
  DFatura.AtualizaSql(False);
  Parametros(DFatura);
  DFatura.Open;
  atualiza_totais() ;
  frDBDataSet.DataSet := DFatura;

end;



procedure TFormRELFATURA.Parametros(Tabela: TTabela);
var
  I: Integer;
  Classe,Nome: String;
begin
  for I:=0 to Self.ComponentCount-1 do
  begin
    Nome := Self.Components[I].Name;
    if Tabela.Params.FindParam(Nome) <> nil then
    begin
      Classe := UpperCase(Self.Components[I].ClassName);
      if Classe = 'TLISTBOX' then
        Tabela.ParamByName(Nome).Value := TListBox(Self.Components[I]).Items[TListBox(Self.Components[I]).ItemIndex]
      else if Classe = 'TEDIT' then
        Tabela.ParamByName(Nome).Value := TEdit(Self.Components[I]).Text
      else if Classe = 'TCOMBOBOX' then
        Tabela.ParamByName(Nome).Value := TComboBox(Self.Components[I]).Text
      else if Classe = 'TCHECKBOX' then
        Tabela.ParamByName(Nome).Value := TCheckBox(Self.Components[I]).Checked
      else if Classe = 'TRADIOGROUP' then
        Tabela.ParamByName(Nome).Value := TRadioGroup(Self.Components[I]).Items[TRadioGroup(Self.Components[I]).ItemIndex]
      else if Classe = 'TCHECKLISTBOX' then
        Tabela.ParamByName(Nome).Value := TCheckListBox(Self.Components[I]).Items[TCheckListBox(Self.Components[I]).ItemIndex]
      else if Classe = 'TXDATEEDIT' then
        Tabela.ParamByName(Nome).AsDate := TXDateEdit(Self.Components[I]).DateValue
      else if Classe = 'TXEDIT' then
        Tabela.ParamByName(Nome).Value := TXEdit(Self.Components[I]).Text
      else if Classe = 'TXNUMEDIT' then
        Tabela.ParamByName(Nome).Value := TXNumEdit(Self.Components[I]).Value;
    end;
  end;
end;

procedure TFormRELFATURA.FormShow(Sender: TObject);
Var
  I : Integer;
begin
  ListaCamposED      := TListaCampos.Create;

//  Status.DataSource := DS_FaturaTab ;
//  Status.DataField := 'Status';

//  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.Status, -2, StatusExit, StatusDrawItem, ListaCamposEd, FormRELFATURA, DS_FaturaTab, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.Status        , -1, Nil, StatusDrawItem, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.Recebimento   , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.DataProtesto  , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.VALOR_NF_LIQ  , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.VALOR_PIS_COF , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.VALOR_IRRF    , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.VALOR_NF      , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.Comentario    , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.DataNF        , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.NumNFEmit     , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.VALOR_LIQ     , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.ValorDesconto , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.Valor         , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.CTTO          , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.DataFatura    , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.Cadastro      , -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobranca, TabGlobal.DOrdemCobranca.NumOrdCobranca, -1, Nil, Nil, ListaCamposEd, FormRELFATURA, DS_FaturaTab, nil);

  {

    CTTO.DataSource := DS_FaturaTab ;
    CTTO.DataField  := 'CTTO';
    Comentario.DataSource := DS_FaturaTab ;
    Comentario.DataField := 'Comentario' ;
    NumNFEmit.DataSource := DS_FaturaTab ;
    NumNFEmit.DataField := 'NumNFEmit';
    DataNF.DataSource := DS_FaturaTab ;
    DataNF.DataField := 'DataNF' ;
    VALOR_NF.DataSource := DS_FaturaTab ;
    VALOR_NF.DataField := 'VALOR_NF';
    VALOR_IRRF.DataSource := DS_FaturaTab ;
    VALOR_IRRF.DataField := 'VALOR_IRRF';
    VALOR_PIS_COF.DataSource := DS_FaturaTab ;
    VALOR_PIS_COF.DataField := 'VALOR_PIS_COF';
    VALOR_NF_LIQ.DataSource := DS_FaturaTab ;
    VALOR_NF_LIQ.DataField := 'VALOR_NF_LIQ' ;
    NumFatura.DataSource := DS_FaturaTab ;
    NumFatura.DataField := 'NumFatura' ;
    Cadastro.DataSource := DS_FaturaTab ;
    Cadastro.DataField := 'Cadastro';

    Status.DataSource := DS_FaturaTab ;
    Status.DataField := 'Status';

    DataFatura.DataSource := DS_FaturaTab ;
    DataFatura.DataField := 'DataFatura' ;

    Valor.DataSource := DS_FaturaTab ;
    Valor.DataField := 'Valor';
    ValorDesconto.DataSource := DS_FaturaTab ;
    ValorDesconto.DataField := 'ValorDesconto';
    VALOR_LIQ.DataSource := DS_FaturaTab ;
    VALOR_LIQ.DataField := 'VALOR_LIQ';
    Recebimento.DataSource := DS_FaturaTab ;
    Recebimento.DataField := 'Recebimento';
    DataProtesto.DataSource := DS_FaturaTab ;
    DataProtesto.DataField := 'DataProtesto';

   }

  TabGlobal.DOrdemCobranca.AfterDelete := ApagaFaturaemProdExp ;
  DS_FaturaTab.DataSet := TabGlobal.DOrdemCobranca ;
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Fatura';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {0_6-Início do Bloco Modular. Modificações não serão preservadas}
//  DFatura := TDFatura.Create(Self);
  IF s_Pfiltro <> '' THEN BEGIN
     DFatura.Close ;
     DFatura.Filtro.Clear ;
     DFatura.Filtro.Add(s_Pfiltro);
  END;

  DFatura.AtualizaSql;
  DOrdemCobrancaDescont.AtualizaSql;

  atualiza_totais();

  DFatura.OnCalcFields := CalculosDFatura;
  DFatura.DataSource.OnDataChange := AtualizaDetalhe_DFatura;
  QyRelatorio := DFatura;
  {9_9-Final do Bloco Modular. Modificações não serão preservadas}


//  BtnAjuda.Visible  := False;
//  BtnFechar.Visible := False;
  FormResize(Self);
  frReport.OnUserFunction := FuncoesExtras;
  Btn_GetFat.Hint  := 'Gerar o número da Fatura Surimpex';
  Btn_imprime.Hint := 'Imprime direto para Impressora';
  Btn_grava.Hint   := 'Grava Fatura e desconto';
  PageControl_Fat.Align := alClient ;

  Carrega_CB(CmbBox_Fatura_Inicial,CmbBox_Fatura_Final,'select distinct SUBSTRING( NumFatura from 1 for 4 ) || ''/'' || SUBSTRING( NumFatura from 5 for 8 ) AS  CAMPOS from  ExportadoTransito WHERE NumFatura IS NOT NULL', 'CAMPOS',SELF);


//  GBox_desconto.Height := (( TabSheet2.Height - GBox_Total.Height ) div 2 );
  GroupBox_FATURA.Align := alTop ;
  GBox_Prod.Align := alClient ;
  GBox_Total.Align := alBottom ;
  GBox_desconto.Align := alBottom;
  


  DBNavProd.Align := alTop ;
  DBGrid_Prod.Align := alClient ;

  DBNavDescontos.Align := alTop ;
  DBGridDescontos.Align := alClient ;

  DBNavFatura.Align := alTop ;
  RxDBGrid_Fatura.Align := alClient ;

//DS_Fatura.DataSet := DFatura ;

  DS_Fatura.DataSet     := TabGlobal.DOrdemCobrancaProdExp ; // FaturaProdExp ;
  DS_Descontos.DataSet  := DOrdemCobrancaDescont ;
  DS_FaturaTab.DataSet  := TabGlobal.DOrdemCobranca ;

  frDBDataSet_DComplementoFatura.DataSet := DOrdemCobrancaDescont ;

  // TabGlobal.DOrdemCobranca.AtualizaSql;

//  AtribuiGridEdicao(TabGlobal.DOrdemCobranca    , RxDBGrid_Fatura , True, ValidaColunaGrid);
  AtribuiGridEdicao(DOrdemCobrancaDescont      , DBGridDescontos , True, ValidaColunaGrid);
  AtribuiGridEdicao(TabGlobal.DOrdemCobrancaProdExp, DBGrid_Prod     , True, ValidaColunaGrid);

  Btn_grava.Hint := 'Aplicar número Fatura a produtos Exportador';
  BitBtn_NotaFiscal.Hint := 'Aplicar número Nota Fiscal a produtos Exportador';
  RxDBGrid_Fatura.Align := alClient ;


  GB_Fatura.Enabled := FALSE ;
  GB_nfiscal.Enabled := FALSE ;

end;

procedure TFormRELFATURA.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormRELFATURA.InicializaVariaveis;
begin
  frVariables['Titulo']       := Sistema.Titulo;
  frVariables['Versao']       := Sistema.Versao;
  frVariables['Analista']     := Sistema.Analista;
  frVariables['Programador']  := Sistema.Programador;
  frVariables['Projetista']   := Sistema.Projetista;
  frVariables['EstiloData']   := Sistema.EstiloData;
  frVariables['SenhaInicial'] := Sistema.SenhaInicial;
  frVariables['Pasta']        := Sistema.Pasta;
  frVariables['Usuario']      := Sistema.Usuario;
  frVariables['Senha']        := Sistema.Senha;
  frVariables['Master']       := Sistema.Master;
  frVariables['Grupo']        := Sistema.Grupo;
  frVariables['NumeroUsr']    := Sistema.NumeroUsr;
  frVariables['EmpresaUsr']   := Sistema.EmpresaUsr;
  frVariables['EnderecoUsr']  := Sistema.EnderecoUsr;
  frVariables['BairroUsr']    := Sistema.BairroUsr;
  frVariables['CidadeUsr']    := Sistema.CidadeUsr;
  frVariables['UfUsr']        := Sistema.UfUsr;
  frVariables['CEPUsr']       := Sistema.CEPUsr;
  frVariables['CNPJUsr']      := Sistema.CNPJUsr;
  frVariables['IEUsr']        := Sistema.IEUsr;
  frVariables['FonesUsr']     := Sistema.FonesUsr;
  frVariables['LogoUsr']      := Sistema.LogoUsr;
  frVariables['Titulo_1']     := Caption;
  frVariables['Titulo_2']     := '';

  // NOVAS VARIAVEIS        ENDERECO_EXP
  frVariables['ENDERECO_EXP']     := ENDERECO_EXP.Text;
  frVariables['ENDERECO_REL']     := TabGlobal.DPARAMETROS.ENDERECOEMPRESA.Conteudo.Text;
  frVariables['TEXTO_PADRAO']     := TabGlobal.DPARAMETROS.TEXTOFATURA.Conteudo.Text;

  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormRELFATURA.BtnVisualizarClick(Sender: TObject);
begin

  IF XNumE_Inicial.ValueInt > 0 THEN
     Get_End_Export(XNumE_Inicial.ValueInt);

  ConstroiSql;
  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório

end;

procedure TFormRELFATURA.EXIBIR_REL;
begin
  frReport.OnUserFunction := FuncoesExtras;
  ConstroiSql_NOVO;
  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
  QyRelatorio.Close;
end;

procedure TFormRELFATURA.FormResize(Sender: TObject);
var
  i_tam : integer ;
begin
//  BtnAjuda.Left  := ShapeSup.Width - 37;
//  BtnFechar.Left := ShapeSup.Width - 19;

  i_tam :=  ( ( PageControl_Fat.Width - GBox_Exportador.Width ) div 2 ) ;
  GBox_Exportador.Left := i_tam  ;
  GBox_Fatura.Left := i_tam ;
  GroupBox_cont.Left := i_tam ;
end;

procedure TFormRELFATURA.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFormRELFATURA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ListaCamposED.Free;
  ENDERECO_EXP.Free ;
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  DFatura.Free;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

{08-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormRELFATURA.CalculosDFatura(DataSet: TDataSet);
begin
end;

procedure TFormRELFATURA.AtualizaDetalhe_DFatura(Sender: TObject;
  Field: TField);
begin
end;
{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormRELFATURA.FuncoesExtras(const Name: String; p1, p2,
  p3: Variant; var Val: String);
begin
  if frParser.Calc(p1) = null then
    exit;
  if Name = 'MASCVALOR' then
    Val := '''' + MascValor(frParser.Calc(p1),frParser.Calc(p2)) + ''''
  else if Name = 'CONSTSTR' then
    Val := '''' + ConstStr(frParser.Calc(p1),frParser.Calc(p2)) + ''''
  else if Name = 'RETIRABRANCOS' then
    Val := '''' + RetiraBrancos(frParser.Calc(p1)) + ''''
  else if Name = 'PADR' then
    Val := '''' + PadR(frParser.Calc(p1),frParser.Calc(p2)) + ''''
  else if Name = 'PADL' then
    Val := '''' + PadL(frParser.Calc(p1),frParser.Calc(p2)) + ''''
  else if Name = 'CENTER' then
    Val := '''' + Center(frParser.Calc(p1),frParser.Calc(p2)) + ''''
  else if Name = 'SPACE' then
    Val := '''' + Space(frParser.Calc(p1)) + ''''
  else if Name = 'POREXTENSO' then
    Val := '''' + PorExtenso(frParser.Calc(p1)) + ''''
  else if Name = 'STRZERO' then
    Val := '''' + StrZero(frParser.Calc(p1),frParser.Calc(p2)) + ''''
  else if Name = 'FORMATMASKTEXT' then
    Val := '''' + FormatMaskText(frParser.Calc(p1),frParser.Calc(p2)) + ''''
  else if Name = 'MASCTEXTO' then
    Val := '''' + MascTexto(frParser.Calc(p1),frParser.Calc(p2)) + ''''
  else if Name = 'MASCDATA' then
    Val := '''' + FormatDateTime(frParser.Calc(p2),frParser.Calc(p1)) + ''''
  else if Name = 'CALCC_0' then
    Val := '''' + FloatToStr(CalcC(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3),0)) + ''''
  else if Name = 'CALCC_1' then
    Val := '''' + FloatToStr(CalcC(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3),1)) + ''''
  else if Name = 'CALCC_2' then
    Val := '''' + FloatToStr(CalcC(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3),2)) + ''''
  else if Name = 'CALCC_3' then
    Val := '''' + FloatToStr(CalcC(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3),3)) + ''''
  else if Name = 'CALCC_4' then
    Val := '''' + FloatToStr(CalcC(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3),4)) + ''''
  else if Name = 'CALCC_5' then
    Val := '''' + FloatToStr(CalcC(frParser.Calc(p1),frParser.Calc(p2),frParser.Calc(p3),5)) + ''''
end;

procedure TFormRELFATURA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then   // Calendário
    Interno108
  else if Key = VK_F6 then // Calculadora
    Interno109
  else if Key = VK_F7 then // Agenda
    Interno110;
end;
{
function  TFormRELFATURA.Get_Fatura():string ;
var
   i_ano, i_seq  : integer  ;
   s_faturnaNova, s_faturnaGrava : string  ;
begin
   // recupera o ano
   i_ano := strtoint (copy ( TabGlobal.DPARAMETROS.NumFatura.ValorString , 1, 4)) ;
   // recupera a seq
   i_seq := strtoint (copy ( TabGlobal.DPARAMETROS.NumFatura.ValorString , 5, 4)) + 1 ;
   // determina mudanca de ano
   if i_ano < YearOf(date) then
      i_ano :=  YearOf(date) ;
   // transforma em um unic numero
   // s_faturnaNova  := trim(StrZero( i_seq ,4 )) + '/'+trim(inttostr( i_ano ))  ;
   
   s_faturnaNova  := trim(StrZero( i_seq ,4 )) + trim(inttostr( i_ano ))  ;

   s_faturnaGrava := trim(inttostr( i_ano )) + trim(StrZero( i_seq ,4 ))  ;

   TabGlobal.DPARAMETROS.Modifica ;
   TabGlobal.DPARAMETROS.NumFatura.Conteudo := strtoint (s_faturnaGrava );
   TabGlobal.DPARAMETROS.Salva ;

   Get_Fatura := s_faturnaNova ;

end;
}
procedure TFormRELFATURA.Btn_GetFatClick(Sender: TObject);
var
   i_ano, i_seq  : integer  ;
   s_faturnaNova, s_faturnaGrava : string  ;
begin

   s_faturnaNova := Get_NumOrdCobranca() ; //Get_Fatura();
   // recupera o ano
   i_ano := strtoint (copy ( s_faturnaNova , 1, 4)) ;
   // recupera a seq
   i_seq := strtoint (copy ( s_faturnaNova , 5, 4))  ;
   // determina mudanca de ano
   if i_ano < YearOf(date) then
      i_ano :=  YearOf(date) ;
   // transforma em um unic numero
   s_faturnaNova  := trim(StrZero( i_seq ,4 )) + '/' + trim(inttostr( i_ano ))  ;
   XNumE_fatura.Text := (s_faturnaNova );

end;

procedure TFormRELFATURA.Btn_gravaClick(Sender: TObject);
var
    s_titulo : string  ;
begin

if MessageDlg( MSG_ConfirmaAtualizaroNumerodeFaturaemtodasosregistrosselecionadosjaExportados ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin

//  s_titulo := LbTituloForm.Caption ;
  Screen.Cursor := crHourGlass      ;
//  LbTituloForm.Caption := LbTituloForm.Caption + 'Gravando Fatura' ;
  Refresh ;

  TabGlobal.DFatura.First ;
  // para todos os registro gravar
  while NOT TabGlobal.DFatura.Eof do begin
    if (( TabGlobal.DFatura.State <>  dsEdit)    and
        (TabGlobal.DFatura.State  <>  dsinsert)) then
         TabGlobal.DFatura.Modifica ;

    if TabGlobal.DFatura.NumOrdCobranca.Conteudo = '' then begin
//     TabGlobal.DFatura.NumFatura.Conteudo := copy(XNumE_fatura.Text,1,4)+ copy(XNumE_fatura.Text,6,4) ; //+  XNumE_fatura.ValueInt ;
       TabGlobal.DFatura.NumOrdCobranca.Conteudo     := TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo ;
       TabGlobal.DFatura.ValorDesconto.Conteudo := TabGlobal.DOrdemCobranca.ValorDesconto.Conteudo ; // XNumE_desconto.Value ;
       TabGlobal.DFatura.Status.Conteudo        := s_ST_FA_F ;
       TabGlobal.DFatura.DataOrdCobranca.Conteudo    := date ;
    end;
  
  
    TabGlobal.DFatura.Salva ;
    TabGlobal.DFatura.Next ;
  end;

  // alterea o status da fatura
  TabGlobal.DOrdemCobranca.Modifica;
  TabGlobal.DOrdemCobranca.Status.Conteudo :=   s_ST_FA_F ;
  TabGlobal.DOrdemCobranca.Salva;

  // INCLUIR NA LISTA DE FATURA O NOVO NUMERO
  CmbBox_Fatura_Inicial.Items.Add( XNumE_fatura.Text )  ;
  CmbBox_Fatura_Final.Items.Add( XNumE_fatura.Text )  ;
  // ATRIBUIR AO METO TEXT O NOVO MUNERO PARA A FILTRO
  CmbBox_Fatura_Inicial.Text :=  XNumE_fatura.Text   ;
  CmbBox_Fatura_Final.Text := XNumE_fatura.Text  ;


  // TabGlobal.DFatura.NumFatura.Conteudo


  ConstroiSql ;

  Screen.Cursor := crDefault ;
//  LbTituloForm.Caption := s_titulo ;

  Refresh ;
end;
end;

procedure TFormRELFATURA.XNumE_InicialBtnClick(Sender: TObject);
begin
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    FormGridPesquisa.Atalho := VK_F8;
//    FormGridPesquisa.Campo  := TabGlobal.DFornecedores.FORCOD;
    FormGridPesquisa.Campo  := TabGlobal.DFatura.FORCOD;
    FormGridPesquisa.Avulso := True;
    if FormGridPesquisa.ShowModal = mrOk then
       XNumE_Inicial.ValueInt := FormGridPesquisa.Resultado;
  Finally
    FormGridPesquisa.Free;
  end;

end;

procedure TFormRELFATURA.XNumE_FinalBtnClick(Sender: TObject);
begin
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    FormGridPesquisa.Atalho := VK_F8;
//    FormGridPesquisa.Campo  := TabGlobal.DFornecedores.FORCOD;
    FormGridPesquisa.Campo  := TabGlobal.DFatura.FORCOD;
    FormGridPesquisa.Avulso := True;
    if FormGridPesquisa.ShowModal = mrOk then
       XNumE_Final.ValueInt := FormGridPesquisa.Resultado;
  Finally
    FormGridPesquisa.Free;
  end;

end;

procedure TFormRELFATURA.set_cod_exportador(cod_ini, cod_final : integer );
begin
    XNumE_Inicial.ValueInt := cod_ini;
    XNumE_Final.ValueInt  := cod_final;
end;

procedure TFormRELFATURA.Btn_imprimeClick(Sender: TObject);
begin
  ConstroiSql;
  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowPreparedReport ;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
  QyRelatorio.Close;

end;

procedure TFormRELFATURA.Get_End_Export(i_cod: integer );
var
  t_tmp : TTabela;
begin
  t_tmp := TTabela.Create(nil);
  t_tmp.DataBase := DFatura.DataBase ;
  t_tmp.Transaction := DFatura.Transaction ;
  t_tmp.SQL.Clear ;
  t_tmp.SQL.Add('SELECT  FORNECEDORES.ENDERECO , FORNECEDORES.CID , TAB_PAIS.NOME FROM  FORNECEDORES , TAB_PAIS WHERE  FORNECEDORES.ID = TAB_PAIS.ID  and FORNECEDORES.FORCOD = ' + inttostr(i_cod) );
  t_tmp.Open ;
  ENDERECO_EXP.Clear ;
  ENDERECO_EXP.Add(t_tmp.FieldValues['ENDERECO'] ) ;
  ENDERECO_EXP.Add(t_tmp.FieldValues['CID'] + t_tmp.FieldValues['NOME'] ) ;
  t_tmp.close ;
  t_tmp.Free ;
end;

procedure TFormRELFATURA.FormCreate(Sender: TObject);
begin
  // CRIACAO DE TABELAS

  DFatura := TDFatura.Create(Self);
  DOrdemCobrancaDescont := TDOrdemCobrancaDescont.Create(Self);
  ENDERECO_EXP:= TStringList.Create;
  // INICIALIZA A STRING FILTRO
  s_Pfiltro := '';


  DOrdemCobrancaDescont.AfterInsert :=  Incluir_Desconto ;




end;

procedure TFormRELFATURA.Incluir_Desconto(DataSet: TDataSet);
begin
  if DOrdemCobrancaDescont.State = dsInsert	 then begin
//     if (dfatura.NumFatura.Conteudo = '')	and ( XNumE_fatura.Text = '    /    ' ) then begin
     if (dfatura.NumOrdCobranca.Conteudo = '')	and (TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo = '' ) then begin
        MessageDlg(MSG_DescontonaopodeserIncluidoFaturaembranco,mtError,[mbOk],0);
        DOrdemCobrancaDescont.Cancel ;
        exit;
     end;
     DOrdemCobrancaDescont.Seq.Conteudo  := DOrdemCobrancaDescont.AutoIncremento( 'Seq');


     if dfatura.NumOrdCobranca.Conteudo = '' then
        DOrdemCobrancaDescont.NumOrdCobranca.Conteudo := XNumE_fatura.Text
     else
        DOrdemCobrancaDescont.NumOrdCobranca.Conteudo :=dfatura.NumOrdCobranca.Conteudo ;

  end ;
end;


procedure TFormRELFATURA.DS_FaturaDataChange(Sender: TObject;
  Field: TField);
VAR
 S_LFILTRO : STRING ;
 n_fatura : Double ;
begin
 S_LFILTRO := 'NumFatura =' + AtribuiAspas( DFatura.NumOrdCobranca.Conteudo );
 DOrdemCobrancaDescont.Close ;
 DOrdemCobrancaDescont.Filtro.Clear ;
 DOrdemCobrancaDescont.Filtro.Add(S_LFILTRO);
 DOrdemCobrancaDescont.AtualizaSql;
 DOrdemCobrancaDescont.First ;
 n_fatura := 0;

 while not DOrdemCobrancaDescont.Eof do begin
    n_fatura := n_fatura + DOrdemCobrancaDescont.Valor.Conteudo   ;
    DOrdemCobrancaDescont.Next ;
 end;
 DOrdemCobrancaDescont.First ;
 XNumDesc.Value := n_fatura ;
 XNumEd_geral.Value :=  XNumEd_Prod.Value + XNumDesc.Value ;

end;

procedure TFormRELFATURA.set_Fatura(sl_FaturaInicial,sl_FaturaFinal : string );
begin

  if sl_FaturaInicial <> '' then
     CmbBox_Fatura_Inicial.Text :=  sl_FaturaInicial ;

  if sl_FaturaFinal <> '' then
     CmbBox_Fatura_Final.Text := sl_FaturaFinal ;

end;

procedure TFormRELFATURA.ValidaColunaGrid(Sender: TField);
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

function TFormRELFATURA.AbandonandoEdicao: Boolean;
begin
  Result := (ActiveControl = Selecao_1);
end;


procedure TFormRELFATURA.BitBtn1Click(Sender: TObject);
begin
 ConstroiSql;
end;

procedure TFormRELFATURA.BitBtn_NotaFiscalClick(Sender: TObject);
begin

   GB_nfiscal.Enabled := true ;
   TabGlobal.DOrdemCobranca.Modifica ;

end;

procedure TFormRELFATURA.BitBtn3Click(Sender: TObject);
begin
try
  Screen.Cursor := crHourGlass      ;
  if MessageDlg( MSG_ConfirmaAtualizaroNumerodaNotaFiscalemtodososregistroselecionados ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
     TabGlobal.DFatura.First;
     while not TabGlobal.DFatura.Eof do begin
       if TabGlobal.DFatura.NumNFEmit.conteudo = 0 then begin
          TabGlobal.DFatura.Edit ;
          TabGlobal.DFatura.NumNFEmit.conteudo := TabGlobal.DOrdemCobranca.NumNFEmit.Conteudo ;
          TabGlobal.DFatura.DataNF.conteudo    := TabGlobal.DOrdemCobranca.DataNF.Conteudo ;
          TabGlobal.DFatura.Valor_NF.conteudo  := TabGlobal.DOrdemCobranca.VALOR_NF.Conteudo ;
          TabGlobal.DFatura.Status.Conteudo    := S_ST_NF_F ;
          TabGlobal.DFatura.Post;

          // ATUALIZA O STATUS DO PROCESSO
          // Atualiza_ST(TabGlobal.DFatura.Contrato.Conteudo,S_ST_NF);
       end;
       TabGlobal.DFatura.Next ;
     end ;
     // alterea o status da fatura  surimpex
     TabGlobal.DOrdemCobranca.Modifica;
     TabGlobal.DOrdemCobranca.Status.Conteudo :=   S_ST_NF_F ;
     TabGlobal.DOrdemCobranca.Salva;


  end;

  BitBtn1Click(SELF);
  Refresh;


finally
  Screen.Cursor := crDefault ;
  GB_nfiscal.Enabled := false ;

//  GroupBox_CalcularRate.Visible := false ;
//  IF TabelaPrincipal.Modificacao THEN
//     BTNSALVARclick  (self);
end;

end;

procedure TFormRELFATURA.BtnCancelarClick(Sender: TObject);
begin
TabGlobal.DOrdemCobranca.Cancela ;
GB_Fatura.Enabled := false ;
GB_nfiscal.Enabled := false ;
end;

procedure TFormRELFATURA.BitBtn4Click(Sender: TObject);
begin
TabGlobal.DOrdemCobranca.Modifica ;
GB_Fatura.Enabled := true ;
//GB_nfiscal.Enabled := false ;
end;

procedure TFormRELFATURA.BitBtn2Click(Sender: TObject);
begin

// verifica se o pagamento foi concluido
if TabGlobal.DOrdemCobranca.DataLiq.Conteudo <> -693594 then begin
   TabGlobal.DOrdemCobranca.Modifica;
   TabGlobal.DOrdemCobranca.Status.Conteudo := s_ST_OK_F ;
   TabGlobal.DOrdemCobranca.Salva;
   TabGlobal.DFatura.First;

   while ( TabGlobal.DFatura.NumOrdCobranca.Conteudo = TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo ) and
         ( NOT TabGlobal.DFatura.Eof ) do begin
      TabGlobal.DFatura.Modifica;
      TabGlobal.DFatura.DataLiq.Conteudo := TabGlobal.DOrdemCobranca.DataLiq.Conteudo;
      TabGlobal.DFatura.Status.Conteudo  := s_ST_OK_F ;
      TabGlobal.DFatura.Salva;
      TabGlobal.DFatura.Next;
   end;

end;
// ENVIO PARA PROTESTO
if TabGlobal.DOrdemCobranca.DataProtesto.Conteudo <> -693594 then begin
   TabGlobal.DOrdemCobranca.Modifica;
   TabGlobal.DOrdemCobranca.Status.Conteudo :=   s_ST_PR_F ;
   TabGlobal.DOrdemCobranca.Salva;
     while ( TabGlobal.DFatura.NumOrdCobranca.Conteudo = TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo ) and
           (   NOT TabGlobal.DFatura.Eof ) do begin
        TabGlobal.DFatura.Modifica;
        TabGlobal.DFatura.Status.Conteudo  :=   s_ST_PR_F ;
        TabGlobal.DFatura.Salva;
        TabGlobal.DFatura.Next;
     end;

end;


TabGlobal.DOrdemCobranca.Salva ;

end;

procedure TFormRELFATURA.StatusDrawItem(Control: TWinControl; Index: Integer;
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


end.
