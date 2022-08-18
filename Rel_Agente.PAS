{  R$ [[sum([DOrdemCobranca."VALOR_NF"],bd_det)] * [TAXA_DOLAR]]
   Programa.: Rel_Agente.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br      DESENVOLVIMENTO
   MODIFICADO PARA INCLUIR REGRA QUE NAO FICOU CLARA NO Rel_Agente
}
unit Rel_Agente;

interface

{$I Princ.inc}
{
CONST

select FORNECEDORES.RAZAO , ordemcobranca.VALOR , ordemcobranca.FATURA , ordemcobranca.NumNFEmit  from ordemcobranca  , FORNECEDORES
WHERE   ordemcobranca.FORCOD =  FORNECEDORES.FORCOD
   AND  ordemcobranca.FATURA  IS NULL
   AND  ordemcobranca.NumNFEmit  IS NULL
}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, BaseD, Atributo, Tabela, Menus, Calculos, db,
  {$I LTab.pas}
  XLookUp, XDBDate, Mask, XDate, XEdit, XNum, FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Tabs, comctrls, XBanner, checklst, IBCustomDataSet, IBQuery, IBDatabase;





type
  TFormRel_Agente = class(TForm)
    PnSup: TPanel;
    ShapeSup: TShape;
    LbTituloForm: TLabel;
    BtnAjuda: TSpeedButton;
    BtnFechar: TSpeedButton;
    frDBDataSet: TfrDBDataSet;
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    Label4: TLabel;
    Label3: TLabel;
    CBox_FIM: TComboBox;
    CBox_INIC: TComboBox;
    GroupBox2: TGroupBox;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    Selecao_1: TScrollBox;
    Divisao: TTabSet;
    Panel1: TPanel;
    BtnVisualizar: TBitBtn;
    BtnCancelar: TBitBtn;
    IBQueryAcordo: TIBQuery;
    IBQueryFaturaEUR: TIBQuery;
    frDBDataSetAcordo: TfrDBDataSet;
    frDBDataSetFaturaEUR: TfrDBDataSet;
    DOrdemCobranca: TIBQuery;
    DT_INCIAL: TXDateEdit;
    DT_FINAL: TXDateEdit;
    IBQuery_soma: TIBQuery;
    IBQueryFaturaUSR: TIBQuery;
    frDBDataSetFaturaUSR: TfrDBDataSet;
    GroupBox3: TGroupBox;
    XNE_DOLAR: TXNumEdit;
    XNE_EURO: TXNumEdit;
    Label5: TLabel;
    Label6: TLabel;
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
  private
    total_acordo : double ;
    total_faturaD : double ;
    total_faturaE : double ;
    total_cobranca : double ;
    { Private declarations }
//    QyRelatorio: TTabela;
    {02-Início do Bloco Modular. Modificações não serão preservadas}
    DOrdemCobranca1: TDOrdemCobranca;
    procedure CalculosDOrdemCobranca(DataSet: TDataSet);
    procedure AtualizaDetalhe_DOrdemCobranca(Sender: TObject; Field: TField);
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
  FormRel_Agente: TFormRel_Agente;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, Abertura, GridPesquisa, Interno, UCMS_CONST, RotinaEd;


const

sql_order_by = ' order by FORNECEDORES.RAZAO ' ;

sql_DOrdemCobranca =  ' select distinct FORNECEDORES.RAZAO , ordemcobranca.NumNFEmit , ordemcobranca.VALOR_NF  ' +  NOVA_LINHA +
                      '  from  ordemcobranca  , FORNECEDORES  , OrdemCobrAncaProdExp ' + NOVA_LINHA +
                      ' WHERE  ordemcobranca.FORCOD =  FORNECEDORES.FORCOD ' + NOVA_LINHA +
                      '    AND ordemcobranca.NumOrdCobranca  = OrdemCobrAncaProdExp.NumOrdCobranca  ' + NOVA_LINHA +
                      '   AND  ordemcobranca.FATURA  IS NULL ' +  NOVA_LINHA +
                      '   AND  ordemcobranca.VALORRECEBIDO  IS NULL ' +  NOVA_LINHA +
                      '   AND  not ordemcobranca.NumNFEmit  IS NULL ' ;


sql_IBQueryAcordo  =   'SELECT RAZAO AS RAZAO, SUM(VALOR ) AS VALOR ' + NOVA_LINHA +
                       'FROM ( ' +NOVA_LINHA +
//  26/04/2012 correcao para o relaorio retirar distinct
//                       '       select distinct  FORNECEDORES.RAZAO AS RAZAO , ExportadoTransito.ComisaoSFatura AS VALOR ' + NOVA_LINHA +
                       '       select   FORNECEDORES.RAZAO AS RAZAO , ExportadoTransito.ComisaoSFatura AS VALOR ' + NOVA_LINHA +
                       '       from FORNECEDORES  ,  ExportadoTransito, ContratoTransporte ' + NOVA_LINHA +
                       '       WHERE ContratoTransporte.FORCOD =  FORNECEDORES.FORCOD ' + NOVA_LINHA +
                       '       AND   ExportadoTransito.Contrato = ContratoTransporte.Contrato ' +  NOVA_LINHA +
                       '       AND   ExportadoTransito.status = ''' + s_ST_CM_F +''' ' +  NOVA_LINHA ;

sql_IBQueryAcordoOrder = '     order by FORNECEDORES.RAZAO ) GROUP BY RAZAO' +NOVA_LINHA  ;


                                                                                     // ordemcobranca.VALORRECEBIDO
sql_IBQueryFatura_Dolar = 'select distinct  FORNECEDORES.RAZAO , ' +  NOVA_LINHA +
                      '    ordemcobranca.FATURA ,' +  NOVA_LINHA +
                      '   ( ordemcobranca.VALOR + ( select IIF( SUM(ordemcobrancadescont.valor) IS NULL ,0, SUM(ordemcobrancadescont.valor))    from ordemcobrancadescont where ordemcobrancadescont.numordcobranca = ordemcobranca.numordcobranca )) as VALORRECEBIDO ' +  NOVA_LINHA +
                      '  from ordemcobranca  , FORNECEDORES  , OrdemCobrancaProdExp'+NOVA_LINHA +
                      ' WHERE ordemcobranca.FORCOD = FORNECEDORES.FORCOD '+ NOVA_LINHA +
                      '   AND ordemcobranca.NumOrdCobranca  = OrdemCobrancaProdExp.NumOrdCobranca  ' + NOVA_LINHA +
                      '  AND  not ordemcobranca.FATURA     IS NULL     '+ NOVA_LINHA +
                      '  AND  ordemcobranca.VALORRECEBIDO  IS NULL '     + NOVA_LINHA +    // NOVA LINAH NOVO CRITERIO
       // 26/04/2012  '  AND  ordemcobranca.valorrecebido      IS NULL '    + NOVA_LINHA +
                      '  and OrdemCobrancaProdExp.MOEDACOMISSAO = ''USR'' ';
                                                                                    // ordemcobranca.VALORRECEBIDO  ' + NOVA_LINHA +
sql_IBQueryFatura_Euro = 'select distinct  FORNECEDORES.RAZAO ,' + NOVA_LINHA +
                      '     ordemcobranca.FATURA ,' + NOVA_LINHA +
                      '   ( ordemcobranca.VALOR + ( select IIF( SUM(ordemcobrancadescont.valor) IS NULL ,0, SUM(ordemcobrancadescont.valor))    from ordemcobrancadescont where ordemcobrancadescont.numordcobranca = ordemcobranca.numordcobranca )) as VALORRECEBIDO ' + NOVA_LINHA +
                      '  from ordemcobranca  , FORNECEDORES  , OrdemCobrancaProdExp '+NOVA_LINHA +
                      ' WHERE ordemcobranca.FORCOD = FORNECEDORES.FORCOD '+NOVA_LINHA +
                      '   AND ordemcobranca.NumOrdCobranca  = OrdemCobrancaProdExp.NumOrdCobranca  ' + NOVA_LINHA +
                      '  AND  not ordemcobranca.FATURA     IS NULL     '+  NOVA_LINHA +
                      '  AND  ordemcobranca.VALORRECEBIDO  IS NULL '     + NOVA_LINHA +     // NOVA LINAH NOVO CRITERI
// 26/04/2012         '  AND  ordemcobranca.valorrecebido  IS NULL  ' +  NOVA_LINHA +
                      '  and  OrdemCobrancaProdExp.MOEDACOMISSAO = ''EUR'' ';


sql_DOrdemCobranca_total =  ' SELECT SUM(TOTAL) AS TOTAL  FROM ( select distinct   ( ordemcobranca.VALOR_NF ) as total ' + NOVA_LINHA +
                      '  from  ordemcobranca  , FORNECEDORES  , OrdemCobrancaProdExp ' + NOVA_LINHA +
                      ' WHERE  ordemcobranca.FORCOD =  FORNECEDORES.FORCOD '  +  NOVA_LINHA +
                      '   AND ordemcobranca.NumOrdCobranca  = OrdemCobrancaProdExp.NumOrdCobranca  ' + NOVA_LINHA +
                      '   AND  ordemcobranca.FATURA  IS NULL '                                          +  NOVA_LINHA +
                      '   AND  ordemcobranca.VALORRECEBIDO  IS NULL '     +  NOVA_LINHA +    // NOVA LINAH NOVO CRITERIO
                      '   AND  not ordemcobranca.NumNFEmit  IS NULL ' ;
{
sql_IBQueryAcordo_total  =  '  SELECT SUM(TOTAL) AS TOTAL  FROM ( select distinct  ( ordemcobranca.VALOR) as total  '  +  NOVA_LINHA +
                            '   from ordemcobranca  , FORNECEDORES  , OrdemCobrancaProdExp              '  +  NOVA_LINHA +
                            '  WHERE ordemcobranca.FORCOD =  FORNECEDORES.FORCOD ' +  NOVA_LINHA +
                            '    AND ordemcobranca.NumOrdCobranca  = OrdemCobrancaProdExp.NumOrdCobranca  ' +   NOVA_LINHA +
                            '    AND ordemcobranca.FATURA  IS NULL               ' + NOVA_LINHA +
                            '    AND  ordemcobranca.VALORRECEBIDO  IS NULL '     + NOVA_LINHA +     // NOVA LINAH NOVO CRITERIO
                            '    AND ordemcobranca.NumNFEmit  IS NULL            ' ;
}

sql_IBQueryAcordo_total  = ' SELECT SUM(VALOR ) AS TOTAL ' +  NOVA_LINHA +
                           ' FROM ( ' +  NOVA_LINHA +
                           '        select distinct  FORNECEDORES.RAZAO AS RAZAO , ExportadoTransito.ComisaoSFatura AS VALOR ' + NOVA_LINHA +
                           '        from FORNECEDORES  ,  ExportadoTransito, ContratoTransporte ' +  NOVA_LINHA +
                           '        WHERE ContratoTransporte.FORCOD =  FORNECEDORES.FORCOD ' +NOVA_LINHA +
                           '        AND   ExportadoTransito.Contrato = ContratoTransporte.Contrato ' +  NOVA_LINHA +
                           '        AND   ExportadoTransito.status = ''' + s_ST_CM_F +'''' +  NOVA_LINHA  ;
ContratoTransporte_ORDER = '        order by FORNECEDORES.RAZAO ) ' ;







sql_IBQueryFatura_total_dolar = '  SELECT SUM(TOTAL) AS TOTAL  FROM ( ' + NOVA_LINHA +
                                                                    ' select distinct ' + NOVA_LINHA +
                                                                    '  ( ordemcobranca.VALOR + ( select IIF( SUM(ordemcobrancadescont.valor) IS NULL ,0, SUM(ordemcobrancadescont.valor)) ' + NOVA_LINHA +
                                                                    ' from ordemcobrancadescont where ordemcobrancadescont.numordcobranca = ordemcobranca.numordcobranca )) as total ' + NOVA_LINHA +
                                '  from ordemcobranca  , FORNECEDORES  , OrdemCobrancaProdExp '+  NOVA_LINHA +
                                ' WHERE ordemcobranca.FORCOD = FORNECEDORES.FORCOD '+  NOVA_LINHA +
                                '   AND ordemcobranca.NumOrdCobranca  = OrdemCobrancaProdExp.NumOrdCobranca  ' +NOVA_LINHA +
                                '  AND  not ordemcobranca.FATURA     IS NULL     '+ NOVA_LINHA +
        // 26/04/2012           '  AND  not ordemcobranca.NumNFEmit  IS NULL  ' + NOVA_LINHA +
                                '  AND  ordemcobranca.VALORRECEBIDO  IS NULL '     +  NOVA_LINHA +    // NOVA LINAH NOVO CRITERIO
                                '  and OrdemCobrancaProdExp.MOEDACOMISSAO = ''USR'' ';
                                                                                         // 26/04/2012
sql_IBQueryFatura_total_euro =  '  SELECT SUM(TOTAL) AS TOTAL  FROM ( ' + NOVA_LINHA +
                                                                    ' select distinct  ' + NOVA_LINHA +
                                                                    '  ( ordemcobranca.VALOR + ( select IIF( SUM(ordemcobrancadescont.valor) IS NULL ,0, SUM(ordemcobrancadescont.valor)) ' + NOVA_LINHA +
                                                                    ' from ordemcobrancadescont where ordemcobrancadescont.numordcobranca = ordemcobranca.numordcobranca )) as total ' + NOVA_LINHA +
                                '  from ordemcobranca  , FORNECEDORES  , OrdemCobrancaProdExp '+ NOVA_LINHA +
                                ' WHERE ordemcobranca.FORCOD = FORNECEDORES.FORCOD '+  NOVA_LINHA +
                                '   AND ordemcobranca.NumOrdCobranca  = OrdemCobrancaProdExp.NumOrdCobranca  ' + NOVA_LINHA +
                                '  AND  not ordemcobranca.FATURA     IS NULL     '+  NOVA_LINHA +
       // 26/04/2012            '  AND  not ordemcobranca.NumNFEmit  IS NULL  '   +  NOVA_LINHA +
                                '  AND  ordemcobranca.VALORRECEBIDO  IS NULL '     +  NOVA_LINHA +    // NOVA LINAH NOVO CRITERIO
                                '  and OrdemCobrancaProdExp.MOEDACOMISSAO = ''EUR'' ';


procedure TFormRel_Agente.ConstroiSql;
var
  I: Integer;
  s_filtro, s_filtro2 : string ;
  S_CLICOD,s_titulo, s_titulo_c  : STRING ;
  N_INC  , N_FIN : INTEGER ;  
begin
  {04-Início do Bloco Modular. Modificações não serão preservadas}
 // DOrdemCobranca1.ChaveIndice := 'OrdemCobranca.NumNFEmit';
 // DOrdemCobranca1.Filtro.Clear;
 // DOrdemCobranca1.Filtro.Add('(OrdemCobranca.Cadastro >= :XDateEdit1)');
 // DOrdemCobranca1.Filtro.Add('AND (OrdemCobranca.Cadastro <= :XDateEdit2)');
 //  DOrdemCobranca1.AtualizaSql(False);
 // Parametros(DOrdemCobranca1);
 // DOrdemCobranca1.Open;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  frDBDataSet.DataSet := DOrdemCobranca;
  frDBDataSetAcordo.DataSet := IBQueryAcordo ;
  frDBDataSetFaturaEUR.DataSet := IBQueryFaturaEUR ;
  frDBDataSetFaturaUSR.DataSet := IBQueryFaturaUSR ;
  s_filtro := '' ;
  s_filtro2 := '' ;
  if DT_INCIAL.DateValue <> CMS_Data_vazia then  BEGIN
     s_filtro := 'OrdemCobranca.Cadastro >= ' + AtribuiAspas(COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2)) ;
     s_filtro2 := 'ExportadoTransito.Cadastro >= ' + AtribuiAspas(COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2)) ;

  END;
  if DT_FINAL.DateValue <> CMS_Data_vazia then BEGIN
     if s_filtro = '' then BEGIN
        s_filtro := 'OrdemCobranca.Cadastro <= ' + AtribuiAspas(COPY( DT_FINAL.Text , 7, 4)+ '/'+ COPY( DT_FINAL.Text , 4,2)+'/'+ COPY( DT_FINAL.Text , 1,2)) ;
        s_filtro2 := 'ExportadoTransito.Cadastro <= ' + AtribuiAspas(COPY( DT_FINAL.Text , 7, 4)+ '/'+ COPY( DT_FINAL.Text , 4,2)+'/'+ COPY( DT_FINAL.Text , 1,2)) ;
     END
     else BEGIN
        s_filtro :=  s_filtro + ' and OrdemCobranca.Cadastro <= ' + AtribuiAspas(COPY( DT_FINAL.Text , 7, 4)+ '/'+ COPY( DT_FINAL.Text , 4,2)+'/'+ COPY( DT_FINAL.Text , 1,2)) ;
        s_filtro2 :=  s_filtro2 + ' and ExportadoTransito.Cadastro <= ' + AtribuiAspas(COPY( DT_FINAL.Text , 7, 4)+ '/'+ COPY( DT_FINAL.Text , 4,2)+'/'+ COPY( DT_FINAL.Text , 1,2)) ;

     END;
  END;
  IF CBox_INIC.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_INIC.Text) + 2   ;
     N_FIN := POS('<<',CBox_INIC.Text)   ;
     S_CLICOD := COPY( CBox_INIC.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN BEGIN
         S_FILTRO := ' OrdemCobranca.FORCOD >= '+ S_CLICOD;
         S_FILTRO2 := ' ContratoTransporte.FORCOD >= '+ S_CLICOD;

     END
     ELSE BEGIN
         S_FILTRO := S_FILTRO +' AND OrdemCobranca.FORCOD >= '+ S_CLICOD ;
         S_FILTRO2 := S_FILTRO2 +' AND ContratoTransporte.FORCOD >= '+ S_CLICOD ;
     END;
  END;

  IF CBox_FIM.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_FIM.Text) + 2   ;
     N_FIN := POS('<<',CBox_FIM.Text)   ;
     S_CLICOD := COPY( CBox_FIM.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN BEGIN
         S_FILTRO := ' OrdemCobranca.FORCOD <= '+ S_CLICOD ;
         S_FILTRO2 := ' ContratoTransporte.FORCOD <= '+ S_CLICOD ;
     END
     ELSE BEGIN
         S_FILTRO := S_FILTRO +' AND OrdemCobranca.FORCOD <= '+ S_CLICOD ;
         S_FILTRO2 := S_FILTRO2 +' AND ContratoTransporte.FORCOD <= '+ S_CLICOD ;
     END;
  END;

  IF  S_FILTRO <> '' THEN BEGIN
      S_FILTRO := ' AND ' +  S_FILTRO ;
      S_FILTRO2 := ' AND ' +  S_FILTRO2 ;
  END;

  IBQueryAcordo.close;
  IBQueryFaturaEUR.close ;
  IBQueryFaturaUSR.close ;

  DOrdemCobranca.close;

  IBQueryAcordo.sql.Clear;
  IBQueryAcordo.sql.add( sql_IBQueryAcordo +  S_FILTRO2 + sql_IBQueryAcordoOrder );
  IBQueryAcordo.sql.SaveToFile('_IBQueryAcordo.SQL');
  IBQueryAcordo.Prepare ;
  IBQueryAcordo.Open ;

  IBQueryFaturaUSR.sql.Clear;
  IBQueryFaturaUSR.sql.add( sql_IBQueryFatura_Dolar +  S_FILTRO + sql_order_by ) ;
  IBQueryFaturaUSR.SQL.SaveToFile('_IB_IBQueryFaturaUSR.SQL');
  IBQueryFaturaUSR.Prepare ;
  IBQueryFaturaUSR.Open ;

  IBQueryFaturaEUR.sql.Clear;
  IBQueryFaturaEUR.sql.add( sql_IBQueryFatura_Euro +  S_FILTRO + sql_order_by ) ;
  IBQueryFaturaEUR.SQL.SaveToFile('_IB_QueryFaturaEUR.SQL');
  IBQueryFaturaEUR.Prepare ;
  IBQueryFaturaEUR.Open ;

  DOrdemCobranca.sql.Clear;
  DOrdemCobranca.sql.add( sql_DOrdemCobranca +  S_FILTRO + sql_order_by );
  DOrdemCobranca.SQL.SaveToFile('_DOrdemCobranca.SQL');
  DOrdemCobranca.Prepare ;
  DOrdemCobranca.Open ;

  total_acordo    := 0;
  total_faturaD    := 0;
  total_faturaE    := 0;

  total_cobranca  := 0;


  IBQuery_soma.Close;
  IBQuery_soma.SQL.Clear;
  IBQuery_soma.SQL.Add(sql_IBQueryAcordo_total + S_FILTRO2 + ContratoTransporte_ORDER ) ;
  IBQuery_soma.SQL.SaveToFile('_sql_IBQueryAcordo_total.SQL');
  IBQuery_soma.Prepare ;
  IBQuery_soma.Open ;
  if not IBQuery_soma.FieldByName('total').IsNull then
     total_acordo := IBQuery_soma.FieldByName('total').Value ;

  IBQuery_soma.Close;
  IBQuery_soma.SQL.Clear;
  IBQuery_soma.SQL.Add(sql_IBQueryFatura_total_dolar + S_FILTRO  + ' )' ) ;
  IBQuery_soma.SQL.SaveToFile('_sql_IBQueryFatura_total_dolar.SQL');
  IBQuery_soma.Prepare ;
  IBQuery_soma.Open ;
  if not IBQuery_soma.FieldByName('total').IsNull then
     total_faturaD := IBQuery_soma.FieldByName('total').Value ;

  IBQuery_soma.Close;
  IBQuery_soma.SQL.Clear;
  IBQuery_soma.SQL.Add(sql_IBQueryFatura_total_euro + S_FILTRO + ' )' ) ;
  IBQuery_soma.SQL.SaveToFile('_sql_IBQueryFatura_total_euro.SQL');
  IBQuery_soma.Prepare ;
  IBQuery_soma.Open ;
  if not IBQuery_soma.FieldByName('total').IsNull then
     total_faturaE := IBQuery_soma.FieldByName('total').Value ;


  IBQuery_soma.Close;
  IBQuery_soma.SQL.Clear;
  IBQuery_soma.SQL.Add(sql_DOrdemCobranca_total + S_FILTRO  + ' )' ) ;
  IBQuery_soma.SQL.SaveToFile('_sql_DOrdemCobranca_total.SQL');
  IBQuery_soma.Prepare ;
  IBQuery_soma.Open ;
  if not IBQuery_soma.FieldByName('total').IsNull then
     total_cobranca := IBQuery_soma.FieldByName('total').Value ;


end;

procedure TFormRel_Agente.Parametros(Tabela: TTabela);
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

procedure TFormRel_Agente.FormShow(Sender: TObject);
Var
  I: Integer;
begin
  // inicializa data set
  IBQueryAcordo.close;
  IBQueryFaturaUSR.close ;
  IBQueryFaturaEUR.close ;
  DOrdemCobranca.close;
  IBQuery_soma.Close ;


  Carrega_CB(CBox_INIC,CBox_FIM,'SELECT RAZAO || '' >> '' || FORCOD || '' << ''  AS CAMPOS FROM FORNECEDORES ORDER BY RAZAO', 'CAMPOS',SELF);

  //DOrdemCobranca
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Rel. Agente';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  //DOrdemCobranca1 := TDOrdemCobranca.Create(Self);
  //  DOrdemCobranca1:= TDOrdemCobranca.Create(SELF);
  //  DOrdemCobranca1.OnCalcFields := CalculosDOrdemCobranca;
  //  DOrdemCobranca1.DataSource.OnDataChange := AtualizaDetalhe_DOrdemCobranca;
  //  QyRelatorio := DOrdemCobranca;
  {99-Final do Bloco Modular. Modificações não serão preservadas}


  IBQuery_soma.Database := BaseDados.BD_Base_Dados;;
  IBQuery_soma.Transaction := BaseDados.TRS_BD_Base_Dados;

  IBQueryAcordo.Database    := BaseDados.BD_Base_Dados;
  IBQueryFaturaEUR.Database := BaseDados.BD_Base_Dados;
  IBQueryFaturaUSR.Database := BaseDados.BD_Base_Dados;

  //  DOrdemCobranca.Database := DOrdemCobranca1.DataBase ;

  IBQueryAcordo.Transaction :=BaseDados.TRS_BD_Base_Dados;
  IBQueryFaturaEUR.Transaction := BaseDados.TRS_BD_Base_Dados;
  IBQueryFaturaUSR.Transaction := BaseDados.TRS_BD_Base_Dados;
  DOrdemCobranca.Transaction := BaseDados.TRS_BD_Base_Dados;

  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  FormResize(Self);
  frReport.OnUserFunction := FuncoesExtras;
  DT_INCIAL.DateValue := Date ;
  DT_FINAL.DateValue := Date ;
end;

procedure TFormRel_Agente.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormRel_Agente.InicializaVariaveis;
begin
  frVariables['total_acordo']   := total_acordo ;
  frVariables['total_faturaD']   := total_faturaD ;
  frVariables['total_faturaE']   := total_faturaE ;
  frVariables['total_cobranca'] := total_cobranca  ;
  frVariables['taxa_dolar']     := XNE_DOLAR.Value  ;
  frVariables['taxa_euro']      := XNE_EURO.Value  ;

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
  // 26/04/2012 => incluido a pedidos
  frVariables['Titulo_2']     := 'Periodo de analise '+DT_INCIAL.DateText + ' a '+ DT_FINAL.DateText; 
  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormRel_Agente.BtnVisualizarClick(Sender: TObject);
begin
  ConstroiSql;
  InicializaVariaveis;

//  IBQueryAcordo.EOF OR IBQueryFaturaEUR.EOF OR IBQueryFaturaUSR.EOF OR   DOrdemCobranca.EOF
// IBQueryAcordo.EOF OR IBQueryFaturaEUR.EOF OR IBQueryFaturaUSR.EOF OR   DOrdemCobranca.EOF

  if DOrdemCobranca.EOF AND IBQueryAcordo.EOF AND  IBQueryFaturaEUR.EOF AND  IBQueryFaturaUSR.EOF  then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
//  QyRelatorio.Close;
end;

procedure TFormRel_Agente.FormResize(Sender: TObject);
begin
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
end;

procedure TFormRel_Agente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFormRel_Agente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  DOrdemCobranca.Free;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

{08-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormRel_Agente.CalculosDOrdemCobranca(DataSet: TDataSet);
begin
end;

procedure TFormRel_Agente.AtualizaDetalhe_DOrdemCobranca(Sender: TObject;
  Field: TField);
begin
end;

{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormRel_Agente.FuncoesExtras(const Name: String; p1, p2,
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

procedure TFormRel_Agente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then   // Calendário
    Interno108
  else if Key = VK_F6 then // Calculadora
    Interno109
  else if Key = VK_F7 then // Agenda
    Interno110;
end;

end.
