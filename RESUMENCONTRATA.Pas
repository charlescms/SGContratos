{
   Programa.: RESUMENCONTRATA.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
   08/06/2011 relatorio concluido 
}
unit RESUMENCONTRATA;

interface

{$I Princ.inc}

{

SELECT
    TOTALIZAR.CLICOD               	AS CLICOD ,
    TOTALIZAR.SEQ                 	AS SEQ   ,
    TOTALIZAR.NOME                               AS NOME  ,
    SUM(TOTALIZAR.QUANTIDADETOTAL) 	AS QuantidadeTotal,
    SUM(TOTALIZAR.VALORSCCTOTAL)   	AS VALORSCCTOTAL ,
    SUM(TOTALIZAR.VALOR )  AS VALOR,
    SUM(TOTALIZAR.QuantidadeExp  )  AS QuantidadeExp,
    SUM(TOTALIZAR.QUANTTOTALEXP)   	AS QUANTTOTALEXP,
    SUM(TOTALIZAR.VALORTOTALEXP)   	AS VALORTOTALEXP,
    SUM(TOTALIZAR.QUANTADEPENDENTE)   AS QUANTADEPENDENTE,
    SUM(TOTALIZAR.VALORTOTALPENDENTE) AS VALORTOTALPENDENTE,
    TOTALIZAR.NOMEMIX
FROM (
SELECT
    CONTRATOTRANSPORTE.CLICOD               	AS CLICOD ,
    CONTRATOTRANSPORTE.SEQ                 	AS SEQ   ,
    DIVISOES.NOME                               AS NOME  ,
    (CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	AS QuantidadeTotal,
    (CONTRATOTRANSPORTE.VALORSCCTOTAL)   	AS VALORSCCTOTAL ,
    ( SELECT IIF( SUM( EXPORTADOTRANSITO.VALOR) IS NULL , 0 , SUM( EXPORTADOTRANSITO.VALOR) )  FROM EXPORTADOTRANSITO  WHERE  CONTRATOTRANSPORTE.CONTRATO =  EXPORTADOTRANSITO.CONTRATO AND  EXPORTADOTRANSITO.DATAEMBARQUE < '2011/11/01'   AND EXPORTADOTRANSITO.FORMPAGO = 'PROEX' )  AS VALOR,
    ( SELECT IIF( SUM( EXPORTADOTRANSITO.QuantidadeExp) IS NULL , 0 , SUM( EXPORTADOTRANSITO.QuantidadeExp) )  FROM EXPORTADOTRANSITO  WHERE  CONTRATOTRANSPORTE.CONTRATO =  EXPORTADOTRANSITO.CONTRATO AND  EXPORTADOTRANSITO.DATAEMBARQUE < '2011/11/01'   AND EXPORTADOTRANSITO.FORMPAGO = 'PROEX' )  AS QuantidadeExp,
    (CONTRATOTRANSPORTE.QUANTTOTALEXP)   	AS QUANTTOTALEXP,
    (CONTRATOTRANSPORTE.VALORTOTALEXP)   	AS VALORTOTALEXP,
    (CONTRATOTRANSPORTE.QUANTADEPENDENTE)   AS QUANTADEPENDENTE,
    (CONTRATOTRANSPORTE.VALORTOTALPENDENTE) AS VALORTOTALPENDENTE,
    CONTRATOTRANSPORTE.NOMEMIX
FROM CONTRATOTRANSPORTE , DIVISOES
 WHERE DIVISOES.CLICOD = CONTRATOTRANSPORTE.CLICOD AND
       DIVISOES.SEQ    = CONTRATOTRANSPORTE.SEQ
 AND  CONTRATOTRANSPORTE.CLICOD >=  1  AND CONTRATOTRANSPORTE.CLICOD <=  1
 AND ((  CONTRATOTRANSPORTE.CONTRATO IN ( SELECT DISTINCT EXPORTADOTRANSITO.CONTRATO FROM EXPORTADOTRANSITO  WHERE   EXPORTADOTRANSITO.DATAEMBARQUE >= '2011/11/01' AND EXPORTADOTRANSITO.DATAEMBARQUE <= '2012/04/29'  AND EXPORTADOTRANSITO.FORMPAGO = 'PROEX' )) OR (  CONTRATOTRANSPORTE.CONTRATO IN ( SELECT DISTINCT PRODUTOCONTRATOT.CONTRATO FROM PRODUTOCONTRATOT  WHERE  PRODUTOCONTRATOT.FORMPAGO = 'PROEX' ) ) )
 ORDER BY CONTRATOTRANSPORTE.CLICOD,CONTRATOTRANSPORTE.SEQ,DIVISOES.NOME,CONTRATOTRANSPORTE.NOMEMIX
 ) AS TOTALIZAR
 GROUP BY TOTALIZAR.CLICOD,TOTALIZAR.SEQ,TOTALIZAR.NOME,TOTALIZAR.NOMEMIX

}


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, BaseD, Atributo, Tabela, Menus, Calculos, db,
  {$I LTab.pas}
  XLookUp, XDBDate, Mask, XDate, XEdit, XNum, FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Tabs, comctrls, XBanner, checklst, Grids, DBGrids, DBCtrls,
  IBCustomDataSet, IBQuery, IBUpdateSQL, IBDatabase;

const
 // msg
 MSG_FORMADEPAGAMETOEOBRIGATORIA = 'Forma de Pagameto é Obrigatoria !';
 MSG_NAOEXISTEMREGISTROSSELECIONADOS = 'Não Existem Registros Selecionados';
 MSG_NAOEXISTEMREGISTROSSELECIONADOSPARAGERACAO = 'Não Existem Registros Selecionados Para Geração' ;
 
 // sql
 NOVA_LINHA = CHR(13)+CHR(10) ;
 SQL_EXEC_REL =
   ' Select ' +   NOVA_LINHA +
   '  0 AS CODIGO,' +   NOVA_LINHA +
   '  RESUMENCONTRATACION.CLICOD AS CLICOD,' +   NOVA_LINHA +
   '  RESUMENCONTRATACION.seq AS seq,' +   NOVA_LINHA +
   '  RESUMENCONTRATACION.NOME AS NOME,' +   NOVA_LINHA +
   '  RESUMENCONTRATACION.NomeMix AS NomeMix,' +   NOVA_LINHA +
   '  produtos.Observacoes AS Observacoes,' +   NOVA_LINHA +
   '  ''FormPago'' AS FormPago,' +   NOVA_LINHA +
   '  RESUMENCONTRATACION.QuantidadeTotal AS QuantidadeTotal,' +   NOVA_LINHA +
   '  RESUMENCONTRATACION.QUANTTOTALEXP AS QUANTTOTALEXP,' +   NOVA_LINHA +
   '  RESUMENCONTRATACION.QuantadePendente AS QuantadePendente,' +   NOVA_LINHA +
   '  RESUMENCONTRATACION.ValorSCCTotal AS ValorSCCTotal,' +   NOVA_LINHA +
   '  RESUMENCONTRATACION.ValorTotalExp AS ValorTotalExp,' +   NOVA_LINHA +
   '  RESUMENCONTRATACION.ValorTotalPendente AS ValorTotalPendente' +   NOVA_LINHA +
   ' from ( ' +   NOVA_LINHA ;    // 28/04/2012

SQL_EXEC_REL_TABELAS =
   ' ) AS  RESUMENCONTRATACION , produtos ' +   NOVA_LINHA +
   ' WHERE ( produtos.produto =  RESUMENCONTRATACION.NOMEMIX ) '  +   NOVA_LINHA ;

//   ' from RESUMENCONTRATACION' +   NOVA_LINHA ;    // 28/04/2012

// SQL_EXEC_REL_ORDER = 'ORDER BY RESUMENCONTRATACION.FormPago,RESUMENCONTRATACION.CLICOD ,  RESUMENCONTRATACION.seq , RESUMENCONTRATACION.NomeMix ' +   NOVA_LINHA ;
 SQL_EXEC_REL_ORDER = 'ORDER BY RESUMENCONTRATACION.CLICOD ,  RESUMENCONTRATACION.seq , RESUMENCONTRATACION.NomeMix ' +   NOVA_LINHA ;



//SC_SQL_EXE_INICIO =
//      'SELECT  ' +   NOVA_LINHA +
//      '    SOMATORIO.NOME                         AS DIVISAO                     , ' +   NOVA_LINHA +
//      '    SOMATORIO.NOMEMIX                      AS NOMEMIX                     , ' +   NOVA_LINHA +
//      '    SOMATORIO.QuantidadeTotal              AS QuantidadeTotal             , ' +   NOVA_LINHA +
//      '    SOMATORIO.VALORSCCTOTAL                AS VALORSCCTOTAL               , ' +   NOVA_LINHA +
//      '    SOMATORIO.QUANTTOTALEXP                AS QUANTTOTALEXP               , ' +   NOVA_LINHA +
//      '    SOMATORIO.VALORTOTALEXP                AS VALORTOTALEXP               , ' +   NOVA_LINHA +
//      '    SOMATORIO.QUANTADEPENDENTE             AS QUANTADEPENDENTE            , ' +   NOVA_LINHA +
//      '    SOMATORIO.VALORTOTALPENDENTE           AS VALORTOTALPENDENTE          , ' +   NOVA_LINHA +
//      '    SOMATORIO.VALORTOTALCOMISSAO           AS VALORTOTALCOMISSAO          , ' +   NOVA_LINHA +
//      '    SOMATORIO.ValorTotalComissaoExecutado  AS ValorTotalComissaoExecutado , ' +   NOVA_LINHA +
//      '    SOMATORIO.VlTotalComissaoPendente      AS VlTotalComissaoPendente     , ' +   NOVA_LINHA +
//      '    RESUMENCONTRATACION.OBSERVACOES        AS OBSERVACOES                   ' +   NOVA_LINHA +
//      'FROM ( '+   NOVA_LINHA ;



// SC_SQL_EXE_FINAL = '      ) AS SOMATORIO,' +   NOVA_LINHA +
//                    '      RESUMENCONTRATACION' +   NOVA_LINHA  +
//                    ' WHERE SOMATORIO.CLICOD = RESUMENCONTRATACION.CLICOD AND ' +   NOVA_LINHA +
//                    '      SOMATORIO.SEQ    = RESUMENCONTRATACION.SEQ' +   NOVA_LINHA ;

 SC_SQL_EXE_ORDER = ' ORDER BY SOMATORIO.CLICOD,SOMATORIO.SEQ,SOMATORIO.NOME,SOMATORIO.NOMEMIX' +   NOVA_LINHA ;


 SC_SQL_WHERE_EXPORTADOR  = ' CONTRATOTRANSPORTE.CONTRATO IN ( SELECT DISTINCT EXPORTADOTRANSITO.CONTRATO FROM EXPORTADOTRANSITO '  ;
 SC_SQL_WHERE_PRODUTOCONTRATOT  = ' CONTRATOTRANSPORTE.CONTRATO IN ( SELECT DISTINCT PRODUTOCONTRATOT.CONTRATO FROM PRODUTOCONTRATOT '  ;


 //
 SC_SQL_TOTAL ='SELECT ' +  NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	AS QuantidadeTotal, ' +   NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	AS VALORSCCTOTAL ,  ' +    NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	AS QUANTTOTALEXP,   ' +    NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	AS VALORTOTALEXP,   ' +    NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)   AS QUANTADEPENDENTE, ' +  NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE) AS VALORTOTALPENDENTE,' +  NOVA_LINHA +
// 	             '    Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO) AS VALORTOTALCOMISSAO , ' + NOVA_LINHA +
// 	             '    Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado) AS ValorTotalComissaoExecutado , ' + NOVA_LINHA +
// 	             '    Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente) AS VlTotalComissaoPendente , ' +  NOVA_LINHA +
               '    '' < = TOTAL GERAL  '' ' +  NOVA_LINHA +
               'FROM CONTRATOTRANSPORTE , DIVISOES ' ;

{

 SC_SQL_PROD_I ='SELECT ' +  NOVA_LINHA +
 	            '    CONTRATOTRANSPORTE.CLICOD               	AS CLICOD , ' +  NOVA_LINHA +
 	            '    CONTRATOTRANSPORTE.SEQ                 	AS SEQ   , ' +  NOVA_LINHA +
              '    DIVISOES.NOME                            AS NOME  , ' +  NOVA_LINHA ;

 SC_SQL_PROD_CAMP1	= '    Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	AS QuantidadeTotal, ' +  NOVA_LINHA ;
 SC_SQL_PROD_CAMP2	= '    Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	AS VALORSCCTOTAL ,  ' +   NOVA_LINHA ;

 SC_SQL_PROD_F =
	            '    Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	AS QUANTTOTALEXP,   ' +  NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	AS VALORTOTALEXP,   ' +   NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)   AS QUANTADEPENDENTE, ' +   NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE) AS VALORTOTALPENDENTE,' +   NOVA_LINHA +
//              '    Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO) AS VALORTOTALCOMISSAO ,' +   NOVA_LINHA +
//	            '    Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado) AS ValorTotalComissaoExecutado , ' +  NOVA_LINHA +
//	            '    Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente) AS VlTotalComissaoPendente , ' +  NOVA_LINHA +
              '    CONTRATOTRANSPORTE.NOMEMIX ' +  NOVA_LINHA +
              'FROM CONTRATOTRANSPORTE , DIVISOES ' +  NOVA_LINHA ;
}
 SC_SQL_PROD ='SELECT ' +  NOVA_LINHA +
 	            '    CONTRATOTRANSPORTE.CLICOD               	AS CLICOD , ' +  NOVA_LINHA +
 	            '    CONTRATOTRANSPORTE.SEQ                 	AS SEQ   , ' +  NOVA_LINHA +
              '    DIVISOES.NOME                            AS NOME  , ' +  NOVA_LINHA +
              '    Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	AS QuantidadeTotal, ' +  NOVA_LINHA +
              '    Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	AS VALORSCCTOTAL ,  ' +   NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	AS QUANTTOTALEXP,   ' +  NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	AS VALORTOTALEXP,   ' +   NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)   AS QUANTADEPENDENTE, ' +   NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE) AS VALORTOTALPENDENTE,' +   NOVA_LINHA +
//              '    Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO) AS VALORTOTALCOMISSAO ,' +   NOVA_LINHA +
//	            '    Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado) AS ValorTotalComissaoExecutado , ' +  NOVA_LINHA +
//	            '    Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente) AS VlTotalComissaoPendente , ' +  NOVA_LINHA +
              '    CONTRATOTRANSPORTE.NOMEMIX ' +  NOVA_LINHA +
              'FROM CONTRATOTRANSPORTE , DIVISOES ' +  NOVA_LINHA ;



  SC_SQL_PROD_WHERE = ' WHERE DIVISOES.CLICOD = CONTRATOTRANSPORTE.CLICOD AND ' +  NOVA_LINHA +
                      '       DIVISOES.SEQ    = CONTRATOTRANSPORTE.SEQ    AND '  +  NOVA_LINHA +
                      '       CONTRATOTRANSPORTE.CADASTRO = '  ;

  SC_SQL_PROD_WHERE_N = ' WHERE DIVISOES.CLICOD = CONTRATOTRANSPORTE.CLICOD AND ' +  NOVA_LINHA +
                        '       DIVISOES.SEQ    = CONTRATOTRANSPORTE.SEQ     '+  NOVA_LINHA;


  SC_SQL_PROD_GROUP = ' GROUP BY CONTRATOTRANSPORTE.CLICOD,CONTRATOTRANSPORTE.SEQ,DIVISOES.NOME,CONTRATOTRANSPORTE.NOMEMIX' +   NOVA_LINHA ;
  SC_SQL_PROD_ORDER = ' ORDER BY CONTRATOTRANSPORTE.CLICOD,CONTRATOTRANSPORTE.SEQ,DIVISOES.NOME,CONTRATOTRANSPORTE.NOMEMIX' +   NOVA_LINHA ;

{ // AJUDA SC_SQL_EXE_INICIO =
 SC_SQL_EXE_INICIO
    SC_SQL_PROD
    SC_SQL_PROD_WHERE_N
    SC_SQL_WHERE_EXPORTADOR
    SC_SQL_PROD_GROUP
    SC_SQL_PROD_ORDER
 SC_SQL_EXE_FINAL
 SC_SQL_EXE_ORDER

 SC_SQL_TOTAL
 SC_SQL_PROD_WHERE
 SC_SQL_WHERE_EXPORTADOR
 SC_SQL_PROD_GROUP
 SC_SQL_PROD_ORDER


 SC_SQL_PROD
 SC_SQL_PROD_WHERE
 SC_SQL_WHERE_EXPORTADOR

 SC_SQL_PROD_WHERE_N
 SC_SQL_WHERE_EXPORTADOR

 SC_SQL_PROD_GROUP
 SC_SQL_PROD_ORDER


}

type
  TFormRESUMENCONTRATA = class(TForm)
    BitBtn1: TBitBtn;
    BtnAjuda: TSpeedButton;
    BtnCancelar: TBitBtn;
    BtnFechar: TSpeedButton;
    BtnVisualizar: TBitBtn;
    CBox_FIM: TComboBox;
    CBox_INIC: TComboBox;
    DBGrid_PROD: TDBGrid;
    DBGrid3: TDBGrid;
    DBNav_PROD: TDBNavigator;
    IBQ_PRODUTOS: TIBQuery;
    Divisao: TTabSet;
    DS_PROD: TDataSource;
    DS_TOT: TDataSource;
    frDBDataSet: TfrDBDataSet;
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    IBQ_TOT: TIBQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LbTituloForm: TLabel;
    Panel_Filtro: TPanel;
    Panel1: TPanel;
    PnSup: TPanel;
    PRODUTO: TGroupBox;
    Selecao_1: TScrollBox;
    ShapeSup: TShape;
    TOTAL: TGroupBox;
    XDT_FIM: TXDateEdit;
    XDT_INIC: TXDateEdit;
    GroupBox_FormaPag: TGroupBox;
    CBox_FormaPag: TComboBox;
    PageCont_Tab: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    BitBtn2: TBitBtn;
    DS_EXCEL: TDataSource;
    DContratoTransporte: TIBQuery;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    XDT_INIC_EMB: TXDateEdit;
    XDT_FIM_EMB: TXDateEdit;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    CBox_INIC_F: TComboBox;
    CBox_FIM_F: TComboBox;
    DBNavig_Excel: TDBNavigator;
    DBGrid_Excel: TDBGrid;
    IBUpdateSQL1: TIBUpdateSQL;
    IBQ_PRODUTOSCLICOD: TIntegerField;
    IBQ_PRODUTOSSEQ: TSmallintField;
    IBQ_PRODUTOSNOME: TIBStringField;
    IBQ_PRODUTOSNOMEMIX: TIBStringField;
    IBQ_PRODUTOSVALORSCCTOTAL: TFloatField;
    IBQ_PRODUTOSQUANTTOTALEXP: TFloatField;
    IBQ_PRODUTOSVALORTOTALEXP: TFloatField;
    IBQ_PRODUTOSQUANTADEPENDENTE: TFloatField;
    IBQ_PRODUTOSVALORTOTALPENDENTE: TFloatField;
    DContratoTransporteCODIGO: TIntegerField;
    DContratoTransporteCLICOD: TIntegerField;
    DContratoTransporteSEQ: TSmallintField;
    DContratoTransporteNOME: TIBStringField;
    DContratoTransporteNOMEMIX: TIBStringField;
    DContratoTransporteOBSERVACOES: TIBStringField;
    DContratoTransporteFORMPAGO: TIBStringField;
    DContratoTransporteQUANTIDADETOTAL: TFloatField;
    DContratoTransporteQUANTTOTALEXP: TFloatField;
    DContratoTransporteQUANTADEPENDENTE: TFloatField;
    DContratoTransporteVALORSCCTOTAL: TFloatField;
    DContratoTransporteVALORTOTALEXP: TFloatField;
    DContratoTransporteVALORTOTALPENDENTE: TFloatField;
    GroupBox_Exce: TGroupBox;
    IBQ_PRODUTOSQUANTIDADETOTAL: TFloatField;
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
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    Caption_rel : string ;
    { Private declarations }
//    QyRelatorio,}T_SQL {, T_SQL_PROD} : TTabela;
    DRESUMENCONTRATACION : TDRESUMENCONTRATACION ;
//    T_SQL_PAIS : TTabela;
    {02-Início do Bloco Modular. Modificações não serão preservadas}
//    DContratoTransporte: TDContratoTransporte;
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
  FormRESUMENCONTRATA: TFormRESUMENCONTRATA;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, Abertura, GridPesquisa, Interno, RotinaEd;

procedure TFormRESUMENCONTRATA.ConstroiSql;
//var
//  I: Integer;
begin
  {[[[04]]] -Início do Bloco Modular. Modificações não serão preservadas}
{
  DContratoTransporte.Filtro.Clear;
  DContratoTransporte.AtualizaSql(False);

  Parametros(DContratoTransporte);

  DContratoTransporte.Open;
}
  // frDBDataSet.DataSet := DContratoTransporte;

//  frDBDataSet_DBoocking.DataSet := DBoocking;
  {[[[99]]]-Final do Bloco Modular. Modificações não serão preservadas}
  {
  T_SQL_PROD.AtualizaSql(FALSE);
  T_SQL_PROD.Open ;

  frDBDataSet.DataSet := T_SQL_PROD ;
  frDBDataSet_DBoocking.DataSet := DBoocking;
  }

//  frDBDataSet.DataSet := DContratoTransporte;

end;

procedure TFormRESUMENCONTRATA.Parametros(Tabela: TTabela);
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

procedure TFormRESUMENCONTRATA.FormShow(Sender: TObject);
Var
//  I: Integer;
  S_SQL_PROD_WHERE  , SQL_EXEC_WHERE , S_SQL_PRODUTO : STRING ;
begin
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption_rel := 'RESUMEN CONTRATACIÓN';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}

  Caption := 'Resumo  Contratação' ;
  S_SQL_PRODUTO := '' ;

  // CARREGANDO   LIST BOX cliente
  Carrega_CB(CBox_INIC,CBox_FIM,'SELECT RAZAO || '' >> '' || CLICOD || '' <<''  AS CAMPOS FROM CLIENTES ORDER BY RAZAO', 'CAMPOS',SELF);
  Carrega_CB(CBox_FormaPag,NIL,'SELECT FORMPAGO  AS FORMPAGO FROM TBFORMAPAGAMENTO ORDER BY FORMPAGO', 'FORMPAGO',SELF);

  // CARREGANDO   LIST BOX fornecedor
  Carrega_CB(CBox_INIC_F,CBox_FIM_F,'SELECT RAZAO || '' >> '' || FORCOD || '' <<''  AS CAMPOS FROM FORNECEDORES ORDER BY RAZAO', 'CAMPOS',SELF);

  // RELATORIO FORMATO EXCEL
  DContratoTransporte.SQL.Clear;
  S_SQL_PROD_WHERE :=   SC_SQL_PROD_WHERE +  AtribuiAspas ( FormatDateTime('YYYY/MM/DD',DATE) )  + ' AND ( ( ' +SC_SQL_WHERE_EXPORTADOR + ')) OR ('+ SC_SQL_WHERE_PRODUTOCONTRATOT + ')) ) ' ;

//  DContratoTransporte.SQL.Add(SC_SQL_EXE_INICIO + SC_SQL_PROD + S_SQL_PROD_WHERE + SC_SQL_PROD_GROUP + SC_SQL_PROD_ORDER + SC_SQL_EXE_FINAL +  SC_SQL_EXE_ORDER );

//  SQL_EXEC_WHERE := ' AND  RESUMENCONTRATACION.FormPago = ''9999'' ';
  S_SQL_PRODUTO := SC_SQL_PROD + S_SQL_PROD_WHERE +  SC_SQL_PROD_GROUP + SC_SQL_PROD_ORDER  ;
  DContratoTransporte.SQL.Add(SQL_EXEC_REL + S_SQL_PRODUTO + SQL_EXEC_REL_TABELAS +  SQL_EXEC_WHERE + SQL_EXEC_REL_ORDER  );
  DContratoTransporte.SQL.SaveToFile('_REL_T_DContratoTransporte.SQL');
  DContratoTransporte.Prepare ;
  DContratoTransporte.Open ;

  // PRODUTOS SEM OBSERVACAO
  IBQ_PRODUTOS.SQL.Clear ;
//IBQ_PRODUTOS.SQL.Add(SC_SQL_PROD + S_SQL_PROD_WHERE + ' AND ' + SC_SQL_WHERE_EXPORTADOR + ' ) ' + SC_SQL_PROD_GROUP + SC_SQL_PROD_ORDER );
  IBQ_PRODUTOS.SQL.Add( S_SQL_PRODUTO  );


  IBQ_PRODUTOS.SQL.SaveToFile('_IBQ_PRODUTOS.SQL');
  IBQ_PRODUTOS.Prepare ;
  IBQ_PRODUTOS.Open ;

  // TOTALIZADOR
  IBQ_TOT.SQL.Clear ;
//  IBQ_TOT.SQL.Add(SC_SQL_TOTAL + S_SQL_PROD_WHERE + ' AND ' + SC_SQL_WHERE_EXPORTADOR + ' ) ' );
  IBQ_TOT.SQL.Add(SC_SQL_TOTAL + S_SQL_PROD_WHERE  );
  IBQ_TOT.SQL.SaveToFile('_IBQ_TOT.SQL');
  IBQ_TOT.Prepare ;
  IBQ_TOT.Open ;

//28/04/2012
//  DS_PROD.DataSet := IBQ_PRODUTOS;
  DS_PROD.DataSet := DContratoTransporte;
  DS_TOT.DataSet  := IBQ_TOT ;
  DS_EXCEL.DataSet:= DContratoTransporte ;




  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  FormResize(Self);
  frReport.OnUserFunction := FuncoesExtras;

  PageCont_Tab.Align := alClient ;
  PRODUTO.Align := alClient  ;
  DBNavig_Excel.Align := alTop ;
  DBGrid_Excel.Align := alClient ;
  GroupBox_Exce.Align := alClient ;
  TOTAL.Height := 60 ;
  PageCont_Tab.TabIndex :=  0 ;


  DContratoTransporteQUANTIDADETOTAL.DisplayFormat := '#,###,###,##0.000' ;
  DContratoTransporteQUANTIDADETOTAL.DisplayLabel := 'QUANTIDADE TOTAL'       ;
  DContratoTransporteQUANTTOTALEXP.DisplayFormat := '#,###,###,##0.000'   ;
  DContratoTransporteQUANTTOTALEXP.DisplayLabel := 'QUANT. TOTAL EXP.'       ;
  DContratoTransporteQUANTADEPENDENTE.DisplayFormat := '#,###,###,##0.000'   ;
  DContratoTransporteQUANTADEPENDENTE.DisplayLabel := 'QUANT. PENDENTE'   ;


  DContratoTransporteVALORSCCTOTAL.DisplayFormat := '#,###,###,##0.00'   ;
  DContratoTransporteVALORSCCTOTAL.DisplayLabel := 'VALOR SCC TOTAL';
  DContratoTransporteVALORTOTALEXP.DisplayFormat := '#,###,###,##0.000'   ;
  DContratoTransporteVALORTOTALEXP.DisplayLabel := 'VALOR TOTAL EXP.';
  DContratoTransporteVALORTOTALPENDENTE.DisplayFormat := '#,###,###,##0.00'   ;
  DContratoTransporteVALORTOTALPENDENTE.DisplayLabel := 'VALOR TOTAL PENDENTE';

  IBQ_PRODUTOSQUANTIDADETOTAL.DisplayFormat := '#,###,###,##0.000'   ;
//  IBQ_PRODUTOSCLICOD: ;
//  IBQ_PRODUTOSSEQ: ;
//  IBQ_PRODUTOSNOME: ;
//  IBQ_PRODUTOSNOMEMIX ;
  IBQ_PRODUTOSVALORSCCTOTAL.DisplayFormat := '#,###,###,##0.00' ;
  IBQ_PRODUTOSQUANTTOTALEXP.DisplayFormat := '#,###,###,##0.000'   ; ;
  IBQ_PRODUTOSVALORTOTALEXP.DisplayFormat := '#,###,###,##0.00' ;
  IBQ_PRODUTOSQUANTADEPENDENTE.DisplayFormat := '#,###,###,##0.000'   ; ;
  IBQ_PRODUTOSVALORTOTALPENDENTE.DisplayFormat := '#,###,###,##0.00' ;

  IBQ_PRODUTOSQUANTIDADETOTAL.DisplayLabel := 'QUANTIDADE TOTAL';
  IBQ_PRODUTOSCLICOD.DisplayLabel := 'CÓD. CLIENTE' ;
  IBQ_PRODUTOSSEQ.DisplayLabel := 'CÓD. DIVISAO' ;
  IBQ_PRODUTOSNOME.DisplayLabel := 'DIVISAO' ;
  IBQ_PRODUTOSNOMEMIX.DisplayLabel := 'PRODUTO' ;
  IBQ_PRODUTOSVALORSCCTOTAL.DisplayLabel := 'VALOR SCC TOTAL' ;
  IBQ_PRODUTOSQUANTTOTALEXP.DisplayLabel := 'QUANT. TOTAL EXP.' ;
  IBQ_PRODUTOSVALORTOTALEXP.DisplayLabel := 'VALOR TOTAL EXP.' ;
  IBQ_PRODUTOSQUANTADEPENDENTE.DisplayLabel := 'QUANTADE PENDENTE' ;
  IBQ_PRODUTOSVALORTOTALPENDENTE.DisplayLabel := 'VALOR TOTAL PENDENTE' ;


  DRESUMENCONTRATACION.Open ;
  // 28/04/2012
  TabSheet1.Visible := False ;

end;

procedure TFormRESUMENCONTRATA.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormRESUMENCONTRATA.InicializaVariaveis;
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
  frVariables['Titulo_1']     := Caption_rel ;
  frVariables['Titulo_2']     := CBox_FormaPag.Text ; // 19/06/2012  '';
  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormRESUMENCONTRATA.BtnVisualizarClick(Sender: TObject);
begin
  BitBtn1Click(SENDER);
  ConstroiSql;
  InicializaVariaveis;
  
  // regra de existencia 2
  IF DContratoTransporte.RecordCount = 0  THEN begin
     MessageDlg(MSG_NAOEXISTEMREGISTROSSELECIONADOS,mtWarning,[mbOk],0);
     exit ;
  end;

  if DRESUMENCONTRATACION.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório

end;

procedure TFormRESUMENCONTRATA.FormResize(Sender: TObject);
begin
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
end;

procedure TFormRESUMENCONTRATA.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFormRESUMENCONTRATA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}

  IBQ_PRODUTOS.Close ;
  DContratoTransporte.Close ;

  DRESUMENCONTRATACION.close ;
  DRESUMENCONTRATACION.Free ;

end;

{08-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormRESUMENCONTRATA.CalculosDContratoTransporte(DataSet: TDataSet);
begin
end;

procedure TFormRESUMENCONTRATA.AtualizaDetalhe_DContratoTransporte(Sender: TObject;
  Field: TField);
begin
end;

{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormRESUMENCONTRATA.FuncoesExtras(const Name: String; p1, p2,
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

procedure TFormRESUMENCONTRATA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then   // Calendário
    Interno108
  else if Key = VK_F6 then // Calculadora
    Interno109
  else if Key = VK_F7 then // Agenda
    Interno110;
end;

procedure TFormRESUMENCONTRATA.FormCreate(Sender: TObject);
begin

  DRESUMENCONTRATACION := TDRESUMENCONTRATACION.Create(NIL) ;
//  DRESUMENCONTRATACION.DataBase := TabGlobal.DContratoTransporte.DataBase ;
//  DRESUMENCONTRATACION.Transaction := TabGlobal.DContratoTransporte.Transaction ;

  IBQ_TOT.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  IBQ_TOT.Transaction := TabGlobal.DContratoTransporte.Transaction ;

  IBQ_PRODUTOS.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  IBQ_PRODUTOS.Transaction := TabGlobal.DContratoTransporte.Transaction ;

  DContratoTransporte.Close ;
  DContratoTransporte.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  DContratoTransporte.Transaction := TabGlobal.DContratoTransporte.Transaction ;

end;

procedure TFormRESUMENCONTRATA.BitBtn1Click(Sender: TObject);
VAR
  S_SQL_PROD_WHERE ,S_SQL_PRODUTO, S_FILTRO , S_FILTRO_EMB,S_FILTRO_EXC, S_CLICOD ,
  S_FILTRO_PRO, S_SQL_WHERE_EXPORTADOR, S_SQL_PROD_CAMP1, S_SQL_PROD_CAMP2 , S_FILTRO_CAMPO  : STRING ;
  N_INC  , N_FIN : INTEGER ;
begin
  IF CBox_FormaPag.Text = '' THEN begin
     MessageDlg(MSG_FORMADEPAGAMETOEOBRIGATORIA,mtWarning,[mbOk],0);
     exit ;
  end;

  Screen.Cursor := crHourGlass;
  S_FILTRO := '';
  S_FILTRO_EMB := '';
  S_FILTRO_PRO := '' ;
  S_FILTRO_EXC := '';
  S_SQL_PRODUTO := '' ;

//  S_SQL_PROD_CAMP1	:= SC_SQL_PROD_CAMP1	;
//  S_SQL_PROD_CAMP2	:= SC_SQL_PROD_CAMP2	;

  // 19/06/20129
  // Caption_rel := 'RESUMEN CONTRATION ';
  Caption_rel := 'RESUMEN CONTRATACIÓN';
  // CADASTRO    RESUMENCONTRATACION
  IF  XDT_INIC.DateValue <> -693594 THEN
      S_FILTRO := ' CONTRATOTRANSPORTE.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue)) ;

  IF  XDT_FIM.DateValue <> -693594 THEN
      IF  S_FILTRO = '' THEN
          S_FILTRO := ' CONTRATOTRANSPORTE.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))
      ELSE
          S_FILTRO := S_FILTRO + ' AND CONTRATOTRANSPORTE.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;

  // EMBARQUE
  IF  XDT_INIC_EMB.DateValue <> -693594 THEN begin
      S_FILTRO_EMB := ' EXPORTADOTRANSITO.DATAEMBARQUE >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC_EMB.DateValue)) ;
      S_FILTRO_CAMPO := ' EXPORTADOTRANSITO.DATAEMBARQUE < '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC_EMB.DateValue)) ;
  end;

  IF  XDT_FIM_EMB.DateValue <> -693594 THEN  begin
      IF  S_FILTRO_EMB = '' THEN
          S_FILTRO_EMB := ' EXPORTADOTRANSITO.DATAEMBARQUE <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM_EMB.DateValue))
      ELSE
          S_FILTRO_EMB := S_FILTRO_EMB + ' AND EXPORTADOTRANSITO.DATAEMBARQUE <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM_EMB.DateValue)) ;

      IF  S_FILTRO_CAMPO = '' then
          S_FILTRO_CAMPO := ' EXPORTADOTRANSITO.DATAEMBARQUE < '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM_EMB.DateValue)) ;
  end;

  // FormaPag
  IF  CBox_FormaPag.Text <> '' THEN BEGIN

      S_FILTRO_PRO :=  ' PRODUTOCONTRATOT.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text ) ;

      IF  S_FILTRO_EMB = '' THEN
          S_FILTRO_EMB := ' EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )
      ELSE
          S_FILTRO_EMB := S_FILTRO_EMB + ' AND EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text ) ;

      IF  S_FILTRO_CAMPO <> '' then
          S_FILTRO_CAMPO := S_FILTRO_CAMPO + ' AND EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )



//      IF  S_FILTRO_EXC = '' THEN
//          S_FILTRO_EXC := ' RESUMENCONTRATACION.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )
//      ELSE
//          S_FILTRO_EXC := S_FILTRO_EXC + ' AND RESUMENCONTRATACION.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text ) ;

  END;

  // CLIENTE
  IF CBox_INIC.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_INIC.Text) + 2   ;
     N_FIN := POS('<<',CBox_INIC.Text)   ;
     S_CLICOD := COPY( CBox_INIC.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' CONTRATOTRANSPORTE.CLICOD >= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.CLICOD >= '+ S_CLICOD ;

     IF  S_FILTRO_EXC = '' THEN
         S_FILTRO_EXC := ' RESUMENCONTRATACION.CLICOD >= '+ S_CLICOD
     ELSE
         S_FILTRO_EXC := S_FILTRO_EXC +' AND RESUMENCONTRATACION.CLICOD >= '+ S_CLICOD ;

     CAPTION_rel := CAPTION_rel + COPY( CBox_INIC.Text,1, N_INC - 3  );
  END;

  IF CBox_FIM.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_FIM.Text) + 2   ;
     N_FIN := POS('<<',CBox_FIM.Text)   ;
     S_CLICOD := COPY( CBox_FIM.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' CONTRATOTRANSPORTE.CLICOD <= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.CLICOD <= '+ S_CLICOD ;


     IF  S_FILTRO_EXC = '' THEN
         S_FILTRO_EXC := ' RESUMENCONTRATACION.CLICOD <= '+ S_CLICOD
     ELSE
         S_FILTRO_EXC := S_FILTRO_EXC +' AND RESUMENCONTRATACION.CLICOD <= '+ S_CLICOD ;

     // 19/06/20129  a CARIAN SO QUE UM CLIENTE
     // CAPTION_rel := CAPTION_rel + COPY( CBox_INIC.Text,1, N_INC - 3 );

  END;

  // FORNECEDOR
  IF CBox_INIC_F.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_INIC_F.Text) + 2   ;
     N_FIN := POS('<<',CBox_INIC_F.Text)   ;
     S_CLICOD := COPY( CBox_INIC_F.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' CONTRATOTRANSPORTE.FORCOD >= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.FORCOD >= '+ S_CLICOD ;

     CAPTION_rel := CAPTION_rel + COPY( CBox_INIC_F.Text,1, N_INC - 3 );
  END;

  IF CBox_FIM_F.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_FIM_F.Text) + 2   ;
     N_FIN := POS('<<',CBox_FIM_F.Text)   ;
     S_CLICOD := COPY( CBox_FIM_F.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' CONTRATOTRANSPORTE.FORCOD <= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.FORCOD <= '+ S_CLICOD ;
     CAPTION_rel := CAPTION_rel + COPY( CBox_INIC_F.Text,1, N_INC - 3 );
  END;

  IF  S_FILTRO <> '' THEN
      S_SQL_PROD_WHERE := SC_SQL_PROD_WHERE_N + ' AND ' + S_FILTRO
  ELSE
      S_SQL_PROD_WHERE := SC_SQL_PROD_WHERE_N ;


  IF  S_FILTRO_EMB <> '' THEN
      S_SQL_WHERE_EXPORTADOR := ' AND (( ' + SC_SQL_WHERE_EXPORTADOR + ' WHERE ' + S_FILTRO_EMB + ' )) OR ( ' + SC_SQL_WHERE_PRODUTOCONTRATOT  + ' WHERE ' + S_FILTRO_PRO +  ' ) ) ) '
  ELSE
      S_SQL_WHERE_EXPORTADOR := ' AND (( ' + SC_SQL_WHERE_EXPORTADOR + ')) OR (' + SC_SQL_WHERE_PRODUTOCONTRATOT +' )) ) ';

  IF  S_FILTRO_EXC <> '' THEN
      S_FILTRO_EXC :=   ' AND ' + S_FILTRO_EXC + NOVA_LINHA
  ELSE
      S_FILTRO_EXC :=  ' ';
// 28/04/2012
  S_SQL_PRODUTO := SC_SQL_PROD + S_SQL_PROD_WHERE + S_SQL_WHERE_EXPORTADOR + SC_SQL_PROD_GROUP + SC_SQL_PROD_ORDER ;

  DContratoTransporte.SQL.Clear;
  DContratoTransporte.SQL.Add( SQL_EXEC_REL + S_SQL_PRODUTO  + SQL_EXEC_REL_TABELAS + S_FILTRO_EXC + SQL_EXEC_REL_ORDER  );
// 28/04/2012
//  DContratoTransporte.SQL.Add( SQL_EXEC_REL + S_SQL_PRODUTO + SQL_EXEC_REL_TABELAS + S_FILTRO_EXC + SQL_EXEC_REL_ORDER  );
  DContratoTransporte.SQL.SaveToFile('_REL_T_DContratoTransporte.SQL');
  DContratoTransporte.Prepare ;
  DContratoTransporte.Open ;
  DContratoTransporte.Last ;
  DContratoTransporte.First ;
  GroupBox_Exce.Caption := 'Planilha Núm. Linhas = ' + INTTOSTR(DContratoTransporte.RecordCount)   ;

  IBQ_TOT.Close ;
  IBQ_TOT.SQL.Clear ;
  IBQ_TOT.SQL.Add(SC_SQL_TOTAL + S_SQL_PROD_WHERE + S_SQL_WHERE_EXPORTADOR ) ;
  IBQ_TOT.SQL.SaveToFile('_IBQ_TOT.SQL');
  IBQ_TOT.Prepare ;
  IBQ_TOT.Open ;

  IBQ_PRODUTOS.Close;
  IBQ_PRODUTOS.SQL.Clear;
  IBQ_PRODUTOS.SQL.Add(SC_SQL_PROD + S_SQL_PROD_WHERE + S_SQL_WHERE_EXPORTADOR + SC_SQL_PROD_GROUP + SC_SQL_PROD_ORDER );
// 28/04/2012
//IBQ_PRODUTOS.SQL.Add(SC_SQL_PROD + S_SQL_PROD_WHERE + S_SQL_WHERE_EXPORTADOR + SC_SQL_PROD_GROUP + SC_SQL_PROD_ORDER );
  IBQ_PRODUTOS.SQL.SaveToFile('_IBQ_PRODUTOS.SQL');
  IBQ_PRODUTOS.Prepare ;
  IBQ_PRODUTOS.Open ;
  IBQ_PRODUTOS.Last ;
  IBQ_PRODUTOS.First ;
  PRODUTO.Caption := 'PRODUTO  Núm. Linhas = ' + INTTOSTR(IBQ_PRODUTOS.RecordCount)   ;
  Screen.Cursor := crDefault;

  IF DContratoTransporte.RecordCount = 0  THEN begin
     MessageDlg(MSG_NAOEXISTEMREGISTROSSELECIONADOS,mtWarning,[mbOk],0);
     exit ;
  end;
  
end;

procedure TFormRESUMENCONTRATA.BitBtn2Click(Sender: TObject);
VAR
  S_NOMEMIX , SQL_FILTRO  , s_FormaPag : STRING ;
  I_CLICOD , I_SEQ  : INTEGER ;
begin
  IBQ_PRODUTOS.First ;
  SQL_FILTRO := '' ;

  // regra de existencia 1
  IF CBox_FormaPag.Text = '' THEN begin
     MessageDlg(MSG_FORMADEPAGAMETOEOBRIGATORIA,mtWarning,[mbOk],0);
     exit ;
  end;

  // regra de existencia 2
  IF IBQ_PRODUTOS.RecordCount = 0  THEN begin
     MessageDlg(MSG_NAOEXISTEMREGISTROSSELECIONADOSPARAGERACAO,mtWarning,[mbOk],0);
     exit ;
  end;

  Screen.Cursor := crHourGlass;

  WHILE NOT IBQ_PRODUTOS.Eof DO BEGIN

        I_CLICOD  := IBQ_PRODUTOS.FieldByName('CLICOD').Value ;
        I_SEQ     := IBQ_PRODUTOS.FieldByName('SEQ').Value ;
        S_NOMEMIX := IBQ_PRODUTOS.FieldByName('NOMEMIX').Value ;
        s_FormaPag:= CBox_FormaPag.Text  ;

        DRESUMENCONTRATACION.Filtro.Clear;
        SQL_FILTRO := 'CLICOD = '+ ( INTTOSTR(I_CLICOD ))+' AND SEQ = ' + (INTTOSTR(I_SEQ)) + ' AND NOMEMIX = '+ AtribuiAspas(S_NOMEMIX)+' AND FormPago  = '+ AtribuiAspas( CBox_FormaPag.Text );
        DRESUMENCONTRATACION.Close ;
        DRESUMENCONTRATACION.Filtro.Add(SQL_FILTRO);
        DRESUMENCONTRATACION.AtualizaSql;


        // SE EXISTE ATUALIZAR
//        IF NOT PTabela(DRESUMENCONTRATACION,['CLICOD','SEQ','NOMEMIX','FORMPAGO'],[I_CLICOD,I_SEQ,S_NOMEMIX,s_FormaPag] ) THEN BEGIN
        IF DRESUMENCONTRATACION.EOF  THEN BEGIN
           DRESUMENCONTRATACION.Inclui(NIL) ;
           DRESUMENCONTRATACION.CODIGO.AtribuiValorPadrao ;
           DRESUMENCONTRATACION.CLICOD.Conteudo := IBQ_PRODUTOSCLICOD.Value ; //: TIntegerField; ;
           DRESUMENCONTRATACION.seq.Conteudo := IBQ_PRODUTOSSEQ.Value ; //: TSmallintField; ;
           DRESUMENCONTRATACION.NomeMix.Conteudo := IBQ_PRODUTOSNOMEMIX.Value ; //: TIBStringField;;
           DRESUMENCONTRATACION.QuantidadeTotal.Conteudo :=  IBQ_PRODUTOSQUANTIDADETOTAL.Value ; //: TFloatField;
           DRESUMENCONTRATACION.QUANTTOTALEXP.Conteudo := IBQ_PRODUTOSQUANTTOTALEXP.Value ; //: TFloatField;
           DRESUMENCONTRATACION.ValorSCCTotal.Conteudo := IBQ_PRODUTOSVALORSCCTOTAL.Value ; //: TFloatField;
//           DRESUMENCONTRATACION.ValorTotalComissaoExecutado.Conteudo := IBQ_PRODUTOSVALORTOTALCOMISSAOEXECUTADO.Value ; //: TFloatField;
//           DRESUMENCONTRATACION.VALORTOTALCOMISSAO.Conteudo := IBQ_PRODUTOSVALORTOTALCOMISSAO.Value ; //: TFloatField;
           DRESUMENCONTRATACION.QuantadePendente.Conteudo := IBQ_PRODUTOSQUANTADEPENDENTE.Value ; //: TFloatField;
           DRESUMENCONTRATACION.ValorTotalExp.Conteudo := IBQ_PRODUTOSVALORTOTALEXP.Value ; //: TFloatField;
           DRESUMENCONTRATACION.ValorTotalPendente.Conteudo := IBQ_PRODUTOSVALORTOTALPENDENTE.Value ; //: TFloatField;
//           DRESUMENCONTRATACION.VlTotalComissaoPendente.Conteudo := IBQ_PRODUTOSVLTOTALCOMISSAOPENDENTE.Value ; //: TFloatField;
           // DRESUMENCONTRATACION.Observacoes.Conteudo :=
           DRESUMENCONTRATACION.FormPago.Conteudo := CBox_FormaPag.Text ;
           DRESUMENCONTRATACION.NOME.Conteudo := IBQ_PRODUTOSNOME.Value ; //: TIBStringField;
           DRESUMENCONTRATACION.Salva ;

        END
        ELSE BEGIN
           // DRESUMENCONTRATACION.Edit ;
           DRESUMENCONTRATACION.Modifica ;
           //DRESUMENCONTRATACION.CLICOD.Conteudo := IBQ_PRODUTOSCLICOD.Value ; //: TIntegerField; ;
           //DRESUMENCONTRATACION.seq.Conteudo := IBQ_PRODUTOSSEQ.Value ; //: TSmallintField; ;
           //DRESUMENCONTRATACION.NomeMix.Conteudo := IBQ_PRODUTOSNOMEMIX.Value ; //: TIBStringField;;
           // DRESUMENCONTRATACION.VlTotalComissaoPendente.Conteudo := IBQ_PRODUTOSVLTOTALCOMISSAOPENDENTE.Value ; //: TFloatField;
           // DRESUMENCONTRATACION.Observacoes.Conteudo :=
           // DRESUMENCONTRATACION.FormPago.Conteudo := CBox_FormaPag.Text ;
//           DRESUMENCONTRATACION.ValorTotalComissaoExecutado.Conteudo := IBQ_PRODUTOSVALORTOTALCOMISSAOEXECUTADO.Value ; //: TFloatField;
//           DRESUMENCONTRATACION.VALORTOTALCOMISSAO.Conteudo := IBQ_PRODUTOSVALORTOTALCOMISSAO.Value ; //: TFloatField;

           DRESUMENCONTRATACION.QuantidadeTotal.Conteudo :=  IBQ_PRODUTOSQUANTIDADETOTAL.Value ; //: TFloatField;
           DRESUMENCONTRATACION.QUANTTOTALEXP.Conteudo := IBQ_PRODUTOSQUANTTOTALEXP.Value ; //: TFloatField;
           DRESUMENCONTRATACION.ValorSCCTotal.Conteudo := IBQ_PRODUTOSVALORSCCTOTAL.Value ; //: TFloatField;
           DRESUMENCONTRATACION.QuantadePendente.Conteudo := IBQ_PRODUTOSQUANTADEPENDENTE.Value ; //: TFloatField;
           DRESUMENCONTRATACION.ValorTotalExp.Conteudo := IBQ_PRODUTOSVALORTOTALEXP.Value ; //: TFloatField;
           DRESUMENCONTRATACION.ValorTotalPendente.Conteudo := IBQ_PRODUTOSVALORTOTALPENDENTE.Value ; //: TFloatField;
           DRESUMENCONTRATACION.NOME.Conteudo := IBQ_PRODUTOSNOME.Value ; //: TIBStringField;
           DRESUMENCONTRATACION.Salva ;
        END;
        IBQ_PRODUTOS.Next ;
  END;
  DRESUMENCONTRATACION.AtualizaSql;
  DContratoTransporte.Close ;
  DContratoTransporte.Open ;

  Screen.Cursor := crDefault;
  
end;

end.
