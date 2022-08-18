{
   Programa.: RESUMEN.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
      08/06/2011 relatorio concluido
}
unit RESUMEN;

interface

{$I Princ.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, BaseD, Atributo, Tabela, Menus, Calculos, db,
  {$I LTab.pas}
  XLookUp, XDBDate, Mask, XDate, XEdit, XNum, FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Tabs, comctrls, XBanner, checklst, Grids, DBGrids, DBCtrls,
  IBCustomDataSet, IBQuery;

const
 NOVA_LINHA = CHR(13)+CHR(10) ;

 SC_SQL_SUM = 'SELECT                                                                                                                           '+ NOVA_LINHA +
              '    Sum(CONTRATOTRANSPORTE2.QUANTIDADETOTAL) 	            AS QuantidadeTotal,                                                   '+ NOVA_LINHA +
              '    Sum(CONTRATOTRANSPORTE2.VALORSCCTOTAL)   	            AS VALORSCCTOTAL ,                                                    '+ NOVA_LINHA +
              '    Sum(CONTRATOTRANSPORTE2.QUANTTOTALEXP)   	            AS QUANTTOTALEXP,                                                     '+ NOVA_LINHA +
              '    Sum(CONTRATOTRANSPORTE2.VALORTOTALEXP)   	            AS VALORTOTALEXP,                                                     '+ NOVA_LINHA +
              '    sum(CONTRATOTRANSPORTE2.QUANTIDADETOTAL - CONTRATOTRANSPORTE2.QUANTTOTALEXP ) AS QUANTADEPENDENTE ,                          '+ NOVA_LINHA +
              '    sum(CONTRATOTRANSPORTE2.VALORSCCTOTAL - CONTRATOTRANSPORTE2.VALORTOTALEXP ) AS VALORTOTALPENDENTE ,                          '+ NOVA_LINHA +
              '    Sum(CONTRATOTRANSPORTE2.VALORTOTALCOMISSAO)           	AS VALORTOTALCOMISSAO ,                                               '+ NOVA_LINHA +
              '    Sum(CONTRATOTRANSPORTE2.ValorTotalComissaoExecutado)  	AS ValorTotalComissaoExecutado ,                                      '+ NOVA_LINHA +
              '    Sum(CONTRATOTRANSPORTE2.VALORTOTALCOMISSAO - CONTRATOTRANSPORTE2.ValorTotalComissaoExecutado ) AS VlTotalComissaoPendente ,  '+ NOVA_LINHA ;




 SC_SQL_SUM_Prin_i                = '   (                                ' +    NOVA_LINHA +
                                    '      SELECT  DISTINCT                        ' +    NOVA_LINHA +
                                    '        CONTRATOTRANSPORTE.CONTRATO , ' +    NOVA_LINHA ;

 SC_QUANTIDADETOTAL_I             = '       (SELECT IIF(SUM( PRODUTOCONTRATOT.QUANTIDADE)       IS NULL ,0,SUM(PRODUTOCONTRATOT.QUANTIDADE) )       FROM PRODUTOCONTRATOT  WHERE ( CONTRATOTRANSPORTE.CONTRATO = PRODUTOCONTRATOT.CONTRATO  )' ;
 SC_QUANTIDADETOTAL_F             = ' )  AS  QUANTIDADETOTAL, ' +    NOVA_LINHA  ;

 SC_VALORSCCTOTAL_I               = '       (SELECT IIF(SUM( PRODUTOCONTRATOT.VALORSCC)         IS NULL ,0,SUM(PRODUTOCONTRATOT.VALORSCC) )         FROM PRODUTOCONTRATOT  WHERE ( CONTRATOTRANSPORTE.CONTRATO = PRODUTOCONTRATOT.CONTRATO  )' ;
 SC_VALORSCCTOTAL_F               = ' )  AS  VALORSCCTOTAL, ' +    NOVA_LINHA  ;

 SC_QUANTTOTALEXP_I               = '       (SELECT IIF(SUM( EXPORTADOTRANSITO.QUANTIDADEEXP)   IS NULL ,0,SUM(EXPORTADOTRANSITO.QUANTIDADEEXP) )   FROM EXPORTADOTRANSITO WHERE ( CONTRATOTRANSPORTE.CONTRATO = EXPORTADOTRANSITO.CONTRATO )' ;
 SC_QUANTTOTALEXP_F               = ' )  AS  QUANTTOTALEXP, ' +    NOVA_LINHA  ;

 SC_VALORTOTALEXP_I               = '       (SELECT IIF(SUM( EXPORTADOTRANSITO.VALOR)           IS NULL ,0,SUM(EXPORTADOTRANSITO.VALOR) )           FROM EXPORTADOTRANSITO WHERE ( CONTRATOTRANSPORTE.CONTRATO = EXPORTADOTRANSITO.CONTRATO )' ;
 SC_VALORTOTALEXP_F               =     ' )  AS  VALORTOTALEXP, ' +    NOVA_LINHA  ;

 SC_VALORTOTALCOMISSAO_I          = '       (SELECT IIF(SUM( PRODUTOCONTRATOT.COMISAOSFATURA)   IS NULL ,0,SUM(PRODUTOCONTRATOT.COMISAOSFATURA) )   FROM PRODUTOCONTRATOT  WHERE ( CONTRATOTRANSPORTE.CONTRATO = PRODUTOCONTRATOT.CONTRATO  )' ;
 SC_VALORTOTALCOMISSAO_F          =     ' )  AS  VALORTOTALCOMISSAO, ' +    NOVA_LINHA  ;

 SC_VALORTOTALCOMISSAOEXECUTADO_I = '       (SELECT IIF(SUM( EXPORTADOTRANSITO.COMISAOSFATURA) IS NULL ,0,SUM(EXPORTADOTRANSITO.COMISAOSFATURA) ) FROM EXPORTADOTRANSITO WHERE ( CONTRATOTRANSPORTE.CONTRATO = EXPORTADOTRANSITO.CONTRATO )'  ;
 SC_VALORTOTALCOMISSAOEXECUTADO_F =     ' )  AS  VALORTOTALCOMISSAOEXECUTADO ' +    NOVA_LINHA  ;

 SC_SQL_SUM_Prin_FROM             = '      FROM '  +    NOVA_LINHA +
                                    '        CONTRATOTRANSPORTE , PRODUTOCONTRATOT ' +    NOVA_LINHA  ;
 SC_SQL_SUM_Prin_F                = '   )  AS  CONTRATOTRANSPORTE2 '   ;



{
 SC_SQL_TOTAL ='SELECT ' +
	              ' IIF( Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	           IS NULL ,0, Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	          ) AS QuantidadeTotal, ' + NOVA_LINHA +
	              ' IIF( Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	           IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	          ) AS VALORSCCTOTAL ,  ' + NOVA_LINHA +
	              ' IIF( Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	           IS NULL ,0, Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	          ) AS QUANTTOTALEXP,   ' + NOVA_LINHA +
	              ' IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	           IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	          ) AS VALORTOTALEXP,   ' + NOVA_LINHA +
	              ' IIF( Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)            IS NULL ,0, Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)           ) AS QUANTADEPENDENTE, ' + NOVA_LINHA +
	              ' IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE)          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE)         ) AS VALORTOTALPENDENTE,' + NOVA_LINHA +
	              ' IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO)          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO)         ) AS VALORTOTALCOMISSAO , ' + NOVA_LINHA +
                ' IIF( Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado) IS NULL ,0, Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado)) AS ValorTotalComissaoExecutado , ' + NOVA_LINHA +
	              ' IIF( Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente)     IS NULL ,0, Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente)    ) AS VlTotalComissaoPendente , ' + NOVA_LINHA +
}

 SC_SQL_TOTAL =  SC_SQL_SUM +
                ' '' < = TOTAL GERAL  '' ' + NOVA_LINHA +
                ' FROM CONTRATOTRANSPORTE  ,    PRODUTOS , ' ;         // 25/03/2012

 SC_SQL_TOTAL_WHERE = ' WHERE ( CONTRATOTRANSPORTE2.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AND CONTRATOTRANSPORTE.NOMEMIX = PRODUTOs.PRODUTO  '  ;
{
  SC_SQL_PROD = 'SELECT ' + NOVA_LINHA +
                '	 IIF( Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	          IS NULL ,0, Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	         ) AS QuantidadeTotal, ' +NOVA_LINHA +
                '	 IIF( Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	         )  AS VALORSCCTOTAL , '  +NOVA_LINHA +
                '	 IIF( Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	          IS NULL ,0, Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	         )  AS QUANTTOTALEXP, '   +NOVA_LINHA +
                '	 IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	         )  AS VALORTOTALEXP, '   +NOVA_LINHA +
                '	 IIF( Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)            IS NULL ,0, Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)           )  AS QUANTADEPENDENTE, '+NOVA_LINHA +
                '	 IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE)          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE)         )  AS VALORTOTALPENDENTE,'+NOVA_LINHA +
    	          '  IIF( Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado) IS NULL ,0, Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado))  AS ValorTotalComissaoExecutado , ' +NOVA_LINHA +
	              '  IIF( Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente)     IS NULL ,0, Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente)    )  AS VlTotalComissaoPendente , ' +NOVA_LINHA +
                '	 IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO)          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO)         )  AS VALORTOTALCOMISSAO, ' +NOVA_LINHA +
}
 SC_SQL_PROD = SC_SQL_SUM +
                '  CONTRATOTRANSPORTE.NOMEMIX                 as NOMEMIX , ' +         NOVA_LINHA +
                '  PRODUTOs.QUANT_PREVISTA                              as QUANT_PREVISTA , ' +NOVA_LINHA +
                '  PRODUTOs.VALOR_PREVISTO                              as VALOR_PREVISTO  ' +NOVA_LINHA +
                'FROM CONTRATOTRANSPORTE ,  PRODUTOS ,';        // 25/03/2012
  SC_SQL_PROD_WHERE_S= ' where ( ContratoTransporte.Contrato = PRODUTOCONTRATOT.Contrato ) ' +NOVA_LINHA ;
  SC_SQL_PROD_WHERE  = ' where ( CONTRATOTRANSPORTE2.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AND CONTRATOTRANSPORTE.NOMEMIX = PRODUTOs.PRODUTO';
  SC_SQL_PROD_ORDER  = ' GROUP BY CONTRATOTRANSPORTE.NOMEMIX     ,PRODUTOs.QUANT_PREVISTA, PRODUTOs.VALOR_PREVISTO';
{
  SC_SQL_PAIS =  'SELECT ' +NOVA_LINHA +
	               '  IIF( Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL)  	         IS NULL ,0,Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL)  	        )  AS QuantidadeTotal,' +NOVA_LINHA +
	               '  IIF( Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)    	         IS NULL,0,Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)    	        )  AS VALORSCCTOTAL ,  ' +NOVA_LINHA +
	               '  IIF( Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)    	         IS NULL,0,Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)    	        )  AS QUANTTOTALEXP,   ' +NOVA_LINHA +
	               '  IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)    	         IS NULL,0,Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)    	        )  AS VALORTOTALEXP,   ' +NOVA_LINHA +
	               '  IIF( Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE) 	         IS NULL,0,Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE) 	        )  AS QUANTADEPENDENTE,'  +NOVA_LINHA +
	               '  IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE)          IS NULL,0,Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE)         )  AS VALORTOTALPENDENTE,' +NOVA_LINHA +
	               '  IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO)          IS NULL,0,Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO)         )  AS VALORTOTALCOMISSAO ,' +NOVA_LINHA +
                 '  IIF( Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado) IS NULL,0,Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado))  AS ValorTotalComissaoExecutado , ' +NOVA_LINHA +
	               '  IIF( Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente)     IS NULL,0,Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente)    )  AS VlTotalComissaoPendente , ' +NOVA_LINHA +
}
  SC_SQL_PAIS =  SC_SQL_SUM +
                 '  ''TOTAL '' || TAB_PAIS.NOME AS PAIS ' +NOVA_LINHA +
                 ' FROM CONTRATOTRANSPORTE,TAB_PAIS  ,   PRODUTOS , ' ;

  SC_SQL_PAIS_WHERE = ' WHERE ( CONTRATOTRANSPORTE2.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) AND CONTRATOTRANSPORTE.ID=TAB_PAIS.ID ' +NOVA_LINHA +
                      ' and CONTRATOTRANSPORTE.NOMEMIX = PRODUTOs.PRODUTO ' ;


  SC_SQL_PAIS_ORDER   = ' GROUP BY TAB_PAIS.NOME'    ;

{
  SC_SQL_PROD_EX = 'SELECT ' + NOVA_LINHA +
              '	 IIF( Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	          IS NULL ,0, Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	         )  AS QuantidadeTotal, ' +NOVA_LINHA +
              '	 IIF( Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	         )  AS VALORSCCTOTAL , '  +NOVA_LINHA +
              '	 IIF( Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	          IS NULL ,0, Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	         )  AS QUANTTOTALEXP, '   +NOVA_LINHA +
              '	 IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	         )  AS VALORTOTALEXP, '   +NOVA_LINHA +
              '	 IIF( Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)            IS NULL ,0, Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)           )  AS QUANTADEPENDENTE, '+NOVA_LINHA +
              '	 IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE)          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE)         )  AS VALORTOTALPENDENTE,'+NOVA_LINHA +
  	          '  IIF( Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado) IS NULL ,0, Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado))  AS ValorTotalComissaoExecutado , ' +NOVA_LINHA +
	            '  IIF( Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente)     IS NULL ,0, Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente)    )  AS VlTotalComissaoPendente , ' +NOVA_LINHA +
              '	 IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO)          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO)         )  AS VALORTOTALCOMISSAO  ,   ' +NOVA_LINHA +
}
  SC_SQL_PROD_EX = SC_SQL_SUM +
              '  CONTRATOTRANSPORTE.NOMEMIX                           as NOMEMIX , ' +         NOVA_LINHA +
              '  PRODUTOs.QUANT_PREVISTA                              as QUANT_PREVISTA , ' +NOVA_LINHA +
              '  PRODUTOs.VALOR_PREVISTO                              as VALOR_PREVISTO  ' +NOVA_LINHA +

              ' FROM CONTRATOTRANSPORTE ,   PRODUTOS, ';        // 25/03/2012

  SC_SQL_PROD_WHERE_EX  = ' where ( CONTRATOTRANSPORTE2.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) and ( CONTRATOTRANSPORTE.NOMEMIX = PRODUTOs.PRODUTO )' +NOVA_LINHA   ;

  SC_SQL_NOME_EX = '   AND ( CONTRATOTRANSPORTE.FORCOD =  ( SELECT FORCOD FROM FORNECEDORES  WHERE  (Fornecedores.RAZAO LIKE '  ;
  SC_SQL_PROD_ORDER_EX  = ' GROUP BY CONTRATOTRANSPORTE.NOMEMIX     ,PRODUTOs.QUANT_PREVISTA, PRODUTOs.VALOR_PREVISTO';
{
  SC_SQL_TOTAL_EX ='SELECT ' +
	                 ' IIF( Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	          IS NULL ,0, Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	          ) AS QuantidadeTotal, ' + NOVA_LINHA +
	                 ' IIF( Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	          ) AS VALORSCCTOTAL ,  ' + NOVA_LINHA +
	                 ' IIF( Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	          IS NULL ,0, Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	          ) AS QUANTTOTALEXP,   ' + NOVA_LINHA +
	                 ' IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	          ) AS VALORTOTALEXP,   ' + NOVA_LINHA +
	                 ' IIF( Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)            IS NULL ,0, Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)           ) AS QUANTADEPENDENTE, ' + NOVA_LINHA +
	                 ' IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE)          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE)         ) AS VALORTOTALPENDENTE,' + NOVA_LINHA +
	                 ' IIF( Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO)          IS NULL ,0, Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO)         ) AS VALORTOTALCOMISSAO , ' + NOVA_LINHA +
                   ' IIF( Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado) IS NULL ,0, Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado)) AS ValorTotalComissaoExecutado , ' + NOVA_LINHA +
	                 ' IIF( Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente)     IS NULL ,0, Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente)    ) AS VlTotalComissaoPendente , ' + NOVA_LINHA +
}
 SC_SQL_TOTAL_EX = SC_SQL_SUM +
                   ' '' < = TOTAL GERAL  '' ' + NOVA_LINHA +
                   ' FROM CONTRATOTRANSPORTE  ,    PRODUTOS , ' ;         // 25/03/2012

SC_SQL_TOTAL_WHERE_EX = ' WHERE  ( CONTRATOTRANSPORTE2.CONTRATO = CONTRATOTRANSPORTE.CONTRATO ) and ( CONTRATOTRANSPORTE.NOMEMIX = PRODUTOs.PRODUTO ) '  ;

type
  TFormRESUMEN = class(TForm)
    PnSup: TPanel;
    ShapeSup: TShape;
    LbTituloForm: TLabel;
    BtnAjuda: TSpeedButton;
    BtnFechar: TSpeedButton;
    frDBDataSet: TfrDBDataSet;
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    Selecao_1: TScrollBox;
    Divisao: TTabSet;
    Panel1: TPanel;
    BtnVisualizar: TBitBtn;
    BtnCancelar: TBitBtn;
    PRODUTO: TGroupBox;
    DBNav_PROD: TDBNavigator;
    DBGrid_PROD: TDBGrid;
    PAIS: TGroupBox;
    DBNav_PAIS: TDBNavigator;
    DBGrid_PAIS: TDBGrid;
    TOTAL: TGroupBox;
    DBGrid3: TDBGrid;
    IBQuery_pais: TIBQuery;
    IBQ_TOT: TIBQuery;
    DS_PAIS: TDataSource;
    DS_PROD: TDataSource;
    DS_TOT: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    XDT_INIC: TXDateEdit;
    XDT_FIM: TXDateEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    CBox_INIC: TComboBox;
    CBox_FIM: TComboBox;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    frDBDataSet1: TfrDBDataSet;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edt_inic: TXDateEdit;
    edt_fim: TXDateEdit;
    lbl3: TLabel;
    edt_ano: TXNumEdit;
    lbl4: TLabel;
    cbb_EXPORTADOR: TComboBox;
    ibq_TOT_EX: TIBQuery;
    ibq_PROD_EX: TIBQuery;
    ds_TOT_EX: TDataSource;
    ds_prod_ex: TDataSource;
    frdb_PROD_EX: TfrDBDataSet;
    frdb_TOT_EX: TfrDBDataSet;
    grp2: TGroupBox;
    dbnvgr1: TDBNavigator;
    dbgrd1: TDBGrid;
    grp3: TGroupBox;
    dbgrd2: TDBGrid;
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
    procedure FormCreate(Sender: TObject);
  private
     Caption_rel : string ;
     S_FILTRO_EXP, S_FILTRO_PRO , S_SQL_PROD_WHERE_SUB: STRING ;
     S_SQL_PROD_WHERE ,   S_SQL_PAIS_WHERE , S_FILTRO , S_SQL_SUM, S_SQL_ANO, S_SQL_NOME_EX   : string ;

    { Private declarations }
    
    QyRelatorio, T_SQL_PROD  : TTabela; // T_SQL ,
    // T_SQL_PAIS : TTabela; // T_SQL ,
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
  FormRESUMEN: TFormRESUMEN;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, Abertura, GridPesquisa, Interno,RotinaEd;

procedure TFormRESUMEN.ConstroiSql;
var
  I: Integer;
begin

  {04-Início do Bloco Modular. Modificações não serão preservadas}
  {
  for I:=0 to DContratoTransporte.Campos.Count-1 do
    TAtributo(DContratoTransporte.Campos[I]).Valor.DataSet := Nil;

  DContratoTransporte.FiltroExtra.Clear;
  DContratoTransporte.ChaveIndice := '';
  DContratoTransporte.Filtro.Clear;
  DContratoTransporte.SQLPrincipal.Clear;
  DContratoTransporte.SQLPrincipal.Add('SELECT');
  DContratoTransporte.SQLPrincipal.Add('   CONTRATOTRANSPORTE.NOMEMIX                 as VALOR_PREVISTO ,');
  DContratoTransporte.SQLPrincipal.Add('   PRODUTOs.QUANT_PREVISTA                    as VALOR_PREVISTO ,');
  DContratoTransporte.SQLPrincipal.Add('   PRODUTOs.VALOR_PREVISTO                    as VALOR_PREVISTO ,');
  DContratoTransporte.SQLPrincipal.Add('	 Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	  AS QuantidadeTotal,');
  DContratoTransporte.SQLPrincipal.Add('	 Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	  AS VALORSCCTOTAL ,');
  DContratoTransporte.SQLPrincipal.Add('	 Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	  AS QUANTTOTALEXP,');
  DContratoTransporte.SQLPrincipal.Add('	 Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	  AS VALORTOTALEXP,');
  DContratoTransporte.SQLPrincipal.Add('	 Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)   AS QUANTADEPENDENTE,');
  DContratoTransporte.SQLPrincipal.Add('	 Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE) AS VALORTOTALPENDENTE,');
  DContratoTransporte.SQLPrincipal.Add('	 Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO) AS VALORTOTALCOMISSAO');
  DContratoTransporte.SQLPrincipal.Add('FROM CONTRATOTRANSPORTE , PRODUTOs');
  DContratoTransporte.SQLPrincipal.Add('where CONTRATOTRANSPORTE.NOMEMIX = PRODUTOs.PRODUTO');
  DContratoTransporte.SQLPrincipal.Add('GROUP BY CONTRATOTRANSPORTE.NOMEMIX     ,PRODUTOs.QUANT_PREVISTA, PRODUTOs.VALOR_PREVISTO');
  DContratoTransporte.AtualizaSql(False);
  Parametros(DContratoTransporte);
  DContratoTransporte.Open;
  frDBDataSet.DataSet := DContratoTransporte;
  // exit;
  // SQL Personalizado

  DContratoTransporte.Filtro.Clear;
  DContratoTransporte.AtualizaSql(False);
  }
  Parametros(DContratoTransporte);
  // DContratoTransporte.Open;
  frDBDataSet.DataSet := DContratoTransporte;
  frDBDataSet1.DataSet := IBQuery_pais;
  frdb_TOT_EX.DataSet :=  ibq_TOT_EX;
  frdb_PROD_EX.DataSet := ibq_PROD_EX;

  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormRESUMEN.Parametros(Tabela: TTabela);
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

procedure TFormRESUMEN.FormShow(Sender: TObject);
Var
  I: Integer;
begin
  S_SQL_PROD_WHERE_SUB := '' ;
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Resumo Geral';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  DContratoTransporte := TDContratoTransporte.Create(Self);
  DContratoTransporte.OnCalcFields := CalculosDContratoTransporte;
  DContratoTransporte.DataSource.OnDataChange := AtualizaDetalhe_DContratoTransporte;
  QyRelatorio := DContratoTransporte;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Resumo Geral';
  ConstroiSql ;

  
  IBQ_TOT.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  IBQ_TOT.Transaction := TabGlobal.DContratoTransporte.Transaction ;
  
  DContratoTransporte.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  DContratoTransporte.Transaction := TabGlobal.DContratoTransporte.Transaction ;
  DContratoTransporte.SQL.Clear ;

  IBQuery_pais.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  IBQuery_pais.Transaction := TabGlobal.DContratoTransporte.Transaction ;
  IBQuery_pais.SQL.Clear ;

  ibq_TOT_EX.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  ibq_TOT_EX.Transaction := TabGlobal.DContratoTransporte.Transaction ;
  ibq_TOT_EX.SQL.Clear ;

  ibq_PROD_EX.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  ibq_PROD_EX.Transaction := TabGlobal.DContratoTransporte.Transaction ;
  ibq_PROD_EX.SQL.Clear ;

  CBox_INIC.items.add(' ') ;
  CBox_FIM.items.add(' ') ;
  Carrega_CB(CBox_INIC,CBox_FIM,'SELECT RAZAO || '' >> '' || CLICOD || '' <<''  AS CAMPOS FROM CLIENTES ORDER BY RAZAO', 'CAMPOS',SELF);

  cbb_EXPORTADOR.items.add(' ') ;

  Carrega_CB(cbb_EXPORTADOR ,nil,'SELECT RAZAO AS CAMPOS FROM Fornecedores ORDER BY RAZAO', 'CAMPOS',SELF);
  cbb_EXPORTADOR.Text := 'SURIMPEX'     ;



  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  QyRelatorio := T_SQL_PROD;  // DContratoTransporte;
  DS_PROD.DataSet := T_SQL_PROD;


  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  edt_ano.ValueInt := StrToInt( ano(Date) ) ;

  frReport.OnUserFunction := FuncoesExtras;
  FormResize(Self);
  BitBtn1Click(Sender);
end;

procedure TFormRESUMEN.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormRESUMEN.InicializaVariaveis;
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
  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormRESUMEN.BtnVisualizarClick(Sender: TObject);
begin
  ConstroiSql;
  InicializaVariaveis;

  DContratoTransporte.sql.SaveToFile('_2REL_DContratoTransporte.sql');
  IBQuery_pais.SQL.SaveToFile('_2REL_IBQuery_pais.SQL');
  IBQuery_pais.CLOSE ;
  IBQuery_pais.OPEN ;

  
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;

end;

procedure TFormRESUMEN.FormResize(Sender: TObject);
var
  larhura : Integer ;
begin
  larhura := 0 ;
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
  larhura :=  (( Selecao_1.Height - 240 ) mod  3 ) ;
  larhura :=  (( Selecao_1.Height - 240 ) div  3 ) ;
  grp2.Height := larhura ;
  PRODUTO.Height := larhura ;
  PAIS.Height :=  (( Selecao_1.Height - 240 ) - (larhura *2 ));
end;

procedure TFormRESUMEN.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFormRESUMEN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  DContratoTransporte.Free;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
 // T_SQL.Close ;
 // T_SQL.Free ;

  T_SQL_PROD.Close ;
  T_SQL_PROD.Free ;
//  T_SQL_PAIS.Close ;
//  T_SQL_PAIS.Free ;

end;

{08-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormRESUMEN.CalculosDContratoTransporte(DataSet: TDataSet);
begin
end;

procedure TFormRESUMEN.AtualizaDetalhe_DContratoTransporte(Sender: TObject;
  Field: TField);
begin
end;

{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormRESUMEN.FuncoesExtras(const Name: String; p1, p2,
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

procedure TFormRESUMEN.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then   // Calendário
    Interno108
  else if Key = VK_F6 then // Calculadora
    Interno109
  else if Key = VK_F7 then // Agenda
    Interno110;
end;

procedure TFormRESUMEN.BitBtn1Click(Sender: TObject);
VAR
  S_T ,    S_SQL_PAIS_WHERE , S_FILTRO , S_CLICOD, S_SQL_NOME_EX : STRING ;
  N_INC  , N_FIN , I: INTEGER ;
begin

  S_FILTRO_EXP     := '';
  S_FILTRO_PRO     := '';
  S_SQL_PROD_WHERE_SUB := '' ;

  if edt_ano.ValueInt = 0 then
  begin
    MessageDlg('O Ano não pode ser Banco !',mtError,[mbOk],0);
    exit;
  end;
      
  Screen.Cursor := crHourGlass;
  S_FILTRO := '';
  Caption_rel := 'Resumo Geral';  //19/06/2012 'INFORMES';

  IF  XDT_INIC.DateValue <> -693594 THEN begin
      S_FILTRO_EXP := ' EXPORTADOTRANSITO.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue)) ;
      S_FILTRO_PRO := ' PRODUTOCONTRATOT.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue)) ;
  end;

  IF  XDT_FIM.DateValue <> -693594 THEN
      IF  S_FILTRO_PRO = '' THEN begin
          S_FILTRO_EXP := ' EXPORTADOTRANSITO.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;
          S_FILTRO_PRO := ' PRODUTOCONTRATOT.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))  ;
      end
      ELSE begin
          S_FILTRO_EXP := S_FILTRO_EXP + ' AND  EXPORTADOTRANSITO.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;
          S_FILTRO_PRO := S_FILTRO_PRO + ' AND  PRODUTOCONTRATOT.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;
      end;

  IF CBox_INIC.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_INIC.Text) + 2   ;
     N_FIN := POS('<<',CBox_INIC.Text)   ;
     S_CLICOD := COPY( CBox_INIC.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := '     CONTRATOTRANSPORTE.CLICOD >= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.CLICOD >= '+ S_CLICOD ;
     CAPTION_rel := CAPTION_rel + COPY( CBox_INIC.Text,1, N_INC  );
  END;

  IF CBox_FIM.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_FIM.Text) + 2   ;
     N_FIN := POS('<<',CBox_FIM.Text)   ;
     S_CLICOD := COPY( CBox_FIM.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' CONTRATOTRANSPORTE.CLICOD <= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.CLICOD <= '+ S_CLICOD ;

  END;

  if cbb_EXPORTADOR.Text <> '' then
  begin
     S_SQL_NOME_EX := SC_SQL_NOME_EX  + AtribuiAspas( '%'+trim(cbb_EXPORTADOR.Text)+'%' ) + ' ))) '  ;
  end;

  S_SQL_PROD_WHERE_SUB := SC_SQL_PROD_WHERE_S ;

  IF  S_FILTRO <> '' THEN BEGIN
      S_SQL_PROD_WHERE_SUB := S_SQL_PROD_WHERE_SUB  + ' AND ' + S_FILTRO ;
      S_SQL_PROD_WHERE := Sc_SQL_PROD_WHERE        + ' AND ' + S_FILTRO ;
      S_SQL_PAIS_WHERE := SC_SQL_PAIS_WHERE        + ' AND ' + S_FILTRO ;

      IF S_FILTRO_PRO <> '' THEN
      BEGIN
         S_SQL_PROD_WHERE_SUB := S_SQL_PROD_WHERE_SUB  + ' AND ' + S_FILTRO_PRO ;
      end;
  END
  ELSE BEGIN
      S_SQL_PROD_WHERE := Sc_SQL_PROD_WHERE;
      S_SQL_PAIS_WHERE := SC_SQL_PAIS_WHERE;
  END;

 if S_FILTRO_PRO <> '' then
 begin
    S_FILTRO_EXP :=' AND ' + S_FILTRO_EXP; // + ' AND  EXPORTADOTRANSITO.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;
    S_FILTRO_PRO :=' AND ' + S_FILTRO_PRO; // + ' AND  PRODUTOCONTRATOT.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;
 end;


  S_SQL_SUM :=
  SC_SQL_SUM_Prin_i +                               //           = '   (                                ' +    NOVA_LINHA +
                                                    //             '      SELECT                          ' +    NOVA_LINHA +
                                                    //             '        CONTRATOTRANSPORTE.CONTRATO , ' +    NOVA_LINHA ;
  SC_QUANTIDADETOTAL_I +  S_FILTRO_PRO            + //         = '       (SELECT IIF(SUM( PRODUTOCONTRATOT.QUANTIDADE)       IS NULL ,0,SUM(PRODUTOCONTRATOT.QUANTIDADE) )       FROM PRODUTOCONTRATOT  WHERE ( CONTRATOTRANSPORTE.CONTRATO = PRODUTOCONTRATOT.CONTRATO  )' ;
  SC_QUANTIDADETOTAL_F                            + // = ' )  AS  QUANTIDADETOTAL, ' +    NOVA_LINHA  ;
  SC_VALORSCCTOTAL_I   + S_FILTRO_PRO             + // = '       (SELECT IIF(SUM( PRODUTOCONTRATOT.VALORSCC)         IS NULL ,0,SUM(PRODUTOCONTRATOT.VALORSCC) )         FROM PRODUTOCONTRATOT  WHERE ( CONTRATOTRANSPORTE.CONTRATO = PRODUTOCONTRATOT.CONTRATO  )' ;
  SC_VALORSCCTOTAL_F                              + // = ' )  AS  VALORSCCTOTAL, ' +    NOVA_LINHA  ;
  SC_QUANTTOTALEXP_I  + S_FILTRO_EXP              + // = '       (SELECT IIF(SUM( EXPORTADOTRANSITO.QUANTIDADEEXP)   IS NULL ,0,SUM(EXPORTADOTRANSITO.QUANTIDADEEXP) )   FROM EXPORTADOTRANSITO WHERE ( CONTRATOTRANSPORTE.CONTRATO = EXPORTADOTRANSITO.CONTRATO )' ;
  SC_QUANTTOTALEXP_F                              + // = ' )  AS  QUANTTOTALEXP, ' +    NOVA_LINHA  ;
  SC_VALORTOTALEXP_I + S_FILTRO_EXP               + // = '       (SELECT IIF(SUM( EXPORTADOTRANSITO.VALOR)           IS NULL ,0,SUM(EXPORTADOTRANSITO.VALOR) )           FROM EXPORTADOTRANSITO WHERE ( CONTRATOTRANSPORTE.CONTRATO = EXPORTADOTRANSITO.CONTRATO )' ;
  SC_VALORTOTALEXP_F                              + // =     ' )  AS  VALORTOTALEXP, ' +    NOVA_LINHA  ;
  SC_VALORTOTALCOMISSAO_I + S_FILTRO_PRO          + // = '       (SELECT IIF(SUM( PRODUTOCONTRATOT.COMISAOSFATURA)   IS NULL ,0,SUM(PRODUTOCONTRATOT.COMISAOSFATURA) )   FROM PRODUTOCONTRATOT  WHERE ( CONTRATOTRANSPORTE.CONTRATO = PRODUTOCONTRATOT.CONTRATO  )' ;
  SC_VALORTOTALCOMISSAO_F                         + // =     ' )  AS  VALORTOTALCOMISSAO, ' +    NOVA_LINHA  ;
  SC_VALORTOTALCOMISSAOEXECUTADO_I + S_FILTRO_EXP + ' and EXPORTADOTRANSITO.numnfemit is not null ' +  // = '       (SELECT IIF(SUM( EXPORTADOTRANSITO.COMISAOSFATURA) IS NULL ,0,SUM(EXPORTADOTRANSITO.COMISAOSFATURA) ) FROM EXPORTADOTRANSITO WHERE ( CONTRATOTRANSPORTE.CONTRATO = EXPORTADOTRANSITO.CONTRATO )'  ;
  SC_VALORTOTALCOMISSAOEXECUTADO_F                + // =     ' )  AS  VALORTOTALCOMISSAOEXECUTADO ' +    NOVA_LINHA  ;
  SC_SQL_SUM_Prin_FROM                            +  // = '      FROM '  +    NOVA_LINHA +
                                                    //   '        CONTRATOTRANSPORTE ' +    NOVA_LINHA  ;
  S_SQL_PROD_WHERE_SUB                                +
  SC_SQL_SUM_Prin_F                                ;// = '   )  AS  CONTRATOTRANSPORTE2 '   ;



  T_SQL_PROD.Close;
  T_SQL_PROD.SQL.Clear;
  T_SQL_PROD.SQL.Add(SC_SQL_PROD  );
  T_SQL_PROD.SQL.Add( S_SQL_SUM  );
  T_SQL_PROD.SQL.Add( S_SQL_PROD_WHERE );
  T_SQL_PROD.SQL.Add( SC_SQL_PROD_ORDER );
  T_SQL_PROD.SQL.SaveToFile('_T_SQL_PROD.SQL');
  T_SQL_PROD.Prepare ;
  T_SQL_PROD.Open ;

  T_SQL_PROD.First ;
  T_SQL_PROD.Last ;
  T_SQL_PROD.First ;  
  grp2.Caption := 'PRODUTO Núm. Linhas = ' + INTTOSTR(T_SQL_PROD.RecordCount)   ;

  ibq_PROD_EX.Close ;
  ibq_PROD_EX.SQL.Clear ;
  IF S_FILTRO <> '' THEN
     ibq_PROD_EX.SQL.Add(SC_SQL_PROD_EX + S_SQL_SUM + SC_SQL_PROD_WHERE_EX + S_SQL_NOME_EX + ' and '+ S_FILTRO  + SC_SQL_PROD_ORDER_EX )
  ELSE
     ibq_PROD_EX.SQL.Add(SC_SQL_PROD_EX + S_SQL_SUM + SC_SQL_PROD_WHERE_EX + S_SQL_NOME_EX +                      SC_SQL_PROD_ORDER_EX );

  ibq_PROD_EX.SQL.SaveToFile('_ibq_PROD_EX.SQL');
  ibq_PROD_EX.Prepare ;
  ibq_PROD_EX.Open ;
  ibq_PROD_EX.Last ;
  ibq_PROD_EX.First ;
  PRODUTO.Caption := 'PRODUTO/SURIMPEX  Núm. Linhas = ' + INTTOSTR(ibq_PROD_EX.RecordCount)   ;
 {
  T_SQL_PAIS.Close ;
  T_SQL_PAIS.SQL.Clear;
  T_SQL_PAIS.SQL.Add(SC_SQL_PAIS  + S_SQL_SUM + S_SQL_PAIS_WHERE +  SC_SQL_PAIS_ORDER );
  T_SQL_PAIS.SQL.SaveToFile('_T_SQL_PAIS.SQL');
  T_SQL_PAIS.Prepare ;
  T_SQL_PAIS.Open ;
  T_SQL_PAIS.Last ;
  T_SQL_PAIS.First ;
}

  IBQuery_pais.Close ;
  IBQuery_pais.SQL.Clear;
  IBQuery_pais.SQL.Add(SC_SQL_PAIS + S_SQL_SUM + S_SQL_PAIS_WHERE  + SC_SQL_PAIS_ORDER );
  IBQuery_pais.SQL.SaveToFile('_IBQuery_pais.SQL');
  IBQuery_pais.Prepare ;
  IBQuery_pais.Open ;
  IBQuery_pais.First ;  
  IBQuery_pais.Last ;
  IBQuery_pais.First ;
  PAIS.Caption := 'PAIS Núm. Linhas = ' + INTTOSTR(IBQuery_pais.RecordCount)     ;

  IBQ_TOT.Close ;
  IBQ_TOT.SQL.Clear ;
  IBQ_TOT.SQL.Add(SC_SQL_TOTAL + S_SQL_SUM + S_SQL_PROD_WHERE  ) ;
  IBQ_TOT.SQL.SaveToFile('_IBQ_TOT.SQL');
  IBQ_TOT.Prepare ;
  IBQ_TOT.Open ;
  IBQ_TOT.First ;
  IBQ_TOT.Last ;
  IBQ_TOT.First ;
  TOTAL.Caption := 'TOTAL Núm. Linhas = ' + INTTOSTR(IBQ_TOT.RecordCount)   ;

  ibq_TOT_EX.Close;
  ibq_TOT_EX.SQL.Clear ;
  IF S_FILTRO <> '' THEN
     ibq_TOT_EX.SQL.Add(SC_SQL_TOTAL_EX + S_SQL_SUM + SC_SQL_TOTAL_WHERE_EX + S_SQL_NOME_EX +' and '+ S_FILTRO  )
  ELSE
     ibq_TOT_EX.SQL.Add(SC_SQL_TOTAL_EX + S_SQL_SUM + SC_SQL_TOTAL_WHERE_EX + S_SQL_NOME_EX                     ) ;

  ibq_TOT_EX.SQL.SaveToFile('_ibq_TOT_EX.SQL');
  ibq_TOT_EX.Prepare ;
  ibq_TOT_EX.Open ;
  ibq_TOT_EX.First ;  
  ibq_TOT_EX.Last ;
  ibq_TOT_EX.First ;
  grp3.Caption := 'TOTAL/SURIMPEX Núm. Linhas = ' + INTTOSTR(ibq_TOT_EX.RecordCount)   ;

  DContratoTransporte.Close;
  DContratoTransporte.SQL.Clear;
  for I:=0 to DContratoTransporte.Campos.Count-1 do
    TAtributo(DContratoTransporte.Campos[I]).Valor.DataSet := Nil;

  DContratoTransporte.SQL.Add(SC_SQL_PROD + S_SQL_SUM + S_SQL_PROD_WHERE + SC_SQL_PROD_ORDER );
  DContratoTransporte.SQL.SaveToFile('_DContratoTransporte.SQL');
  DContratoTransporte.Prepare ;
  DContratoTransporte.Open ;

  Screen.Cursor := crDefault;


end;
procedure TFormRESUMEN.FormCreate(Sender: TObject);
begin


  T_SQL_PROD:= TTabela.Create(NIL);
//  T_SQL_PAIS:= TTabela.Create(NIL);


  T_SQL_PROD.DataBase :=  TabGlobal.DContratoTransporte.DataBase ;
  T_SQL_PROD.Transaction := TabGlobal.DContratoTransporte.Transaction ;


//  T_SQL_PAIS.DataBase    :=  TabGlobal.DContratoTransporte.DataBase ;
//  T_SQL_PAIS.Transaction := TabGlobal.DContratoTransporte.Transaction ;

end;

end.
