{
   Programa.: INFOMECOMERCIAL.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados       VL_ANTERIOR_CONTRATADO
   Site.....: http://www.xmaker.com.br
}
unit INFOMECOMERCIAL;

interface

{$I Princ.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, BaseD, Atributo, Tabela, Menus, Calculos, db,
  {$I LTab.pas}
  XLookUp, XDBDate, Mask, XDate, XEdit, XNum, FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Tabs, comctrls, XBanner, checklst, IBCustomDataSet, IBQuery, IBDatabase,
  DBCtrls, Grids, DBGrids,  ActnMan, ActnCtrls, ToolWin;
//  , ActnCtrls ;
  //, DBGrids, ToolWin, ActnMan, ActnCtrls;
  
CONST
  NOVA_LINHA = CHR(13)+CHR(10) ;
  MSG_ADATAEUMCAMPOOBRIGATORIO = 'A Data é um campo Obrigatorio!' ;
  CONST_SQL_INICIO_TOTAL =
    ' SELECT' +   NOVA_LINHA +
    '   INFORME.PRODUCTO,' +   NOVA_LINHA +
// 29/06/2012    
//    '   IIF( SUM(INFORME.VL_ATUAL_CONTRATADO) IS NULL ,0, SUM(INFORME.VL_ATUAL_CONTRATADO)) AS CTTO ,' +   NOVA_LINHA +
//    '   IIF( SUM(INFORME.VL_ATUAL_EXPORTADO)  IS NULL ,0, SUM(INFORME.VL_ATUAL_EXPORTADO) ) AS EJEC ' +   NOVA_LINHA +
    '   sum (  IIF(INFORME.VL_ATUAL_CONTRATADO IS NULL , 0 , INFORME.VL_ATUAL_CONTRATADO )  + IIF( INFORME.VL_ANTERIOR_CONTRATADO IS NULL ,0, INFORME.VL_ANTERIOR_CONTRATADO)) AS CTTO , ' +   NOVA_LINHA +
    '   sum (  IIF( INFORME.VL_ATUAL_EXPORTADO IS NULL,  0 , INFORME.VL_ATUAL_EXPORTADO  )  + IIF( INFORME.VL_ANTERIOR_EXPORTADO IS NULL , 0, INFORME.VL_ANTERIOR_EXPORTADO )) AS EJEC   ' +   NOVA_LINHA +

    ' FROM ( select' +   NOVA_LINHA +
    '       CONTRATOTRANSPORTE.NOMEMIX     AS PRODUCTO,' +   NOVA_LINHA ;

  Ccont_VL_ATUAL_CONTRATADO = ' ( SELECT IIF( SUM(PRODUTOCONTRATOT.VALORSCC) IS NULL ,0, SUM(PRODUTOCONTRATOT.VALORSCC)) FROM PRODUTOCONTRATOT  WHERE PRODUTOCONTRATOT.CONTRATO = CONTRATOTRANSPORTE.CONTRATO )  AS VL_ATUAL_CONTRATADO,' +   NOVA_LINHA ;
  Ccont_VL_ATUAL_EXPORTADO  = ' ( SELECT IIF( SUM(EXPORTADOTRANSITO.VALOR)   IS NULL ,0, SUM(EXPORTADOTRANSITO.VALOR)  ) FROM EXPORTADOTRANSITO WHERE EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AS VL_ATUAL_EXPORTADO ,' +   NOVA_LINHA ;

  Ccont_VL_ANTERIOR_CONTRATAD  = ' 0 AS VL_ANTERIOR_CONTRATADO, ' +   NOVA_LINHA ;
  Ccont_VL_ANTERIOR_EXPORTADO  = ' 0 AS VL_ANTERIOR_EXPORTADO   ' +   NOVA_LINHA ;



  CONST_SQL_FINAL_TOTAL =
    ' from  CONTRATOTRANSPORTE  , FORNECEDORES, DIVISOES' +   NOVA_LINHA ;

  CONST_SQL_WHERE_TOTAL =
    ' WHERE  CONTRATOTRANSPORTE.FORCOD = FORNECEDORES.FORCOD' +   NOVA_LINHA +
    '  AND   CONTRATOTRANSPORTE.CLICOD = DIVISOES.CLICOD' +   NOVA_LINHA +
    '  AND   CONTRATOTRANSPORTE.SEQ = DIVISOES.SEQ' +   NOVA_LINHA ;

  CONST_SQL_ORDER_TOTAL =
    ' ORDER BY PRODUCTO' +   NOVA_LINHA +
    '  ) AS INFORME' +   NOVA_LINHA +
    '  GROUP BY  INFORME.PRODUCTO' +   NOVA_LINHA;

//***********************************************************************************************/
  CONST_SQL_INICIO =
    'SELECT ' +   NOVA_LINHA +
    '      INFORME.CONTRATOS, ' +   NOVA_LINHA +
    '      INFORME.DIVISION , ' +   NOVA_LINHA +
    '      INFORME.EXPORTADOR, ' +   NOVA_LINHA +
    '      INFORME.PRODUCTO, ' +   NOVA_LINHA +
    '      INFORME.VL_ATUAL_CONTRATADO  as  VL_ATUAL_CONTRATADO , ' +   NOVA_LINHA +
    '      INFORME.VL_ANTERIOR_CONTRATADO  as VL_ANTERIOR_CONTRATADO  , ' +   NOVA_LINHA +
    '      ( IIF(INFORME.VL_ATUAL_CONTRATADO IS NULL , 0 , INFORME.VL_ATUAL_CONTRATADO )  + IIF( INFORME.VL_ANTERIOR_CONTRATADO IS NULL ,0, INFORME.VL_ANTERIOR_CONTRATADO) ) AS VL_ACUMULADO_CONTRATADO , ' +   NOVA_LINHA +
    '      INFORME.VL_ATUAL_EXPORTADO, ' +   NOVA_LINHA +
    '      INFORME.VL_ANTERIOR_EXPORTADO, ' +   NOVA_LINHA +
    '      (  IIF( INFORME.VL_ATUAL_EXPORTADO IS NULL, 0, INFORME.VL_ATUAL_EXPORTADO )    + IIF( INFORME.VL_ANTERIOR_EXPORTADO IS NULL ,0, INFORME.VL_ANTERIOR_EXPORTADO )) AS VL_ACUMULADO_EXPORTADO , ' +   NOVA_LINHA +
    '      INFORME.ACUM_ATUAL_COMISSAO, ' +   NOVA_LINHA +
    '      INFORME.ACUM_ANTERIOR_COMISSAO, ' +   NOVA_LINHA +
    '      ( IIF( INFORME.ACUM_ATUAL_COMISSAO IS NULL , 0 ,INFORME.ACUM_ATUAL_COMISSAO)   + IIF( INFORME.ACUM_ANTERIOR_COMISSAO IS NULL ,0, INFORME.ACUM_ANTERIOR_COMISSAO) ) AS VL_ACUMULADO_COMISSAO , ' +   NOVA_LINHA +
    '      INFORME.COMISSION_CTTO, ' +   NOVA_LINHA +

// 28/08/2012 conforme solicitacao karina
//    '      INFORME.COMISSION_PENDIENTE, ' +   NOVA_LINHA +
    '      ( INFORME.COMISSION_CTTO - ( IIF( INFORME.ACUM_ATUAL_COMISSAO IS NULL , 0 ,INFORME.ACUM_ATUAL_COMISSAO)   + IIF( INFORME.ACUM_ANTERIOR_COMISSAO IS NULL ,0, INFORME.ACUM_ANTERIOR_COMISSAO) ) ) as COMISSION_PENDIENTE, ' +   NOVA_LINHA +
    '      INFORME.PORCENTAGEM_TM, ' +   NOVA_LINHA +
    '      INFORME.PORCENTAGEM_FORM ' +   NOVA_LINHA +

//     [IBQuery_Analise."COMISSION_PENDIENTE"]  = [IBQuery_Analise."COMISSION_CTTO"] - [IBQuery_Analise."VL_ACUMULADO_COMISSAO"]


    'FROM ( select ' +   NOVA_LINHA +
    '      CONTRATOTRANSPORTE.CONTRATO    AS CONTRATOS, ' +   NOVA_LINHA +
    '      DIVISOES.NOME                   AS DIVISION , ' +   NOVA_LINHA +
    '      FORNECEDORES.RAZAO             AS EXPORTADOR, ' +   NOVA_LINHA +
    '      CONTRATOTRANSPORTE.NOMEMIX     AS PRODUCTO, ' +   NOVA_LINHA ;
  cont_VL_ATUAL_CONTRATADO  =   ' ( SELECT IIF ( SUM(PRODUTOCONTRATOT.VALORSCC)         IS NULL , 0 , SUM(PRODUTOCONTRATOT.VALORSCC)        ) FROM PRODUTOCONTRATOT   WHERE PRODUTOCONTRATOT.CONTRATO  = CONTRATOTRANSPORTE.CONTRATO ) AS VL_ATUAL_CONTRATADO ,    '+ NOVA_LINHA ;
  cont_VL_ANTERIOR_CONTRATADO = ' ( SELECT IIF ( SUM(PRODUTOCONTRATOT.VALORSCC)         IS NULL , 0 , SUM(PRODUTOCONTRATOT.VALORSCC)        ) FROM PRODUTOCONTRATOT   WHERE PRODUTOCONTRATOT.CONTRATO  = CONTRATOTRANSPORTE.CONTRATO ) AS VL_ANTERIOR_CONTRATADO , '+ NOVA_LINHA ;
  cont_VL_ATUAL_EXPORTADO =     ' ( SELECT IIF ( SUM(EXPORTADOTRANSITO.VALOR)           IS NULL , 0 , SUM(EXPORTADOTRANSITO.VALOR)          ) FROM EXPORTADOTRANSITO  WHERE EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AS VL_ATUAL_EXPORTADO,      '+ NOVA_LINHA ;
  cont_VL_ANTERIOR_EXPORTADO =  ' ( SELECT IIF ( SUM(EXPORTADOTRANSITO.VALOR)           IS NULL , 0 , SUM(EXPORTADOTRANSITO.VALOR)          ) FROM EXPORTADOTRANSITO  WHERE EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AS VL_ANTERIOR_EXPORTADO,   '+ NOVA_LINHA ;
// 2906/2012 trocado o campo VALORCONVERTIDO pelo campo ComisaoSFatura
//  cont_ACUM_ATUAL_COMISSAO =    ' ( SELECT IIF ( SUM(EXPORTADOTRANSITO.VALORCONVERTIDO) IS NULL , 0 , SUM(EXPORTADOTRANSITO.VALORCONVERTIDO)) FROM EXPORTADOTRANSITO  WHERE EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AS ACUM_ATUAL_COMISSAO,     '+ NOVA_LINHA ;
//  cont_ACUM_ANTERIOR_COMISSAO = ' ( SELECT IIF ( SUM(EXPORTADOTRANSITO.VALORCONVERTIDO) IS NULL , 0 , SUM(EXPORTADOTRANSITO.VALORCONVERTIDO)) FROM EXPORTADOTRANSITO  WHERE EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AS ACUM_ANTERIOR_COMISSAO,  '+ NOVA_LINHA ;
  cont_ACUM_ATUAL_COMISSAO =    ' ( SELECT IIF ( SUM(EXPORTADOTRANSITO.ComisaoSFatura) IS NULL , 0 , SUM(EXPORTADOTRANSITO.ComisaoSFatura)) FROM EXPORTADOTRANSITO  WHERE EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AS ACUM_ATUAL_COMISSAO,     '+ NOVA_LINHA ;
  cont_ACUM_ANTERIOR_COMISSAO = ' ( SELECT IIF ( SUM(EXPORTADOTRANSITO.ComisaoSFatura) IS NULL , 0 , SUM(EXPORTADOTRANSITO.ComisaoSFatura)) FROM EXPORTADOTRANSITO  WHERE EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AS ACUM_ANTERIOR_COMISSAO,  '+ NOVA_LINHA ;

  CONST_SQL_FIM =
    '      CONTRATOTRANSPORTE.ValorTotalComissao  AS COMISSION_CTTO, ' +   NOVA_LINHA +
  //  '      CONTRATOTRANSPORTE.VlTotalComissaoPendente AS COMISSION_PENDIENTE, ' +   NOVA_LINHA +
    '      CONTRATOTRANSPORTE.COMISSAO AS PORCENTAGEM_TM , ' +   NOVA_LINHA +
    '      ( IIF( CONTRATOTRANSPORTE.FORMCOMISSAO = ''PO'' , ''%'' ,CONTRATOTRANSPORTE.FORMCOMISSAO )) AS PORCENTAGEM_FORM ' +   NOVA_LINHA +
    'from  CONTRATOTRANSPORTE  , FORNECEDORES, DIVISOES ' +   NOVA_LINHA ;
  CONST_SQL_WHERE =
    'WHERE  CONTRATOTRANSPORTE.FORCOD = FORNECEDORES.FORCOD ' +   NOVA_LINHA +
    ' AND   CONTRATOTRANSPORTE.CLICOD = DIVISOES.CLICOD ' +   NOVA_LINHA +
    ' AND   CONTRATOTRANSPORTE.SEQ = DIVISOES.SEQ ' +   NOVA_LINHA ;
  CONST_SQL_ORDER =
    'ORDER BY PRODUCTO ' +   NOVA_LINHA +
    ' ) AS INFORME ' +   NOVA_LINHA ;

type
  TFormINFOMECOMERCIAL = class(TForm)
    PnSup: TPanel;
    ShapeSup: TShape;
    LbTituloForm: TLabel;
    BtnAjuda: TSpeedButton;
    BtnFechar: TSpeedButton;
    frDBDataSet_Analise: TfrDBDataSet;
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    Selecao_1: TScrollBox;
    Divisao: TTabSet;
    Panel1: TPanel;
    BtnVisualizar: TBitBtn;
    BtnCancelar: TBitBtn;
    Panel_Filtro: TPanel;
    GroupBox1: TGroupBox;
    XDT_INIC: TXDateEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    CBox_INIC: TComboBox;
    CBox_FIM: TComboBox;
    BitBtn1: TBitBtn;
    GroupBoxAnalise: TGroupBox;
    GroupBoxProduto: TGroupBox;
    IBQuery_Analise: TIBQuery;
    IBQuery_Total: TIBQuery;
    DBNavig_Analise: TDBNavigator;
    DBNav_Total: TDBNavigator;
    DBGrid_ANALISE: TDBGrid;
    DBGrid_TOTAL: TDBGrid;
    DS_Analise: TDataSource;
    DS_Total: TDataSource;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    CBox_INIC_F: TComboBox;
    CBox_FIM_F: TComboBox;
    frDBDataSet_Total: TfrDBDataSet;
    IBQuery_AnaliseCONTRATOS: TIBStringField;
    IBQuery_AnaliseDIVISION: TIBStringField;
    IBQuery_AnaliseEXPORTADOR: TIBStringField;
    IBQuery_AnalisePRODUCTO: TIBStringField;
    IBQuery_AnaliseVL_ATUAL_CONTRATADO: TFloatField;
    IBQuery_AnaliseVL_ANTERIOR_CONTRATADO: TFloatField;
    IBQuery_AnaliseVL_ACUMULADO_CONTRATADO: TFloatField;
    IBQuery_AnaliseVL_ATUAL_EXPORTADO: TFloatField;
    IBQuery_AnaliseVL_ANTERIOR_EXPORTADO: TFloatField;
    IBQuery_AnaliseVL_ACUMULADO_EXPORTADO: TFloatField;
    IBQuery_AnaliseACUM_ATUAL_COMISSAO: TFloatField;
    IBQuery_AnaliseACUM_ANTERIOR_COMISSAO: TFloatField;
    IBQuery_AnaliseVL_ACUMULADO_COMISSAO: TFloatField;
    IBQuery_AnaliseCOMISSION_CTTO: TFloatField;
    IBQuery_AnaliseCOMISSION_PENDIENTE: TFloatField;
    IBQuery_AnalisePORCENTAGEM_TM: TFloatField;
    IBQuery_AnalisePORCENTAGEM_FORM: TIBStringField;
    IBQuery_TotalPRODUCTO: TIBStringField;
    IBQuery_TotalCTTO: TFloatField;
    IBQuery_TotalEJEC: TFloatField;
    XDT_EXECUCAO: TXDateEdit;
    XDT_CAD_CONT: TXDateEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
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
    procedure BitBtn1Click(Sender: TObject);
  private
    Caption_rel : string ;
    sNome_mes_ant, sNome_mes_atu :string ;
    l_Filtro : boolean ;
    { Private declarations }
//    QyRelatorio: TTabela;
    {02-Início do Bloco Modular. Modificações não serão preservadas}
    DContratoTransporte: TDContratoTransporte;
    procedure CalculosDContratoTransporte(DataSet: TDataSet);
    procedure AtualizaDetalhe_DContratoTransporte(Sender: TObject; Field: TField);
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure ConstroiSql;
    procedure InicializaVariaveis;
    procedure Parametros(Tabela: TTabela);
  public
    { Public declarations }
    {03-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
  end;

var
  FormINFOMECOMERCIAL: TFormINFOMECOMERCIAL;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas,RotinaEd , Abertura, GridPesquisa, Interno;

procedure TFormINFOMECOMERCIAL.ConstroiSql;
//var
//  I: Integer;
begin
  {0_4-Início do Bloco Modular. Modificações não serão preservadas}
//  DContratoTransporte.Filtro.Clear;
//  DContratoTransporte.AtualizaSql(False);
//  Parametros(DContratoTransporte);
//  DContratoTransporte.Open;
//  frDBDataSet.DataSet := DContratoTransporte;
  {9_9-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormINFOMECOMERCIAL.Parametros(Tabela: TTabela);
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

procedure TFormINFOMECOMERCIAL.FormShow(Sender: TObject);
//Var
//  I: Integer;
begin
  l_Filtro := false ;
  XDT_CAD_CONT.DATEVALUE := STRTODATE('01/12/'+INTTOSTR(STRTOINT(ANO(Date)) - 1));
  XDT_EXECUCAO.DATEVALUE :=  XDT_CAD_CONT.DATEVALUE ;
  IBQuery_Analise.Database := BaseDados.BD_Base_Dados ;
  IBQuery_Total.Database   := BaseDados.BD_Base_Dados ;

  IBQuery_Analise.Transaction  := BaseDados.TRS_BD_Base_Dados ;
  IBQuery_Total.Transaction    := BaseDados.TRS_BD_Base_Dados ;


  frDBDataSet_Analise.DataSet := IBQuery_Analise;
  frDBDataSet_Total.DataSet := IBQuery_Total ;
  Caption_rel := 'Infome Diretoria';
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Infome Diretoria';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  DContratoTransporte := TDContratoTransporte.Create(Self);
  DContratoTransporte.OnCalcFields := CalculosDContratoTransporte;
  DContratoTransporte.DataSource.OnDataChange := AtualizaDetalhe_DContratoTransporte;
//  QyRelatorio := DContratoTransporte;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  GroupBoxProduto.Height := ( Selecao_1.Height - Panel_Filtro.Height ) div 2 ;
  GroupBoxProduto.Align := alBottom ;
  GroupBoxAnalise.Align := alClient ;
  DBNavig_Analise.Align := alTop ;
  DBNav_Total.Align := alTop ;

  IBQuery_Analise.close ;
  IBQuery_Analise.SQL.Clear ;
  IBQuery_Analise.SQL.Add(CONST_SQL_INICIO            );
  IBQuery_Analise.SQL.Add(cont_VL_ATUAL_CONTRATADO    );
  IBQuery_Analise.SQL.Add(cont_VL_ANTERIOR_CONTRATADO );
  IBQuery_Analise.SQL.Add(cont_VL_ATUAL_EXPORTADO     );
  IBQuery_Analise.SQL.Add(cont_VL_ANTERIOR_EXPORTADO  );
  IBQuery_Analise.SQL.Add(cont_ACUM_ATUAL_COMISSAO    );
  IBQuery_Analise.SQL.Add(cont_ACUM_ANTERIOR_COMISSAO );
  IBQuery_Analise.SQL.Add(CONST_SQL_FIM               );
  IBQuery_Analise.SQL.Add(CONST_SQL_WHERE             );
  IBQuery_Analise.SQL.Add(CONST_SQL_ORDER             );
  IBQuery_Analise.SQL.SaveToFile('_REL_INFOMECOMERCIAL_IBQuery_Analise.SQL');
  IBQuery_Analise.Prepare ;
  IBQuery_Analise.Open ;

  IBQuery_Total.close;
  IBQuery_Total.SQL.Clear;
  IBQuery_Total.SQL.Add( CONST_SQL_INICIO_TOTAL    );

  IBQuery_Total.SQL.Add( Ccont_VL_ATUAL_CONTRATADO );
  IBQuery_Total.SQL.Add( Ccont_VL_ANTERIOR_CONTRATAD  );
  IBQuery_Total.SQL.Add( Ccont_VL_ATUAL_EXPORTADO  );
  IBQuery_Total.SQL.Add( Ccont_VL_ANTERIOR_EXPORTADO  );

  IBQuery_Total.SQL.Add( CONST_SQL_FINAL_TOTAL     );
  IBQuery_Total.SQL.Add( CONST_SQL_WHERE_TOTAL     );
  IBQuery_Total.SQL.Add( CONST_SQL_ORDER_TOTAL     );
  IBQuery_Total.SQL.SaveToFile('_REL_INFOMECOMERCIAL_IBQuery_Total.SQL');
  IBQuery_Total.Prepare;
  IBQuery_Total.Open;


  DS_Analise.DataSet := IBQuery_Analise ;
  DS_Total.DataSet   := IBQuery_Total;

  DBNav_Total.DataSource := DS_Total;
  DBNavig_Analise.DataSource := DS_Analise;
  DBGrid_TOTAL.DataSource := DS_Total;
  DBGrid_ANALISE.DataSource := DS_Analise;

  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  FormResize(Self);
  frReport.OnUserFunction := FuncoesExtras;

  Panel_Filtro.Align := alBottom ;
//  GroupBoxProduto.Align := alBottom ;
  GroupBoxAnalise.Align := alClient;
  DBNav_Total.Align := altop;
  DBNavig_Analise.Align := altop;
  DBGrid_ANALISE.Align := alClient;
  DBGrid_TOTAL.Align := alClient;



  // CARREGANDO   LIST BOX fornecedor
  Carrega_CB(CBox_INIC_F,CBox_FIM_F,'SELECT RAZAO || '' >> '' || FORCOD || '' <<''  AS CAMPOS FROM FORNECEDORES ORDER BY RAZAO', 'CAMPOS',SELF);
  Carrega_CB(CBox_INIC,CBox_FIM,'SELECT RAZAO || '' >> '' || CLICOD || '' <<''  AS CAMPOS FROM CLIENTES ORDER BY RAZAO', 'CAMPOS',SELF);


//IBQuery_AnaliseCONTRATOS: TIBStringField;
//IBQuery_AnaliseDIVISION: TIBStringField;
//IBQuery_AnaliseEXPORTADOR: TIBStringField;
//IBQuery_AnalisePRODUCTO: TIBStringField;
                                                            //12345678
  IBQuery_AnaliseVL_ATUAL_CONTRATADO.DisplayFormat      := '$ ########.000'; //
  IBQuery_AnaliseVL_ANTERIOR_CONTRATADO.DisplayFormat   := '$ ########.000'; //: TFloatField;
  IBQuery_AnaliseVL_ACUMULADO_CONTRATADO.DisplayFormat  := '$ ########.000'; //: TFloatField;
  IBQuery_AnaliseVL_ATUAL_EXPORTADO.DisplayFormat       := '$ ########.000'; //: TFloatField;
  IBQuery_AnaliseVL_ANTERIOR_EXPORTADO.DisplayFormat    := '$ ########.000'; //: TFloatField;
  IBQuery_AnaliseVL_ACUMULADO_EXPORTADO.DisplayFormat   := '$ ########.000'; //: TFloatField;
  IBQuery_AnaliseACUM_ATUAL_COMISSAO.DisplayFormat      := '$ ########.000'; //: TFloatField;
  IBQuery_AnaliseACUM_ANTERIOR_COMISSAO.DisplayFormat   := '$ ########.000'; //: TFloatField;
  IBQuery_AnaliseVL_ACUMULADO_COMISSAO.DisplayFormat    := '$ ########.000'; //: TFloatField;
  IBQuery_AnaliseCOMISSION_CTTO.DisplayFormat           := '$ ########.000'; //: TFloatField;
  IBQuery_AnaliseCOMISSION_PENDIENTE.DisplayFormat      := '$ ########.000'; //: TFloatField;
  IBQuery_AnalisePORCENTAGEM_TM.DisplayFormat           := '##.00'; //: TFloatField;
//IBQuery_AnalisePORCENTAGEM_FORM.DisplayFormat         := '$ ########.000'; //: TIBStringField;


  IBQuery_AnaliseVL_ATUAL_CONTRATADO.DisplayWidth      := 20; //
  IBQuery_AnaliseVL_ANTERIOR_CONTRATADO.DisplayWidth   := 20; //: TFloatField;
  IBQuery_AnaliseVL_ACUMULADO_CONTRATADO.DisplayWidth  := 20; //: TFloatField;
  IBQuery_AnaliseVL_ATUAL_EXPORTADO.DisplayWidth       := 20; //: TFloatField;
  IBQuery_AnaliseVL_ANTERIOR_EXPORTADO.DisplayWidth    := 20; //: TFloatField;
  IBQuery_AnaliseVL_ACUMULADO_EXPORTADO.DisplayWidth   := 20; //: TFloatField;
  IBQuery_AnaliseACUM_ATUAL_COMISSAO.DisplayWidth      := 20; //: TFloatField;
  IBQuery_AnaliseACUM_ANTERIOR_COMISSAO.DisplayWidth   := 20; //: TFloatField;
  IBQuery_AnaliseVL_ACUMULADO_COMISSAO.DisplayWidth    := 20; //: TFloatField;
  IBQuery_AnaliseCOMISSION_CTTO.DisplayWidth           := 20; //: TFloatField;
  IBQuery_AnaliseCOMISSION_PENDIENTE.DisplayWidth      := 20; //: TFloatField;
  IBQuery_AnalisePORCENTAGEM_TM.DisplayWidth           := 20; //: TFloatField;


{
  IBQuery_AnaliseVL_ATUAL_CONTRATADO.currency     := true ;
  IBQuery_AnaliseVL_ANTERIOR_CONTRATADO.currency  := true ;
  IBQuery_AnaliseVL_ACUMULADO_CONTRATADO.currency := true ;
  IBQuery_AnaliseVL_ATUAL_EXPORTADO.currency      := true ;
  IBQuery_AnaliseVL_ANTERIOR_EXPORTADO.currency   := true ;
  IBQuery_AnaliseVL_ACUMULADO_EXPORTADO.currency  := true ;
  IBQuery_AnaliseACUM_ATUAL_COMISSAO.currency     := true ;
  IBQuery_AnaliseACUM_ANTERIOR_COMISSAO.currency  := true ;
  IBQuery_AnaliseVL_ACUMULADO_COMISSAO.currency   := true ;
  IBQuery_AnaliseCOMISSION_CTTO.currency          := true ;
  IBQuery_AnaliseCOMISSION_PENDIENTE.currency     := true ;
}










//IBQuery_TotalPRODUCTO.DisplayFormat                   := '########.000'; //: TIBStringField;

  IBQuery_TotalCTTO.DisplayFormat                       := '$ ########.000'; //: TFloatField;
  IBQuery_TotalEJEC.DisplayFormat                       := '$ ########.000'; //: TFloatField;

  IBQuery_TotalCTTO.DisplayWidth := 20; //: TFloatField;
  IBQuery_TotalEJEC.DisplayWidth := 20; //: TFloatField;


//  IBQuery_TotalCTTO.currency     := True ;
//  IBQuery_TotalEJEC.currency     := True ;

end;

procedure TFormINFOMECOMERCIAL.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormINFOMECOMERCIAL.InicializaVariaveis;
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
  frVariables['Titulo_1']     := Caption_rel;
  frVariables['Titulo_2']     := '';

  frVariables['ANTER_CONTRATADO']:= 'Acum '  + sNome_mes_ant;
  frVariables['ATUAL_CONTRATADO']:= ''       + sNome_mes_atu;
  frVariables['ACUMU_CONTRATADO']:= 'Acum '  + sNome_mes_atu;

  frVariables['ANTER_EXPORTADO'] := 'Acum ' + sNome_mes_ant;
  frVariables['ATUAL_EXPORTADO'] := ' '     + sNome_mes_atu;
  frVariables['ACUMU_EXPORTADO'] := 'Acum ' + sNome_mes_atu;

  frVariables['ANTER_COMISSAO']  := 'Acum ' + sNome_mes_ant;
  frVariables['ATUAL_COMISSAO']  := ''      + sNome_mes_atu;
  frVariables['ACUMU_COMISSAO']  := 'Acum ' + sNome_mes_atu;

  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormINFOMECOMERCIAL.BtnVisualizarClick(Sender: TObject);
begin
  ConstroiSql;
  InicializaVariaveis;
  if IBQuery_Analise.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
 // QyRelatorio.Close;
  l_Filtro := false ;
end;

procedure TFormINFOMECOMERCIAL.FormResize(Sender: TObject);
begin
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
  GroupBoxProduto.Height := (( Selecao_1.Height - Panel_Filtro.Height )  div 2 ) ;

  Panel_Filtro.Align := alBottom ;
//  GroupBoxProduto.Align := alBottom ;
  GroupBoxAnalise.Align := alClient;
  


end;

procedure TFormINFOMECOMERCIAL.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFormINFOMECOMERCIAL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  DContratoTransporte.Free;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

{08-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormINFOMECOMERCIAL.CalculosDContratoTransporte(DataSet: TDataSet);
begin
end;

procedure TFormINFOMECOMERCIAL.AtualizaDetalhe_DContratoTransporte(Sender: TObject;
  Field: TField);
begin
end;

{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormINFOMECOMERCIAL.FuncoesExtras(const Name: String; p1, p2,
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

procedure TFormINFOMECOMERCIAL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then   // Calendário
    Interno108
  else if Key = VK_F6 then // Calculadora
    Interno109
  else if Key = VK_F7 then // Agenda
    Interno110;
end;

procedure TFormINFOMECOMERCIAL.BitBtn1Click(Sender: TObject);
VAR
  S_FILTRO , S_CLICOD, sAno, sMes,ult_dia, sDia : STRING ;
  N_INC  , N_FIN  : INTEGER ;
  iAno, iMes, iDia, iAnoAnt ,iMesAnt : Word ;
  s_data_final , s_data_inicial , sano_ant, smes_ant , ult_dia_ant , s_data_ant_final: string ;
  FILTRO_PRODUTOCONTRATOT , FILTRO_EXPORTADOTRANSITO , FILTRO_PRODUTOCONTRATOT_ANT , FILTRO_EXPORTADOTRANSITO_ANT : string ;
  FILTRO_COMISSAO_ANT , FILTRO_COMISSAO : string ;
  S_cont_VL_ATUAL_CONTRATADO,S_cont_VL_ANTERIOR_CONTRATADO,S_cont_VL_ATUAL_EXPORTADO,S_cont_VL_ANTERIOR_EXPORTADO,S_cont_ACUM_ATUAL_COMISSAO,S_cont_ACUM_ANTERIOR_COMISSAO  : string ;
  S_cont_VL_ATUAL_CONTRATADO_Total ,  S_cont_VL_ATUAL_EXPORTADO_Total : string ;
  s_data_ant_INIC_AC ,s_data_ant_INIC_EX : string;
  S_cont_VL_ANTERIOR_CONTRATADO_Total , S_cont_VL_ANTERIOR_EXPORTADO_total: string;
  FILTRO_PRODUTOCONTRATOT_SELEC : STRING ;
begin

S_FILTRO := '' ;

TRY
  Screen.Cursor := crHourGlass;
  IF XDT_INIC.DateValue <> -693594 THEN BEGIN
    DecodeDate( XDT_INIC.DateValue, iAno, iMes, iDia );

    if iMes = 1 then begin
       iMes := 12 ;
       iAno := iAno - 1 ;
    end
    else
       iMes := iMes -1 ;

    iAnoAnt := iAno ;
    iMesAnt := iMes - 1 ;
    if iMesAnt = 0 then begin
       iMesAnt := 12 ;
       iAnoAnt := iAno - 1 ;
       iAnoAnt := 1900 ;
    end;



    if idia = 31   then
    begin
        if (( imes = 4 ) or ( imes =  6 ) or ( imes = 9 ) or ( imes = 11 )) then
           idia := 30 ;
           
        if (( imes = 2 )) then
           idia := 28 ;

    end;

    sdia := strzero(idia,2);

    smes := strzero(imes,2) ;
    sano := strzero(iano,4);
    ult_dia := UltimoDiaDoMes(mesano(strtodate(sdia+'/'+smes+'/'+sano)))   ;
    s_data_final     := sano+'/'+smes+'/'+ult_dia ;
    s_data_inicial   := sano+'/'+smes+'/01' ;

    sano_ant := strzero(iAnoAnt,4);
    smes_ant := strzero(iMesAnt ,2) ;

    sNome_mes_ant := nome_mes(iMesAnt,3) ;
    sNome_mes_atu := nome_mes(iMes,3);


    ult_dia_ant := UltimoDiaDoMes(mesano(strtodate(sdia+'/'+smes_ant+'/'+sano_ant )))   ;
    s_data_ant_final := sano_ant+'/'+smes_ant+'/'+ult_dia_ant ;

//  26/06/2012 NOVO CRITERIO COM DATA INICIAL DE CALCULO
    DecodeDate( XDT_CAD_CONT.DateValue, iAno, iMes, iDia );
    sdia := strzero(idia,2);
    smes := strzero(imes,2) ;
    sano := strzero(iano,4);

    s_data_ant_INIC_AC := SAno+'/'+Smes+'/'+Sdia ;

    DecodeDate( XDT_EXECUCAO.DateValue, IAno, IMes, IDia );
    sdia := strzero(idia,2);
    smes := strzero(imes,2) ;
    sano := strzero(iano,4);


    s_data_ant_INIC_EX := Sano+'/'+Smes+'/'+Sdia ;


    FILTRO_PRODUTOCONTRATOT_SELEC := '( PRODUTOCONTRATOT.Cadastro  >= ' + AtribuiAspas(s_data_ant_INIC_AC) + ' ) AND ( PRODUTOCONTRATOT.Cadastro  <= ' + AtribuiAspas(s_data_final) + ' )' ;



    FILTRO_PRODUTOCONTRATOT       := '( PRODUTOCONTRATOT.Cadastro  >= ' + AtribuiAspas(s_data_inicial) + ' ) AND ( PRODUTOCONTRATOT.Cadastro  <= ' + AtribuiAspas(s_data_final) + ' )' ;
    FILTRO_EXPORTADOTRANSITO      := '( EXPORTADOTRANSITO.DATAEMBARQUE >= ' + AtribuiAspas(s_data_inicial) + ' ) AND ( EXPORTADOTRANSITO.DATAEMBARQUE <= ' + AtribuiAspas(s_data_final) + ' )' ;

//    FILTRO_COMISSAO               := '( EXPORTADOTRANSITO.DATALIQ  >= ' + AtribuiAspas(s_data_inicial) + ' ) AND ( EXPORTADOTRANSITO.DATALIQ  <= ' + AtribuiAspas(s_data_final) + ' )' ;
    FILTRO_COMISSAO               := '( EXPORTADOTRANSITO.DATANF  >= ' + AtribuiAspas(s_data_inicial) + ' ) AND ( EXPORTADOTRANSITO.DATANF  <= ' + AtribuiAspas(s_data_final) + ' )' ;

    FILTRO_PRODUTOCONTRATOT_ANT   := '( PRODUTOCONTRATOT.Cadastro  <= ' + AtribuiAspas(s_data_ant_final) + ' ) AND ( PRODUTOCONTRATOT.Cadastro  >= ' + AtribuiAspas(s_data_ant_INIC_AC) + ' )' ;

    FILTRO_EXPORTADOTRANSITO_ANT  := '( EXPORTADOTRANSITO.DATAEMBARQUE <= ' + AtribuiAspas(s_data_ant_final) + ' ) AND ( EXPORTADOTRANSITO.DATAEMBARQUE >= ' + AtribuiAspas(s_data_ant_INIC_EX) + ' )' ;
//  FILTRO_COMISSAO_ANT           := '( EXPORTADOTRANSITO.DATALIQ  <= ' + AtribuiAspas(s_data_ant_final) + ' ) AND ( EXPORTADOTRANSITO.DATALIQ  >= ' + AtribuiAspas(s_data_ant_INIC_EX) + ' )' ;
    FILTRO_COMISSAO_ANT           := '( EXPORTADOTRANSITO.DATANF  <= ' + AtribuiAspas(s_data_ant_final) + ' ) AND ( EXPORTADOTRANSITO.DATANF  >= ' + AtribuiAspas(s_data_ant_INIC_EX) + ' )' ;

    S_cont_VL_ATUAL_CONTRATADO    := '( SELECT IIF( SUM(PRODUTOCONTRATOT.VALORSCC)         IS NULL,0, SUM(PRODUTOCONTRATOT.VALORSCC)        ) FROM PRODUTOCONTRATOT   WHERE (PRODUTOCONTRATOT.CONTRATO  = CONTRATOTRANSPORTE.CONTRATO ) AND  '+ FILTRO_PRODUTOCONTRATOT     +') AS VL_ATUAL_CONTRATADO ,    '+ NOVA_LINHA ;
    S_cont_VL_ANTERIOR_CONTRATADO := '( SELECT IIF( SUM(PRODUTOCONTRATOT.VALORSCC)         IS NULL,0, SUM(PRODUTOCONTRATOT.VALORSCC)        ) FROM PRODUTOCONTRATOT   WHERE (PRODUTOCONTRATOT.CONTRATO  = CONTRATOTRANSPORTE.CONTRATO ) AND  '+ FILTRO_PRODUTOCONTRATOT_ANT +') AS VL_ANTERIOR_CONTRATADO , '+ NOVA_LINHA ;
    S_cont_VL_ATUAL_EXPORTADO     := '( SELECT IIF( SUM(EXPORTADOTRANSITO.VALOR)           IS NULL,0, SUM(EXPORTADOTRANSITO.VALOR)          ) FROM EXPORTADOTRANSITO  WHERE (EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AND  '+ FILTRO_EXPORTADOTRANSITO +') AS VL_ATUAL_EXPORTADO,      '+ NOVA_LINHA ;
    S_cont_VL_ANTERIOR_EXPORTADO  := '( SELECT IIF( SUM(EXPORTADOTRANSITO.VALOR)           IS NULL,0, SUM(EXPORTADOTRANSITO.VALOR)          ) FROM EXPORTADOTRANSITO  WHERE (EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AND  '+ FILTRO_EXPORTADOTRANSITO_ANT +') AS VL_ANTERIOR_EXPORTADO,   '+ NOVA_LINHA ;
// 2906/2012 trocado o campo VALORCONVERTIDO pelo campo ComisaoSFatura
//    S_cont_ACUM_ATUAL_COMISSAO    := '( SELECT IIF( SUM(EXPORTADOTRANSITO.VALORCONVERTIDO) IS NULL,0, SUM(EXPORTADOTRANSITO.VALORCONVERTIDO)) FROM EXPORTADOTRANSITO  WHERE (EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AND  '+ FILTRO_COMISSAO +') AS ACUM_ATUAL_COMISSAO,     '+ NOVA_LINHA ;
//    S_cont_ACUM_ANTERIOR_COMISSAO := '( SELECT IIF( SUM(EXPORTADOTRANSITO.VALORCONVERTIDO) IS NULL,0, SUM(EXPORTADOTRANSITO.VALORCONVERTIDO)) FROM EXPORTADOTRANSITO  WHERE (EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AND  '+ FILTRO_COMISSAO_ANT +') AS ACUM_ANTERIOR_COMISSAO,  '+ NOVA_LINHA ;
    S_cont_ACUM_ATUAL_COMISSAO    := '( SELECT IIF( SUM(EXPORTADOTRANSITO.ComisaoSFatura) IS NULL,0, SUM(EXPORTADOTRANSITO.ComisaoSFatura)) FROM EXPORTADOTRANSITO  WHERE (EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AND  '+ FILTRO_COMISSAO +') AS ACUM_ATUAL_COMISSAO,     '+ NOVA_LINHA ;
    S_cont_ACUM_ANTERIOR_COMISSAO := '( SELECT IIF( SUM(EXPORTADOTRANSITO.ComisaoSFatura) IS NULL,0, SUM(EXPORTADOTRANSITO.ComisaoSFatura)) FROM EXPORTADOTRANSITO  WHERE (EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AND  '+ FILTRO_COMISSAO_ANT +') AS ACUM_ANTERIOR_COMISSAO,  '+ NOVA_LINHA ;


    S_cont_VL_ATUAL_CONTRATADO_Total    := '( SELECT IIF( SUM(PRODUTOCONTRATOT.VALORSCC) IS NULL,0, SUM(PRODUTOCONTRATOT.VALORSCC))  FROM PRODUTOCONTRATOT   WHERE (PRODUTOCONTRATOT.CONTRATO  = CONTRATOTRANSPORTE.CONTRATO ) AND  '+ FILTRO_PRODUTOCONTRATOT     +') AS VL_ATUAL_CONTRATADO ,    '+ NOVA_LINHA ;
    S_cont_VL_ANTERIOR_CONTRATADO_Total := '( SELECT IIF( SUM(PRODUTOCONTRATOT.VALORSCC) IS NULL,0, SUM(PRODUTOCONTRATOT.VALORSCC) ) FROM PRODUTOCONTRATOT   WHERE (PRODUTOCONTRATOT.CONTRATO  = CONTRATOTRANSPORTE.CONTRATO ) AND  '+ FILTRO_PRODUTOCONTRATOT_ANT +') AS VL_ANTERIOR_CONTRATADO , '+ NOVA_LINHA ;
    S_cont_VL_ANTERIOR_EXPORTADO_total  := '( SELECT IIF( SUM(EXPORTADOTRANSITO.VALOR)   IS NULL,0, SUM(EXPORTADOTRANSITO.VALOR)   ) FROM EXPORTADOTRANSITO  WHERE (EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AND  '+ FILTRO_EXPORTADOTRANSITO_ANT +') AS VL_ANTERIOR_EXPORTADO,   '+ NOVA_LINHA ;
    S_cont_VL_ATUAL_EXPORTADO_Total     := '( SELECT IIF( SUM(EXPORTADOTRANSITO.VALOR)   IS NULL,0, SUM(EXPORTADOTRANSITO.VALOR)  )  FROM EXPORTADOTRANSITO  WHERE (EXPORTADOTRANSITO.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AND  '+ FILTRO_EXPORTADOTRANSITO +') AS VL_ATUAL_EXPORTADO     '+ NOVA_LINHA ;


  END
  else begin
     MessageDlg(MSG_ADATAEUMCAMPOOBRIGATORIO,mtError,[mbOk],0)  ;
     exit ;
  end;

  // CODIGO DE CLIENTE
  IF CBox_INIC.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_INIC.Text) + 2   ;
     N_FIN := POS('<<',CBox_INIC.Text)   ;
     S_CLICOD := COPY( CBox_INIC.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' AND CONTRATOTRANSPORTE.CLICOD >= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.CLICOD >= '+ S_CLICOD ;
     CAPTION_rel := CAPTION_rel + COPY( CBox_INIC.Text,1, N_INC  );
  END;

  IF CBox_FIM.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_FIM.Text) + 2   ;
     N_FIN := POS('<<',CBox_FIM.Text)   ;
     S_CLICOD := COPY( CBox_FIM.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' AND CONTRATOTRANSPORTE.CLICOD <= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.CLICOD <= '+ S_CLICOD ;
     CAPTION_rel := CAPTION_rel + COPY( CBox_INIC.Text,1, N_INC  );
  END;

  // CODIGO DE FORNECEDOR
  IF CBox_INIC_F.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_INIC_F.Text) + 2   ;
     N_FIN := POS('<<',CBox_INIC_F.Text)   ;
     S_CLICOD := COPY( CBox_INIC_F.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' and CONTRATOTRANSPORTE.FORCOD >= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.FORCOD >= '+ S_CLICOD ;
     CAPTION_rel := CAPTION_rel + COPY( CBox_INIC_F.Text,1, N_INC  );
  END;

  IF CBox_FIM_F.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_FIM_F.Text) + 2   ;
     N_FIN := POS('<<',CBox_FIM_F.Text)   ;
     S_CLICOD := COPY( CBox_FIM_F.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' and CONTRATOTRANSPORTE.FORCOD <= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.FORCOD <= '+ S_CLICOD ;
     CAPTION_rel := CAPTION_rel + COPY( CBox_INIC_F.Text,1, N_INC  );

  END;
  // 29/06/2012
  if  s_data_ant_INIC_AC <> '' then
//      if S_FILTRO <> '' then
//         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.Cadastro >= '+  AtribuiAspas(s_data_ant_INIC_AC)
//      else
//         S_FILTRO := S_FILTRO +'     CONTRATOTRANSPORTE.Cadastro >= '+  AtribuiAspas(s_data_ant_INIC_AC) ;
  // 28/08/2012  
      if S_FILTRO <> '' then
         S_FILTRO := S_FILTRO + ' AND ( CONTRATOTRANSPORTE.CONTRATO    IN (select DISTINCT PRODUTOCONTRATOT.CONTRATO FROM PRODUTOCONTRATOT   WHERE ' + FILTRO_PRODUTOCONTRATOT_SELEC  + ' ) )'
      else
         S_FILTRO := S_FILTRO + ' AND ( CONTRATOTRANSPORTE.CONTRATO    IN (select DISTINCT PRODUTOCONTRATOT.CONTRATO FROM PRODUTOCONTRATOT   WHERE ' + FILTRO_PRODUTOCONTRATOT_SELEC + ' )) ' ;



  IBQuery_Analise.close ;
  IBQuery_Analise.SQL.Clear ;
  IBQuery_Analise.SQL.Add(CONST_SQL_INICIO            );
  IBQuery_Analise.SQL.Add(s_cont_VL_ATUAL_CONTRATADO    );
  IBQuery_Analise.SQL.Add(s_cont_VL_ANTERIOR_CONTRATADO );
  IBQuery_Analise.SQL.Add(s_cont_VL_ATUAL_EXPORTADO     );
  IBQuery_Analise.SQL.Add(s_cont_VL_ANTERIOR_EXPORTADO  );
  IBQuery_Analise.SQL.Add(s_cont_ACUM_ATUAL_COMISSAO    );
  IBQuery_Analise.SQL.Add(s_cont_ACUM_ANTERIOR_COMISSAO );
  IBQuery_Analise.SQL.Add(CONST_SQL_FIM               );
  IBQuery_Analise.SQL.Add(CONST_SQL_WHERE + S_FILTRO  );
  IBQuery_Analise.SQL.Add(CONST_SQL_ORDER             );
  IBQuery_Analise.sql.SaveToFile('_REL_INFOMECOMERCIAL_IBQuery_Analise.sql');
  IBQuery_Analise.Prepare ;
  IBQuery_Analise.Open ;

  IBQuery_Total.close;
  IBQuery_Total.SQL.Clear;
  IBQuery_Total.SQL.Add( CONST_SQL_INICIO_TOTAL    );
  IBQuery_Total.SQL.Add( s_cont_VL_ATUAL_CONTRATADO_Total );
  IBQuery_Total.SQL.Add( S_cont_VL_ANTERIOR_CONTRATADO_Total );
  IBQuery_Total.SQL.Add( S_cont_VL_ANTERIOR_EXPORTADO_total );
  IBQuery_Total.SQL.Add( s_cont_VL_ATUAL_EXPORTADO_Total  );
  IBQuery_Total.SQL.Add( CONST_SQL_FINAL_TOTAL     );
  IBQuery_Total.SQL.Add( CONST_SQL_WHERE_TOTAL + S_FILTRO );
  IBQuery_Total.SQL.Add( CONST_SQL_ORDER_TOTAL     );
  IBQuery_Total.sql.SaveToFile('_REL_INFOMECOMERCIAL_IBQuery_Total.sql');
  IBQuery_Total.Prepare;
  IBQuery_Total.Open;
  l_Filtro := True ;
finally
  Screen.Cursor := crDefault;
END;

end;


end.
