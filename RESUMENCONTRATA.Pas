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

 SQL_EXEC_REL_ORDER = 'ORDER BY RESUMENCONTRATACION.CLICOD ,  RESUMENCONTRATACION.seq , RESUMENCONTRATACION.NomeMix ' +   NOVA_LINHA ;


 SC_SQL_EXE_ORDER = ' ORDER BY SOMATORIO.CLICOD,SOMATORIO.SEQ,SOMATORIO.NOME,SOMATORIO.NOMEMIX' +   NOVA_LINHA ;


 SC_SQL_WHERE_EXPORTADOR  = ' CONTRATOTRANSPORTE.CONTRATO IN ( SELECT DISTINCT EXPORTADOTRANSITO.CONTRATO FROM EXPORTADOTRANSITO '  ;
 SC_SQL_WHERE_PRODUTOCONTRATOT  = ' CONTRATOTRANSPORTE.CONTRATO IN ( SELECT DISTINCT PRODUTOCONTRATOT.CONTRATO FROM PRODUTOCONTRATOT '  ;


 SC_SQL_BASE ='SELECT ' +  NOVA_LINHA +
              '    Sum(CONTRATOTRANSPORTE2.QUANTIDADETOTAL) 	AS QuantidadeTotal, ' +  NOVA_LINHA +
              '    Sum(CONTRATOTRANSPORTE2.VALORSCCTOTAL)   	AS VALORSCCTOTAL ,  ' +   NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE2.QUANTTOTALEXP)   	AS QUANTTOTALEXP,   ' +  NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE2.VALORTOTALEXP)   	AS VALORTOTALEXP,   ' +   NOVA_LINHA +
      			  '    Sum(CONTRATOTRANSPORTE2.VALORTOTALCOMISSAO) AS VALORTOTALCOMISSAO ,    ' +   NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE2.QUANTIDADETOTAL - CONTRATOTRANSPORTE2.QUANTTOTALEXP ) AS QUANTADEPENDENTE , '  +   NOVA_LINHA +
              '    sum(CONTRATOTRANSPORTE2.VALORSCCTOTAL   - CONTRATOTRANSPORTE2.VALORTOTALEXP ) AS VALORTOTALPENDENTE , '  +   NOVA_LINHA ;

 SC_SQL_PRODF ='    CONTRATOTRANSPORTE.CLICOD               	AS CLICOD , ' +  NOVA_LINHA +
 	            '    CONTRATOTRANSPORTE.SEQ                 	AS SEQ   , ' +  NOVA_LINHA +
              '    DIVISOES.NOME                            AS NOME  , ' +  NOVA_LINHA +
              '    CONTRATOTRANSPORTE.NOMEMIX ' +  NOVA_LINHA +
              'FROM CONTRATOTRANSPORTE , DIVISOES ' +  NOVA_LINHA ;


{
 SC_SQL_TOTAL ='SELECT ' +  NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	AS QuantidadeTotal, ' +   NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	AS VALORSCCTOTAL ,  ' +    NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	AS QUANTTOTALEXP,   ' +    NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	AS VALORTOTALEXP,   ' +    NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)   AS QUANTADEPENDENTE, ' +  NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE) AS VALORTOTALPENDENTE,' +  NOVA_LINHA +
}
SC_SQL_TOTALF ='    '' < = TOTAL GERAL  '' ' +  NOVA_LINHA +
               'FROM CONTRATOTRANSPORTE , DIVISOES ' ;
{
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
              '    CONTRATOTRANSPORTE.NOMEMIX ' +  NOVA_LINHA +
              'FROM CONTRATOTRANSPORTE , DIVISOES ' +  NOVA_LINHA ;
}

  SC_SQL_PROD  = SC_SQL_BASE + SC_SQL_PRODF  +  NOVA_LINHA ;
  SC_SQL_TOTAL = SC_SQL_BASE + SC_SQL_TOTALF +  NOVA_LINHA ;

  SC_SQL_PROD_WHERE = ' WHERE DIVISOES.CLICOD = CONTRATOTRANSPORTE.CLICOD AND ' +  NOVA_LINHA +
                      '       CONTRATOTRANSPORTE2.CONTRATO = CONTRATOTRANSPORTE.CONTRATO AND ' +  NOVA_LINHA +
                      '       DIVISOES.SEQ    = CONTRATOTRANSPORTE.SEQ    AND '  +  NOVA_LINHA +
                      '       CONTRATOTRANSPORTE.CADASTRO = '  ;

  SC_SQL_PROD_WHERE_N = ' WHERE DIVISOES.CLICOD = CONTRATOTRANSPORTE.CLICOD AND ' +  NOVA_LINHA +
                        '       CONTRATOTRANSPORTE2.CONTRATO = CONTRATOTRANSPORTE.CONTRATO AND ' +  NOVA_LINHA +
//                      '       PRODUTOCONTRATOT.CONTRATO = CONTRATOTRANSPORTE.CONTRATO AND ' +  NOVA_LINHA +
                        '       DIVISOES.SEQ    = CONTRATOTRANSPORTE.SEQ     '+  NOVA_LINHA;

  SC_SQL_PROD_WHERE_NV = ' WHERE  ' +  NOVA_LINHA +
                        '       PRODUTOCONTRATOT.CONTRATO = CONTRATOTRANSPORTE.CONTRATO  ' +  NOVA_LINHA ;




  SC_SQL_PROD_GROUP = ' GROUP BY CONTRATOTRANSPORTE.CLICOD,CONTRATOTRANSPORTE.SEQ,DIVISOES.NOME,CONTRATOTRANSPORTE.NOMEMIX' +   NOVA_LINHA ;
  SC_SQL_PROD_ORDER = ' ORDER BY CONTRATOTRANSPORTE.CLICOD,CONTRATOTRANSPORTE.SEQ,DIVISOES.NOME,CONTRATOTRANSPORTE.NOMEMIX' +   NOVA_LINHA ;


 SC_SQL_SUM_Prin_i                = ',  (                                ' +    NOVA_LINHA +
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
 SC_SQL_SUM_Prin_F                = '   )  AS  CONTRATOTRANSPORTE2 ' +    NOVA_LINHA   ;




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
      S_SQL_PROD_WHERE  , SQL_EXEC_WHERE , S_SQL_PRODUTO : STRING ;

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
  CBox_FormaPag.Text := 'PROEX' ;
  
  // CARREGANDO   LIST BOX fornecedor
  Carrega_CB(CBox_INIC_F,CBox_FIM_F,'SELECT RAZAO || '' >> '' || FORCOD || '' <<''  AS CAMPOS FROM FORNECEDORES ORDER BY RAZAO', 'CAMPOS',SELF);

  BitBtn1Click(SELF) ;
{
  // RELATORIO FORMATO EXCEL
  DContratoTransporte.SQL.Clear;
  S_SQL_PROD_WHERE :=   SC_SQL_PROD_WHERE +  AtribuiAspas ( FormatDateTime('YYYY/MM/DD',DATE) )  + ' AND ( ( ' +SC_SQL_WHERE_EXPORTADOR + ')) OR ('+ SC_SQL_WHERE_PRODUTOCONTRATOT + ')) ) ' ;

  S_SQL_PRODUTO := SC_SQL_PROD + S_SQL_PROD_WHERE +  SC_SQL_PROD_GROUP + SC_SQL_PROD_ORDER  ;
  DContratoTransporte.SQL.Add(SQL_EXEC_REL + S_SQL_PRODUTO + SQL_EXEC_REL_TABELAS +  SQL_EXEC_WHERE + SQL_EXEC_REL_ORDER  );
  DContratoTransporte.SQL.SaveToFile('_REL_T_DContratoTransporte.SQL');
  DContratoTransporte.Prepare ;
  DContratoTransporte.Open ;

  // PRODUTOS SEM OBSERVACAO
  IBQ_PRODUTOS.SQL.Clear ;
  IBQ_PRODUTOS.SQL.Add( S_SQL_PRODUTO  );
  IBQ_PRODUTOS.SQL.SaveToFile('_IBQ_PRODUTOS.SQL');
  IBQ_PRODUTOS.Prepare ;
  IBQ_PRODUTOS.Open ;


  IBQ_TOT.SQL.Clear ;
  IBQ_TOT.SQL.Add(SC_SQL_TOTAL + S_SQL_PROD_WHERE  );
  IBQ_TOT.SQL.SaveToFile('_IBQ_TOT.SQL');
  IBQ_TOT.Prepare ;
  IBQ_TOT.Open ;

}




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
  TabSheet1.Visible := True ;

  XDT_INIC.DateValue := DT0112 ;
  XDT_FIM.DateValue  := Date ;

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
  S_SQL_PROD_WHERE ,S_SQL_PRODUTO, S_FILTRO , S_FILTRO_EMB,S_FILTRO_EXC, S_CLICOD , S_FILTRO_EXP , S_SQL_PROD_WHERE_SUB ,
  S_FILTRO_PRO,S_FILTRO_EXP2,S_FILTRO_EMB2 ,S_FILTRO_PRO2, S_SQL_WHERE_EXPORTADOR, S_SQL_PROD_CAMP1, S_SQL_PROD_CAMP2 , S_FILTRO_CAMPO, S_SQL_SUM  : STRING ;
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
  S_FILTRO_PRO2 := '' ;
  S_FILTRO_EXC := '';
  S_SQL_PRODUTO := '' ;

  Caption_rel := 'RESUMEN CONTRATACIÓN';
  IF  XDT_INIC.DateValue <> -693594 THEN begin

      S_FILTRO_EXP := ' EXPORTADOTRANSITO.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue)) ;
      S_FILTRO_PRO := ' PRODUTOCONTRATOT.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue)) ;

      S_FILTRO_EXP2 := ' EXPORTADOTRANSITO.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue)) ;
      S_FILTRO_PRO2 := ' PRODUTOCONTRATOT.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue)) ;

  end ;

  IF  XDT_FIM.DateValue <> -693594 THEN begin

      IF  S_FILTRO_PRO = '' THEN begin
          S_FILTRO_EXP := ' EXPORTADOTRANSITO.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;
          S_FILTRO_PRO := ' PRODUTOCONTRATOT.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))  ;

          S_FILTRO_EXP2 := ' EXPORTADOTRANSITO.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;
          S_FILTRO_PRO2 := ' PRODUTOCONTRATOT.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))  ;

      end

      ELSE begin
          S_FILTRO_EXP := S_FILTRO_EXP + ' AND  EXPORTADOTRANSITO.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;
          S_FILTRO_PRO := S_FILTRO_PRO + ' AND  PRODUTOCONTRATOT.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;

          S_FILTRO_EXP2 := S_FILTRO_EXP2 + ' AND  EXPORTADOTRANSITO.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;
          S_FILTRO_PRO2 := S_FILTRO_PRO2 + ' AND  PRODUTOCONTRATOT.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;

      end;


  end;
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


      IF S_FILTRO_PRO = '' THEN
         S_FILTRO_PRO :=  ' PRODUTOCONTRATOT.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )
      ELSE
         S_FILTRO_PRO :=  S_FILTRO_PRO + ' AND PRODUTOCONTRATOT.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text ) ;


      IF S_FILTRO_PRO2 = '' THEN
         S_FILTRO_PRO2 :=  ' PRODUTOCONTRATOT.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )
      ELSE
         S_FILTRO_PRO2 :=  S_FILTRO_PRO2 + ' AND PRODUTOCONTRATOT.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text ) ;

      IF  S_FILTRO_EXP = '' THEN
          S_FILTRO_EXP := ' EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )
      ELSE
          S_FILTRO_EXP := S_FILTRO_EXP + ' AND EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text ) ;





      IF  S_FILTRO_EMB = '' THEN
          S_FILTRO_EMB := ' EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )
      ELSE
          S_FILTRO_EMB := S_FILTRO_EMB + ' AND EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text ) ;


      IF  S_FILTRO_EMB2 = '' THEN
          S_FILTRO_EMB2 := ' EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )
      ELSE
          S_FILTRO_EMB2 := S_FILTRO_EMB2 + ' AND EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text ) ;


      IF  S_FILTRO_CAMPO <> '' then
          S_FILTRO_CAMPO := S_FILTRO_CAMPO + ' AND EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )

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
  begin
      S_SQL_PROD_WHERE := SC_SQL_PROD_WHERE_N + ' AND ' + S_FILTRO  ;
      S_SQL_PROD_WHERE_SUB := SC_SQL_PROD_WHERE_NV + ' AND ' + S_FILTRO ;
  end
  ELSE
  begin
      S_SQL_PROD_WHERE := SC_SQL_PROD_WHERE_N ;
      S_SQL_PROD_WHERE_SUB := SC_SQL_PROD_WHERE_NV;
  end ;


  IF  S_FILTRO_EMB <> '' THEN
      S_SQL_WHERE_EXPORTADOR := ' AND (( ' + SC_SQL_WHERE_EXPORTADOR + ' WHERE ' + S_FILTRO_EMB2 + ' )) OR ( ' + SC_SQL_WHERE_PRODUTOCONTRATOT  + ' WHERE ' + S_FILTRO_PRO2 +  ' ) ) ) '
  ELSE
      S_SQL_WHERE_EXPORTADOR := ' AND (( ' + SC_SQL_WHERE_EXPORTADOR + ')) OR (' + SC_SQL_WHERE_PRODUTOCONTRATOT +' )) ) ';

  IF  S_FILTRO_EXC <> '' THEN
      S_FILTRO_EXC :=   ' AND ' + S_FILTRO_EXC + NOVA_LINHA
  ELSE
      S_FILTRO_EXC :=  ' ';

  if S_FILTRO_EXP <> '' then
  begin
       S_FILTRO_PRO := ' AND ' + S_FILTRO_PRO ;
       S_FILTRO_EXP := ' AND ' + S_FILTRO_EXP ;
  end;

  S_SQL_SUM :=
  SC_SQL_SUM_Prin_i +                               // = '   (                                ' +    NOVA_LINHA +
                                                    //   '      SELECT                          ' +    NOVA_LINHA +
                                                    //   '        CONTRATOTRANSPORTE.CONTRATO , ' +    NOVA_LINHA ;
  SC_QUANTIDADETOTAL_I +  S_FILTRO_PRO            + // = '       (SELECT IIF(SUM( PRODUTOCONTRATOT.QUANTIDADE)       IS NULL ,0,SUM(PRODUTOCONTRATOT.QUANTIDADE) )       FROM PRODUTOCONTRATOT  WHERE ( CONTRATOTRANSPORTE.CONTRATO = PRODUTOCONTRATOT.CONTRATO  )' ;
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

  S_SQL_PRODUTO := SC_SQL_PROD + S_SQL_SUM + S_SQL_PROD_WHERE + S_SQL_WHERE_EXPORTADOR + SC_SQL_PROD_GROUP + SC_SQL_PROD_ORDER ;

  DContratoTransporte.Close ;
  DContratoTransporte.SQL.Clear;
  DContratoTransporte.SQL.Add( SQL_EXEC_REL + S_SQL_PRODUTO  + SQL_EXEC_REL_TABELAS + S_FILTRO_EXC + SQL_EXEC_REL_ORDER  );
  DContratoTransporte.SQL.SaveToFile('_REL_T_DContratoTransporte.SQL');
  DContratoTransporte.Prepare ;
  DContratoTransporte.Open ;
  DContratoTransporte.First ;
  DContratoTransporte.Last ;
  DContratoTransporte.First ;
  GroupBox_Exce.Caption := 'Planilha Núm. Linhas = ' + INTTOSTR(DContratoTransporte.RecordCount)   ;

  IBQ_TOT.Close ;
  IBQ_TOT.SQL.Clear ;
  IBQ_TOT.SQL.Add(SC_SQL_TOTAL + S_SQL_SUM + S_SQL_PROD_WHERE + S_SQL_WHERE_EXPORTADOR ) ;
  IBQ_TOT.SQL.SaveToFile('_IBQ_TOT.SQL');
  IBQ_TOT.Prepare ;
  IBQ_TOT.Open ;

  IBQ_PRODUTOS.Close;
  IBQ_PRODUTOS.SQL.Clear;
  IBQ_PRODUTOS.SQL.Add(SC_SQL_PROD  + S_SQL_SUM + S_SQL_PROD_WHERE + S_SQL_WHERE_EXPORTADOR + SC_SQL_PROD_GROUP + SC_SQL_PROD_ORDER );
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
