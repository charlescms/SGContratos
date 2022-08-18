{
   Programa.: RelSitucaoCred.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
}
unit RelSitucaoCred;

interface

{$I Princ.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, BaseD, Atributo, Tabela, Menus, Calculos, db,
  {$I LTab.pas}
  XLookUp, XDBDate, Mask, XDate, XEdit, XNum, FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Tabs, comctrls, XBanner, checklst, Grids, DBGrids, DBCtrls,
  IBCustomDataSet, IBQuery, IBDatabase;
const

  NOVA_LINHA = CHR(13)+CHR(10) ;
  MSG_FORMADEPAGAMETOEOBRIGATORIA = 'Forma de Pagameto é Obrigatoria !';
  MSG_NAOEXISTEMREGISTROSSELECIONADOS = 'Não Existem Registros Selecionados';
  MSG_NAOEXISTEMREGISTROSSELECIONADOSPARAGERACAO = 'Não Existem Registros Selecionados Para Geração' ;


sql_navio_inicio  =
  'Select distinct ' + NOVA_LINHA +
  '    Situacao.Contrato as Contrato, ' + NOVA_LINHA +
  '    Situacao.Navio AS Navio, ' + NOVA_LINHA +
  '    Situacao.DataEmbarque AS DataEmbarque, ' + NOVA_LINHA +
  '    Situacao.QuantidadeExp AS QuantidadeExp, ' + NOVA_LINHA +
  '    Situacao.Valor AS Valor ' + NOVA_LINHA +
  'from ( ' + NOVA_LINHA +
  ' select distinct ' + NOVA_LINHA +
  '    ExportadoTransito.Contrato as Contrato, ' + NOVA_LINHA +
  '    ExportadoTransito.Navio AS Navio, ' + NOVA_LINHA +
  '    ExportadoTransito.DataEmbarque AS DataEmbarque, ' + NOVA_LINHA +
  '    ExportadoTransito.QuantidadeExp AS QuantidadeExp, ' + NOVA_LINHA +
  '    ExportadoTransito.Valor AS Valor ' + NOVA_LINHA +
  '   from  ContratoTransporte ' + NOVA_LINHA +
  'Left Outer Join Tab_pais on ' + NOVA_LINHA +
  '    ContratoTransporte.id    = Tab_pais.id ' + NOVA_LINHA +
  'Left Outer Join Fornecedores on  ' + NOVA_LINHA +
  '  ContratoTransporte.FORCOD = Fornecedores.FORCOD ' + NOVA_LINHA +
  'Left Outer Join ExportadoTransito on ' + NOVA_LINHA +
  '  ContratoTransporte.Contrato = ExportadoTransito.Contrato ' + NOVA_LINHA +
  'Left Outer Join ProdutoContratoT on ' +  NOVA_LINHA +
  '  ContratoTransporte.Contrato = ProdutoContratoT.Contrato ' +  NOVA_LINHA +
  '  where   ContratoTransporte.Contrato = :Contrato ' + NOVA_LINHA ;
// filtro
sql_navio_order =
  '  order by    ExportadoTransito.Contrato ' + NOVA_LINHA +
  ') as  Situacao ' + NOVA_LINHA ;



sql_corpo_i =
      ' ContratoTransporte.Contrato AS Contrato, ' +  NOVA_LINHA +
      ' ContratoTransporte.NomeMix AS NomeMix, ' +  NOVA_LINHA +
      ' ContratoTransporte.FORCOD AS FORCOD, ' +  NOVA_LINHA +
      ' ContratoTransporte.C_C AS C_C, ' +  NOVA_LINHA +
      ' iif ( ContratoTransporte.QuantidadeTotal is null , 0 , ContratoTransporte.QuantidadeTotal ) AS QuantidadeTotal, ' +  NOVA_LINHA +
      ' iif ( ContratoTransporte.PrecoFOBTotal   is null , 0 , ContratoTransporte.PrecoFOBTotal   ) AS PrecoFOBTotal, ' +  NOVA_LINHA +
      ' iif ( ContratoTransporte.ValorSCCTotal   is null , 0 , ContratoTransporte.ValorSCCTotal   ) AS ValorSCCTotal, ' +  NOVA_LINHA +
      ' iif ( ContratoTransporte.QUANTTOTALEXP   is null , 0 , ContratoTransporte.QUANTTOTALEXP   ) AS QUANTTOTALEXP, ' +  NOVA_LINHA +
      ' iif ( ContratoTransporte.ValorTotalExp   is null , 0 , ContratoTransporte.ValorTotalExp   ) AS ValorTotalExp, ' +  NOVA_LINHA ;
sql_corpo_novos1 =
' 0 AS QuantidadeExp, '+  NOVA_LINHA ;
sql_corpo_novos2 =
' 0 AS valor, '+  NOVA_LINHA ;

sql_corpo_f =
      '       Tab_pais.nome  as nome     , ' +  NOVA_LINHA +
      '       Fornecedores.RAZAO AS RAZAO ' +  NOVA_LINHA +
      '       from  ContratoTransporte ' +  NOVA_LINHA +
      'Left Outer Join Tab_pais on ' +  NOVA_LINHA +
      '    ContratoTransporte.id    = Tab_pais.id ' +  NOVA_LINHA +
      'Left Outer Join Fornecedores on ' +  NOVA_LINHA +
      '  ContratoTransporte.FORCOD = Fornecedores.FORCOD ' +  NOVA_LINHA +
      'Left Outer Join ExportadoTransito on ' +  NOVA_LINHA +
      '  ContratoTransporte.Contrato = ExportadoTransito.Contrato ' +  NOVA_LINHA  +
      'Left Outer Join ProdutoContratoT on ' +  NOVA_LINHA +
      '  ContratoTransporte.Contrato = ProdutoContratoT.Contrato ' +  NOVA_LINHA ;
      
      // 26/04/2012
      //'Left Outer Join ExportadoTransito on ' +  NOVA_LINHA +
      //'  ContratoTransporte.Contrato = ExportadoTransito.Contrato ' +  NOVA_LINHA ;
      
sql_total_alimentos = ' ' +
        'SELECT distinct ' +   NOVA_LINHA +
				'   Situacao.NomeMix as  NomeMix ,' +   NOVA_LINHA +
        '   SUM(Situacao.QuantidadeTotal)  as QuantidadeTotal,' +   NOVA_LINHA +
        '   SUM(Situacao.ValorSCCTotal)    as ValorSCCTotal,' +   NOVA_LINHA +
        '   SUM(Situacao.QUANTTOTALEXP)    as QUANTTOTALEXP,' +   NOVA_LINHA +
        '   SUM(Situacao.ValorTotalExp)    as ValorTotalExp' +   NOVA_LINHA +
        'from (  select distinct' +   NOVA_LINHA ;

// 27/04/2012
//sql_total_alimentos = ' ' +
//        'SELECT distinct ' +   NOVA_LINHA +
//				'   Situacao.NomeMix as  NomeMix ,' +   NOVA_LINHA +
//        '   iif ( SUM(Situacao.QuantidadeTotal) is null , 0 , SUM(Situacao.QuantidadeTotal)) as QuantidadeTotal,' +   NOVA_LINHA +
//        '   iif ( SUM(Situacao.ValorSCCTotal)   is null , 0 , SUM(Situacao.ValorSCCTotal)  ) as ValorSCCTotal,' +   NOVA_LINHA +
//        '   iif ( SUM(Situacao.QUANTTOTALEXP)   is null , 0 , SUM(Situacao.QUANTTOTALEXP)  ) as QUANTTOTALEXP,' +   NOVA_LINHA +
//        '   iif ( SUM(Situacao.ValorTotalExp)   is null , 0 , SUM(Situacao.ValorTotalExp)  ) as ValorTotalExp' +   NOVA_LINHA +
//        'from (  select distinct' +   NOVA_LINHA ;

// sql_corpo
// s_where
sql_total_alimentos_order_int = ' order by ContratoTransporte.NomeMix '  +   NOVA_LINHA ;
sql_total_alimentos_grup =  ' ) as  Situacao '  +   NOVA_LINHA +
        ' group By Situacao.NomeMix ORDER BY Situacao.NomeMix' +   NOVA_LINHA ;

sql_total_Pais = ' ' +
        'SELECT  distinct ' +   NOVA_LINHA +
				'       Situacao.nome as  nome ,   ' +   NOVA_LINHA +
        '   iif ( SUM(Situacao.QuantidadeTotal) is null , 0 , SUM(Situacao.QuantidadeTotal)) as QuantidadeTotal,' +   NOVA_LINHA +
        '   iif ( SUM(Situacao.ValorSCCTotal)   is null , 0 , SUM(Situacao.ValorSCCTotal)  ) as ValorSCCTotal,' +   NOVA_LINHA +
        '   iif ( SUM(Situacao.QUANTTOTALEXP)   is null , 0 , SUM(Situacao.QUANTTOTALEXP)  ) as QUANTTOTALEXP,' +   NOVA_LINHA +
        '   iif ( SUM(Situacao.ValorTotalExp)   is null , 0 , SUM(Situacao.ValorTotalExp)  ) as ValorTotalExp' +   NOVA_LINHA +
        'from (  select distinct' +   NOVA_LINHA ;
// sql_corpo
// s_where
sql_total_pais_order_int = ' order by Tab_pais.nome  '  +   NOVA_LINHA ;
sql_total_pais_grup =  ' ) as  Situacao '  +   NOVA_LINHA +
        ' group by Situacao.nome ORDER BY Situacao.nome ' +   NOVA_LINHA ;



sql_Camp_Situacao =
                'Select distinct ' +   NOVA_LINHA +
                '  Situacao.Contrato AS Contrato,' +   NOVA_LINHA +
                '  Situacao.NomeMix AS NomeMix,' +   NOVA_LINHA +
                '  Situacao.FORCOD AS FORCOD,' +   NOVA_LINHA +
                '  Situacao.C_C AS C_C,' +   NOVA_LINHA +
// 27/04/2012   '  Situacao.QuantidadeTotal AS QuantidadeTotal,' +   NOVA_LINHA +
                '  ( Situacao.QuantidadeTotal - iif( Situacao.QuantidadeExp is null , 0, Situacao.QuantidadeExp ))  AS QuantidadeTotal,' +   NOVA_LINHA +
                '  Situacao.PrecoFOBTotal AS PrecoFOBTotal,' +   NOVA_LINHA +
// 27/04/2012   '  Situacao.ValorSCCTotal AS ValorSCCTotal,' +   NOVA_LINHA +
                '  ( Situacao.ValorSCCTotal   - iif( Situacao.valor is null , 0, Situacao.valor )) AS ValorSCCTotal,' +   NOVA_LINHA +
                '  Situacao.QUANTTOTALEXP AS QUANTTOTALEXP,' +   NOVA_LINHA +
                '  Situacao.ValorTotalExp AS ValorTotalExp,' +   NOVA_LINHA +
                '  Situacao.RAZAO AS RAZAO' +   NOVA_LINHA +
                'from (  select distinct' +   NOVA_LINHA ;
// sql_corpo
// s_where
sql_Situacao_ordem =  ' ) as  Situacao '  +   NOVA_LINHA +
        'Order By Situacao.NomeMix,Situacao.Contrato' +   NOVA_LINHA ;

// SOMATORIO_PORCENTAGEM GERAL

sql_TOTAL_PRODUTO_P_I =
  'SELECT' +   NOVA_LINHA +
  '   TOTAL_PRODUTO.QuantidadeTotal   ,' +   NOVA_LINHA +
  '   TOTAL_PRODUTO_FORMA.QuantidadeTotal AS QuantidadeTotal_FOR ,' +   NOVA_LINHA +
  '   iif ( TOTAL_PRODUTO.QuantidadeTotal > 0 , TOTAL_PRODUTO_FORMA.QuantidadeTotal * 100 / TOTAL_PRODUTO.QuantidadeTotal, 0 ) AS  QuantidadeTotal_POR,' +   NOVA_LINHA +
  '   TOTAL_PRODUTO.ValorSCCTotal ,' +   NOVA_LINHA +
  '   TOTAL_PRODUTO_FORMA.ValorSCCTotal  AS ValorSCCTotal_FOR,' +   NOVA_LINHA +
  '   iif ( TOTAL_PRODUTO.ValorSCCTotal   > 0 ,TOTAL_PRODUTO_FORMA.ValorSCCTotal * 100 / TOTAL_PRODUTO.ValorSCCTotal,0 ) AS ValorSCCTotal_POR,' +   NOVA_LINHA +
  '   TOTAL_PRODUTO.QUANTTOTALEXP  ,' +   NOVA_LINHA +
  '   TOTAL_PRODUTO_FORMA.QUANTTOTALEXP AS QUANTTOTALEXP_FOR ,' +   NOVA_LINHA +
  '   iif ( TOTAL_PRODUTO.QUANTTOTALEXP   > 0 , TOTAL_PRODUTO_FORMA.QUANTTOTALEXP * 100 / TOTAL_PRODUTO.QUANTTOTALEXP,0 ) AS QUANTTOTALEXP_POR,' +   NOVA_LINHA +
  '   TOTAL_PRODUTO.ValorTotalExp ,' +   NOVA_LINHA +
  '   TOTAL_PRODUTO_FORMA.ValorTotalExp  AS ValorTotalExp_FOR ,' +   NOVA_LINHA +
  '   iif ( TOTAL_PRODUTO.ValorTotalExp   > 0 , TOTAL_PRODUTO_FORMA.ValorTotalExp * 100 /TOTAL_PRODUTO.ValorTotalExp ,0  ) AS  ValorTotalExp_POR' +   NOVA_LINHA +
  'FROM' +   NOVA_LINHA +
  '(' +   NOVA_LINHA +
  ' SELECT distinct' +   NOVA_LINHA +
//  '   iif ( SUM(Situacao.QuantidadeTotal) is null , 0 , SUM(Situacao.QuantidadeTotal)) as QuantidadeTotal,' +   NOVA_LINHA +
//  '   iif ( SUM(Situacao.ValorSCCTotal)   is null , 0 , SUM(Situacao.ValorSCCTotal)  ) as ValorSCCTotal,' +   NOVA_LINHA +
//  '   iif ( SUM(Situacao.QUANTTOTALEXP)   is null , 0 , SUM(Situacao.QUANTTOTALEXP)  ) as QUANTTOTALEXP,' +   NOVA_LINHA +
//  '   iif ( SUM(Situacao.ValorTotalExp)   is null , 0 , SUM(Situacao.ValorTotalExp)  ) as ValorTotalExp' +   NOVA_LINHA +
//  ( Situacao.QuantidadeTotal - iif( Situacao.QuantidadeExp is null , 0, Situacao.QuantidadeExp ))  AS QuantidadeTotal
  '    SUM(Situacao.QuantidadeTotal) - SUM(iif( Situacao.QuantidadeExp is null , 0, Situacao.QuantidadeExp ))  as QuantidadeTotal,' +   NOVA_LINHA +
  '    SUM(Situacao.ValorSCCTotal)   - SUM(iif( Situacao.valor is null , 0, Situacao.valor ))  as ValorSCCTotal,' +   NOVA_LINHA +
  '    SUM(Situacao.QUANTTOTALEXP)    as QUANTTOTALEXP,' +   NOVA_LINHA +
  '    SUM(Situacao.ValorTotalExp)    as ValorTotalExp' +   NOVA_LINHA +

  'from (  select distinct' +   NOVA_LINHA +
  '       ContratoTransporte.Contrato AS Contrato,' +   NOVA_LINHA +
  '       ContratoTransporte.NomeMix AS NomeMix,' +   NOVA_LINHA +
  '       ContratoTransporte.FORCOD AS FORCOD,' +   NOVA_LINHA +
  '       ContratoTransporte.C_C AS C_C,' +   NOVA_LINHA +

//  '       ContratoTransporte.QuantidadeTotal AS QuantidadeTotal,' +   NOVA_LINHA +
//  '       ContratoTransporte.PrecoFOBTotal AS PrecoFOBTotal,' +   NOVA_LINHA +
//  '       ContratoTransporte.ValorSCCTotal AS ValorSCCTotal,' +   NOVA_LINHA +
//  '       ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,' +   NOVA_LINHA +
//  '       ContratoTransporte.ValorTotalExp AS ValorTotalExp,' +   NOVA_LINHA +

  '       iif ( ContratoTransporte.QuantidadeTotal is null , 0 , ContratoTransporte.QuantidadeTotal ) AS QuantidadeTotal, ' +  NOVA_LINHA +
  '       iif ( ContratoTransporte.PrecoFOBTotal   is null , 0 , ContratoTransporte.PrecoFOBTotal   ) AS PrecoFOBTotal, ' +  NOVA_LINHA +
  '       iif ( ContratoTransporte.ValorSCCTotal   is null , 0 , ContratoTransporte.ValorSCCTotal   ) AS ValorSCCTotal, ' +  NOVA_LINHA +
  '       iif ( ContratoTransporte.QUANTTOTALEXP   is null , 0 , ContratoTransporte.QUANTTOTALEXP   ) AS QUANTTOTALEXP, ' +  NOVA_LINHA +
  '       iif ( ContratoTransporte.ValorTotalExp   is null , 0 , ContratoTransporte.ValorTotalExp   ) AS ValorTotalExp, ' +  NOVA_LINHA ;

sql_TOTAL_PRODUTO_P_F =
  '       Tab_pais.nome  as nome     ,' +   NOVA_LINHA +
  '       Fornecedores.RAZAO AS RAZAO' +   NOVA_LINHA +
  '       from  ContratoTransporte' +   NOVA_LINHA +
  'Left Outer Join Tab_pais on' +   NOVA_LINHA +
  '    ContratoTransporte.id    = Tab_pais.id' +   NOVA_LINHA +
  'Left Outer Join Fornecedores on' +   NOVA_LINHA +
  '  ContratoTransporte.FORCOD = Fornecedores.FORCOD' +   NOVA_LINHA +
  'Left Outer Join ExportadoTransito on' +   NOVA_LINHA +
  '  ContratoTransporte.Contrato = ExportadoTransito.Contrato' +   NOVA_LINHA +
  'Left Outer Join ProdutoContratoT on ' +  NOVA_LINHA +
  '  ContratoTransporte.Contrato = ProdutoContratoT.Contrato ' +  NOVA_LINHA ;
  // 26/04/2012
  //'Left Outer Join ExportadoTransito on' +   NOVA_LINHA +
  //'  ContratoTransporte.Contrato = ExportadoTransito.Contrato' +   NOVA_LINHA ;
//  ' WHERE  ' +   NOVA_LINHA ;

sql_TOTAL_PRODUTO_S_I =
  ' order by ContratoTransporte.NomeMix' +   NOVA_LINHA +
  ' ) as  Situacao' +   NOVA_LINHA +
  ') AS TOTAL_PRODUTO  ,' +   NOVA_LINHA +
  '(' +   NOVA_LINHA +
  ' SELECT distinct' +   NOVA_LINHA +
//  '   iif ( SUM(Situacao.QuantidadeTotal) is null , 0 , SUM(Situacao.QuantidadeTotal)) as QuantidadeTotal,' +   NOVA_LINHA +
//  '   iif ( SUM(Situacao.ValorSCCTotal)   is null , 0 , SUM(Situacao.ValorSCCTotal)  ) as ValorSCCTotal,' +   NOVA_LINHA +
//  '   iif ( SUM(Situacao.QUANTTOTALEXP)   is null , 0 , SUM(Situacao.QUANTTOTALEXP)  ) as QUANTTOTALEXP,' +   NOVA_LINHA +
//  '   iif ( SUM(Situacao.ValorTotalExp)   is null , 0 , SUM(Situacao.ValorTotalExp)  ) as ValorTotalExp' +   NOVA_LINHA +



//  '   ( SUM(Situacao.QuantidadeTotal)  as QuantidadeTotal,' +   NOVA_LINHA +
//  '   ( SUM(Situacao.ValorSCCTotal)   as ValorSCCTotal,' +   NOVA_LINHA +

  '    SUM(Situacao.QuantidadeTotal) - SUM(iif( Situacao.QuantidadeExp is null , 0, Situacao.QuantidadeExp ))  as QuantidadeTotal,' +   NOVA_LINHA +
  '    SUM(Situacao.ValorSCCTotal)   - SUM(iif( Situacao.valor is null , 0, Situacao.valor ))  as ValorSCCTotal,' +   NOVA_LINHA +

  '    SUM(Situacao.QUANTTOTALEXP)   as QUANTTOTALEXP,' +   NOVA_LINHA +
  '    SUM(Situacao.ValorTotalExp)   as ValorTotalExp' +   NOVA_LINHA +

  'from (  select distinct' +   NOVA_LINHA +
  '       ContratoTransporte.Contrato AS Contrato,' +   NOVA_LINHA +
  '       ContratoTransporte.NomeMix AS NomeMix,' +   NOVA_LINHA +
  '       ContratoTransporte.FORCOD AS FORCOD,' +   NOVA_LINHA +
  '       ContratoTransporte.C_C AS C_C,' +   NOVA_LINHA +
//  '       ContratoTransporte.QuantidadeTotal AS QuantidadeTotal,' +   NOVA_LINHA +
//  '       ContratoTransporte.PrecoFOBTotal AS PrecoFOBTotal,' +   NOVA_LINHA +
//  '       ContratoTransporte.ValorSCCTotal AS ValorSCCTotal,' +   NOVA_LINHA +
//  '       ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,' +   NOVA_LINHA +
//  '       ContratoTransporte.ValorTotalExp AS ValorTotalExp,' +   NOVA_LINHA ;

  '       iif ( ContratoTransporte.QuantidadeTotal is null ,0,ContratoTransporte.QuantidadeTotal) AS QuantidadeTotal, ' +  NOVA_LINHA +
  '       iif ( ContratoTransporte.PrecoFOBTotal   is null ,0,ContratoTransporte.PrecoFOBTotal  ) AS PrecoFOBTotal, ' +  NOVA_LINHA +
  '       iif ( ContratoTransporte.ValorSCCTotal   is null ,0,ContratoTransporte.ValorSCCTotal  ) AS ValorSCCTotal, ' +  NOVA_LINHA +
  '       iif ( ContratoTransporte.QUANTTOTALEXP   is null ,0,ContratoTransporte.QUANTTOTALEXP  ) AS QUANTTOTALEXP, ' +  NOVA_LINHA +
  '       iif ( ContratoTransporte.ValorTotalExp   is null ,0,ContratoTransporte.ValorTotalExp  ) AS ValorTotalExp, ' +  NOVA_LINHA ;

sql_TOTAL_PRODUTO_S_f =
  '       Tab_pais.nome  as nome     ,' +   NOVA_LINHA +
  '       Fornecedores.RAZAO AS RAZAO' +   NOVA_LINHA +
  '       from  ContratoTransporte' +   NOVA_LINHA +
  'Left Outer Join Tab_pais on' +   NOVA_LINHA +
  '    ContratoTransporte.id    = Tab_pais.id' +   NOVA_LINHA +
  'Left Outer Join Fornecedores on' +   NOVA_LINHA +
  '  ContratoTransporte.FORCOD = Fornecedores.FORCOD' +   NOVA_LINHA +
  'Left Outer Join ExportadoTransito on' +   NOVA_LINHA +
  '  ContratoTransporte.Contrato = ExportadoTransito.Contrato' +   NOVA_LINHA +
  'Left Outer Join ProdutoContratoT on ' +  NOVA_LINHA +
  '  ContratoTransporte.Contrato = ProdutoContratoT.Contrato ' +  NOVA_LINHA ;
  
  // 26/04/2012
  //'Left Outer Join ExportadoTransito on' +   NOVA_LINHA +
  //'  ContratoTransporte.Contrato = ExportadoTransito.Contrato' +   NOVA_LINHA ;
//  ' WHERE ' +   NOVA_LINHA ;


sql_TOTAL_PRODUTO_O =
  ' order by ContratoTransporte.NomeMix' +   NOVA_LINHA +
  ' ) as  Situacao' +   NOVA_LINHA +
  ') AS TOTAL_PRODUTO_FORMA' +   NOVA_LINHA ;

sql_TOTAL_PAIS_P_I =
' SELECT' +   NOVA_LINHA +
'       TOTAL_PAIS.nome AS nome,' +   NOVA_LINHA +
'       TOTAL_PAIS.QuantidadeTotal AS QuantidadeTotal,' +   NOVA_LINHA +
'       TOTAL_PAIS_FORMA.QuantidadeTotal AS QuantidadeTotal_FOR ,' +   NOVA_LINHA +
'       iif ( TOTAL_PAIS.QuantidadeTotal > 0 , TOTAL_PAIS_FORMA.QuantidadeTotal * 100 / TOTAL_PAIS.QuantidadeTotal,0) AS QuantidadeTotal_PER,' +   NOVA_LINHA +
'       TOTAL_PAIS.ValorSCCTotal AS ValorSCCTotal,' +   NOVA_LINHA +
'       TOTAL_PAIS_FORMA.ValorSCCTotal AS ValorSCCTotal_FOR,' +   NOVA_LINHA +
'       iif( TOTAL_PAIS.ValorSCCTotal > 0 , TOTAL_PAIS_FORMA.ValorSCCTotal * 100 / TOTAL_PAIS.ValorSCCTotal, 0 ) AS ValorSCCTotal_PER,' +   NOVA_LINHA +
'       TOTAL_PAIS.QUANTTOTALEXP AS QUANTTOTALEXP ,' +   NOVA_LINHA +
'       TOTAL_PAIS_FORMA.QUANTTOTALEXP AS QUANTTOTALEXP_FOR,' +   NOVA_LINHA +
'       iif ( TOTAL_PAIS.QUANTTOTALEXP > 0 , TOTAL_PAIS_FORMA.QUANTTOTALEXP * 100 / TOTAL_PAIS.QUANTTOTALEXP, 0 ) AS QUANTTOTALEXP_PER,' +   NOVA_LINHA +
'       TOTAL_PAIS.ValorTotalExp AS ValorTotalExp,' +   NOVA_LINHA +
'       TOTAL_PAIS_FORMA.ValorTotalExp AS ValorTotalExp_FOR,' +   NOVA_LINHA +
'       iif ( TOTAL_PAIS.ValorTotalExp > 0 , TOTAL_PAIS_FORMA.ValorTotalExp * 100 / TOTAL_PAIS.ValorTotalExp , 0) AS ValorTotalExp_PER' +   NOVA_LINHA +
' FROM' +   NOVA_LINHA +
' (' +   NOVA_LINHA +
' SELECT  distinct' +   NOVA_LINHA +
'       Situacao.nome as  nome ,' +   NOVA_LINHA +
//'   iif ( SUM(Situacao.QuantidadeTotal) is null , 0 , SUM(Situacao.QuantidadeTotal)) as QuantidadeTotal,' +   NOVA_LINHA +
//'   iif ( SUM(Situacao.ValorSCCTotal)   is null , 0 , SUM(Situacao.ValorSCCTotal)  ) as ValorSCCTotal,' +   NOVA_LINHA +
//'   iif ( SUM(Situacao.QUANTTOTALEXP)   is null , 0 , SUM(Situacao.QUANTTOTALEXP)  ) as QUANTTOTALEXP,' +   NOVA_LINHA +
//'   iif ( SUM(Situacao.ValorTotalExp)   is null , 0 , SUM(Situacao.ValorTotalExp)  ) as ValorTotalExp' +   NOVA_LINHA +

//'   ( SUM(Situacao.QuantidadeTotal) as QuantidadeTotal,' +   NOVA_LINHA +
//'   ( SUM(Situacao.ValorSCCTotal)   as ValorSCCTotal,' +   NOVA_LINHA +
'    SUM(Situacao.QuantidadeTotal) - SUM(iif( Situacao.QuantidadeExp is null , 0, Situacao.QuantidadeExp ))  as QuantidadeTotal,' +   NOVA_LINHA +
'    SUM(Situacao.ValorSCCTotal)   - SUM(iif( Situacao.valor is null , 0, Situacao.valor ))  as ValorSCCTotal,' +   NOVA_LINHA +

'    SUM(Situacao.QUANTTOTALEXP)   as QUANTTOTALEXP,' +   NOVA_LINHA +
'    SUM(Situacao.ValorTotalExp)   as ValorTotalExp' +   NOVA_LINHA +

'from (  select distinct' +   NOVA_LINHA +
'       ContratoTransporte.Contrato AS Contrato,' +   NOVA_LINHA +
'       ContratoTransporte.NomeMix AS NomeMix,' +   NOVA_LINHA +
'       ContratoTransporte.FORCOD AS FORCOD,' +   NOVA_LINHA +
'       ContratoTransporte.C_C AS C_C,' +   NOVA_LINHA +

//'       ContratoTransporte.QuantidadeTotal AS QuantidadeTotal,' +   NOVA_LINHA +
//'       ContratoTransporte.PrecoFOBTotal AS PrecoFOBTotal,' +   NOVA_LINHA +
//'       ContratoTransporte.ValorSCCTotal AS ValorSCCTotal,' +   NOVA_LINHA +
//'       ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,' +   NOVA_LINHA +
//'       ContratoTransporte.ValorTotalExp AS ValorTotalExp,' +   NOVA_LINHA +

'       iif ( ContratoTransporte.QuantidadeTotal is null , 0 , ContratoTransporte.QuantidadeTotal ) AS QuantidadeTotal, ' +  NOVA_LINHA +
'       iif ( ContratoTransporte.PrecoFOBTotal   is null , 0 , ContratoTransporte.PrecoFOBTotal   ) AS PrecoFOBTotal, ' +  NOVA_LINHA +
'       iif ( ContratoTransporte.ValorSCCTotal   is null , 0 , ContratoTransporte.ValorSCCTotal   ) AS ValorSCCTotal, ' +  NOVA_LINHA +
'       iif ( ContratoTransporte.QUANTTOTALEXP   is null , 0 , ContratoTransporte.QUANTTOTALEXP   ) AS QUANTTOTALEXP, ' +  NOVA_LINHA +
'       iif ( ContratoTransporte.ValorTotalExp   is null , 0 , ContratoTransporte.ValorTotalExp   ) AS ValorTotalExp, ' +  NOVA_LINHA ;
sql_TOTAL_PAIS_P_F =
'       Tab_pais.nome  as nome     ,' +   NOVA_LINHA +
'       Fornecedores.RAZAO AS RAZAO' +   NOVA_LINHA +
'       from  ContratoTransporte' +   NOVA_LINHA +
'Left Outer Join Tab_pais on' +   NOVA_LINHA +
'    ContratoTransporte.id    = Tab_pais.id' +   NOVA_LINHA +
'Left Outer Join Fornecedores on' +   NOVA_LINHA +
'  ContratoTransporte.FORCOD = Fornecedores.FORCOD' +   NOVA_LINHA +
'Left Outer Join ExportadoTransito on' +   NOVA_LINHA +
'  ContratoTransporte.Contrato = ExportadoTransito.Contrato' +   NOVA_LINHA +
'Left Outer Join ProdutoContratoT on ' +  NOVA_LINHA +
'  ContratoTransporte.Contrato = ProdutoContratoT.Contrato ' +  NOVA_LINHA ;

// 26/04/2012
//'Left Outer Join ExportadoTransito on' +   NOVA_LINHA +
//'  ContratoTransporte.Contrato = ExportadoTransito.Contrato' +   NOVA_LINHA ;
//' WHERE  '+   NOVA_LINHA  ;

// CONTRATOTRANSPORTE.CADASTRO >= '2011/05/01' AND CONTRATOTRANSPORTE.CADASTRO <= '2011/07/10'' +   NOVA_LINHA +

sql_TOTAL_PAIS_S_I =
' order by Tab_pais.nome' +   NOVA_LINHA +
' ) as  Situacao' +   NOVA_LINHA +
' group by Situacao.nome ORDER BY Situacao.nome' +   NOVA_LINHA +
' ) AS TOTAL_PAIS ,' +   NOVA_LINHA +
' (' +   NOVA_LINHA +
' SELECT  distinct' +   NOVA_LINHA +
'       Situacao.nome as  nome ,' +   NOVA_LINHA +
//'       SUM(Situacao.QuantidadeTotal) as QuantidadeTotal,' +   NOVA_LINHA +
//'       SUM(Situacao.ValorSCCTotal) as ValorSCCTotal,' +   NOVA_LINHA +

'     SUM(Situacao.QuantidadeTotal) - SUM(iif( Situacao.QuantidadeExp is null , 0, Situacao.QuantidadeExp ))  as QuantidadeTotal,' +   NOVA_LINHA +
'     SUM(Situacao.ValorSCCTotal)   - SUM(iif( Situacao.valor is null , 0, Situacao.valor ))  as ValorSCCTotal,' +   NOVA_LINHA +


'       SUM(Situacao.QUANTTOTALEXP) as QUANTTOTALEXP,' +   NOVA_LINHA +
'       SUM(Situacao.ValorTotalExp) as ValorTotalExp' +   NOVA_LINHA +
//'   iif ( SUM(Situacao.QuantidadeTotal) is null , 0 , SUM(Situacao.QuantidadeTotal)) as QuantidadeTotal,' +   NOVA_LINHA +
//'   iif ( SUM(Situacao.ValorSCCTotal)   is null , 0 , SUM(Situacao.ValorSCCTotal)  ) as ValorSCCTotal,' +   NOVA_LINHA +
//'   iif ( SUM(Situacao.QUANTTOTALEXP)   is null , 0 , SUM(Situacao.QUANTTOTALEXP)  ) as QUANTTOTALEXP,' +   NOVA_LINHA +
//'   iif ( SUM(Situacao.ValorTotalExp)   is null , 0 , SUM(Situacao.ValorTotalExp)  ) as ValorTotalExp' +   NOVA_LINHA +
'from (  select distinct' +   NOVA_LINHA +
'       ContratoTransporte.Contrato AS Contrato,' +   NOVA_LINHA +
'       ContratoTransporte.NomeMix AS NomeMix,' +   NOVA_LINHA +
'       ContratoTransporte.FORCOD AS FORCOD,' +   NOVA_LINHA +
'       ContratoTransporte.C_C AS C_C,' +   NOVA_LINHA +
//'       ContratoTransporte.QuantidadeTotal AS QuantidadeTotal,' +   NOVA_LINHA +
//'       ContratoTransporte.PrecoFOBTotal AS PrecoFOBTotal,' +   NOVA_LINHA +
//'       ContratoTransporte.ValorSCCTotal AS ValorSCCTotal,' +   NOVA_LINHA +
//'       ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,' +   NOVA_LINHA +
//'       ContratoTransporte.ValorTotalExp AS ValorTotalExp,' +   NOVA_LINHA +
'       iif ( ContratoTransporte.QuantidadeTotal is null , 0 , ContratoTransporte.QuantidadeTotal ) AS QuantidadeTotal, ' +  NOVA_LINHA +
'       iif ( ContratoTransporte.PrecoFOBTotal   is null , 0 , ContratoTransporte.PrecoFOBTotal   ) AS PrecoFOBTotal, ' +  NOVA_LINHA +
'       iif ( ContratoTransporte.ValorSCCTotal   is null , 0 , ContratoTransporte.ValorSCCTotal   ) AS ValorSCCTotal, ' +  NOVA_LINHA +
'       iif ( ContratoTransporte.QUANTTOTALEXP   is null , 0 , ContratoTransporte.QUANTTOTALEXP   ) AS QUANTTOTALEXP, ' +  NOVA_LINHA +
'       iif ( ContratoTransporte.ValorTotalExp   is null , 0 , ContratoTransporte.ValorTotalExp   ) AS ValorTotalExp, ' +  NOVA_LINHA ;
sql_TOTAL_PAIS_S_F =
'       Tab_pais.nome  as nome     ,' +   NOVA_LINHA +
'       Fornecedores.RAZAO AS RAZAO' +   NOVA_LINHA +
'       from  ContratoTransporte' +   NOVA_LINHA +
'Left Outer Join Tab_pais on' +   NOVA_LINHA +
'    ContratoTransporte.id    = Tab_pais.id' +   NOVA_LINHA +
'Left Outer Join Fornecedores on' +   NOVA_LINHA +
'  ContratoTransporte.FORCOD = Fornecedores.FORCOD' +   NOVA_LINHA +
'Left Outer Join ExportadoTransito on' +   NOVA_LINHA +
'  ContratoTransporte.Contrato = ExportadoTransito.Contrato' +   NOVA_LINHA +
'Left Outer Join ProdutoContratoT on ' +  NOVA_LINHA +
'  ContratoTransporte.Contrato = ProdutoContratoT.Contrato ' +  NOVA_LINHA ;
// 26/04/2012
//'Left Outer Join ExportadoTransito on' +   NOVA_LINHA +
//'  ContratoTransporte.Contrato = ExportadoTransito.Contrato' +   NOVA_LINHA ;

// ' WHERE ' +   NOVA_LINHA ;

// CONTRATOTRANSPORTE.CADASTRO >= '2011/05/01' AND CONTRATOTRANSPORTE.CADASTRO <= '2011/07/10'  AND EXPORTADOTRANSITO.FORMPAGO = 'CAD'' +   NOVA_LINHA +
sql_TOTAL_PAIS_O =
' order by Tab_pais.nome' +   NOVA_LINHA +
' ) as  Situacao' +   NOVA_LINHA +
' group by Situacao.nome ORDER BY Situacao.nome' +   NOVA_LINHA +
' ) AS TOTAL_PAIS_FORMA' +   NOVA_LINHA +
' WHERE TOTAL_PAIS_FORMA.nome = TOTAL_PAIS.nome' +   NOVA_LINHA ;

 {
sql_TOTAL_PAIS_P = ' WHERE  '
sql_TOTAL_PAIS_S = ' WHERE '
sql_TOTAL_PAIS_O

sql_TOTAL_PRODUTO_P = ' WHERE  '
sql_TOTAL_PRODUTO_S = ' WHERE '
sql_TOTAL_PRODUTO_O

 }

type
  TFormRelSitucaoCred = class(TForm)
    PnSup: TPanel;
    ShapeSup: TShape;
    LbTituloForm: TLabel;
    BtnAjuda: TSpeedButton;
    BtnFechar: TSpeedButton;
    frDBDataSet: TfrDBDataSet;
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    Label2: TLabel;
    Label1: TLabel;
    XDT_FIM: TXDateEdit;
    XDT_INIC: TXDateEdit;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    Selecao_1: TScrollBox;
    Divisao: TTabSet;
    Panel1: TPanel;
    BtnVisualizar: TBitBtn;
    BtnCancelar: TBitBtn;
    GroupBox_dados: TGroupBox;
    DBNav_Qsituacao: TDBNavigator;
    DBGrid_QSituacao: TDBGrid;
    Panel_filtro: TPanel;
    GroupBox_Filtro: TGroupBox;
    GroupBox_total_grup: TGroupBox;
    IBQuery_Total_Prod: TIBQuery;
    DS_total_Prod: TDataSource;
    DBNav_total_prod: TDBNavigator;
    DBGrid_total_prod: TDBGrid;
    IBQuery_Total_ProdNOMEMIX: TIBStringField;
    IBQuery_Total_ProdQUANTIDADETOTAL: TFloatField;
    IBQuery_Total_ProdVALORSCCTOTAL: TFloatField;
    IBQuery_Total_ProdQUANTTOTALEXP: TFloatField;
    IBQuery_Total_ProdVALORTOTALEXP: TFloatField;
    BitB_FILTRO: TBitBtn;
    frDBDataSet_Total_Prod: TfrDBDataSet;
    QSituacao: TIBQuery;
    IBQuery_navio: TIBQuery;
    frDBDataSet_Navio: TfrDBDataSet;
    DS_situacao: TDataSource;
    DS_Navio: TDataSource;
    GBoxCliente: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    CBox_Cliente_I: TComboBox;
    CBox_Cliente_F: TComboBox;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    CBox_Exportador_I: TComboBox;
    CBox_Exportador_F: TComboBox;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    XDT_INIC_EMB: TXDateEdit;
    XDT_FIM_EMB: TXDateEdit;
    DS_QSituacao: TDataSource;
    IBQuery_Pais: TIBQuery;
    DS_PAIS: TDataSource;
    frDBDataSet_Pais: TfrDBDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox_situacao: TGroupBox;
    DBNav_situacao: TDBNavigator;
    DBGrid_Situacao111: TDBGrid;
    GroupBox_total_pais: TGroupBox;
    DBNav_Total_pais: TDBNavigator;
    DBGrid_total_pais: TDBGrid;
    GroupBox_navio: TGroupBox;
    DBNav_navio: TDBNavigator;
    DBGrid_navio: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    GridConsulta: TDBGrid;
    PopConsulta: TPopupMenu;
    mnu_Filtrar: TMenuItem;
    mnu_Ordenar: TMenuItem;
    mnu_OrdenarComposto: TMenuItem;
    N1: TMenuItem;
    mnu_ApagarColuna: TMenuItem;
    N2: TMenuItem;
    mnu_Quantificar: TMenuItem;
    mnu_TotalizarColuna: TMenuItem;
    mnu_CalcularMedia: TMenuItem;
    N3: TMenuItem;
    mnu_Imprimir: TMenuItem;
    mnu_SalvarConsulta: TMenuItem;
    mnu_ExcluirConsulta: TMenuItem;
    IBQuery_navioCONTRATO: TIBStringField;
    IBQuery_navioNAVIO: TIBStringField;
    IBQuery_navioDATAEMBARQUE: TDateTimeField;
    IBQuery_navioQUANTIDADEEXP: TFloatField;
    IBQuery_navioVALOR: TFloatField;
    GroupBox_FormaPag: TGroupBox;
    CBox_FormaPag: TComboBox;
    IBQuery_TOTAL_PRODUTO: TIBQuery;
    IBQuery_TOTAL_PAIS: TIBQuery;
    DS_TOTAL_PRODUTO: TDataSource;
    DS_TOTAL_PAIS: TDataSource;
    frDBDataSet_TOTAL_PRODUTO: TfrDBDataSet;
    frDBDataSet_TOTAL_PAIS: TfrDBDataSet;
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
    procedure BitB_FILTROClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
    
  private
    Caption_rel : string ;
    L_FILTRO : BOOLEAN ;
    S_FILTRO , SQL_SITUACAO , S_FILTRO_WHERE_contrato, s_filtro_WHERE_navio  : string ;
    { Private declarations }
    //QyRelatorio: TTabela;
    {02-Início do Bloco Modular. Modificações não serão preservadas}
    AbaConsulta: TTabSet;
    TabelaPrincipal: TTabela;
    ConsultasSalvas: TList;
    DSituacao: TDSituacao;
    procedure CalculosDSituacao(DataSet: TDataSet);
    procedure AtualizaDetalhe_DSituacao(Sender: TObject; Field: TField);
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure ConstroiSql;
    procedure InicializaVariaveis;
    procedure Parametros(Tabela: TTabela);
    procedure ValidaColunaGrid(Sender: TField);
    function AbandonandoEdicao: Boolean;
  public
    { Public declarations }
    {03-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
  end;

var
  FormRelSitucaoCred: TFormRelSitucaoCred;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas,RotinaEd, Abertura, GridPesquisa, Interno;

procedure TFormRelSitucaoCred.ConstroiSql;
//var
//  I: Integer;
begin
  {0_4-Início do Bloco Modular. Modificações não serão preservadas}
//  DSituacao.Filtro.Clear;
//  DSituacao.AtualizaSql(False);
//  Parametros(DSituacao);
//  DSituacao.Open;
//  frDBDataSet.DataSet := DSituacao;
  {9_9-Final do Bloco Modular. Modificações não serão preservadas}

 // SQL_SITUACAO


end;

procedure TFormRelSitucaoCred.Parametros(Tabela: TTabela);
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

procedure TFormRelSitucaoCred.FormShow(Sender: TObject);
Var
  I: Integer;
begin
TRY
  ConsultasSalvas    := TList.Create;
  L_FILTRO := FALSE ;
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Situação Credito';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {0_6-Início do Bloco Modular. Modificações não serão preservadas}
  DSituacao := TDSituacao.Create(Self);
  DSituacao.OnCalcFields := CalculosDSituacao;
  DSituacao.DataSource.OnDataChange := AtualizaDetalhe_DSituacao;
  //QyRelatorio := DSituacao;
  {9_9-Final do Bloco Modular. Modificações não serão preservadas}
   Caption := 'Informe Forma de Pago';

  TabelaPrincipal    := DSituacao;
  // QyRelatorio := QSituacao;
  /////////////////////  IBQuery_navio

  QSituacao.Close;
  QSituacao.Database := BaseDados.BD_Base_Dados ;
  QSituacao.Transaction := BaseDados.TRS_BD_Base_Dados ;

  IBQuery_Total_Prod.Close;
  IBQuery_Total_Prod.Database := BaseDados.BD_Base_Dados ;
  IBQuery_Total_Prod.Transaction := BaseDados.TRS_BD_Base_Dados ;

  IBQuery_navio.Close ;
  IBQuery_navio.Database := BaseDados.BD_Base_Dados ;
  IBQuery_navio.Transaction := BaseDados.TRS_BD_Base_Dados ;
  IBQuery_navio.DataSource := DS_QSituacao ;


 // IBQuery_Pais

  IBQuery_Pais.Close;
  IBQuery_Pais.Database := BaseDados.BD_Base_Dados ;
  IBQuery_Pais.Transaction := BaseDados.TRS_BD_Base_Dados ;

  IBQuery_TOTAL_PRODUTO.CLOSE;
  IBQuery_TOTAL_PAIS.close;

  IBQuery_TOTAL_PRODUTO.Database := BaseDados.BD_Base_Dados ;
  IBQuery_TOTAL_PRODUTO.Transaction := BaseDados.TRS_BD_Base_Dados ;

  IBQuery_TOTAL_PAIS.Database := BaseDados.BD_Base_Dados ;
  IBQuery_TOTAL_PAIS.Transaction := BaseDados.TRS_BD_Base_Dados ;



  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;

//  if not DSituacao.Active  then
//     ConstroiSql ;


  frReport.OnUserFunction := FuncoesExtras;

  DS_situacao.DataSet :=  DSituacao ;

  DBNav_situacao.DataSource := DS_situacao ;
//  DBGrid_Situacao.DataSource := DS_situacao ;
  GridConsulta.DataSource := DS_situacao ;

//  GroupBox_total_grup.Height := (( Selecao_1.Height - Panel_filtro.Height ) DIV 2 ) ;
  GroupBox_total_grup.Align := alClient ;


  DBNav_situacao.Align := alTop ;
//  DBGrid_Situacao.Align := alClient ;
  GridConsulta.Align := alClient ;

  DBNav_Qsituacao.Align := alTop ;
  DBGrid_QSituacao.Align := alClient ;

  DBNav_total_prod.Align := alTop ;
  DBGrid_total_prod.Align := alClient ;

  DBNav_Total_pais.Align := alTop ;
  DBGrid_total_pais.Align := alClient ;

  DBNav_navio.Align := alTop ;
  DBGrid_navio.Align := alClient ;

  Panel_filtro.Align := alBottom ;
  GroupBox_dados.Align := alClient ;
  GroupBox_situacao.Align := alClient ;
  GroupBox_navio.Align := alRight;
  GroupBox_total_pais.Align := alRight;

//  GroupBox_total_grup.Align := alBottom ;
  Panel2.Align := alClient ;
  Panel3.Align := alBottom ;

  DS_total_Prod.DataSet := IBQuery_Total_Prod ;
  DBNav_total_prod.DataSource := DS_total_Prod ;
  DBGrid_total_prod.DataSource := DS_total_Prod ;
  frDBDataSet_Total_Prod.DataSource   := DS_total_Prod ;

  IBQuery_navio.DataSource := DS_QSituacao ;
{
  IBQuery_Total_ProdQUANTIDADETOTAL.DisplayFormat  :=  '########0.000';
  IBQuery_Total_ProdVALORSCCTOTAL.DisplayFormat  :=  '#########0.00';
  IBQuery_Total_ProdQUANTTOTALEXP.DisplayFormat  :=  '########0.000';
  IBQuery_Total_ProdVALORTOTALEXP.DisplayFormat  :=  '#########0.00';

  IBQuery_PaisQUANTIDADETOTAL.DisplayFormat  :=  '##########0.000';
  IBQuery_PaisVALORSCCTOTAL.DisplayFormat    :=  '###########0.00';
  IBQuery_PaisQUANTTOTALEXP.DisplayFormat    :=  '##########0.000';
  IBQuery_PaisVALORTOTALEXP.DisplayFormat    :=  '###########0.00';
}

//  IBQuery_PaisNOME.DisplayLabel := 'Pais';

  frDBDataSet.DataSource := DS_QSituacao ;


  Carrega_CB(CBox_Cliente_i,CBox_Cliente_f,'SELECT RAZAO || '' >> '' || CLICOD || '' <<''  AS CAMPOS FROM CLIENTES ORDER BY RAZAO', 'CAMPOS',SELF);
  Carrega_CB(CBox_Exportador_i,CBox_Exportador_F,'SELECT RAZAO || '' >> '' || FORCOD || '' <<''  AS CAMPOS FROM FORNECEDORES ORDER BY RAZAO', 'CAMPOS',SELF);
  Carrega_CB(CBox_FormaPag,NIL,'SELECT FORMPAGO  AS FORMPAGO FROM TBFORMAPAGAMENTO ORDER BY FORMPAGO', 'FORMPAGO',SELF);

//  BitB_FILTROClick(SELF) ;


  FormResize(Self);
except
  on Erro: Exception do
  begin
    SISTEMA.ERRO_CMS.Add('ARQUIVO = RelSitucaoCred '+''+'Erro: ' + Erro.Message );
    SISTEMA.ERRO_CMS.SaveToFile('ERRO_CMS_SISTEMA.ERR');
    MessageDlg('Erro: ' + Erro.Message, mtError, [mbOk], 0);
  end;
end;


end;

procedure TFormRelSitucaoCred.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormRelSitucaoCred.InicializaVariaveis;
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
  frVariables['Titulo_1']     :=  Caption ;
  frVariables['Titulo_2']     := Caption_rel ;
  frVariables['Titulo_3']     := 'Forma Pag : '+ Trim(CBox_FormaPag.Text )  ;
  frVariables['FORMA_PAG']    := CBox_FormaPag.Text ;
  
  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormRelSitucaoCred.BtnVisualizarClick(Sender: TObject);
begin
try
  IF CBox_FormaPag.Text = '' THEN begin
     MessageDlg(MSG_FORMADEPAGAMETOEOBRIGATORIA,mtWarning,[mbOk],0);
     exit ;
  end;

  IF L_FILTRO = FALSE THEN BEGIN
     MessageDlg('FILTRO NAO EXECUTADO !',mtInformation,[mbOk],0);
     EXIT ;
  END;

//  BitB_FILTROClick(Sender);

  ConstroiSql;
  InicializaVariaveis;
  if QSituacao.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório

  except
    on Erro: Exception do
    begin
      MessageDlg('Erro: ' + Erro.Message, mtError, [mbOk], 0);
    end;
  end;
    

end;

procedure TFormRelSitucaoCred.FormResize(Sender: TObject);
begin
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
  Panel3.Height := TabSheet1.Height div 2 ;
  GroupBox_navio.Width  := TabSheet1.Width div 2 ;
  GroupBox_total_pais.Width  := TabSheet1.Width div 2 ;
end;

procedure TFormRelSitucaoCred.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFormRelSitucaoCred.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i : integer ;
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  DSituacao.Free;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
//  ListaCamposED.Free;
  for I := 0 to ConsultasSalvas.Count - 1 do
    TConsultasSalvas(ConsultasSalvas[I]).Free;
  ConsultasSalvas.Free;
//  Action := caFree;
//  FormClienteN := nil;

end;

{08-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormRelSitucaoCred.CalculosDSituacao(DataSet: TDataSet);
begin
end;

procedure TFormRelSitucaoCred.AtualizaDetalhe_DSituacao(Sender: TObject;
  Field: TField);
begin
end;
{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormRelSitucaoCred.FuncoesExtras(const Name: String; p1, p2,
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

procedure TFormRelSitucaoCred.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then   // Calendário
    Interno108
  else if Key = VK_F6 then // Calculadora
    Interno109
  else if Key = VK_F7 then // Agenda
    Interno110;
end;

procedure TFormRelSitucaoCred.BitB_FILTROClick(Sender: TObject);
VAR
  S_CLICOD,s_titulo, s_titulo_c , S_FILTRO_EMB , S_FILTRO_EMB_NAVIO , s_corpo_novos1 , s_corpo_novos2 ,S_FILTRO_WHERE_contrato_pais : STRING ;
  N_INC  , N_FIN : INTEGER ;
begin
try

  IF CBox_FormaPag.Text = '' THEN begin
     MessageDlg(MSG_FORMADEPAGAMETOEOBRIGATORIA,mtWarning,[mbOk],0);
     exit ;
  end;

  L_FILTRO := FALSE ;
  Screen.Cursor := crHourGlass;
  S_FILTRO := '';
  s_titulo := '' ;
  s_titulo_c := '' ;
  S_FILTRO_EMB := '' ;
  S_FILTRO_EMB_NAVIO := '' ;

  S_FILTRO_WHERE_contrato := '' ;
  S_FILTRO_WHERE_contrato_pais := '' ;

  s_filtro_WHERE_navio    := '' ;

  Caption_rel := '' ;
  s_corpo_novos1 := sql_corpo_novos1  ;
  s_corpo_novos2 := sql_corpo_novos2  ;

  // ExportadoTransito embarque
  IF  XDT_INIC_EMB.DateValue <> -693594 THEN begin
      S_FILTRO := ' ExportadoTransito.DataEmbarque >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC_EMB.DateValue)) ;
      s_corpo_novos1 := ' (select sum(ExportadoTransito.QuantidadeExp) from ExportadoTransito where (ExportadoTransito.Contrato = ContratoTransporte.Contrato ) and ( ExportadoTransito.DataEmbarque < '+  AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC_EMB.DateValue)) + ')) AS QuantidadeExp, ' +  NOVA_LINHA ;
      s_corpo_novos2 := ' (select sum(ExportadoTransito.valor) from ExportadoTransito where (ExportadoTransito.Contrato = ContratoTransporte.Contrato ) and ( ExportadoTransito.DataEmbarque < ' +  AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC_EMB.DateValue))  + ' )) AS valor, '+    NOVA_LINHA ;

  end;
  IF  XDT_FIM_EMB.DateValue <> -693594 THEN  begin
      IF  S_FILTRO = '' THEN
          S_FILTRO := ' ExportadoTransito.DataEmbarque <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM_EMB.DateValue))
      ELSE
          S_FILTRO := S_FILTRO + ' AND ExportadoTransito.DataEmbarque <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM_EMB.DateValue)) ;
  end;

  //´PERIODO
  IF  ( XDT_FIM.DateValue <> -693594 ) and ( XDT_INIC.DateValue <> -693594) THEN
      s_titulo := ' Periodo ( '+ XDT_INIC.Text + ' a ' + XDT_FIM.Text  + ' )'
  else
      IF  XDT_FIM.DateValue <> -693594 then
          s_titulo := ' Periodo ( '+  XDT_FIM.Text  + ' )'
      else
         IF XDT_INIC.DateValue <> -693594 then
            s_titulo := ' Periodo ( '+ XDT_INIC.Text + ' )';

  IF S_FILTRO <>  '' THEN
     L_FILTRO := TRUE ;
//  25/04/2012 ERRO
//  S_FILTRO := '';

  IF  XDT_INIC.DateValue <> -693594 THEN
      IF  S_FILTRO = '' THEN
          S_FILTRO := ' CONTRATOTRANSPORTE.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue))
      ELSE
          S_FILTRO := S_FILTRO + ' AND CONTRATOTRANSPORTE.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue)) ;
//  25/04/2012 ERRO
//      S_FILTRO := ' CONTRATOTRANSPORTE.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue)) ;

  IF  XDT_FIM.DateValue <> -693594 THEN  begin
      IF  S_FILTRO = '' THEN
          S_FILTRO := ' CONTRATOTRANSPORTE.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))
      ELSE
          S_FILTRO := S_FILTRO + ' AND CONTRATOTRANSPORTE.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;
  end;

  IF CBox_Cliente_I.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_Cliente_I.Text) + 2   ;
     N_FIN := POS('<<',CBox_Cliente_I.Text)   ;
     S_CLICOD := COPY( CBox_Cliente_I.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN BEGIN
         S_FILTRO := ' CONTRATOTRANSPORTE.CLICOD >= '+  ( S_CLICOD  );
     END
     ELSE BEGIN
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.CLICOD >= '+  ( S_CLICOD ) ;
     END;
  END;
  IF CBox_Cliente_F.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_Cliente_F.Text) + 2   ;
     N_FIN := POS('<<',CBox_Cliente_F.Text)   ;
     S_CLICOD := COPY( CBox_Cliente_F.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN BEGIN
         S_FILTRO := ' CONTRATOTRANSPORTE.CLICOD <= '+ S_CLICOD ;
     END
     ELSE BEGIN
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.CLICOD <= '+ S_CLICOD ;
     END;
     Caption_rel := Caption_rel + COPY( CBox_Cliente_F.Text,1, N_INC - 3 );
  END;
  // exportador

  IF CBox_Exportador_I.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_Exportador_I.Text) + 2   ;
     N_FIN := POS('<<',CBox_Exportador_I.Text)   ;
     S_CLICOD :=  ( COPY( CBox_Exportador_I.Text, N_INC, N_FIN - N_INC )) ;
     IF S_FILTRO = '' THEN BEGIN
        S_FILTRO := ' CONTRATOTRANSPORTE.FORCOD >= '+ S_CLICOD;
     END
     ELSE BEGIN
        S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.FORCOD >= '+ S_CLICOD ;
     END;
  END;

  IF CBox_Exportador_F.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_Exportador_f.Text) + 2   ;
     N_FIN := POS('<<',CBox_Exportador_f.Text)   ;
     S_CLICOD :=  ( COPY( CBox_Exportador_f.Text, N_INC, N_FIN - N_INC ) ) ;
     IF  S_FILTRO = '' THEN BEGIN
         S_FILTRO := ' CONTRATOTRANSPORTE.FORCOD <= '+ S_CLICOD;
     END
     ELSE BEGIN
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.FORCOD <= '+ S_CLICOD ;
     END;
  END;

  IF  ( s_titulo_c <> '') and ( s_titulo <> '' ) THEN
      Caption_rel  := Caption_rel + ' ' + s_titulo + ' e ' + s_titulo_c
  else
      IF  s_titulo_c <> '' then
          Caption_rel  := Caption_rel + ' '  + s_titulo_c
      else
          Caption_rel  := Caption_rel + ' ' + s_titulo  ;

  IF  CBox_FormaPag.Text <> '' THEN BEGIN
    //  IF  S_FILTRO_EMB = '' THEN  BEGIN
          S_FILTRO_EMB := ' (( EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )  +' ) or ( ProdutoContratoT.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )+ ') )';
          S_FILTRO_EMB_NAVIO := ' ( EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )  +'  )' ;
    //  END
    //  ELSE BEGIN
    //      S_FILTRO_EMB := S_FILTRO_EMB + ' AND  (( EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )  +' ) or ( ProdutoContratoT.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )+ ') )'
    //      S_FILTRO_EMB_NAVIO := ' AND ( EXPORTADOTRANSITO.FORMPAGO = '+ AtribuiAspas ( CBox_FormaPag.Text )  +'  )'
    //  END
  END;

  IF S_FILTRO_EMB <> '' THEN BEGIN
     S_FILTRO_EMB := ' AND ' + S_FILTRO_EMB ;
     S_FILTRO_EMB_NAVIO := ' AND  ' + S_FILTRO_EMB_NAVIO ;
  END;


  IF ( S_FILTRO <>  '') OR (S_FILTRO_EMB <> '') THEN
     L_FILTRO := TRUE ;

  IF  S_FILTRO <> '' THEN  begin
      S_FILTRO_WHERE_contrato := ' WHERE ' + S_FILTRO + S_FILTRO_EMB  ;
      S_FILTRO_WHERE_contrato_pais := ' WHERE ' + S_FILTRO  ;
    //s_filtro_WHERE_navio    :=  ' and ' + S_FILTRO  + S_FILTRO_EMB_NAVIO ;
      s_filtro_WHERE_navio    :=  ' and ' + S_FILTRO  + S_FILTRO_EMB ;
  end;

  if Caption_rel <> '' then
     Caption_rel := 'Diversos ' + Caption_rel;

  DSituacao.Close ;
  DSituacao.AtualizaSql;
  DSituacao.Last;
  DSituacao.First ;

  IBQuery_Total_Prod.Close ;
  IBQuery_Total_Prod.SQL.Clear ;
  IBQuery_Total_Prod.SQL.Add( sql_total_alimentos + sql_corpo_i + s_corpo_novos1 + s_corpo_novos2+ sql_corpo_f + S_FILTRO_WHERE_contrato + sql_total_alimentos_order_int + sql_total_alimentos_grup ) ;
  IBQuery_Total_Prod.SQL.SaveToFile('_IBQuery_Total_Prod.SQL');
  IBQuery_Total_Prod.Prepare ;
  IBQuery_Total_Prod.Open ;
  
//  IBQuery_Total_Prod.Last;
//  IBQuery_Total_Prod.First ;

  IBQuery_Pais.Close ;
  IBQuery_Pais.SQL.Clear ;
  IBQuery_Pais.SQL.Add( sql_total_Pais +sql_corpo_i + s_corpo_novos1 + s_corpo_novos2+ sql_corpo_f +
                        S_FILTRO_WHERE_contrato_pais + sql_total_pais_order_int + sql_total_pais_grup) ;
  IBQuery_Pais.SQL.SaveToFile('_IBQuery_Pais.SQL');
  IBQuery_Pais.Prepare ;
  IBQuery_Pais.Open ;
//  IBQuery_Pais.Last;
//  IBQuery_Pais.First ;

  SQL_SITUACAO :=   sql_Camp_Situacao   +
                    sql_corpo_i           +
                    s_corpo_novos1 +
                    s_corpo_novos2+
                    sql_corpo_f           +
                    S_FILTRO_WHERE_contrato    +
                    sql_Situacao_ordem   ;

  QSituacao.Close ;
  QSituacao.SQL.Clear ;
  QSituacao.SQL.Add( SQL_SITUACAO ) ;
  QSituacao.SQL.SaveToFile('_QSituacao.SQL');
  QSituacao.Prepare ;
  QSituacao.Open ;
//  QSituacao.Last;
//  QSituacao.First ;

  SQL_SITUACAO := sql_navio_inicio + s_filtro_WHERE_navio  +
                  sql_navio_order ;

  IBQuery_navio.Close ;
  IBQuery_navio.SQL.Clear ;
  IBQuery_navio.SQL.Add( SQL_SITUACAO ) ;
  IBQuery_navio.SQL.SaveToFile('_IBQuery_navio.SQL');
  IBQuery_navio.Prepare ;
  IBQuery_navio.Open ;
//  IBQuery_navio.Last;
//  IBQuery_navio.First ;

  IBQuery_TOTAL_PRODUTO.CLOSE;
  IBQuery_TOTAL_PRODUTO.SQL.Clear ;
//01/05/2012
//IBQuery_TOTAL_PRODUTO.SQL.Add( sql_TOTAL_PRODUTO_P_I + s_corpo_novos1 + s_corpo_novos2 +sql_TOTAL_PRODUTO_P_F + S_FILTRO_WHERE_contrato_pais + sql_TOTAL_PRODUTO_S_I   + s_corpo_novos1 + s_corpo_novos2 + sql_TOTAL_PRODUTO_S_F + S_FILTRO_WHERE_contrato + S_FILTRO_EMB + sql_TOTAL_PRODUTO_O ) ;
  IBQuery_TOTAL_PRODUTO.SQL.Add( sql_TOTAL_PRODUTO_P_I + s_corpo_novos1 + s_corpo_novos2 +sql_TOTAL_PRODUTO_P_F + S_FILTRO_WHERE_contrato_pais + sql_TOTAL_PRODUTO_S_I   + s_corpo_novos1 + s_corpo_novos2 + sql_TOTAL_PRODUTO_S_F + S_FILTRO_WHERE_contrato +                sql_TOTAL_PRODUTO_O ) ;
  IBQuery_TOTAL_PRODUTO.SQL.SaveToFile('_IBQuery_TOTAL_PRODUTO.SQL');
  IBQuery_TOTAL_PRODUTO.Prepare ;
  IBQuery_TOTAL_PRODUTO.Open ;
//  IBQuery_TOTAL_PRODUTO.Last;
//  IBQuery_TOTAL_PRODUTO.First ;

  IBQuery_TOTAL_PAIS.close;
  IBQuery_TOTAL_PAIS.SQL.Clear ;
//01/05/2012
//IBQuery_TOTAL_PAIS.SQL.Add( sql_TOTAL_PAIS_P_I +s_corpo_novos1 + s_corpo_novos2 + sql_TOTAL_PAIS_P_F + S_FILTRO_WHERE_contrato + sql_TOTAL_PAIS_S_I +s_corpo_novos1 + s_corpo_novos2 + sql_TOTAL_PAIS_S_F + S_FILTRO_WHERE_contrato + S_FILTRO_EMB + sql_TOTAL_PAIS_O ) ;
//  IBQuery_TOTAL_PAIS.SQL.Add(    sql_TOTAL_PAIS_P_I    + s_corpo_novos1 + s_corpo_novos2 + sql_TOTAL_PAIS_P_F + S_FILTRO_WHERE_contrato_pais + sql_TOTAL_PAIS_S_I +s_corpo_novos1 + s_corpo_novos2 + sql_TOTAL_PAIS_S_F + S_FILTRO_WHERE_contrato + S_FILTRO_EMB + sql_TOTAL_PAIS_O ) ;
  IBQuery_TOTAL_PAIS.SQL.Add(    sql_TOTAL_PAIS_P_I    + s_corpo_novos1 + s_corpo_novos2 + sql_TOTAL_PAIS_P_F + S_FILTRO_WHERE_contrato_pais + sql_TOTAL_PAIS_S_I +s_corpo_novos1 + s_corpo_novos2 + sql_TOTAL_PAIS_S_F + S_FILTRO_WHERE_contrato +                  sql_TOTAL_PAIS_O ) ;
  IBQuery_TOTAL_PAIS.SQL.SaveToFile('_IBQuery_TOTAL_PAIS.SQL');
  IBQuery_TOTAL_PAIS.Prepare ;
  IBQuery_TOTAL_PAIS.Open ;
//  IBQuery_TOTAL_PAIS.Last;
//  IBQuery_TOTAL_PAIS.First ;

  ConstroiSql ;

  GroupBox_situacao.Caption := 'Dados Totais Núm. Linhas = ' + INTTOSTR(DSituacao.RecordCount)   ;
  GroupBox_total_grup.Caption := 'Somatorio de Produtos Núm. Linhas = ' + INTTOSTR(IBQuery_Total_Prod.RecordCount)   ;
  GroupBox_dados.Caption := 'Contratos Núm. Linhas = ' + INTTOSTR(QSituacao.RecordCount)   ;
  GroupBox_total_pais.Caption := 'Somatorio de Pais Núm. Linhas = ' + INTTOSTR(IBQuery_Pais.RecordCount)   ;
  GroupBox_navio.Caption := 'Navios Núm. Linhas = ' + INTTOSTR(IBQuery_navio.RecordCount)   ;

Finally
  Screen.Cursor := crDefault;
end;

end;

procedure TFormRelSitucaoCred.ValidaColunaGrid(Sender: TField);
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

function TFormRelSitucaoCred.AbandonandoEdicao: Boolean;
begin
  Result :=  (ActiveControl = PageControl1 );
end;

procedure TFormRelSitucaoCred.FormActivate(Sender: TObject);
begin
  {
    Inicializa Menu Consulta

  FormRelSitucaoCred.Consulta.Enabled         := True;
  FormRelSitucaoCred.Filtrar.OnClick          := mnu_FiltrarClick;
  FormRelSitucaoCred.Ordenar.OnClick          := mnu_OrdenarClick;
  FormRelSitucaoCred.OrdenarComposto.OnClick  := mnu_OrdenarCompostoClick;
  FormRelSitucaoCred.ApagarColuna.OnClick     := mnu_ApagarColunaClick;
  FormRelSitucaoCred.Quantificar.OnClick      := mnu_QuantificarClick;
  FormRelSitucaoCred.TotalizarColuna.OnClick  := mnu_TotalizarColunaClick;
  FormRelSitucaoCred.CalcularMedia.OnClick    := mnu_CalcularMediaClick;
  FormRelSitucaoCred.Imprimir.OnClick         := mnu_ImprimirClick;
  FormRelSitucaoCred.SalvarConsulta.OnClick   := mnu_SalvarConsultaClick;
  FormRelSitucaoCred.ExcluirConsulta.OnClick  := mnu_ExcluirConsultaClick;
   }
end;

procedure TFormRelSitucaoCred.mnu_FiltrarClick(Sender: TObject);
begin
  Ed_Filtrar(TabelaPrincipal, FormRelSitucaoCred, GridConsulta);
 // StatusTabela;
end;

procedure TFormRelSitucaoCred.mnu_OrdenarClick(Sender: TObject);
begin
  Ed_Ordenar(TabelaPrincipal, FormRelSitucaoCred, GridConsulta);
//  StatusTabela;
end;

procedure TFormRelSitucaoCred.mnu_OrdenarCompostoClick(Sender: TObject);
begin
  Ed_OrdenarComposto(TabelaPrincipal, FormRelSitucaoCred, GridConsulta);
//  StatusTabela;
end;

procedure TFormRelSitucaoCred.mnu_ApagarColunaClick(Sender: TObject);
begin
  Ed_ApagarColuna(TabelaPrincipal, FormRelSitucaoCred, GridConsulta);
end;

procedure TFormRelSitucaoCred.mnu_QuantificarClick(Sender: TObject);
begin
  Ed_Quantificar(TabelaPrincipal, FormRelSitucaoCred, GridConsulta);
end;

procedure TFormRelSitucaoCred.mnu_TotalizarColunaClick(Sender: TObject);
begin
  Ed_TotalizarColuna(TabelaPrincipal, FormRelSitucaoCred, GridConsulta);
end;

procedure TFormRelSitucaoCred.mnu_CalcularMediaClick(Sender: TObject);
begin
  Ed_CalcularMedia(TabelaPrincipal, FormRelSitucaoCred, GridConsulta);
end;

procedure TFormRelSitucaoCred.mnu_ImprimirClick(Sender: TObject);
begin
  Ed_Imprimir(TabelaPrincipal, FormRelSitucaoCred, GridConsulta, DS_situacao);
end;

procedure TFormRelSitucaoCred.mnu_SalvarConsultaClick(Sender: TObject);
begin
  Ed_SalvarConsulta(TabelaPrincipal, FormRelSitucaoCred, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormRelSitucaoCred.mnu_ExcluirConsultaClick(Sender: TObject);
begin
  Ed_ExcluirConsulta(TabelaPrincipal, FormRelSitucaoCred, GridConsulta, AbaConsulta, ConsultasSalvas);
end;








end.
