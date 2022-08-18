{
   Programa.: XMaker CMS Modelo.PAS
   Copyright: CMX
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
   08/06/2011 relatorio concluido
}
unit Informe;

interface

{$I Princ.inc}




uses
  DB, IBCustomDataSet, IBQuery, Dialogs, Menus, Buttons, ExtCtrls, DBCtrls,
  Grids, DBGrids, XDBDate, XDBNum, XLookUp, Mask, XDBEdit, Forms, Tabs,
  ComCtrls, Classes, XDate, Controls, StdCtrls ,
  Windows, Messages, SysUtils,  Graphics, BaseD,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Atributo,  Clipbrd, Tabela, IniFiles, Printers, Calculos,
  {$I LTab.pas}
  JPeg,      XEdit, XBanner,  XNum, RxMemDS, IBDatabase, DBClient, FR_Class,
  FR_DSet, FR_DBSet, FR_Desgn, UCMS_CONST;


CONST
      NOVA_LINHA = CHR(13)+CHR(10) ;
      SC_PRODUTOS_princ =
       ' Select  distinct ' +                             NOVA_LINHA +
       ' Informe.Contrato AS Contrato, ' +                NOVA_LINHA +
       ' Informe.CADASTRO as CADASTRO ,' +                NOVA_LINHA +
       ' Informe.NomeMix AS NomeMix,   ' +                NOVA_LINHA +
       ' Fornecedores.RAZAO AS RAZAO,  ' +                NOVA_LINHA +
       ' TAB_PAIS.NOME AS NOME,        ' +                NOVA_LINHA +
       ' Informe.C_C AS C_C,           ' +                NOVA_LINHA +
       ' PRODUTOCONTRATOT.FormPago AS FormPago, ' +       NOVA_LINHA +
       ' Informe.QUANTIDADETOTAL AS QUANTIDADETOTAL_OLD,' +   NOVA_LINHA +
       ' PRODUTOCONTRATOT.QUANTIDADE AS QUANTIDADETOTAL,' +   NOVA_LINHA +
       ' Informe.SDataEmbarque AS SDataEmbarque,    ' +   NOVA_LINHA +
       ' Informe.CLICOD AS CLICOD,                  ' +   NOVA_LINHA +
       ' PRODUTOCONTRATOT.PrecoFOB AS PrecoFOB,     ' +   NOVA_LINHA +
       ' Informe.PRECOFOBTOTAL AS PRECOFOBTOTAL,    ' +   NOVA_LINHA +
       ' PRODUTOCONTRATOT.PrecoSCC AS PrecoSCC,     ' +   NOVA_LINHA +
       ' Informe.VALORSCCTOTAL AS VALORSCCTOTAL_OLD,    ' +   NOVA_LINHA +
       ' PRODUTOCONTRATOT.VALORSCC AS VALORSCCTOTAL,         ' +   NOVA_LINHA +
       ' Informe.FORCOD AS FORCOD,                  ' +   NOVA_LINHA +
       ' DIVISOES.NOME AS NOMEDIV,                  ' +   NOVA_LINHA +
       ' Informe.ID AS ID                           ' +   NOVA_LINHA +
       ' from ( select distinct                     ' +   NOVA_LINHA +
       '      ContratoTransporte.Contrato AS Contrato,' + NOVA_LINHA +
       '      ContratoTransporte.NomeMix AS NomeMix,  ' + NOVA_LINHA +
       '      ContratoTransporte.C_C AS C_C,          ' + NOVA_LINHA +
       '      ContratoTransporte.QUANTIDADETOTAL AS QUANTIDADETOTAL,' +  NOVA_LINHA +
       '      ContratoTransporte.SDataEmbarque AS SDataEmbarque,' +  NOVA_LINHA +
       '      ContratoTransporte.PRECOFOBTOTAL AS PRECOFOBTOTAL,' +  NOVA_LINHA +
       '      ContratoTransporte.VALORSCCTOTAL AS VALORSCCTOTAL,' +  NOVA_LINHA +
       '      ContratoTransporte.FORCOD AS FORCOD,              ' +  NOVA_LINHA +
       '      ContratoTransporte.CLICOD AS CLICOD,              ' +  NOVA_LINHA +
       '      CONTRATOTRANSPORTE.CADASTRO as CADASTRO ,         ' +  NOVA_LINHA +
       '      CONTRATOTRANSPORTE.SEQ as SEQ ,                   ' +  NOVA_LINHA +
       '      ContratoTransporte.ID AS ID                       ' +  NOVA_LINHA +
       '      from  ContratoTransporte                          ' +  NOVA_LINHA +
       '    ) as  Informe                                       ' +  NOVA_LINHA +
       ' Left Outer Join DIVISOES on                            ' +  NOVA_LINHA +
       ' Informe.CLICOD = DIVISOES.CLICOD AND Informe.SEQ = DIVISOES.SEQ ' +  NOVA_LINHA +
       ' Left Outer Join TAB_PAIS on                            ' +  NOVA_LINHA +
       ' Informe.ID = TAB_PAIS.ID                               ' +  NOVA_LINHA +
       ' Left Outer Join Fornecedores on                        ' +  NOVA_LINHA +
       ' Informe.FORCOD = Fornecedores.FORCOD                   ' +  NOVA_LINHA +
       ' Left Outer Join ExportadoTransito on                   ' +  NOVA_LINHA +
       ' Informe.Contrato = ExportadoTransito.Contrato          ' +  NOVA_LINHA +
       ' Left Outer Join PRODUTOCONTRATOT on                    ' +  NOVA_LINHA +
       ' Informe.Contrato = PRODUTOCONTRATOT.Contrato           ' ;

      SC_PRODUTOS_where = ' WHERE ( Informe.Contrato IS NOT  NULL ) ';
      SC_PRODUTOS_order = ' Order By TAB_PAIS.NOME, Informe.Contrato'              ;

      SC_Boocking_princ =
       'Select  distinct                     ' +                     NOVA_LINHA +
       '  Boocking.SEQ AS SEQ,               ' +                     NOVA_LINHA +
       '  Boocking.Contrato AS Contrato,     ' +                     NOVA_LINHA +
       '  Boocking.Navio AS NAVIO_BOOCK,     ' +                     NOVA_LINHA +
       '  Boocking.Quantidade AS Quantidade ,' +                     NOVA_LINHA +
       '  Informe.CLICOD AS CLICOD,          ' +                     NOVA_LINHA +
       '  Informe.CADASTRO as CADASTRO       ' +                     NOVA_LINHA +
       'from ( select distinct               ' +                     NOVA_LINHA +
       '       ContratoTransporte.Contrato AS Contrato, ' +          NOVA_LINHA +
       '       ContratoTransporte.NomeMix AS NomeMix,   ' +          NOVA_LINHA +
       '       CONTRATOTRANSPORTE.CADASTRO as CADASTRO ,' +          NOVA_LINHA +
       '       ContratoTransporte.C_C AS C_C,           ' +          NOVA_LINHA +
       '       ContratoTransporte.QUANTIDADETOTAL AS QUANTIDADETOTAL,' +  NOVA_LINHA +
       '       ContratoTransporte.SDataEmbarque AS SDataEmbarque,    ' +  NOVA_LINHA +
       '       ContratoTransporte.PRECOFOBTOTAL AS PRECOFOBTOTAL,    ' +  NOVA_LINHA +
       '       ContratoTransporte.VALORSCCTOTAL AS VALORSCCTOTAL,    ' +  NOVA_LINHA +
       '       ContratoTransporte.FORCOD AS FORCOD,  ' +                  NOVA_LINHA +
       '       ContratoTransporte.CLICOD AS CLICOD,  ' +                  NOVA_LINHA +
       '       CONTRATOTRANSPORTE.SEQ as SEQ ,       ' +                  NOVA_LINHA +
       '       ContratoTransporte.ID AS ID           ' +                  NOVA_LINHA +
       '       from  ContratoTransporte              ' +                  NOVA_LINHA +
       '     ) as  Informe                           ' +                  NOVA_LINHA +
       ' Left Outer Join DIVISOES on                 ' +                  NOVA_LINHA +
       ' Informe.CLICOD = DIVISOES.CLICOD  AND Informe.SEQ = DIVISOES.SEQ                           ' +  NOVA_LINHA +
       'Left Outer Join TAB_PAIS on                      ' +  NOVA_LINHA +
       '  Informe.ID = TAB_PAIS.ID                       ' +  NOVA_LINHA +
       'Left Outer Join Fornecedores on                  ' +  NOVA_LINHA +
       '  Informe.FORCOD = Fornecedores.FORCOD           ' +  NOVA_LINHA +
       ' Left Outer Join ExportadoTransito on            ' +  NOVA_LINHA +
       '   Informe.Contrato = ExportadoTransito.Contrato ' +  NOVA_LINHA +
// 24/10/2012
//       'Left Outer Join Boocking on                      ' +  NOVA_LINHA +
//       '  Informe.Contrato = Boocking.Contrato           ' ;
       'Left Outer Join Boocking on                      ' +  NOVA_LINHA +
       '  Informe.Contrato = Boocking.Contrato           ' +  NOVA_LINHA +
       ' Left Outer Join PRODUTOCONTRATOT on             ' +  NOVA_LINHA +
       ' Informe.Contrato = PRODUTOCONTRATOT.Contrato    ' ;

        SC_Boocking_where = ' WHERE ( Boocking.Contrato IS NOT  NULL )  ' ;
        SC_Boocking_order = ' Order By TAB_PAIS.NOME ,Informe.Contrato , Boocking.DATAPREVISTA ' ;

        SC_ExportadoTransito_princ =
       'Select  distinct                                    ' +             NOVA_LINHA +
       '   ExportadoTransito.Contrato AS Contrato,          ' +             NOVA_LINHA +
       '   ExportadoTransito.Navio AS Navio,                ' +             NOVA_LINHA +
       '   ExportadoTransito.QuantidadeExp AS QuantidadeExp,' +             NOVA_LINHA +
       '   ExportadoTransito.Valor AS Valor,                ' +             NOVA_LINHA +
       '   ExportadoTransito.DataEmbarque AS DataEmbarque,  ' +             NOVA_LINHA +
       '   ExportadoTransito.Fatura AS Fatura,              ' +             NOVA_LINHA +
       '   ExportadoTransito.ETADestino AS ETADestino,      ' +             NOVA_LINHA +
       '   ExportadoTransito.OBS AS OBS ,                   ' +             NOVA_LINHA +
       '   Informe.CLICOD AS CLICOD,                        ' +             NOVA_LINHA +
       '   Informe.CADASTRO as CADASTRO                     ' +             NOVA_LINHA +
       ' from ( select distinct                             ' +             NOVA_LINHA +
       '        ContratoTransporte.Contrato AS Contrato,    ' +             NOVA_LINHA +
       '        ContratoTransporte.NomeMix AS NomeMix,      ' +             NOVA_LINHA +
       '        ContratoTransporte.C_C AS C_C,              ' +             NOVA_LINHA +
       '        ContratoTransporte.QUANTIDADETOTAL AS QUANTIDADETOTAL,' +   NOVA_LINHA +
       '        ContratoTransporte.SDataEmbarque AS SDataEmbarque,    ' +   NOVA_LINHA +
       '        ContratoTransporte.PRECOFOBTOTAL AS PRECOFOBTOTAL,    ' +   NOVA_LINHA +
       '        ContratoTransporte.VALORSCCTOTAL AS VALORSCCTOTAL,    ' +   NOVA_LINHA +
       '        ContratoTransporte.FORCOD AS FORCOD,     ' +                NOVA_LINHA +
       '        ContratoTransporte.CLICOD AS CLICOD,     ' +                NOVA_LINHA +
       '        CONTRATOTRANSPORTE.CADASTRO as CADASTRO ,' +                NOVA_LINHA +
       '        CONTRATOTRANSPORTE.SEQ as SEQ ,          ' +                NOVA_LINHA +
       '        ContratoTransporte.ID AS ID              ' +                NOVA_LINHA +
       '        from  ContratoTransporte                 ' +                NOVA_LINHA +
       '      ) as  Informe                              ' +                NOVA_LINHA +
       ' Left Outer Join DIVISOES on                     ' +                NOVA_LINHA +
       '   Informe.CLICOD = DIVISOES.CLICOD AND Informe.SEQ = DIVISOES.SEQ                           ' +  NOVA_LINHA +
       ' Left Outer Join TAB_PAIS on                    ' +                 NOVA_LINHA +
       '   Informe.ID = TAB_PAIS.ID                     ' +                 NOVA_LINHA +
       ' Left Outer Join Fornecedores on                ' +                 NOVA_LINHA +
       '   Informe.FORCOD = Fornecedores.FORCOD         ' +                 NOVA_LINHA +
       ' Left Outer Join ExportadoTransito on           ' +                 NOVA_LINHA +
       '   Informe.Contrato = ExportadoTransito.Contrato' +                 NOVA_LINHA + // inicio de 24/10/2012
       ' Left Outer Join PRODUTOCONTRATOT on                    ' +  NOVA_LINHA +
       ' Informe.Contrato = PRODUTOCONTRATOT.Contrato           ' ;          // fim de 24/10/2012

       SC_ExportadoTransito_WHERE = ' WHERE ( ExportadoTransito.Contrato IS NOT  NULL )' ;

       SC_ExportadoTransito_order = ' Order By  TAB_PAIS.NOME , ExportadoTransito.Contrato,ExportadoTransito.DataEmbarque  ';

       SC_Contrato_princ_i =
       'Select  distinct                            '+                  NOVA_LINHA +
       ' Informe.Contrato AS Contrato,              '+                  NOVA_LINHA +
       ' Informe.NomeMix AS NomeMix,                '+                  NOVA_LINHA +
       ' Fornecedores.RAZAO AS RAZAO,               '+                  NOVA_LINHA +
       ' TAB_PAIS.NOME AS NOME,                     '+                  NOVA_LINHA +
       ' Informe.C_C AS C_C,                        '+                  NOVA_LINHA +
       // correcao de erro 05/01/2012
       {'  PRODUTOCONTRATOT.FormPago AS FormPago_OLD,    '+                  NOVA_LINHA +   }
       ' iif( (select  count(PRODUTOCONTRATOT.FormPago)  as FormPago from PRODUTOCONTRATOT WHERE Informe.Contrato = PRODUTOCONTRATOT.Contrato )> 1 , '' '',  PRODUTOCONTRATOT.FormPago )   AS FormPago ,  '+                  NOVA_LINHA ;
       SC_Contrato_VALORSCCTOTAL =
       ' Informe.VALORSCCTOTAL AS VALORSCCTOTAL,                     '+ NOVA_LINHA ;

       SC_Contrato_QUANTIDADETOTAL =
       ' Informe.QUANTIDADETOTAL AS QUANTIDADETOTAL,'+                  NOVA_LINHA ;
       SC_Contrato_QUANTIDADETOTAL_CONTINUA =
       ' Informe.SDataEmbarque AS SDataEmbarque,    '+                  NOVA_LINHA +
       // correcao 08/01/2012
       {' PRODUTOCONTRATOT.PrecoFOB AS PrecoFOB,     '+                  NOVA_LINHA +   }
       ' (select  MAX(PRODUTOCONTRATOT.PrecoFOB)  as PrecoFOB from PRODUTOCONTRATOT WHERE Informe.Contrato = PRODUTOCONTRATOT.Contrato ) as PrecoFOB , '+ NOVA_LINHA +
       ' Informe.PRECOFOBTOTAL AS PRECOFOBTOTAL,    '+                  NOVA_LINHA ;
//       ' Informe.QUANTTOTALEXP AS QUANTTOTALEXP2,    '+                  NOVA_LINHA +
//       ' Informe.ValorTotalExp AS ValorTotalExp2,    '+                  NOVA_LINHA ;
       SC_Contrato_princ_q_i =  // quantidade
       '(select  distinct sum(ExportadoTransito.QuantidadeExp) from ExportadoTransito  WHERE ExportadoTransito.Contrato = Informe.Contrato and ( ExportadoTransito.Contrato IS NOT  NULL )';
       SC_Contrato_princ_q_f =  // quantidade
       ' ) as QUANTTOTALEXP ,' +                  NOVA_LINHA ;
       SC_Contrato_princ_v_i =  // valor
       '(select  distinct sum(ExportadoTransito.valor) from ExportadoTransito  WHERE ExportadoTransito.Contrato = Informe.Contrato and ( ExportadoTransito.Contrato IS NOT  NULL )' ;
       SC_Contrato_princ_v_f =
        '  ) as ValorTotalExp ,'  +                  NOVA_LINHA ;

       SC_Contrato_princ_v_f2 =   // CRIADO PARA 
        '  ) as ValorTotalExp '  +                  NOVA_LINHA ;
       SC_Contrato_princ_f =
       ' (( SELECT SUM ( Boocking.QUANTIDADE) AS QUANTIDADE FROM Boocking WHERE Informe.Contrato = Boocking.Contrato )) AS QUANTIDADE, '+ NOVA_LINHA +
       // correcao de erro 05/01/2012
       {' PRODUTOCONTRATOT.PrecoSCC AS PrecoSCC_OLD,                      '+ NOVA_LINHA + }
       ' (select  sum(PRODUTOCONTRATOT.PrecoSCC)  as PrecoSCC from PRODUTOCONTRATOT WHERE Informe.Contrato = PRODUTOCONTRATOT.Contrato ) as PrecoSCC_OLD ,'+ NOVA_LINHA +
       ' (select  MAX(PRODUTOCONTRATOT.PrecoSCC)  as PrecoSCC from PRODUTOCONTRATOT WHERE Informe.Contrato = PRODUTOCONTRATOT.Contrato ) as PrecoSCC ,'+ NOVA_LINHA +
       ' Informe.CLICOD AS CLICOD,                                   '+ NOVA_LINHA +
 {      '/* Boocking.Navio AS NAVIO_BOOCK,                       */     '+ NOVA_LINHA +
       '/* Boocking.Quantidade AS Quantidade,                 */     '+ NOVA_LINHA +
       '/* ExportadoTransito.Navio AS Navio,                   */     '+ NOVA_LINHA +
       '/* ExportadoTransito.QuantidadeExp AS QuantidadeExp,	  */     '+ NOVA_LINHA +
       '/* ExportadoTransito.Valor AS Valor,                   */     '+ NOVA_LINHA +
       '/* ExportadoTransito.DataEmbarque AS DataEmbarque,     */     '+ NOVA_LINHA +
       '/* ExportadoTransito.Fatura AS Fatura,                 */     '+ NOVA_LINHA +
       '/* ExportadoTransito.ETADestino AS ETADestino,         */     '+ NOVA_LINHA +
       '/* ExportadoTransito.OBS AS OBS,                       */     '+ NOVA_LINHA + }
       ' Informe.CADASTRO as CADASTRO ,                              '+ NOVA_LINHA +
       ' Informe.FORCOD AS FORCOD,                                   '+ NOVA_LINHA +
       ' Informe.StatusCT AS StatusCT,                                   '+ NOVA_LINHA +
       ' DIVISOES.NOME AS NOMEDIV,                                   '+ NOVA_LINHA +
       ' Informe.ID AS ID                                            '+ NOVA_LINHA +
       'from ( select distinct                                       '+ NOVA_LINHA +
       '       ContratoTransporte.Contrato AS Contrato,              '+ NOVA_LINHA +
       '       ContratoTransporte.NomeMix AS NomeMix,                '+ NOVA_LINHA +
       '       ContratoTransporte.C_C AS C_C,                        '+ NOVA_LINHA +
       '       ContratoTransporte.QUANTIDADETOTAL AS QUANTIDADETOTAL,'+ NOVA_LINHA +
       '       ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,    '+ NOVA_LINHA +
       '       ContratoTransporte.ValorTotalExp AS ValorTotalExp,    '+ NOVA_LINHA +
       '       ContratoTransporte.SDataEmbarque AS SDataEmbarque,    '+ NOVA_LINHA +
       '       ContratoTransporte.PRECOFOBTOTAL AS PRECOFOBTOTAL,    '+ NOVA_LINHA +
       '       ContratoTransporte.CLICOD AS CLICOD,                  '+ NOVA_LINHA +
       '       ContratoTransporte.VALORSCCTOTAL AS VALORSCCTOTAL,    '+ NOVA_LINHA +
       '       CONTRATOTRANSPORTE.CADASTRO as CADASTRO ,' +             NOVA_LINHA +
       '       CONTRATOTRANSPORTE.SEQ as SEQ , ' +                      NOVA_LINHA +
       '       ContratoTransporte.FORCOD AS FORCOD,'+      NOVA_LINHA +
       '       ContratoTransporte.StatusCT AS StatusCT,'+      NOVA_LINHA +
       '       ContratoTransporte.ID AS ID         '+      NOVA_LINHA +
       '       from  ContratoTransporte            '+      NOVA_LINHA +
       '     ) as  Informe                         '+      NOVA_LINHA +
       ' Left Outer Join DIVISOES on               '+      NOVA_LINHA +
       '  Informe.CLICOD = DIVISOES.CLICOD  AND Informe.SEQ = DIVISOES.SEQ '+ NOVA_LINHA +
       'Left Outer Join TAB_PAIS on            '+          NOVA_LINHA +
       '  Informe.ID = TAB_PAIS.ID             '+          NOVA_LINHA +
       'Left Outer Join Fornecedores on        '+          NOVA_LINHA +
       '  Informe.FORCOD = Fornecedores.FORCOD '+          NOVA_LINHA +
       'Left Outer Join ExportadoTransito on   '+          NOVA_LINHA +
       '  Informe.Contrato = ExportadoTransito.Contrato '+ NOVA_LINHA +
       'Left Outer Join Boocking on            '+          NOVA_LINHA +
       '  Informe.Contrato = Boocking.Contrato '+          NOVA_LINHA +
       'Left Outer Join PRODUTOCONTRATOT on    '+          NOVA_LINHA +
       'Informe.Contrato = PRODUTOCONTRATOT.Contrato    ';

SC_Contrato_WHERE = ' WHERE ( Informe.Contrato IS NOT  NULL )' ;
SC_Contrato_order = ' Order By TAB_PAIS.NOME, Informe.Contrato ' ;

SC_Total_Pais_Inicio =
      ' SELECT'+ NOVA_LINHA +
      '   TOTAL_PAIS.NOME,'+ NOVA_LINHA +
      '   IIF ( SUM( TOTAL_PAIS.QUANTIDADETOTAL) IS NULL,0, SUM( TOTAL_PAIS.QUANTIDADETOTAL) )  AS  QUANTIDADETOTAL,'+ NOVA_LINHA +
      '   IIF ( SUM( TOTAL_PAIS.VALORSCCTOTAL)   IS NULL,0, SUM( TOTAL_PAIS.VALORSCCTOTAL)   ) AS VALORSCCTOTAL,'+ NOVA_LINHA +
      '   IIF ( SUM( TOTAL_PAIS.QUANTIDADEBOOCK) IS NULL,0, SUM( TOTAL_PAIS.QUANTIDADEBOOCK) ) AS QUANTIDADEBOOCK,'+ NOVA_LINHA +
      '   IIF ( SUM( TOTAL_PAIS.QUANTTOTALEXP)   IS NULL,0, SUM( TOTAL_PAIS.QUANTTOTALEXP)   ) AS QUANTTOTALEXP,'+ NOVA_LINHA +
      '   IIF ( SUM( TOTAL_PAIS.ValorTotalExp)   IS NULL,0, SUM( TOTAL_PAIS.ValorTotalExp)   ) AS ValorTotalExp'+ NOVA_LINHA +
      ' FROM ('+ NOVA_LINHA +
      '   Select  distinct'+ NOVA_LINHA +
      '          TAB_PAIS.NOME AS NOME,'+ NOVA_LINHA +
      '          Informe.Contrato as Contrato ,'+ NOVA_LINHA +
      '          (( SELECT SUM ( Boocking.QUANTIDADE) AS QUANTIDADE FROM  Boocking WHERE Informe.Contrato = Boocking.Contrato )) AS QUANTIDADEBOOCK,'+ NOVA_LINHA ;
SC_Total_Pais_CAOMPOS =
      '          (Informe.QUANTIDADETOTAL) AS QUANTIDADETOTAL ,'+ NOVA_LINHA +
      '          (Informe.VALORSCCTOTAL) AS VALORSCCTOTAL,'+ NOVA_LINHA +
      '          (Informe.QUANTTOTALEXP) AS QUANTTOTALEXP,'+ NOVA_LINHA +
      '          (Informe.ValorTotalExp) AS ValorTotalExp'+ NOVA_LINHA ;
SC_Total_Pais_Inicio2 =
      '        from ( select distinct '+ NOVA_LINHA +
      '               ContratoTransporte.Contrato AS Contrato,'+ NOVA_LINHA +
      '               ContratoTransporte.NomeMix AS NomeMix,'+ NOVA_LINHA +
      '               ContratoTransporte.C_C AS C_C,'+ NOVA_LINHA +
      '               ContratoTransporte.QUANTIDADETOTAL AS QUANTIDADETOTAL,'+ NOVA_LINHA +
      '               ContratoTransporte.SDataEmbarque AS SDataEmbarque,'+ NOVA_LINHA +
      '               ContratoTransporte.PRECOFOBTOTAL AS PRECOFOBTOTAL,'+ NOVA_LINHA +
      '               ContratoTransporte.VALORSCCTOTAL AS VALORSCCTOTAL,'+ NOVA_LINHA +
      '               ContratoTransporte.QUANTTOTALEXP AS QUANTTOTALEXP,'+ NOVA_LINHA +
      '               CONTRATOTRANSPORTE.CADASTRO as CADASTRO , ' +  NOVA_LINHA +      
      '               ContratoTransporte.ValorTotalExp AS ValorTotalExp,'+ NOVA_LINHA +
      '               ContratoTransporte.FORCOD AS FORCOD,'+ NOVA_LINHA +
      '               ContratoTransporte.CLICOD as CLICOD,'+ NOVA_LINHA +
      '               CONTRATOTRANSPORTE.SEQ as SEQ , ' +    NOVA_LINHA +
      '               ContratoTransporte.ID AS ID'+ NOVA_LINHA +
      '               from  ContratoTransporte'+ NOVA_LINHA +
      '             ) as  Informe'+ NOVA_LINHA +
      '        Left Outer Join DIVISOES on'+ NOVA_LINHA +
      '          Informe.CLICOD = DIVISOES.CLICOD  AND Informe.SEQ = DIVISOES.SEQ '+ NOVA_LINHA +
      '        Left Outer Join TAB_PAIS on'+ NOVA_LINHA +
      '          Informe.ID = TAB_PAIS.ID'+ NOVA_LINHA +
      '        Left Outer Join Fornecedores on'+ NOVA_LINHA +
      '          Informe.FORCOD = Fornecedores.FORCOD'+ NOVA_LINHA +
      '        Left Outer Join EXPORTADOTRANSITO on'+ NOVA_LINHA +
      '          Informe.Contrato = EXPORTADOTRANSITO.Contrato'+ NOVA_LINHA +
//      '        Left Outer Join Boocking on'+ NOVA_LINHA +
//      '          Informe.Contrato = Boocking.Contrato'+ NOVA_LINHA +
      '        Left Outer Join PRODUTOCONTRATOT on'+ NOVA_LINHA +
      '        Informe.Contrato = PRODUTOCONTRATOT.Contrato'+ NOVA_LINHA ;

SC_Total_Pais_where =
      '       WHERE ( Informe.Contrato IS NOT  NULL )'+ NOVA_LINHA ;

SC_Total_Pais_Final =
      '       Order By TAB_PAIS.NOME'+ NOVA_LINHA +
      '     ) AS TOTAL_PAIS'+ NOVA_LINHA +
      '     GROUP BY   TOTAL_PAIS.NOME'+ NOVA_LINHA +
      '     ORDER BY   TOTAL_PAIS.NOME'+ NOVA_LINHA ;

//      SC_PRODUTOS_where = ' WHERE ( Informe.Contrato IS NOT  NULL ) ';
//      SC_PRODUTOS_order = ' Order By TAB_PAIS.NOME, Informe.Contrato'              ;

// SC_Total_Pais_Inicio + SC_Total_Pais_where + SC_Total_Pais_Final

SC_CERBO_INICI =
  'Select  DISTINCT ' + NOVA_LINHA +
  '  CERBO.Contrato AS Contrato,' + NOVA_LINHA +
  '  Fornecedores.RAZAO AS RAZAO,' + NOVA_LINHA +
  '  ContratoTransporte.NomeMix AS NomeMix,   ' +  NOVA_LINHA +
  // '  CERBO.Navio AS Navio,' + NOVA_LINHA +
  // '  CERBO.DataEmbarque AS DataEmbarque,' + NOVA_LINHA +
  // '  CERBO.QuantidadeExp AS QuantidadeExp,' + NOVA_LINHA +
  '  ContratoTransporte.QUANTTOTALEXP as QuantidadeExp   ,' + NOVA_LINHA +
  '  ContratoTransporte.QuantidadeTotal AS QuantidadeTotal,' + NOVA_LINHA +
  //'  CERBO.Fatura AS Fatura,' + NOVA_LINHA +
  //'  ContratoTransporte.Comissao AS Comissao,' + NOVA_LINHA +
  '  ContratoTransporte.FormComissao AS FormComissao,' + NOVA_LINHA +
  //'  CERBO.ComisaoSFatura AS ComisaoSFatura,' + NOVA_LINHA +
  '  ContratoTransporte.VALORTOTALCOMISSAO as ComisaoSFatura  ,' + NOVA_LINHA +
  '  ContratoTransporte.ValorTotalComissaoExecutado AS ValorTotalComissaoExecutado ,' + NOVA_LINHA +
  // '  CERBO.NumNFEmit AS NumNFEmit,' + NOVA_LINHA +
  // '  CERBO.NumOrdCobranca AS NumOrdCobranca,' + NOVA_LINHA +
  '  Clientes.RAZAO AS RAZAO_CLIENTE,' + NOVA_LINHA +
  '  Clientes.CLICOD AS CLICOD ' + NOVA_LINHA +
  // '  CERBO.Status AS Status' + NOVA_LINHA +
  'from ( select' + NOVA_LINHA +
  '       ExportadoTransito.Contrato AS Contrato,' + NOVA_LINHA +
  '       ExportadoTransito.Navio AS Navio,' + NOVA_LINHA +
  '       ExportadoTransito.DataEmbarque AS DataEmbarque,' + NOVA_LINHA +
  '       ExportadoTransito.QuantidadeExp AS QuantidadeExp,' + NOVA_LINHA +
  '       ExportadoTransito.Fatura AS Fatura,' + NOVA_LINHA +
  '       ExportadoTransito.ComisaoSFatura AS ComisaoSFatura,' + NOVA_LINHA +
  '       ExportadoTransito.NumNFEmit AS NumNFEmit,' + NOVA_LINHA +
  '       ExportadoTransito.NumOrdCobranca AS NumOrdCobranca,' + NOVA_LINHA +
  '       ExportadoTransito.Status AS Status' + NOVA_LINHA +
  '       from  ExportadoTransito' + NOVA_LINHA +
  '     ) as  CERBO' + NOVA_LINHA +
  'Left Outer Join ContratoTransporte on' + NOVA_LINHA +
  '  CERBO.Contrato = ContratoTransporte.Contrato' + NOVA_LINHA +
  'Left Outer Join Fornecedores on' + NOVA_LINHA +
  '  ContratoTransporte.FORCOD = Fornecedores.FORCOD' + NOVA_LINHA +
  'Left Outer Join Clientes on' + NOVA_LINHA +
  '  ContratoTransporte.CLICOD = Clientes.CLICOD' + NOVA_LINHA +
  'Left Outer Join Divisoes on' + NOVA_LINHA +
// CORRECAO 25/04/2012 FALTAVA ESTE CRITERIO =>  AND ContratoTransporte.SEQ = DIVISOES.SEQ
//'  ContratoTransporte.CLICOD = Divisoes.CLICOD' + NOVA_LINHA ;
// 24/10/2012
//'  ContratoTransporte.CLICOD = Divisoes.CLICOD AND ContratoTransporte.SEQ = DIVISOES.SEQ ' + NOVA_LINHA ;
  '  ContratoTransporte.CLICOD = Divisoes.CLICOD AND ContratoTransporte.SEQ = DIVISOES.SEQ ' + NOVA_LINHA +
  ' Left Outer Join PRODUTOCONTRATOT on                    ' +  NOVA_LINHA +
  ' ContratoTransporte.Contrato = PRODUTOCONTRATOT.Contrato           ' ;


  SC_CERBO_DET_INICI =
  'Select  DISTINCT ' + NOVA_LINHA +
  '  CERBO.seq AS seq,' + NOVA_LINHA +
  '  CERBO.Contrato AS Contrato,' + NOVA_LINHA +
  '  Fornecedores.RAZAO AS RAZAO,' + NOVA_LINHA +
  '  CERBO.Navio AS Navio,' + NOVA_LINHA +
  '  CERBO.DataEmbarque AS DataEmbarque,' + NOVA_LINHA +
  '  CERBO.QuantidadeExp AS QuantidadeExp,' + NOVA_LINHA +
  '  CERBO.Fatura AS Fatura,' + NOVA_LINHA +
  '  ContratoTransporte.Comissao AS Comissao,' + NOVA_LINHA +
  '  ContratoTransporte.FormComissao AS FormComissao,' + NOVA_LINHA +
  '  CERBO.ComisaoSFatura AS ComisaoSFatura,' + NOVA_LINHA +
  '  CERBO.NumNFEmit AS NumNFEmit,' + NOVA_LINHA +
  '  CERBO.NumOrdCobranca AS NumOrdCobranca,' + NOVA_LINHA +
  '  Clientes.RAZAO AS RAZAO_CLIENTE,' + NOVA_LINHA +
  '  Clientes.CLICOD AS CLICOD ,' + NOVA_LINHA +
//'  CERBO.Status AS Status' + NOVA_LINHA +
   S_CONSTANTE_STATUS + NOVA_LINHA +
  'from ( select' + NOVA_LINHA +
  '       ExportadoTransito.seq AS seq,' + NOVA_LINHA +
  '       ExportadoTransito.Contrato AS Contrato,' + NOVA_LINHA +
  '       ExportadoTransito.Navio AS Navio,' + NOVA_LINHA +
  '       ExportadoTransito.DataEmbarque AS DataEmbarque,' + NOVA_LINHA +
  '       ExportadoTransito.QuantidadeExp AS QuantidadeExp,' + NOVA_LINHA +
  '       ExportadoTransito.Fatura AS Fatura,' + NOVA_LINHA +
  '       ExportadoTransito.ComisaoSFatura AS ComisaoSFatura,' + NOVA_LINHA +
  '       ExportadoTransito.NumNFEmit AS NumNFEmit,' + NOVA_LINHA +
  '       ExportadoTransito.NumOrdCobranca AS NumOrdCobranca,' + NOVA_LINHA +
  '       ExportadoTransito.Status AS Status' + NOVA_LINHA +
  '       from  ExportadoTransito' + NOVA_LINHA +
  '     ) as  CERBO' + NOVA_LINHA +
  'Left Outer Join ContratoTransporte on' + NOVA_LINHA +
  '  CERBO.Contrato = ContratoTransporte.Contrato' + NOVA_LINHA +
  'Left Outer Join Fornecedores on' + NOVA_LINHA +
  '  ContratoTransporte.FORCOD = Fornecedores.FORCOD' + NOVA_LINHA +
  'Left Outer Join Clientes on' + NOVA_LINHA +
  '  ContratoTransporte.CLICOD = Clientes.CLICOD' + NOVA_LINHA +
  'Left Outer Join Divisoes on' + NOVA_LINHA +
// CORRECAO 25/04/2012 FALTAVA ESTE CRITERIO =>  AND ContratoTransporte.SEQ = DIVISOES.SEQ
//'  ContratoTransporte.CLICOD = Divisoes.CLICOD' + NOVA_LINHA ;
  '  ContratoTransporte.CLICOD = Divisoes.CLICOD AND ContratoTransporte.SEQ = DIVISOES.SEQ ' + NOVA_LINHA +
// 24/1012012 inicio
  ' Left Outer Join PRODUTOCONTRATOT on                    ' +  NOVA_LINHA +
  ' ContratoTransporte.Contrato = PRODUTOCONTRATOT.Contrato           ' +  NOVA_LINHA +
// 24/1012012 fim
  ' Where CERBO.Contrato = :Contrato ' + NOVA_LINHA ;


  //'Where' + NOVA_LINHA +
  //' CONTRATOTRANSPORTE.CADASTRO >= '2011/05/01' AND CONTRATOTRANSPORTE.CADASTRO <= '2011/07/09'' + NOVA_LINHA +
  SC_CERBO_ORDE = 'Order By ContratoTransporte.CLICOD,CERBO.Contrato' + NOVA_LINHA ;
  // SC_CERBO_INICI + ' WHERE ' + SC_CERBO_ORDE

{
Select distinct
/*  CERBO.seq AS seq, */
  CERBO.Contrato AS Contrato,
  Fornecedores.RAZAO AS RAZAO,
/*  CERBO.Navio AS Navio,
  CERBO.DataEmbarque AS DataEmbarque,
  CERBO.QuantidadeExp AS QuantidadeExp, */
  ContratoTransporte.QUANTTOTALEXP as QuantidadeExp   ,
/*  CERBO.Fatura AS Fatura,
  ContratoTransporte.Comissao AS Comissao, */
  ContratoTransporte.FormComissao AS FormComissao,
/*  CERBO.ComisaoSFatura AS ComisaoSFatura, */
  ContratoTransporte.VALORTOTALCOMISSAO as ComisaoSFatura  ,
  CERBO.NumNFEmit AS NumNFEmit,
  CERBO.NumOrdCobranca AS NumOrdCobranca,
  Clientes.RAZAO AS RAZAO_CLIENTE,
  Clientes.CLICOD AS CLICOD ,
  CERBO.Status AS Status
from ( select DISTINCT
       ExportadoTransito.Contrato AS Contrato,
       ExportadoTransito.Navio AS Navio,
       ExportadoTransito.DataEmbarque AS DataEmbarque,
       ExportadoTransito.QuantidadeExp AS QuantidadeExp,
       ExportadoTransito.Fatura AS Fatura,
       ExportadoTransito.ComisaoSFatura AS ComisaoSFatura,
       ExportadoTransito.NumNFEmit AS NumNFEmit,
       ExportadoTransito.NumOrdCobranca AS NumOrdCobranca,
       ExportadoTransito.Status AS Status
       from  ExportadoTransito
     ) as  CERBO
Left Outer Join ContratoTransporte on
  CERBO.Contrato = ContratoTransporte.Contrato
Left Outer Join Fornecedores on
  ContratoTransporte.FORCOD = Fornecedores.FORCOD
Left Outer Join Clientes on
  ContratoTransporte.CLICOD = Clientes.CLICOD
Left Outer Join Divisoes on
  ContratoTransporte.CLICOD = Divisoes.CLICOD
Order By ContratoTransporte.CLICOD,CERBO.Contrato

}
  SC_CERBO_TEMP =
'Select                                                        ' + NOVA_LINHA +
'  CERBO.Contrato AS Contrato,                                 ' + NOVA_LINHA +
'  Fornecedores.RAZAO AS RAZAO,                                ' + NOVA_LINHA +
'  CERBO.Navio AS Navio,                                       ' + NOVA_LINHA +
'  CERBO.DataEmbarque AS DataEmbarque,                         ' + NOVA_LINHA +
'  CERBO.QuantidadeExp AS QuantidadeExp,                       ' + NOVA_LINHA +
'  CERBO.Fatura AS Fatura,                                     ' + NOVA_LINHA +
'  ContratoTransporte.Comissao AS Comissao,                    ' + NOVA_LINHA +
'  ContratoTransporte.FormComissao AS FormComissao,            ' + NOVA_LINHA +
'  CERBO.ComisaoSFatura AS ComisaoSFatura,                     ' + NOVA_LINHA +
'  CERBO.NumNFEmit AS NumNFEmit,                               ' + NOVA_LINHA +
'  CERBO.NumOrdCobranca AS NumOrdCobranca,                     ' + NOVA_LINHA +
'  CERBO.Status AS Status,                                     ' + NOVA_LINHA +
'  ContratoTransporte.FORCOD AS FORCOD,                        ' + NOVA_LINHA +
'  ContratoTransporte.CLICOD AS CLICOD,                        ' + NOVA_LINHA +
'  Clientes.RAZAO AS RAZAO_CLIENTE,                            ' + NOVA_LINHA +
'  Divisoes.NOME AS NOME,                                      ' + NOVA_LINHA +
'  ContratoTransporte.StatusCT AS StatusCT                     ' + NOVA_LINHA +
'from ( select                                                 ' + NOVA_LINHA +
'       ExportadoTransito.Contrato AS Contrato,                ' + NOVA_LINHA +
'       ExportadoTransito.Navio AS Navio,                      ' + NOVA_LINHA +
'       ExportadoTransito.DataEmbarque AS DataEmbarque,        ' + NOVA_LINHA +
'       ExportadoTransito.QuantidadeExp AS QuantidadeExp,      ' + NOVA_LINHA +
'       ExportadoTransito.Fatura AS Fatura,                    ' + NOVA_LINHA +
'       ExportadoTransito.ComisaoSFatura AS ComisaoSFatura,    ' + NOVA_LINHA +
'       ExportadoTransito.NumNFEmit AS NumNFEmit,              ' + NOVA_LINHA +
'       ExportadoTransito.NumOrdCobranca AS NumOrdCobranca,    ' + NOVA_LINHA +
'       ExportadoTransito.Status AS Status                     ' + NOVA_LINHA +
'       from  ExportadoTransito                                ' + NOVA_LINHA +
'     ) as  CERBO                                              ' + NOVA_LINHA ;
SC_CERBO_TEMP_RELACIONAMENTO =
'Left Outer Join ContratoTransporte on                         ' + NOVA_LINHA +
'  CERBO.Contrato = ContratoTransporte.Contrato                ' + NOVA_LINHA +
'Left Outer Join Fornecedores on                               ' + NOVA_LINHA +
'  ContratoTransporte.FORCOD = Fornecedores.FORCOD             ' + NOVA_LINHA +
'Left Outer Join Clientes on                                   ' + NOVA_LINHA +
'  ContratoTransporte.CLICOD = Clientes.CLICOD                 ' + NOVA_LINHA +
'Left Outer Join Divisoes on                                   ' + NOVA_LINHA +
'  ContratoTransporte.CLICOD = Divisoes.CLICOD                 ' + NOVA_LINHA +
'Left Outer Join PRODUTOCONTRATOT on                           ' + NOVA_LINHA +
' ContratoTransporte.Contrato = PRODUTOCONTRATOT.Contrato      ' + NOVA_LINHA ;















































type
  TFormInforme = class(TForm)
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    AbaConsulta: TTabSet;
    AbrirImagem: TMenuItem;
    BitB_Filtro: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BtnAjuda: TSpeedButton;
    BtnAnterior: TSpeedButton;
    BtnDesistir: TBitBtn;
    BtnExcluir: TSpeedButton;
    BtnFechar: TSpeedButton;
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
    C_C: TXDBLookUp;
    CBox_Cliente_F: TComboBox;
    CBox_Cliente_I: TComboBox;
    CBox_Exportador_F: TComboBox;
    CBox_Exportador_I: TComboBox;
    CBox_produto_I: TComboBox;
    ColarImagem: TMenuItem;
    Contrato: TXDBEdit;
    CopiarImagem: TMenuItem;
    CortarImagem: TMenuItem;
    DataEmbarque: TXDBDateEdit;
    DataSource: TDataSource;
    DataSource1: TDataSource;
    DBGrid_CERBO: TDBGrid;
    DBGrid_Contrato: TDBGrid;
    DBGrid_excel: TDBGrid;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBNavigator_CERBO: TDBNavigator;
    DBNavigator_excel: TDBNavigator;
    DCERBO_L: TIBQuery;
    Divisao_sup: TPanel;
    DlgAbrirImagem: TOpenDialog;
    DlgSalvarComoImagem: TSaveDialog;
    DS_CERBO: TDataSource;
    DS_Contrato: TDataSource;
    DS_EXCEL: TDataSource;
    DS_TMP: TDataSource;
    DSboock: TDataSource;
    DSExportado: TDataSource;
    DSProduto: TDataSource;
    ETADestino: TXDBDateEdit;
    Fatura: TXDBEdit;
    FORCOD: TXDBNumEdit;
    FormPago: TXDBLookUp;
    frDBDataSet_CERBO: TfrDBDataSet;
    frDBDataSet1: TfrDBDataSet;
    frDesigner1: TfrDesigner;
    frReport: TfrReport;
    frReport_Comissao: TfrReport;
    GBox_Fornecedor: TGroupBox;
    GBoxCliente: TGroupBox;
    GridConsulta: TDBGrid;
    GroupB_contrato: TGroupBox;
    GroupBox_Boock: TGroupBox;
    GroupBox_Excel: TGroupBox;
    GroupBox_Exportado: TGroupBox;
    GroupBox_Prod: TGroupBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    IBQboock: TIBQuery;
    IBQContratos: TIBQuery;
    IBQExportado: TIBQuery;
    IBQProduto: TIBQuery;
    ID: TXDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    LbcC_C: TLabel;
    LbcContrato: TLabel;
    LbcDataEmbarque: TLabel;
    LbcETADestino: TLabel;
    LbcFatura: TLabel;
    LbcFORCOD: TLabel;
    LbcFormPago: TLabel;
    LbcID: TLabel;
    LbcNavio: TLabel;
    LbcNOME: TLabel;
    LbcNomeMix: TLabel;
    LbcOBS: TLabel;
    LbcPrecoFOB: TLabel;
    LbcPRECOFOBTOTAL: TLabel;
    LbcPrecoSCC: TLabel;
    LbcQuantidade: TLabel;
    LbcQuantidadeExp: TLabel;
    LbcQUANTIDADETOTAL: TLabel;
    LbcRAZAO: TLabel;
    LbcSDataEmbarque: TLabel;
    LbcValor: TLabel;
    LbcVALORSCCTOTAL: TLabel;
    LbTituloForm: TLabel;
    MenuImagem: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
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
    Navio: TXDBEdit;
    NoManutencao: TNotebook;
    NOME: TXDBEdit;
    NomeMix: TXDBLookUp;
    OBS: TXDBEdit;
    PageControl1: TPageControl;
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
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    PgPagina1: TScrollBox;
    PnInfConsulta: TPanel;
    PnSalva: TPanel;
    PnSup: TPanel;
    PnSuperior: TPanel;
    PopConsulta: TPopupMenu;
    PopRelacionados: TPopupMenu;
    PopupMenu_CERBO: TPopupMenu;
    PrecoFOB: TXDBNumEdit;
    PRECOFOBTOTAL: TXDBNumEdit;
    PrecoSCC: TXDBNumEdit;
    Quantidade: TXDBNumEdit;
    QuantidadeExp: TXDBNumEdit;
    QUANTIDADETOTAL: TXDBNumEdit;
    RAZAO: TXDBEdit;
    SalvarImagem: TMenuItem;
    SDataEmbarque: TXDBEdit;
    ShapeSup: TShape;
    TabConsulta: TTabSheet;
    TabManutencao: TTabSheet;
    TabPaginas: TTabSet;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Valor: TXDBNumEdit;
    VALORSCCTOTAL: TXDBNumEdit;
    XDE_Periodo_F: TXDateEdit;
    XDE_Periodo_I: TXDateEdit;
    IBQProdutoCONTRATO: TIBStringField;
    IBQProdutoNOMEMIX: TIBStringField;
    IBQProdutoRAZAO: TIBStringField;
    IBQProdutoNOME: TIBStringField;
    IBQProdutoC_C: TIBStringField;
    IBQProdutoFORMPAGO: TIBStringField;
    IBQProdutoQUANTIDADETOTAL: TFloatField;
    IBQProdutoSDATAEMBARQUE: TIBStringField;
    IBQProdutoPRECOFOB: TFloatField;
    IBQProdutoPRECOFOBTOTAL: TFloatField;
    IBQProdutoPRECOSCC: TFloatField;
    IBQProdutoVALORSCCTOTAL: TFloatField;
    IBQProdutoFORCOD: TIntegerField;
    IBQProdutoID: TIBStringField;
    IBQExportadoNAVIO: TIBStringField;
    IBQExportadoQUANTIDADEEXP: TFloatField;
    IBQExportadoVALOR: TFloatField;
    IBQExportadoDATAEMBARQUE: TDateTimeField;
    IBQExportadoFATURA: TIBStringField;
    IBQExportadoETADESTINO: TDateTimeField;
    IBQExportadoOBS: TIBStringField;
    IBQboockCONTRATO: TIBStringField;
    IBQboockNAVIO_BOOCK: TIBStringField;
    IBQboockQUANTIDADE: TFloatField;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Cbox_div_I: TComboBox;
    Cbox_div_F: TComboBox;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    XDE_EMB_I: TXDateEdit;
    XDE_EMB_F: TXDateEdit;
    DS_EXCEL_DT: TDataSource;
    frDBDataSet2: TfrDBDataSet;
    IBQExportadoCONTRATO: TIBStringField;
    IBQuery_Total_Pais: TIBQuery;
    IBQuery_Total_PaisNOME: TIBStringField;
    IBQuery_Total_PaisQUANTIDADETOTAL: TFloatField;
    IBQuery_Total_PaisVALORSCCTOTAL: TFloatField;
    IBQuery_Total_PaisQUANTIDADEBOOCK: TFloatField;
    IBQuery_Total_PaisQUANTTOTALEXP: TFloatField;
    IBQuery_Total_PaisVALORTOTALEXP: TFloatField;
    frDBDataSet3: TfrDBDataSet;
    DCERBO_L_DET: TIBQuery;
    DS_DCERBO_L: TDataSource;
    DS_DCERBO_L_DET: TDataSource;
    frDBDataSet_DCERBO_L_DET: TfrDBDataSet;
    Label1: TLabel;
    CBox_contrato: TComboBox;
    IBQContratosCONTRATO: TIBStringField;
    IBQContratosNOMEMIX: TIBStringField;
    IBQContratosRAZAO: TIBStringField;
    IBQContratosNOME: TIBStringField;
    IBQContratosC_C: TIBStringField;
    IBQContratosFORMPAGO: TIBStringField;
    IBQContratosQUANTIDADETOTAL: TFloatField;
    IBQContratosSDATAEMBARQUE: TIBStringField;
    IBQContratosPRECOFOB: TFloatField;
    IBQContratosPRECOFOBTOTAL: TFloatField;
    IBQContratosQUANTTOTALEXP: TFloatField;
    IBQContratosVALORTOTALEXP: TFloatField;
    IBQContratosQUANTIDADE: TFloatField;
    IBQContratosPRECOSCC_OLD: TFloatField;
    IBQContratosPRECOSCC: TFloatField;
    IBQContratosVALORSCCTOTAL: TFloatField;
    IBQContratosCLICOD: TIntegerField;
    IBQContratosCADASTRO: TDateTimeField;
    IBQContratosFORCOD: TIntegerField;
    IBQContratosSTATUSCT: TIBStringField;
    IBQContratosNOMEDIV: TIBStringField;
    IBQContratosID: TIBStringField;
    RxMemoryData_Excel: TClientDataSet;
    RxMemoryData_Excel_DT: TClientDataSet;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure ContratoExit(Sender: TObject);
    procedure NomeMixExit(Sender: TObject);
    procedure RAZAOExit(Sender: TObject);
    procedure NOMEExit(Sender: TObject);
    procedure C_CExit(Sender: TObject);
    procedure FormPagoExit(Sender: TObject);
    procedure QUANTIDADETOTALExit(Sender: TObject);
    procedure SDataEmbarqueExit(Sender: TObject);
    procedure PrecoFOBExit(Sender: TObject);
    procedure PRECOFOBTOTALExit(Sender: TObject);
    procedure PrecoSCCExit(Sender: TObject);
    procedure VALORSCCTOTALExit(Sender: TObject);
    procedure NAVIO_BOOCKExit(Sender: TObject);
    procedure QuantidadeExit(Sender: TObject);
    procedure NavioExit(Sender: TObject);
    procedure QuantidadeExpExit(Sender: TObject);
    procedure ValorExit(Sender: TObject);
    procedure FaturaExit(Sender: TObject);
    procedure ETADestinoExit(Sender: TObject);
    procedure OBSExit(Sender: TObject);
    procedure FORCODExit(Sender: TObject);
    procedure IDExit(Sender: TObject);
    procedure DataEmbarqueExit(Sender: TObject);
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
    procedure FormCreate(Sender: TObject);
    procedure BitB_FiltroClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DS_ContratoDataChange(Sender: TObject; Field: TField);
    procedure BtnVisualizarClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure GridConsultaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_ContratoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid_CERBODrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FuncoesExtras(const Name: String; p1, p2, p3: Variant;
      var Val: String);
  private
    S_SQL_WHERE, S_EMBARQUE : string ;
    RxMemData_tmp : TClientDataSet ;
    RxMemoryData_Excel_DT1: TClientDataSet;
    RxMemoryData_Excel1: TClientDataSet;

    DCERBO_TMP : TDCERBO  ;
    s_TITULO_div : string ;
    s_TITULO_cli : string ;
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
    procedure HabilitaEdicao(Valor: Boolean = true);
    procedure copy_dados;
    procedure Caption_GrupBox;
    procedure InicializaVariaveis;
  public
    { Public declarations }
    {03-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    TabelaPrincipal: TTabela;
    {04-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}

    
{
    RxMemoryData_ExcelLINHA: TIntegerField;
    RxMemoryData_ExcelCONTRATO: TStringField;
    RxMemoryData_ExcelNOMEMIX: TStringField;
    RxMemoryData_ExcelRAZAO: TStringField;
    RxMemoryData_ExcelNOME: TStringField;
    RxMemoryData_ExcelC_C: TStringField;
    RxMemoryData_ExcelFORMPAGO: TStringField;
    RxMemoryData_ExcelQUANTIDADETOTAL: TFloatField;
    RxMemoryData_ExcelSDATAEMBARQUE: TStringField;
    RxMemoryData_ExcelPRECOFOB: TFloatField;
    RxMemoryData_ExcelPRECOFOBTOTAL: TFloatField;
    RxMemoryData_ExcelPRECOSCC: TFloatField;
    RxMemoryData_ExcelVALORSCCTOTAL: TFloatField;
    RxMemoryData_ExcelQUANTIDADE: TFloatField;
    RxMemoryData_ExcelNAVIO: TStringField;
    RxMemoryData_ExcelQUANTIDADEEXP: TFloatField;
    RxMemoryData_ExcelDATAEMBARQUE: TDateTimeField;
    RxMemoryData_ExcelFATURA: TStringField;
    RxMemoryData_ExcelETADESTINO: TDateTimeField;
    RxMemoryData_ExcelOBS: TStringField;


    RxMemoryData_Excel_DT: TClientDataSet;

    RxMemoryData_Excel_DTLINHA: TIntegerField;
    RxMemoryData_Excel_DTCONTRATO: TStringField;
    RxMemoryData_Excel_DTNOMEMIX: TStringField;
    RxMemoryData_Excel_DTRAZAO: TStringField;
    RxMemoryData_Excel_DTNOME: TStringField;
    RxMemoryData_Excel_DTC_C: TStringField;
    RxMemoryData_Excel_DTFORMPAGO: TStringField;
    RxMemoryData_Excel_DTQUANTIDADETOTAL: TFloatField;
    RxMemoryData_Excel_DTSDATAEMBARQUE: TStringField;
    RxMemoryData_Excel_DTPRECOFOB: TFloatField;
    RxMemoryData_Excel_DTPRECOFOBTOTAL: TFloatField;
    RxMemoryData_Excel_DTPRECOSCC: TFloatField;
    RxMemoryData_Excel_DTVALORSCCTOTAL: TFloatField;
    RxMemoryData_Excel_DTNAVIO_BUQ: TStringField;
    RxMemoryData_Excel_DTQUANTIDADE: TFloatField;
    RxMemoryData_Excel_DTNAVIO: TStringField;
    RxMemoryData_Excel_DTQUANTIDADEEXP: TFloatField;
    RxMemoryData_Excel_DTVALOR: TFloatField;
    RxMemoryData_Excel_DTDATAEMBARQUE: TDateTimeField;
    RxMemoryData_Excel_DTFATURA: TStringField;
    RxMemoryData_Excel_DTETADESTINO: TDateTimeField;
    RxMemoryData_Excel_DTOBS: TStringField;
    RxMemoryData_Excel_DTDIVISAO: TStringField;

 }

  end;

var
  FormInforme: TFormInforme;
  LastControl: TWinControl;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, RotinaEd, Abertura, GridPesquisa;

procedure TFormInforme.FuncoesExtras(const Name: String; p1, p2,
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


procedure TFormInforme.FormShow(Sender: TObject);
//Var
//  I: Integer;
begin
  // XDE_Periodo_I.Text := '01/05/2011';
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  TabelaPrincipal    := TabGlobal.DInforme;
  TituloModulo       := 'Informe Consulta';
  Caption            := TituloModulo;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
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
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.DataEmbarque, -2, DataEmbarqueExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.ID, -2, IDExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.FORCOD, -2, FORCODExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.OBS, -2, OBSExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.ETADestino, -2, ETADestinoExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.Fatura, -2, FaturaExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.Valor, -2, ValorExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.QuantidadeExp, -2, QuantidadeExpExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.Navio, -2, NavioExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.Quantidade, -2, QuantidadeExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.NAVIO_BOOCK, -2, NAVIO_BOOCKExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.VALORSCCTOTAL, -2, VALORSCCTOTALExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.PrecoSCC, -2, PrecoSCCExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.PRECOFOBTOTAL, -2, PRECOFOBTOTALExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.PrecoFOB, -2, PrecoFOBExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.SDataEmbarque, -2, SDataEmbarqueExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.QUANTIDADETOTAL, -2, QUANTIDADETOTALExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.FormPago, -2, FormPagoExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.C_C, -2, C_CExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.NOME, -2, NOMEExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.RAZAO, -2, RAZAOExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.NomeMix, -2, NomeMixExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DInforme, TabGlobal.DInforme.Contrato, -1, ContratoExit, Nil, ListaCamposEd, FormInforme, DataSource, ChamaGridPesquisa);
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
    // CARREGANDO   LIST BOX
  Carrega_CB(Cbox_div_I,Cbox_div_F,'select divisoes.nome || '' | Cliente  = '' ||  clientes.razao || '' [[ '' || divisoes.seq || '' ]] '' || '' << '' || divisoes.clicod|| '' >> ''   AS CAMPOS  from divisoes , clientes where divisoes.clicod =  clientes.clicod  order by divisoes.nome  ', 'CAMPOS',SELF);
  Carrega_CB(CBox_Cliente_i,CBox_Cliente_f,'SELECT RAZAO || '' >> '' || CLICOD || '' <<''  AS CAMPOS FROM CLIENTES ORDER BY RAZAO', 'CAMPOS',SELF);
  Carrega_CB(CBox_Exportador_i,CBox_Exportador_F,'SELECT RAZAO || '' >> '' || FORCOD || '' <<''  AS CAMPOS FROM FORNECEDORES ORDER BY RAZAO', 'CAMPOS',SELF);
//  Carrega_CB(CBox_produto_I,CBox_produto_f,'SELECT PRODUTO FROM PRODUTOS ORDER BY PRODUTO', 'PRODUTO',SELF);
  Carrega_CB(CBox_produto_I,nil,'SELECT PRODUTO FROM PRODUTOS ORDER BY PRODUTO', 'PRODUTO',SELF);
  Carrega_CB(CBox_contrato,nil,'select contrato from contratotransporte    order by contrato', 'contrato',SELF);

  // alinhamento da tela
  DBGrid_Contrato.Align := alClient ;
  GroupB_contrato.Align := alClient ;
  DBGrid_excel.Align := alClient ;
  DBNavigator_excel.Align := alTop ;
  Panel2.height := 280 ;
  GroupBox_Excel.Align := alClient;
  DBNavigator_CERBO.Align := alTop ;
  DBGrid_CERBO.Align := alClient;

  DS_CERBO.DataSet :=  DCERBO_TMP ;


  DCERBO_TMP.Close ;
  DCERBO_TMP.AtualizaSql(FALSE);
  DCERBO_TMP.Open;

  PageControl1.tabIndex := 0 ;
  PagePrincipal.tabIndex := 2 ;

  // RELATORIO COMISSAO
  frDBDataSet_CERBO.DataSet :=  DCERBO_L ;
  frReport_Comissao.Dataset :=  frDBDataSet_CERBO ;

  BitB_FiltroClick(SELF) ;

  frReport.OnUserFunction := FuncoesExtras;
  frReport_Comissao.OnUserFunction := FuncoesExtras;
end;

function TFormInforme.AbreTabelas: Boolean;
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  Result := True;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormInforme.CamposCalculados;
begin
  {08-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormInforme.HabilitaEdicao(Valor: Boolean = true);
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

function TFormInforme.ConfirmaInclusao: Boolean;
begin
  Result := True;
end;

function TFormInforme.ConfirmaModificacao: Boolean;
begin
  Result := True;
end;

function TFormInforme.ConfirmaExclusao: Boolean;
begin
  Result := True;
end;

function TFormInforme.ConfirmaGravacao: Boolean;
begin
  Result := True;
end;

procedure TFormInforme.TelaManutencao;
begin
  if (TabelaPrincipal.Inclusao) or
     (TabelaPrincipal.Modificacao) then
    HabilitaEdicao
  else
    HabilitaEdicao(False);
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormInforme.TelaConsulta;
begin
  HabilitaEdicao(False);

end;

procedure TFormInforme.AtribuiValoresPadrao;
begin
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd, True);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormInforme.AntesdeSalvar;
begin

end;

procedure TFormInforme.AntesdeIncluir;
begin

end;

procedure TFormInforme.AntesdeModificar;
begin

end;

procedure TFormInforme.AntesdeExcluir;
begin

end;

procedure TFormInforme.DepoisdeIncluir;
begin

end;

procedure TFormInforme.DepoisdeModificar;
begin

end;

procedure TFormInforme.DepoisdeExcluir;
begin

end;

procedure TFormInforme.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSalvar.Enabled then
    TabelaPrincipal.Cancela;
end;

procedure TFormInforme.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  I: Integer;
begin
  RxMemData_tmp.Close ;
  RxMemoryData_Excel_DT.Close;
  RxMemoryData_Excel.Close;

  RxMemData_tmp.Free;
//  RxMemoryData_Excel_DT.Free;
//  RxMemoryData_Excel.Free;

  //TabelaPrincipal.AtribuiRelacionamentos(False); // Habilite esta opção caso seja realmente necessário...
  DesabilitaFuncoesEd;
  ListaCamposED.Free;
  DCERBO_TMP.Free ;
  
  for I := 0 to ConsultasSalvas.Count - 1 do
    TConsultasSalvas(ConsultasSalvas[I]).Free;
    
  ConsultasSalvas.Free;
  Action := caFree;
  FormInforme := nil;
end;

procedure TFormInforme.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormInforme.BtnAjudaClick(Sender: TObject);
begin
  application.helpcommand(Help_Finder,HelpContext);
end;

procedure TFormInforme.StatusTabela;
begin
  LbTituloForm.Caption := TituloModulo + '- [ Ordem: '+TabelaPrincipal.TituloIndice+' ]';
end;

procedure TFormInforme.FormResize(Sender: TObject);
begin
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
  Panel4.Height  := Panel2.Height DIV 2 ;
end;

procedure TFormInforme.FormActivate(Sender: TObject);
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

procedure TFormInforme.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormInforme.BtnSalvarClick(Sender: TObject);
Var
  EInclusao, Ok: Boolean;
begin
  Ok := False;
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

procedure TFormInforme.BtnDesistirClick(Sender: TObject);
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

procedure TFormInforme.GridConsultaDblClick(Sender: TObject);
begin
  if TabelaPrincipal.Eof then
    Incluir(Self)
  else
    Modificar(Self);
end;

procedure TFormInforme.VerificaAtualizacoes;
begin
  if not BtnSalvar.Enabled then
    BtnDesistirClick(Self)
  else
    if MessageDlg('Salvar Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      BtnSalvarClick(Self)
    else
      BtnDesistirClick(Self);
end;

procedure TFormInforme.Localizar(Sender: TObject);
begin
  Ed_Localizar(TabelaPrincipal, FormInforme, GridConsulta);
end;

procedure TFormInforme.Incluir(Sender: TObject);
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

procedure TFormInforme.Modificar(Sender: TObject);
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

procedure TFormInforme.Excluir(Sender: TObject);
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

procedure TFormInforme.Primeiro(Sender: TObject);
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

procedure TFormInforme.Anterior(Sender: TObject);
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

procedure TFormInforme.Proximo(Sender: TObject);
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

procedure TFormInforme.Ultimo(Sender: TObject);
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

procedure TFormInforme.mnu_FiltrarClick(Sender: TObject);
begin
  Ed_Filtrar(TabelaPrincipal, FormInforme, GridConsulta);
  StatusTabela;
end;

procedure TFormInforme.mnu_OrdenarClick(Sender: TObject);
begin
  Ed_Ordenar(TabelaPrincipal, FormInforme, GridConsulta);
  StatusTabela;
end;

procedure TFormInforme.mnu_OrdenarCompostoClick(Sender: TObject);
begin
  Ed_OrdenarComposto(TabelaPrincipal, FormInforme, GridConsulta);
  StatusTabela;
end;

procedure TFormInforme.mnu_ApagarColunaClick(Sender: TObject);
begin
  Ed_ApagarColuna(TabelaPrincipal, FormInforme, GridConsulta);
end;

procedure TFormInforme.mnu_QuantificarClick(Sender: TObject);
begin
  Ed_Quantificar(TabelaPrincipal, FormInforme, GridConsulta);
end;

procedure TFormInforme.mnu_TotalizarColunaClick(Sender: TObject);
begin
  Ed_TotalizarColuna(TabelaPrincipal, FormInforme, GridConsulta);
end;

procedure TFormInforme.mnu_CalcularMediaClick(Sender: TObject);
begin
  Ed_CalcularMedia(TabelaPrincipal, FormInforme, GridConsulta);
end;

procedure TFormInforme.mnu_ImprimirClick(Sender: TObject);
begin
  Ed_Imprimir(TabelaPrincipal, FormInforme, GridConsulta, DataSource);
end;

procedure TFormInforme.mnu_SalvarConsultaClick(Sender: TObject);
begin
  Ed_SalvarConsulta(TabelaPrincipal, FormInforme, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormInforme.mnu_ExcluirConsultaClick(Sender: TObject);
begin
  Ed_ExcluirConsulta(TabelaPrincipal, FormInforme, GridConsulta, AbaConsulta, ConsultasSalvas);
end;

procedure TFormInforme.PagePrincipalChange(Sender: TObject);
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

procedure TFormInforme.AbaConsultaClick(Sender: TObject);
begin
  Ed_AbaConsulta(TabelaPrincipal, AbaConsulta, ConsultasSalvas, GridConsulta);
  StatusTabela;
end;

procedure TFormInforme.TabPaginasClick(Sender: TObject);
begin
  if NoManutencao.PageIndex <> TabPaginas.TabIndex then
    NoManutencao.SetFocus;
  NoManutencao.PageIndex := TabPaginas.TabIndex;
end;

procedure TFormInforme.PosicionaNoCampo(Campo: TAtributo);
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

procedure TFormInforme.ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
begin
  MessageDlg(MsgErro, mtError, [mbOk], 0);
  ErroValidacao := True;
  PosicionaNoCampo(Campo);
end;

procedure TFormInforme.MudaSeForUltimo;
begin
  if (NoManutencao.PageIndex <> NoManutencao.Pages.Count - 1) and
     (ActiveControl = BtnSalvar) then
    if TabPaginas.TabIndex + 1 <= TabPaginas.Tabs.Count-1 then
      TabPaginas.TabIndex := TabPaginas.TabIndex + 1;
end;

procedure TFormInforme.CortarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CutToClipBoard;
end;

procedure TFormInforme.CopiarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CopyToClipBoard;
end;

procedure TFormInforme.ColarImagemClick(Sender: TObject);
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

procedure TFormInforme.AbrirImagemClick(Sender: TObject);
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

procedure TFormInforme.SalvarImagemClick(Sender: TObject);
begin
  if DlgSalvarComoImagem.Execute and (ActiveControl is TDBImage) then
    TDBImage(ActiveControl).Picture.SaveToFile(DlgSalvarComoImagem.FileName);
end;

function TFormInforme.AbandonandoEdicao: Boolean;
begin
  Result := (ActiveControl = BtnDesistir) or (ActiveControl = PagePrincipal);
end;

procedure TFormInforme.BtnRelac_1Click(Sender: TObject);
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

procedure TFormInforme.PopRelacionadosClick(Sender: TObject);
var
  MenuItem: TMenuItem;
begin
  MenuItem := TMenuItem(Sender);
  {10-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormInforme.ChamaGridPesquisa(Sender: TObject);
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

procedure TFormInforme.ValidaColunaGrid(Sender: TField);
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

procedure TFormInforme.BtnIncluirClick(Sender: TObject);
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

procedure TFormInforme.BtnModificarClick(Sender: TObject);
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

procedure TFormInforme.BtnExcluirClick(Sender: TObject);
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

procedure TFormInforme.BtnTabelaClick(Sender: TObject);
begin
  if BtnTabela.Tag = 0 then
    TelaConsulta
  else
    TelaManutencao;
  StatusTabela;

end;

procedure TFormInforme.BtnLocalizarClick(Sender: TObject);
begin
  Ed_Localizar(TabelaPrincipal, FormInforme, GridConsulta);
  StatusTabela;
//  if PageForm.PageIndex = 0 then
  IF PagePrincipal.TABINDEX = 0 THEN
    TelaManutencao;

end;

procedure TFormInforme.BtnPrimeiroClick(Sender: TObject);
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

procedure TFormInforme.BtnAnteriorClick(Sender: TObject);
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

procedure TFormInforme.BtnProximoClick(Sender: TObject);
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

procedure TFormInforme.BtnUltimoClick(Sender: TObject);
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

procedure TFormInforme.BtnRefreshClick(Sender: TObject);
begin
  if MessageDlg('Atualizar registros?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    TabelaPrincipal.AtualizaSql;
    // if PageForm.PageIndex = 0 then
    IF PagePrincipal.TABINDEX = 0 THEN
      TelaManutencao;
  end;

end;

procedure TFormInforme.ContratoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.Contrato.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.Contrato);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.NomeMixExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.NomeMix.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.NomeMix);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.RAZAOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.RAZAO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.RAZAO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.NOMEExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.NOME.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.NOME);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.C_CExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.C_C.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.C_C);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.FormPagoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.FormPago.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.FormPago);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.QUANTIDADETOTALExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.QUANTIDADETOTAL.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.QUANTIDADETOTAL);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.SDataEmbarqueExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.SDataEmbarque.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.SDataEmbarque);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.PrecoFOBExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.PrecoFOB.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.PrecoFOB);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.PRECOFOBTOTALExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.PRECOFOBTOTAL.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.PRECOFOBTOTAL);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.PrecoSCCExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.PrecoSCC.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.PrecoSCC);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.VALORSCCTOTALExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.VALORSCCTOTAL.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.VALORSCCTOTAL);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.NAVIO_BOOCKExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.NAVIO_BOOCK.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.NAVIO_BOOCK);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.QuantidadeExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.Quantidade.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.Quantidade);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.NavioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.Navio.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.Navio);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.QuantidadeExpExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.QuantidadeExp.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.QuantidadeExp);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.ValorExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.Valor.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.Valor);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.FaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.Fatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.Fatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.ETADestinoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.ETADestino.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.ETADestino);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.OBSExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.OBS.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.OBS);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.FORCODExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.FORCOD.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.FORCOD);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.IDExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.ID.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.ID);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.DataEmbarqueExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DInforme.DataEmbarque.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DInforme.DataEmbarque);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormInforme.FormCreate(Sender: TObject);
vAR
//t_text , S_NOME , SC_Contrato_princ_v_JA_EXP , SC_Contrato_princ_Q_JA_EXP : STRING ;
t_text , S_NOME   : STRING ;
IND : INTEGER ;
begin
//    SC_Contrato_princ_v_JA_EXP :=  '( 0.0 )/100 * 100 as ValorTotal_JA_Exp, ' + NOVA_LINHA ;
//    SC_Contrato_princ_Q_JA_EXP :=  '( 0.0 )/100 * 100 as QUANTTOTAL_JA_EXP, ' + NOVA_LINHA ;

    DCERBO_TMP := TDCERBO.Create(Self);
    IBQProduto.Database     := BaseDados.BD_Base_Dados ;
    IBQboock.Database       := BaseDados.BD_Base_Dados ;
    IBQExportado.Database   := BaseDados.BD_Base_Dados ;
    IBQContratos.Database   := BaseDados.BD_Base_Dados ;
    DCERBO_TMP.Database     := BaseDados.BD_Base_Dados ;
    DCERBO_L.Database       := BaseDados.BD_Base_Dados ;
    DCERBO_L_DET.Database   := BaseDados.BD_Base_Dados ;
    IBQuery_Total_Pais.Database:= BaseDados.BD_Base_Dados ;

    IBQProduto.Transaction     := BaseDados.TRS_BD_Base_Dados ;
    IBQboock.Transaction       := BaseDados.TRS_BD_Base_Dados ;
    IBQExportado.Transaction   := BaseDados.TRS_BD_Base_Dados ;
    IBQContratos.Transaction   := BaseDados.TRS_BD_Base_Dados ;
    DCERBO_TMP.Transaction     := BaseDados.TRS_BD_Base_Dados ;
    DCERBO_L.Transaction       := BaseDados.TRS_BD_Base_Dados ;
    DCERBO_L_DET.Transaction   := BaseDados.TRS_BD_Base_Dados ;

    IBQuery_Total_Pais.Transaction := BaseDados.TRS_BD_Base_Dados ;


    IBQuery_Total_Pais.Close;
    IBQuery_Total_Pais.sql.clear;

//  IBQuery_Total_Pais.sql.Add(SC_PRODUTOS_princ+SC_PRODUTOS_where + SC_PRODUTOS_order)   ;

    IBQuery_Total_Pais.sql.Add(SC_Total_Pais_Inicio + SC_Total_Pais_CAOMPOS + SC_Total_Pais_Inicio2 + SC_Total_Pais_where + SC_Total_Pais_Final)   ;
    IBQuery_Total_Pais.sql.SaveToFile('_IBQuery_Total_Pais.sql');
    IBQuery_Total_Pais.Prepare ;
    IBQuery_Total_Pais.Open;



    IBQProduto.Close;
    IBQProduto.sql.clear;
    IBQProduto.sql.Add(SC_PRODUTOS_princ+SC_PRODUTOS_where + SC_PRODUTOS_order)   ;
    IBQProduto.sql.SaveToFile('_IBQProduto.sql');
    IBQProduto.Prepare ;
    IBQProduto.Open;

    IBQboock.Close;
    IBQboock.sql.clear ;
    IBQboock.sql.Add( SC_Boocking_princ + SC_Boocking_where + SC_Boocking_order )  ;
    IBQboock.sql.SaveToFile('_IBQboock.sql');
    IBQboock.Prepare ;
    IBQboock.Open;


    IBQContratos.Close;
    IBQContratos.sql.clear;
    IBQContratos.sql.Add(SC_Contrato_princ_i+ SC_Contrato_VALORSCCTOTAL +SC_Contrato_QUANTIDADETOTAL +
                         SC_Contrato_QUANTIDADETOTAL_CONTINUA + SC_Contrato_princ_q_i + SC_Contrato_princ_q_f +
//                           SC_Contrato_princ_q_JA_EXP +
                          SC_Contrato_princ_v_i +SC_Contrato_princ_v_f +
//                         SC_Contrato_princ_v_JA_EXP  +
                         SC_Contrato_princ_f+SC_contrato_where + SC_contrato_order)   ;
    IBQContratos.sql.SaveToFile('_IBQContratos.sql');
    IBQContratos.Prepare;
    IBQContratos.Open;
    IBQContratos.Last ;
    IBQContratos.First;


    IBQExportado.Close;
    IBQExportado.sql.clear ;
    IBQExportado.sql.Add( SC_ExportadoTransito_princ + SC_ExportadoTransito_where + SC_ExportadoTransito_order )    ;
    IBQExportado.sql.SaveToFile('_IBQExportado.sql');
    IBQExportado.Prepare;
    IBQExportado.Open;

 //   RxMemoryData_Excel.ClearFields;
  //  RxMemoryData_Excel.Active := TRUE ;

  //  RxMemoryData_Excel_DT.Active := TRUE ;
  //  27/07/2012
  //  while NOT RxMemoryData_Excel.Eof do
  //        RxMemoryData_Excel.delete ;
  //
  //  while NOT RxMemoryData_Excel_DT.Eof do
  //        RxMemoryData_Excel_DT.delete ;

    IBQContratos.First ;
    Caption_GrupBox ;

  // 27/07/2012
  //  RxMemoryData_Excel_DT.EmptyDataset;
  //  RxMemoryData_Excel.EmptyDataset;

    RxMemData_tmp := TClientDataSet.Create(APPLICATION) ;
 //   RxMemoryData_Excel_DT := TClientDataSet.Create(APPLICATION) ;
 //   RxMemoryData_Excel := TClientDataSet.Create(APPLICATION) ;

  // 27/07/2012
  //  RxMemoryData_Excel.close;
  //  RxMemoryData_Excel_DT.close;
   {
    RxMemoryData_Excel.Close;
    RxMemoryData_Excel.FieldDefs.Clear ;
    RxMemoryData_Excel.FieldDefs.Add('LINHA',ftINTEGER	,0,false);	  // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('CONTRATO',ftString	,15,false);	  // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('NOMEMIX',ftString	,30,false);	  // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('RAZAO',ftString	,50,false);	  // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('NOME',ftString	,48,false);	  // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('C_C',ftString	,20,false);	  // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('FORMPAGO',ftString	,03,false);	  // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('QUANTIDADETOTAL',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel.FieldDefs.Add('SDATAEMBARQUE',ftString  ,07,false);   // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('PRECOFOB',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel.FieldDefs.Add('PRECOFOBTOTAL',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel.FieldDefs.Add('PRECOSCC',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel.FieldDefs.Add('VALORSCCTOTAL',ftFloat	  ,00,false);   // : TFloatField;
//  RxMemoryData_Excel.FieldDefs.Add('NAVIO_BOOCK',ftString  ,15,false);   // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('NAVIO_BUQ',ftString  ,15,false);   // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('QUANTIDADE',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel.FieldDefs.Add('NAVIO',ftString  ,15,false);   // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('QUANTIDADEEXP',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel.FieldDefs.Add('VALOR',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel.FieldDefs.Add('DATAEMBARQUE',ftDateTime,00,false);   // : TDateTimeField;
    RxMemoryData_Excel.FieldDefs.Add('FATURA',ftString  ,20,false);   // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('ETADESTINO',ftDateTime,00,false);   // : TDateTimeField;
    RxMemoryData_Excel.FieldDefs.Add('OBS',ftString	,15,false);   // : TIBStringField;
    RxMemoryData_Excel.FieldDefs.Add('DIVISAO',ftString	  ,50,false); //.Value:=  IBQContratosNOMEDIV.Value ; // : TFloatField;
 //   RxMemoryData_Excel.Fields.Add();
    // ordem de tabela tempe
    RxMemoryData_Excel.MasterFields := 'LINHA';
    RxMemoryData_Excel.CreateDataSet ;
    
    RxMemoryData_Excel_DT.Close;
    RxMemoryData_Excel_DT.FieldDefs.Clear ;
    RxMemoryData_Excel_DT.FieldDefs.Add('LINHA',ftINTEGER	,0,false);	  // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('CONTRATO',ftString	,15,false);	  // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('NOMEMIX',ftString	,30,false);	  // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('RAZAO',ftString	,50,false);	  // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('NOME',ftString	,48,false);	  // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('C_C',ftString	,20,false);	  // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('FORMPAGO',ftString	,10,false);	  // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('QUANTIDADETOTAL',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel_DT.FieldDefs.Add('SDATAEMBARQUE',ftString  ,07,false);   // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('PRECOFOB',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel_DT.FieldDefs.Add('PRECOFOBTOTAL',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel_DT.FieldDefs.Add('PRECOSCC',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel_DT.FieldDefs.Add('VALORSCCTOTAL',ftFloat	  ,00,false);   // : TFloatField;
//  RxMemoryData_Excel_DT.FieldDefs.Add('NAVIO_BOOCK',ftString  ,15,false);   // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('NAVIO_BUQ',ftString  ,15,false);   // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('QUANTIDADE',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel_DT.FieldDefs.Add('NAVIO',ftString  ,15,false);   // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('QUANTIDADEEXP',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel_DT.FieldDefs.Add('VALOR',ftFloat	  ,00,false);   // : TFloatField;
    RxMemoryData_Excel_DT.FieldDefs.Add('DATAEMBARQUE',ftDateTime,00,false);   // : TDateTimeField;
    RxMemoryData_Excel_DT.FieldDefs.Add('FATURA',ftString  ,20,false);   // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('ETADESTINO',ftDateTime,00,false);   // : TDateTimeField;
    RxMemoryData_Excel_DT.FieldDefs.Add('OBS',ftString	,15,false);   // : TIBStringField;
    RxMemoryData_Excel_DT.FieldDefs.Add('DIVISAO',ftString	,50,false);   // : TIBStringField;
    RxMemoryData_Excel_DT.CreateDataSet ;

    }
    
    RxMemData_tmp.FieldDefs.Clear ;
    RxMemData_tmp.FieldDefs.Add('LINHA',ftINTEGER	,0,false);	  // : TIBStringField;
    RxMemData_tmp.FieldDefs.Add('CONTRATO',ftString	,15,false);	  // : TIBStringField;
    RxMemData_tmp.FieldDefs.Add('NOMEMIX',ftString	,30,false);	  // : TIBStringField;
    RxMemData_tmp.FieldDefs.Add('RAZAO',ftString	,50,false);	  // : TIBStringField;
    RxMemData_tmp.FieldDefs.Add('NOME',ftString	,48,false);	  // : TIBStringField;
    RxMemData_tmp.FieldDefs.Add('C_C',ftString	,20,false);	  // : TIBStringField;
    RxMemData_tmp.FieldDefs.Add('FORMPAGO',ftString	,10,false);	  // : TIBStringField;
    RxMemData_tmp.FieldDefs.Add('QUANTIDADETOTAL',ftFloat	  ,00,false);   // : TFloatField;
    RxMemData_tmp.FieldDefs.Add('SDATAEMBARQUE',ftString  ,07,false);   // : TIBStringField;
    RxMemData_tmp.FieldDefs.Add('PRECOFOB',ftFloat	  ,00,false);   // : TFloatField;
    RxMemData_tmp.FieldDefs.Add('PRECOFOBTOTAL',ftFloat	  ,00,false);   // : TFloatField;
    RxMemData_tmp.FieldDefs.Add('PRECOSCC',ftFloat	  ,00,false);   // : TFloatField;
    RxMemData_tmp.FieldDefs.Add('VALORSCCTOTAL',ftFloat	  ,00,false);   // : TFloatField;
    RxMemData_tmp.FieldDefs.Add('NAVIO_BOOCK',ftString  ,15,false);   // : TIBStringField;
    RxMemData_tmp.FieldDefs.Add('QUANTIDADE',ftFloat	  ,00,false);   // : TFloatField;
    RxMemData_tmp.FieldDefs.Add('NAVIO',ftString  ,15,false);   // : TIBStringField;
    RxMemData_tmp.FieldDefs.Add('QUANTIDADEEXP',ftFloat	  ,00,false);   // : TFloatField;
    RxMemData_tmp.FieldDefs.Add('VALOR',ftFloat	  ,00,false);   // : TFloatField;
    RxMemData_tmp.FieldDefs.Add('DATAEMBARQUE',ftDateTime,00,false);   // : TDateTimeField;
    RxMemData_tmp.FieldDefs.Add('FATURA',ftString  ,20,false);   // : TIBStringField;
    RxMemData_tmp.FieldDefs.Add('ETADESTINO',ftDateTime,00,false);   // : TDateTimeField;
    RxMemData_tmp.FieldDefs.Add('OBS',ftString	,15,false);   // : TIBStringField;
    RxMemData_tmp.FieldDefs.Add('DIVISAO',ftString	,50,false);   // : TIBStringField;
    // orde da tabela tempe
    RxMemData_tmp.MasterFields := 'LINHA';
    RxMemData_tmp.CreateDataSet ;

{
    RxMemoryData_ExcelLINHA := TIntegerField.Create(self);
    RxMemoryData_ExcelCONTRATO:= TStringField.Create(self);
    RxMemoryData_ExcelNOMEMIX:= TStringField.Create(self);
    RxMemoryData_ExcelRAZAO:= TStringField.Create(self);
    RxMemoryData_ExcelNOME:= TStringField.Create(self);
    RxMemoryData_ExcelC_C:= TStringField.Create(self);
    RxMemoryData_ExcelFORMPAGO:= TStringField.Create(self);
    RxMemoryData_ExcelQUANTIDADETOTAL:= TFloatField.Create(self);
    RxMemoryData_ExcelSDATAEMBARQUE:= TStringField.Create(self);
    RxMemoryData_ExcelPRECOFOB:= TFloatField.Create(self);
    RxMemoryData_ExcelPRECOFOBTOTAL:= TFloatField.Create(self);
    RxMemoryData_ExcelPRECOSCC:= TFloatField.Create(self);
    RxMemoryData_ExcelVALORSCCTOTAL:= TFloatField.Create(self);
    RxMemoryData_ExcelNAVIO_BOOCK:= TStringField.Create(self);
    RxMemoryData_ExcelQUANTIDADE:= TFloatField.Create(self);
    RxMemoryData_ExcelNAVIO:= TStringField.Create(self);
    RxMemoryData_ExcelQUANTIDADEEXP:= TFloatField.Create(self);
    RxMemoryData_ExcelVALOR:= TFloatField.Create(self);
    RxMemoryData_ExcelDATAEMBARQUE:= TDateTimeField.Create(self);
    RxMemoryData_ExcelFATURA:= TStringField.Create(self);
    RxMemoryData_ExcelETADESTINO:= TDateTimeField.Create(self);
    RxMemoryData_ExcelOBS:= TStringField.Create(self);



    RxMemoryData_ExcelLINHA.DisplayLabel := 'Linha'                     ;
    RxMemoryData_ExcelLINHA.FieldName := 'LINHA'                        ;
    RxMemoryData_ExcelCONTRATO.DisplayLabel := 'Ctto.'                  ;
    RxMemoryData_ExcelCONTRATO.FieldName := 'CONTRATO'                  ;
    RxMemoryData_ExcelCONTRATO.Size := 15                               ;
    RxMemoryData_ExcelNOMEMIX.DisplayLabel := 'Produtos'                ;
    RxMemoryData_ExcelNOMEMIX.FieldName := 'NOMEMIX'                    ;
    RxMemoryData_ExcelNOMEMIX.Size := 30                                ;
    RxMemoryData_ExcelRAZAO.DisplayLabel := 'Vend.'                     ;
    RxMemoryData_ExcelRAZAO.FieldName := 'RAZAO'                        ;
    RxMemoryData_ExcelRAZAO.Size := 50                                  ;
    RxMemoryData_ExcelNOME.DisplayLabel := 'Pais'                       ;
    RxMemoryData_ExcelNOME.FieldName := 'NOME'                          ;
    RxMemoryData_ExcelNOME.Size := 48                                   ;
    RxMemoryData_ExcelC_C.DisplayLabel := 'C/C'                         ;
    RxMemoryData_ExcelC_C.FieldName := 'C_C'                            ;
    RxMemoryData_ExcelFORMPAGO.DisplayLabel := 'Pago'                   ;
    RxMemoryData_ExcelFORMPAGO.FieldName := 'FORMPAGO'                  ;
    RxMemoryData_ExcelFORMPAGO.Size := 3                                ;
    RxMemoryData_ExcelQUANTIDADETOTAL.DisplayLabel := 'Cant.'           ;
    RxMemoryData_ExcelQUANTIDADETOTAL.FieldName := 'QUANTIDADETOTAL'    ;
    RxMemoryData_ExcelSDATAEMBARQUE.DisplayLabel := 'Fecha Emb.'        ;
    RxMemoryData_ExcelSDATAEMBARQUE.FieldName := 'SDATAEMBARQUE'        ;
    RxMemoryData_ExcelSDATAEMBARQUE.EditMask := '###\/###;1;_'          ;
    RxMemoryData_ExcelSDATAEMBARQUE.Size := 7                           ;
    RxMemoryData_ExcelPRECOFOB.DisplayLabel := 'Precio FOB'             ;
    RxMemoryData_ExcelPRECOFOB.FieldName := 'PRECOFOB'                  ;
    RxMemoryData_ExcelPRECOFOB.currency := True                         ;
    RxMemoryData_ExcelPRECOFOBTOTAL.DisplayLabel := 'Preco FOB Total'   ;
    RxMemoryData_ExcelPRECOFOBTOTAL.FieldName := 'PRECOFOBTOTAL'        ;
    RxMemoryData_ExcelPRECOFOBTOTAL.currency := True                    ;
    RxMemoryData_ExcelPRECOSCC.DisplayLabel := 'Precio S/C/C'           ;
    RxMemoryData_ExcelPRECOSCC.FieldName := 'PRECOSCC'                  ;
    RxMemoryData_ExcelPRECOSCC.currency := True                         ;
    RxMemoryData_ExcelVALORSCCTOTAL.DisplayLabel := 'Valor S/C/C'       ;
    RxMemoryData_ExcelVALORSCCTOTAL.FieldName := 'VALORSCCTOTAL'        ;
    RxMemoryData_ExcelVALORSCCTOTAL.currency := True                    ;
    RxMemoryData_ExcelNAVIO_BOOCK.DisplayLabel := 'M/N'                   ;
    RxMemoryData_ExcelNAVIO_BOOCK.FieldName := 'NAVIO_BOOCK'                ;
    RxMemoryData_ExcelNAVIO_BOOCK.Size := 15                              ;
    RxMemoryData_ExcelQUANTIDADE.DisplayLabel := 'Cant.'                ;
    RxMemoryData_ExcelQUANTIDADE.FieldName := 'QUANTIDADE'              ;
    RxMemoryData_ExcelQUANTIDADE.currency := True                       ;
    RxMemoryData_ExcelNAVIO.DisplayLabel := 'M/N'                       ;
    RxMemoryData_ExcelNAVIO.FieldName := 'NAVIO'                        ;
    RxMemoryData_ExcelNAVIO.Size := 15                                  ;
    RxMemoryData_ExcelQUANTIDADEEXP.DisplayLabel := 'Cant.'             ;
    RxMemoryData_ExcelQUANTIDADEEXP.FieldName := 'QUANTIDADEEXP'        ;
    RxMemoryData_ExcelQUANTIDADEEXP.currency := True                    ;
    RxMemoryData_ExcelVALOR.DisplayLabel := 'Valor'                     ;
    RxMemoryData_ExcelVALOR.FieldName := 'VALOR'                        ;
    RxMemoryData_ExcelVALOR.currency := True                            ;
    RxMemoryData_ExcelDATAEMBARQUE.DisplayLabel := 'Fecha'              ;
    RxMemoryData_ExcelDATAEMBARQUE.FieldName := 'DATAEMBARQUE'          ;
    RxMemoryData_ExcelFATURA.DisplayLabel := 'Fatura'                   ;
    RxMemoryData_ExcelFATURA.FieldName := 'FATURA'                      ;
    RxMemoryData_ExcelETADESTINO.DisplayLabel := 'ETA Cuba'             ;
    RxMemoryData_ExcelETADESTINO.FieldName := 'ETADESTINO'              ;
    RxMemoryData_ExcelOBS.DisplayLabel := 'Observações'                 ;
    RxMemoryData_ExcelOBS.FieldName := 'OBS'                            ;
    RxMemoryData_ExcelOBS.Size := 15                                     ;

    FOR IND := 0 TO RxMemoryData_Excel.Fields.Count - 1 DO
       S_NOME :=  RxMemoryData_Excel.Fields[IND].Name ;


    RxMemoryData_Excel.Fields.Clear ;
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelLINHA);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelCONTRATO);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelNOMEMIX);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelRAZAO);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelNOME);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelC_C);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelFORMPAGO);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelQUANTIDADETOTAL);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelSDATAEMBARQUE);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelPRECOFOB);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelPRECOFOBTOTAL);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelPRECOSCC);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelVALORSCCTOTAL);
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelNAVIO_BOOCK );
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelQUANTIDADE );
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelNAVIO) ;
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelQUANTIDADEEXP );
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelVALOR ) ;
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelDATAEMBARQUE );
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelFATURA );
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelETADESTINO );
    RxMemoryData_Excel.Fields.add(RxMemoryData_ExcelOBS);

    FOR IND := 0 TO RxMemoryData_Excel.Fields.Count - 1 DO
       S_NOME :=  RxMemoryData_Excel.Fields[IND].Name ;
 }
 {
   RxMemoryData_Excel.close ;
   RxMemoryData_Excel.Fields[0].DisplayLabel := 'Linha'                     ;
   RxMemoryData_Excel.Fields[0].Name := 'Linha'                     ;
   RxMemoryData_Excel.Fields[0].FieldName := 'LINHA' ;

   RxMemoryData_Excel.Fields[1].DisplayLabel := 'Ctto.'                  ;
   RxMemoryData_Excel.Fields[1].Name :=  'CONTRATO' ;
   //RxMemoryData_Excel.Fields[1].FieldName  ;

   RxMemoryData_Excel.Fields[2].DisplayLabel := 'Produtos'                ;
   RxMemoryData_Excel.Fields[2].Name := RxMemoryData_Excel.Fields[2].FieldName  ;

   RxMemoryData_Excel.Fields[3].DisplayLabel := 'Vend.' ;
   RxMemoryData_Excel.Fields[3].Name := RxMemoryData_Excel.Fields[3].FieldName  ;

   RxMemoryData_Excel.Fields[4].DisplayLabel := 'Pais' ;
   RxMemoryData_Excel.Fields[4].Name := RxMemoryData_Excel.Fields[4].FieldName  ;

   RxMemoryData_Excel.Fields[5].DisplayLabel := 'C/C';
   RxMemoryData_Excel.Fields[5].Name := RxMemoryData_Excel.Fields[5].FieldName  ;

   RxMemoryData_Excel.Fields[6].DisplayLabel := 'Pago' ;
   RxMemoryData_Excel.Fields[6].Name := RxMemoryData_Excel.Fields[6].FieldName  ;

   RxMemoryData_Excel.Fields[7].DisplayLabel := 'Cant.' ;
   RxMemoryData_Excel.Fields[7].Name := RxMemoryData_Excel.Fields[7].FieldName  ;

   RxMemoryData_Excel.Fields[8].DisplayLabel := 'Fecha Emb.';
   RxMemoryData_Excel.Fields[8].EditMask := '###\/###;1;_'  ;
   RxMemoryData_Excel.Fields[8].Name := RxMemoryData_Excel.Fields[8].FieldName  ;


   RxMemoryData_Excel.Fields[9].DisplayLabel := 'Precio FOB' ;
   RxMemoryData_Excel.Fields[9].Name := RxMemoryData_Excel.Fields[9].FieldName  ;
  // RxMemoryData_Excel.Fields[9].c .currency := True
                     ;
   RxMemoryData_Excel.Fields[10].DisplayLabel := 'Preco FOB Total'   ;
   RxMemoryData_Excel.Fields[10].Name := RxMemoryData_Excel.Fields[10].FieldName  ;
 //  RxMemoryData_Excel.Fields[10].currency := True                    ;

   RxMemoryData_Excel.Fields[11].DisplayLabel := 'Precio S/C/C'           ;
   RxMemoryData_Excel.Fields[11].Name := RxMemoryData_Excel.Fields[11].FieldName  ;
 //  RxMemoryData_Excel.Fields[11].currency := True                         ;

   RxMemoryData_Excel.Fields[12].DisplayLabel := 'Valor S/C/C'       ;
   RxMemoryData_Excel.Fields[12].Name := RxMemoryData_Excel.Fields[12].FieldName  ;
//   RxMemoryData_Excel.Fields[12].currency := True                    ;

   RxMemoryData_Excel.Fields[13].DisplayLabel := 'M/N'                   ;
   RxMemoryData_Excel.Fields[13].Name := RxMemoryData_Excel.Fields[13].FieldName  ;
   RxMemoryData_Excel.Fields[14].DisplayLabel := 'Cant.'                ;
   RxMemoryData_Excel.Fields[14].Name := RxMemoryData_Excel.Fields[14].FieldName  ;
   //   RxMemoryData_Excel.Fields[14].currency := True                       ;
   RxMemoryData_Excel.Fields[15].DisplayLabel := 'M/N' ;
   RxMemoryData_Excel.Fields[15].Name := RxMemoryData_Excel.Fields[15].FieldName  ;

   RxMemoryData_Excel.Fields[16].DisplayLabel := 'Cant.' ;
   RxMemoryData_Excel.Fields[16].Name := RxMemoryData_Excel.Fields[16].FieldName  ;
 //  RxMemoryData_Excel.Fields[16].currency := True                    ;
   RxMemoryData_Excel.Fields[17].DisplayLabel := 'Valor'                     ;
   RxMemoryData_Excel.Fields[17].Name := RxMemoryData_Excel.Fields[17].FieldName  ;
//   RxMemoryData_Excel.Fields[17].currency := True                            ;
   RxMemoryData_Excel.Fields[18].DisplayLabel := 'Fecha' ;
   RxMemoryData_Excel.Fields[18].Name := RxMemoryData_Excel.Fields[18].FieldName  ;
   RxMemoryData_Excel.Fields[19].DisplayLabel := 'Fatura'                   ;
   RxMemoryData_Excel.Fields[19].Name := RxMemoryData_Excel.Fields[19].FieldName  ;

   RxMemoryData_Excel.Fields[20].DisplayLabel := 'ETA Cuba' ;
   RxMemoryData_Excel.Fields[20].Name := RxMemoryData_Excel.Fields[20].FieldName  ;
   RxMemoryData_Excel.Fields[21].DisplayLabel := 'Observações'                 ;
   RxMemoryData_Excel.Fields[21].Name := RxMemoryData_Excel.Fields[21].FieldName  ;

  }

//    RxMemoryData_Excel.FieldDefs.Add('OBS',ftString	,15,false);   // : TIBStringField;

//    27/07/2012
//    RxMemoryData_Excel.Close  ;
//    RxMemoryData_Excel.MasterFields := 'LINHA';
//    RxMemoryData_Excel.Open;
//    RxMemoryData_Excel_DT.Open;
//    RxMemData_tmp
//    RxMemData_tmp.MasterFields := 'LINHA';
//    RxMemData_tmp.Open;

    DS_EXCEL.DataSet := RxMemoryData_Excel ;
    DS_EXCEL_DT.DataSet := RxMemoryData_Excel_DT ;
    RxMemoryData_Excel_DT.MasterSource := DS_EXCEL ;
    RxMemoryData_Excel_DT.IndexFieldNames := 'CONTRATO' ;
    RxMemoryData_Excel_DT.MasterFields    := 'CONTRATO' ;

    DS_TMP.DataSet :=  RxMemData_tmp ;
    DS_DCERBO_L.DataSet := DCERBO_L ;
    DS_DCERBO_L_DET.DataSet := DCERBO_L_DET ;
    DCERBO_L_DET.DataSource := DS_DCERBO_L ;
    frDBDataSet1. DataSet := RxMemoryData_Excel ;
    frDBDataSet2.DataSet := RxMemoryData_Excel_DT ;



end;

procedure TFormInforme.BitB_FiltroClick(Sender: TObject);
VAR
  S_CLICOD, S_FILTRO_CERBO , S_FILTRO , S_DIVCOD ,  S_EMBARQUE_CERBO , S_Contrato_VALORSCCTOTAL ,
  S_Contrato_QUANTIDADETOTAL , S_Total_Pais_CAOMPOS_P1 , S_Total_Pais_CAOMPOS : STRING ;  // , SC_Contrato_princ_v_JA_EXP SC_Contrato_princ_q_JA_EXP : STRING ;

  N_INC  , N_FIN : INTEGER ;
begin

  Screen.Cursor := crHourGlass;
  S_FILTRO := '';
  S_EMBARQUE := '';
  S_EMBARQUE_CERBO := '' ;
  S_Total_Pais_CAOMPOS_P1 := '';

//  SC_Contrato_princ_v_JA_EXP :=  ' ( 0.0 ) / 100 * 100 as ValorTotal_JA_Exp, ' + NOVA_LINHA ;
//  SC_Contrato_princ_Q_JA_EXP :=  ' ( 0.0 ) / 100 * 100 as QUANTTOTAL_JA_EXP, ' + NOVA_LINHA ;
  S_Contrato_QUANTIDADETOTAL := SC_Contrato_QUANTIDADETOTAL ;
  S_Contrato_VALORSCCTOTAL   := SC_Contrato_VALORSCCTOTAL ;
  S_Total_Pais_CAOMPOS       := SC_Total_Pais_CAOMPOS ;
  Caption := 'INFORMES';

  /// EMBARQUE INICIO
  IF  XDE_EMB_I.DateValue <> -693594 THEN BEGIN
      S_EMBARQUE := ' ( ExportadoTransito.DATAEMBARQUE >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_EMB_I.DateValue)) + ' ) ' ;
      S_EMBARQUE_CERBO := ' ( CERBO.DATAEMBARQUE >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_EMB_I.DateValue)) + ' ) ' ;

  //    SC_Contrato_princ_v_JA_EXP := SC_Contrato_princ_v_i + ' AND ( ExportadoTransito.DATAEMBARQUE < '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_EMB_I.DateValue)) + ' ) '  +  ' ) / 100 * 100  as ValorTotal_JA_Exp, ' + NOVA_LINHA ;
  //    SC_Contrato_princ_Q_JA_EXP := SC_Contrato_princ_q_i + ' AND ( ExportadoTransito.DATAEMBARQUE < '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_EMB_I.DateValue)) + ' ) '  +  ' ) / 100 * 100  as QUANTTOTAL_JA_EXP, ' + NOVA_LINHA;

      S_Contrato_VALORSCCTOTAL   := '( Informe.VALORSCCTOTAL   - IIF( ' +  SC_Contrato_princ_V_I + ' AND ( ExportadoTransito.DATAEMBARQUE < '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_EMB_I.DateValue))  + ' )) IS NULL ,0 ,'+ SC_Contrato_princ_V_I + ' AND ( ExportadoTransito.DATAEMBARQUE < '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_EMB_I.DateValue))  + ' ))'+')) AS VALORSCCTOTAL,'+                  NOVA_LINHA ;
      S_Contrato_QUANTIDADETOTAL := '( Informe.QUANTIDADETOTAL - IIF( ' +  SC_Contrato_princ_q_i + ' AND ( ExportadoTransito.DATAEMBARQUE < '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_EMB_I.DateValue))  + ' )) IS NULL ,0 ,'+ SC_Contrato_princ_q_i + ' AND ( ExportadoTransito.DATAEMBARQUE < '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_EMB_I.DateValue))  + ' ))'+')) AS QUANTIDADETOTAL,'+                  NOVA_LINHA ;
      S_Total_Pais_CAOMPOS_P1 :=
                 S_Contrato_VALORSCCTOTAL +
                 S_Contrato_QUANTIDADETOTAL ;
//      '          (Informe.QUANTIDADETOTAL) AS QUANTIDADETOTAL ,'+ NOVA_LINHA +
//      '          (Informe.VALORSCCTOTAL) AS VALORSCCTOTAL,'+ NOVA_LINHA +
//      '          (Informe.QUANTTOTALEXP) AS QUANTTOTALEXP,'+ NOVA_LINHA +
//      '          (Informe.ValorTotalExp) AS ValorTotalExp'+ NOVA_LINHA ;



  END;

  IF  XDE_EMB_F.DateValue <> -693594 THEN BEGIN
      IF  S_EMBARQUE = '' THEN BEGIN
          S_EMBARQUE := ' ( ExportadoTransito.DATAEMBARQUE <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_EMB_F.DateValue)) + ' ) ';
          S_EMBARQUE_CERBO :=  ' ( CERBO.DATAEMBARQUE <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_EMB_F.DateValue)) + ' ) ';

      END
      ELSE BEGIN
          S_EMBARQUE := S_EMBARQUE + ' AND ( ExportadoTransito.DATAEMBARQUE <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_EMB_F.DateValue)) + ' ) ' ;
          S_EMBARQUE_CERBO := S_EMBARQUE_CERBO + ' AND ( CERBO.DATAEMBARQUE <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_EMB_F.DateValue)) + ' ) ';

      END;
  END;

  IF S_EMBARQUE <> '' THEN  BEGIN
     S_EMBARQUE := ' AND '+ S_EMBARQUE ;
  END;

  /// EMBARQUE FIM     /* and  ( ExportadoTransito.DATAEMBARQUE is not null   ) */


{  antes do dis 24/102012
  // modificacao para aatender o requizito do relatorioem relacao o cadasatro de produtos
  /// CADASTRO INICIO
  IF  XDE_Periodo_I.DateValue <> -693594 THEN BEGIN
      S_FILTRO := ' ( Informe.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_Periodo_I.DateValue))  + ' ) ' ;
      S_FILTRO_CERBO := ' ( CONTRATOTRANSPORTE.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_Periodo_I.DateValue)) + ' ) '  ;
  END;
  IF  XDE_Periodo_F.DateValue <> -693594 THEN BEGIN
      IF  S_FILTRO = '' THEN BEGIN
          S_FILTRO := ' ( Informe.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_Periodo_f.DateValue))  + ' ) ' ;
          S_FILTRO_CERBO := ' ( CONTRATOTRANSPORTE.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_Periodo_f.DateValue))  + ' ) ';
      END
      ELSE BEGIN
          S_FILTRO := S_FILTRO + ' AND ( Informe.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_Periodo_f.DateValue))  + ' ) ';
          S_FILTRO_CERBO := S_FILTRO_CERBO + ' AND ( CONTRATOTRANSPORTE.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_Periodo_f.DateValue)) + ' ) ' ;
      END;
  END;
  /// CADASTRO FIM
  }

  /// CADASTRO INICIO  modidifcado 24/10/2012 karina  
  IF  XDE_Periodo_I.DateValue <> -693594 THEN BEGIN
      S_FILTRO := ' ( PRODUTOCONTRATOT.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_Periodo_I.DateValue))  + ' ) ' ;
      S_FILTRO_CERBO := ' ( PRODUTOCONTRATOT.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_Periodo_I.DateValue)) + ' ) '  ;
  END;
  IF  XDE_Periodo_F.DateValue <> -693594 THEN BEGIN
      IF  S_FILTRO = '' THEN BEGIN
          S_FILTRO := ' ( PRODUTOCONTRATOT.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_Periodo_f.DateValue))  + ' ) ' ;
          S_FILTRO_CERBO := ' ( PRODUTOCONTRATOT.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_Periodo_f.DateValue))  + ' ) ';
      END
      ELSE BEGIN
          S_FILTRO := S_FILTRO + ' AND ( PRODUTOCONTRATOT.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_Periodo_f.DateValue))  + ' ) ';
          S_FILTRO_CERBO := S_FILTRO_CERBO + ' AND ( PRODUTOCONTRATOT.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDE_Periodo_f.DateValue)) + ' ) ' ;
      END;
  END;
  /// CADASTRO FIM


  // inicio divisao
  IF Cbox_div_I.Text <> '' THEN BEGIN
     N_INC := POS('<<',Cbox_div_I.Text) + 2   ;
     N_FIN := POS('>>',Cbox_div_I.Text)   ;
     S_CLICOD := COPY( Cbox_div_I.Text, N_INC, N_FIN - N_INC );
     N_INC := POS('[[',Cbox_div_I.Text) + 2   ;
     N_FIN := POS(']]',Cbox_div_I.Text)   ;
     S_DIVCOD := COPY( Cbox_div_I.Text, N_INC, N_FIN - N_INC );

     IF  S_FILTRO = '' THEN BEGIN
         S_FILTRO := ' ( Informe.CLICOD >= '+  ( S_CLICOD  ) + ' ) AND (DIVISOES.SEQ >= '+  ( S_DIVCOD  ) + ' ) ';
         S_FILTRO_CERBO := '( CONTRATOTRANSPORTE.CLICOD >= '+  ( S_CLICOD  ) + ') AND ( DIVISOES.SEQ >= '+  ( S_DIVCOD  )  + ' ) ';
     END
     ELSE BEGIN
         S_FILTRO := S_FILTRO +' AND ( Informe.CLICOD >= '+  ( S_CLICOD ) + ') AND  (DIVISOES.SEQ >= '+  ( S_DIVCOD  )  + ' ) ';
         S_FILTRO_CERBO := S_FILTRO_CERBO +' AND ( CONTRATOTRANSPORTE.CLICOD >= '+  ( S_CLICOD  ) + ') AND ( DIVISOES.SEQ >= '+  ( S_DIVCOD  ) + ' ) ';
     END;
     s_TITULO_div :=  COPY( Cbox_div_I.Text,1, N_INC - 3 );
  END;

  IF Cbox_div_F.Text <> '' THEN BEGIN
     N_INC := POS('<<',Cbox_div_F.Text) + 2   ;
     N_FIN := POS('>>',Cbox_div_F.Text)   ;
     S_CLICOD := COPY( Cbox_div_F.Text, N_INC, N_FIN - N_INC );
     N_INC := POS('[[',Cbox_div_F.Text) + 2   ;
     N_FIN := POS(']]',Cbox_div_F.Text)   ;
     S_DIVCOD := COPY( Cbox_div_F.Text, N_INC, N_FIN - N_INC );

     IF  S_FILTRO = '' THEN BEGIN
         S_FILTRO := ' ( Informe.CLICOD <= '+ S_CLICOD + ') AND  (DIVISOES.SEQ <= '+  ( S_DIVCOD  )  + ' ) ';
         S_FILTRO_CERBO := ' CONTRATOTRANSPORTE.CLICOD <= '+  ( S_CLICOD  ) + ' AND  DIVISOES.SEQ <= '+  ( S_DIVCOD  ) + ' ) ';
     END
     ELSE BEGIN
         S_FILTRO := S_FILTRO +' AND (Informe.CLICOD <= '+ S_CLICOD + ') AND ( DIVISOES.SEQ <= '+  ( S_DIVCOD  )  + ' ) ';
         S_FILTRO_CERBO := S_FILTRO_CERBO +' AND (CONTRATOTRANSPORTE.CLICOD <= '+  ( S_CLICOD  ) + ') AND  (DIVISOES.SEQ <= '+  ( S_DIVCOD  ) + ' ) ';
     END;

     if s_TITULO_div <> '' then
        s_TITULO_div :=  COPY( Cbox_div_F.Text,1, N_INC - 3 );

  END;

  // fim divisao


  IF CBox_Cliente_I.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_Cliente_I.Text) + 2   ;
     N_FIN := POS('<<',CBox_Cliente_I.Text)   ;
     S_CLICOD := COPY( CBox_Cliente_I.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN BEGIN
         S_FILTRO := ' ( Informe.CLICOD >= '+  ( S_CLICOD  )  + ' ) ';
         S_FILTRO_CERBO := '( CONTRATOTRANSPORTE.CLICOD >= '+  ( S_CLICOD  ) + ' ) ';
     END
     ELSE BEGIN
         S_FILTRO := S_FILTRO +' AND ( Informe.CLICOD >= '+  ( S_CLICOD )  + ' ) ' ;
         S_FILTRO_CERBO := S_FILTRO_CERBO +' AND ( CONTRATOTRANSPORTE.CLICOD >= '+  ( S_CLICOD )  + ' ) ' ;
     END;
     s_TITULO_cli :=  COPY( CBox_Cliente_I.Text,1, N_INC - 3  );
  END;

  IF CBox_Cliente_F.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_Cliente_F.Text) + 2   ;
     N_FIN := POS('<<',CBox_Cliente_F.Text)   ;
     S_CLICOD := COPY( CBox_Cliente_F.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN BEGIN
         S_FILTRO := ' ( Informe.CLICOD <= '+ S_CLICOD  + ' ) ' ;
         S_FILTRO_CERBO := ' ( CONTRATOTRANSPORTE.CLICOD <= '+ S_CLICOD  + ' ) ';
     END
     ELSE BEGIN
         S_FILTRO := S_FILTRO +' AND ( Informe.CLICOD <= '+ S_CLICOD   + ' ) ';
         S_FILTRO_CERBO := S_FILTRO_CERBO +' AND ( CONTRATOTRANSPORTE.CLICOD <= '+ S_CLICOD  + ' ) ';
     END;
     if s_TITULO_cli <> '' then
        s_TITULO_cli :=  COPY( CBox_Cliente_F.Text,1, N_INC - 3 );
  END;

  // produto

  IF CBox_produto_I.Text <> '' THEN BEGIN

     IF S_FILTRO = '' THEN BEGIN
        S_FILTRO := '( Informe.NomeMix = '+ AtribuiAspas ( CBox_produto_i.Text  )  + ' ) ';
        S_FILTRO_CERBO := ' ( CONTRATOTRANSPORTE.NomeMix = '+ AtribuiAspas ( CBox_produto_i.Text  ) + ' ) ';
     END
     ELSE BEGIN
        S_FILTRO := S_FILTRO +' AND ( Informe.NomeMix = '+ AtribuiAspas ( CBox_produto_i.Text )  + ' ) ';
        S_FILTRO_CERBO := S_FILTRO_CERBO +' AND ( CONTRATOTRANSPORTE.NomeMix = '+ AtribuiAspas ( CBox_produto_i.Text )  + ' ) ';
     END;

  END;

  // CONTRATO 08/01/2012
  // ESTE FILTRO FOI INCLUIDO PARA FACILITAR O TRABALHO DE PESQUIZA DE PROBLEMA

  IF CBox_contrato.Text <> '' THEN BEGIN

     IF S_FILTRO = '' THEN BEGIN
        S_FILTRO := '( Informe.Contrato= '+ AtribuiAspas ( CBox_contrato.Text  )  + ' ) ';
        S_FILTRO_CERBO := ' ( CONTRATOTRANSPORTE.Contrato = '+ AtribuiAspas ( CBox_contrato.Text  ) + ' ) ';
     END
     ELSE BEGIN
        S_FILTRO := S_FILTRO +' AND ( Informe.Contrato = '+ AtribuiAspas ( CBox_contrato.Text )  + ' ) ';
        S_FILTRO_CERBO := S_FILTRO_CERBO +' AND ( CONTRATOTRANSPORTE.Contrato = '+ AtribuiAspas ( CBox_contrato.Text )  + ' ) ';
     END;

  END;


  // exportador

  IF CBox_Exportador_I.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_Exportador_I.Text) + 2   ;
     N_FIN := POS('<<',CBox_Exportador_I.Text)   ;
     S_CLICOD :=  ( COPY( CBox_Exportador_I.Text, N_INC, N_FIN - N_INC )) ;
     IF S_FILTRO = '' THEN BEGIN
        S_FILTRO := ' ( Informe.FORCOD >= '+ S_CLICOD  + ' ) ';
        S_FILTRO_CERBO := ' ( CONTRATOTRANSPORTE.FORCOD >= '+ S_CLICOD  + ' ) ';
     END
     ELSE BEGIN
        S_FILTRO := S_FILTRO +' AND ( Informe.FORCOD >= '+ S_CLICOD  + ' ) ';
        S_FILTRO_CERBO := S_FILTRO_CERBO +' AND (CONTRATOTRANSPORTE.FORCOD >= '+ S_CLICOD  + ' ) ';
     END;

  END;

  IF CBox_Exportador_F.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_Exportador_f.Text) + 2   ;
     N_FIN := POS('<<',CBox_Exportador_f.Text)   ;
     S_CLICOD :=  ( COPY( CBox_Exportador_f.Text, N_INC, N_FIN - N_INC ) ) ;
     IF  S_FILTRO = '' THEN BEGIN
         S_FILTRO := ' ( Informe.FORCOD <= '+ S_CLICOD  + ' ) ';
         S_FILTRO_CERBO := '( CONTRATOTRANSPORTE.FORCOD <= '+ S_CLICOD  + ' ) ';
     END
     ELSE BEGIN
         S_FILTRO := S_FILTRO +' AND ( Informe.FORCOD <= '+ S_CLICOD  + ' ) ';
         S_FILTRO_CERBO := S_FILTRO_CERBO +' AND (CONTRATOTRANSPORTE.FORCOD <= '+ S_CLICOD  + ' ) ';
     END;

  END;

  IF S_FILTRO <> '' THEN
     S_SQL_WHERE := '  and ' + S_FILTRO
  ELSE
     S_SQL_WHERE := ' ';

  if  S_Total_Pais_CAOMPOS_P1 <> '' then
      S_Total_Pais_CAOMPOS :=
                 S_Contrato_VALORSCCTOTAL +
                 S_Contrato_QUANTIDADETOTAL +
                 SC_Contrato_princ_q_i + S_EMBARQUE + SC_Contrato_princ_q_f +
                 SC_Contrato_princ_v_i + S_EMBARQUE + SC_Contrato_princ_v_f2 ;

//SC_Total_Pais_CAOMPOS_P1 :=
//                 S_Contrato_VALORSCCTOTAL +
//                 S_Contrato_QUANTIDADETOTAL +
//      '          (Informe.QUANTIDADETOTAL) AS QUANTIDADETOTAL ,'+ NOVA_LINHA +
//      '          (Informe.VALORSCCTOTAL) AS VALORSCCTOTAL,'+ NOVA_LINHA +
//      '          (Informe.QUANTTOTALEXP) AS QUANTTOTALEXP,'+ NOVA_LINHA +
//      '          (Informe.ValorTotalExp) AS ValorTotalExp'+ NOVA_LINHA ;





  IBQProduto.Close;
  IBQProduto.sql.clear;
  IBQProduto.sql.Add(SC_PRODUTOS_princ+SC_PRODUTOS_where + S_SQL_WHERE + S_EMBARQUE + SC_PRODUTOS_order)   ;
  IBQProduto.sql.SaveToFile('_IBQProduto.SQL');
  IBQProduto.Prepare ;
  IBQProduto.Open;
  IBQProduto.Last;
  IBQProduto.First;


  IBQboock.Close;
  IBQboock.sql.clear ;
  IBQboock.sql.Add( SC_Boocking_princ  +   SC_Boocking_where + S_SQL_WHERE +SC_Boocking_order )  ;
  IBQboock.sql.SaveToFile('_IBQboock.SQL');
  IBQboock.Prepare ;
  IBQboock.Open;
  IBQboock.Last;
  IBQboock.First;

  IBQExportado.Close;
  IBQExportado.sql.clear ;
  IBQExportado.sql.Add( SC_ExportadoTransito_princ  +   SC_ExportadoTransito_where + S_SQL_WHERE + S_EMBARQUE +SC_ExportadoTransito_order )    ;
  IBQExportado.sql.SaveToFile('_IBQExportado.SQL');
  IBQExportado.Prepare ;
  IBQExportado.Open;
  IBQExportado.Last;
  IBQExportado.First;

  Caption_GrupBox;
  Caption_GrupBox ;

  IF S_FILTRO_CERBO <> '' THEN  BEGIN
     if S_EMBARQUE_CERBO <> ''  then
        S_EMBARQUE_CERBO := ' AND '+ S_EMBARQUE_CERBO  ;
  END;


  DCERBO_TMP.CLOSE;
  DCERBO_TMP.SqlPrincipal.Clear   ;
  DCERBO_TMP.SqlPrincipal.Add( SC_CERBO_TEMP );
  DCERBO_TMP.FiltroExtra.CLEAR ;
  DCERBO_TMP.FiltroExtra.Add( SC_CERBO_TEMP_RELACIONAMENTO );
  DCERBO_TMP.Filtro.Clear ;
  DCERBO_TMP.Filtro.Add(S_FILTRO_CERBO + S_EMBARQUE_CERBO )  ;
  DCERBO_TMP.SQL.SaveToFile('DCERBO_TMP.SQL');

  DCERBO_TMP.AtualizaSql(FALSE) ;



  DCERBO_TMP.Open;
  DCERBO_TMP.Last;
  DCERBO_TMP.First;

// SC_CERBO_INICI + ' WHERE ' + SC_CERBO_ORDE
   DCERBO_L.Close;
   DCERBO_L.SQL.Clear ;
   if (S_FILTRO_CERBO <> '') OR ( S_EMBARQUE_CERBO <> '' )  then
       DCERBO_L.SQL.Add(SC_CERBO_INICI + ' WHERE ' + S_FILTRO_CERBO + S_EMBARQUE_CERBO + SC_CERBO_ORDE)
   else
       DCERBO_L.SQL.Add(SC_CERBO_INICI + '  ' + S_FILTRO_CERBO + S_EMBARQUE_CERBO + SC_CERBO_ORDE) ;

   DCERBO_L.SQL.SaveToFile('_DCERBO_L.SQL');
   DCERBO_L.Prepare ;
   DCERBO_L.Open ;

   DCERBO_L_DET.Close;
   DCERBO_L_DET.SQL.Clear ;
   if (S_FILTRO_CERBO <> '') OR ( S_EMBARQUE_CERBO <> '' )  then
      DCERBO_L_DET.SQL.Add(SC_CERBO_DET_INICI + ' AND ' + S_FILTRO_CERBO + S_EMBARQUE_CERBO + SC_CERBO_ORDE + ', CERBO.DataEmbarque' )
   else
      DCERBO_L_DET.SQL.Add(SC_CERBO_DET_INICI + '  '    + S_FILTRO_CERBO + S_EMBARQUE_CERBO + SC_CERBO_ORDE + ', CERBO.DataEmbarque' ) ;

   DCERBO_L_DET.SQL.SaveToFile('_DCERBO_L_DET.SQL');
   DCERBO_L_DET.Prepare ;
   DCERBO_L_DET.Open ;

  IBQContratos.Close;
  IBQContratos.sql.clear;
  IBQContratos.sql.Add(SC_Contrato_princ_i + S_Contrato_VALORSCCTOTAL + S_Contrato_QUANTIDADETOTAL + SC_Contrato_QUANTIDADETOTAL_CONTINUA + SC_Contrato_princ_q_i + S_EMBARQUE + SC_Contrato_princ_q_f +
//    SC_Contrato_princ_q_JA_EXP +
    SC_Contrato_princ_v_i + S_EMBARQUE + SC_Contrato_princ_v_f +
//  SC_Contrato_princ_v_JA_EXP +
  SC_Contrato_princ_f  +SC_contrato_where + S_SQL_WHERE + S_EMBARQUE + SC_contrato_order)   ;
  IBQContratos.sql.SaveToFile('_IBQContratos.SQL');
  IBQContratos.Prepare ;
  IBQContratos.Open;
  IBQContratos.Last;
  IBQContratos.First;


  IBQuery_Total_Pais.Close;
  IBQuery_Total_Pais.sql.clear;
  IBQuery_Total_Pais.sql.Add(SC_Total_Pais_Inicio + S_Total_Pais_CAOMPOS + SC_Total_Pais_Inicio2 + SC_Total_Pais_where + S_SQL_WHERE + S_EMBARQUE + SC_Total_Pais_Final)   ;
  IBQuery_Total_Pais.sql.SaveToFile('_IBQuery_Total_Pais.sql');
  IBQuery_Total_Pais.Prepare ;
  IBQuery_Total_Pais.Open;
  IBQuery_Total_Pais.Last;
  IBQuery_Total_Pais.First;

  Screen.Cursor := crDefault;


end;


procedure TFormInforme.BitBtn3Click(Sender: TObject);
var
 S_NOMEMIX , S_SDATAEMBARQUE, stest : string ;
 LINHA,n_reg, tam : INTEGER ;
begin

//  Screen.Cursor := crHourGlass;
  BitB_FiltroClick( Sender ) ;
  Screen.Cursor := crHourGlass;
//  27/07/2012
//  RxMemData_tmp.First;
//  while not RxMemData_tmp.eof  do begin
//      RxMemData_tmp.Delete ;
//  end ;
  RxMemData_tmp.EmptyDataSet ;
  RxMemoryData_Excel_DT.EmptyDataSet ;
  RxMemoryData_Excel.EmptyDataSet ;

//  Screen.Cursor := crHourGlass;
  // apaga os registros anteriores
  {
  RxMemoryData_Excel.First;
  while not RxMemoryData_Excel.eof  do begin
      N_REG := RxMemoryData_Excel_DT.RecordCount ;
      RxMemoryData_Excel_DT.First;
      while not RxMemoryData_Excel_DT.eof  do begin
          RxMemoryData_Excel_DT.Delete ;
      end ;
      RxMemoryData_Excel.Delete ;
  end ;
  }

  LINHA := 0;

  while not IBQContratos.Eof do begin
     RxMemoryData_Excel.Append ;
     LINHA := LINHA + 1   ;
     RxMemoryData_Excel.FieldByName('LINHA').Value:= LINHA ;
     RxMemoryData_Excel.FieldByName('CONTRATO').Value:= IBQContratosCONTRATO.Value ; 	  // : TIBStringField;
     RxMemoryData_Excel.FieldByName('NOMEMIX').Value:= IBQContratosNOMEMIX.Value ;	  // : TIBStringField;
     RxMemoryData_Excel.FieldByName('RAZAO').Value:= IBQContratosRAZAO.Value ;	  // : TIBStringField;
     RxMemoryData_Excel.FieldByName('NOME').Value:= IBQContratosNOME.Value ;	  // : TIBStringField;
     RxMemoryData_Excel.FieldByName('C_C').Value:= IBQContratosC_C.Value ;	  // : TIBStringField;

     RxMemoryData_Excel.FieldByName('FORMPAGO').Value:= IBQContratosFORMPAGO.Value ;	  // : TIBStringField;

     // campo de formpago
{
    if ( not IBQContratosFORMPAGO.IsNull ) and (IBQContratosFORMPAGO.Value <> '') then begin
        stest := IBQContratosFORMPAGO.Value;
        tam := length( stest ) ;
        tam := tam + 1;
        if (IBQContratosFORMPAGO.Value <> '' ) then
           RxMemoryData_Excel.FieldByName('FORMPAGO').VALUE  := IBQContratosFORMPAGO.Value   // ; // RxMemData_tmp.FieldByName('FORMPAGO').VALUE
        else
           RxMemoryData_Excel.FieldByName('FORMPAGO').VALUE  := '___' ; // RxMemData_tmp.FieldByName('FORMPAGO').VALUE;
     end
     else

        RxMemoryData_Excel.FieldByName('FORMPAGO').VALUE  := '___' ; // RxMemData_tmp.FieldByName('FORMPAGO').VALUE;
}


     RxMemoryData_Excel.FieldByName('QUANTIDADETOTAL').Value:= IBQContratosQUANTIDADETOTAL.Value ;  // : TFloatField;
     RxMemoryData_Excel.FieldByName('SDATAEMBARQUE').Value:= IBQContratosSDATAEMBARQUE.Value ;  // : TIB:=StringField;
     // NAO EXISTE O PRECO FOB TOTAL
     RxMemoryData_Excel.FieldByName('PRECOFOB').Value:= IBQContratosPRECOFOB.Value ;  // : TFl:=oatField;
     RxMemoryData_Excel.FieldByName('PRECOFOBTOTAL').Value:= IBQContratosPRECOFOB.Value ; // IBQContratosPRECOFOBTOTAL.Value ;  // : TFloatField;
     RxMemoryData_Excel.FieldByName('PRECOSCC').Value:= IBQContratosPRECOSCC.Value ;  // : TFloatField;
     RxMemoryData_Excel.FieldByName('VALORSCCTOTAL').Value:=  IBQContratosVALORSCCTOTAL.Value ;  // : TFloatField;
     // 19/04/2012
//     IBQContratos.FieldByName('QUANTTOTAL_JA_EXP').IsNull
//     IF not IBQContratos.FieldByName('QUANTTOTAL_JA_EXP').IsNull  then
//        RxMemoryData_Excel.FieldByName('QUANTIDADEEXP').Value:=  IBQContratosQUANTTOTALEXP.Value  - IBQContratos.FieldByName('QUANTTOTAL_JA_EXP').Value // IBQContratosQUANTTOTAL_JA_EXP.AsFloat  // : TFloatField;
//     else
//        RxMemoryData_Excel.FieldByName('QUANTIDADEEXP').Value:=  IBQContratosQUANTTOTALEXP.Value  ; //- IBQContratos.FieldByName('QUANTTOTAL_JA_EXP').Value ; // : TFloatField;


//     IF not IBQContratosQUANTTOTAL_JA_EXP.IsNull  then
//        RxMemoryData_Excel.FieldByName('QUANTIDADEEXP').Value:=  IBQContratosQUANTTOTALEXP.Value  - IBQContratosQUANTTOTAL_JA_EXP.AsFloat  // : TFloatField;
//     else
        RxMemoryData_Excel.FieldByName('QUANTIDADEEXP').Value:=  IBQContratosQUANTTOTALEXP.Value  ; //- IBQContratos.FieldByName('QUANTTOTAL_JA_EXP').Value ; // : TFloatField;

//     IF not IBQContratosVALORTOTAL_JA_EXP.IsNull THEN
//        RxMemoryData_Excel.FieldByName('VALOR').Value:=  IBQContratosVALORTOTALEXP.Value  - IBQContratosVALORTOTAL_JA_EXP.AsCurrency  // : TFloatField;
//     else
        RxMemoryData_Excel.FieldByName('VALOR').Value:=  IBQContratosVALORTOTALEXP.Value ; // - IBQContratos.FieldByName('VALORTOTAL_JA_EXP').Value ; // : TFloatField;

     RxMemoryData_Excel.FieldByName('DIVISAO').Value:=  IBQContratosNOMEDIV.Value ; // : TFloatField;
     RxMemoryData_Excel.FieldByName('QUANTIDADE').Value:= IBQContratosQUANTIDADE.Value ; //: TFloatField;
     RxMemoryData_Excel.Post ;

     S_NOMEMIX := IBQContratosNOMEMIX.Value ;
     S_SDATAEMBARQUE := IBQContratosSDATAEMBARQUE.Value ;

     IBQProduto.Last ;
     IBQProduto.First;

     n_reg := IBQProduto.RecordCount ;
     while ( not IBQProduto.eof ) AND ( n_reg > 1 ) do begin
         RxMemData_tmp.Append ;
         LINHA := LINHA + 1   ;
         RxMemData_tmp.FieldByName('LINHA').Value:= LINHA ;
         RxMemData_tmp.FieldByName('CONTRATO').Value:= IBQProdutoCONTRATO.Value ; 	  // : TIBStringField;
         RxMemData_tmp.FieldByName('NOMEMIX').Value:= IBQProdutoNOMEMIX.Value ;	  // : TIBStringField;
         RxMemData_tmp.FieldByName('RAZAO').Value:= IBQProdutoRAZAO.Value ;	  // : TIBStringField;
         RxMemData_tmp.FieldByName('NOME').Value:= IBQProdutoNOME.Value ;	  // : TIBStringField;
         RxMemData_tmp.FieldByName('C_C').Value:= IBQProdutoC_C.Value ;	  // : TIBStringField;
         RxMemData_tmp.FieldByName('FORMPAGO').Value:= TRIM( IBQProdutoFORMPAGO.Value ) ;
        // if IBQProdutoFORMPAGO.is
        {
         if not IBQProdutoFORMPAGO.isnull then
            RxMemData_tmp.FieldByName('FORMPAGO').Value:= TRIM( IBQProdutoFORMPAGO.Value ) 	  // : TIBStringField;
         else
            RxMemData_tmp.FieldByName('FORMPAGO').Value:= '___' ;	  // : TIBStringField;
         }

         RxMemData_tmp.FieldByName('QUANTIDADETOTAL').Value:= IBQProdutoQUANTIDADETOTAL.Value ;  // : TFloatField;
         RxMemData_tmp.FieldByName('SDATAEMBARQUE').Value:= IBQProdutoSDATAEMBARQUE.Value ;  // : TIB:=StringField;
         RxMemData_tmp.FieldByName('PRECOFOB').Value:= IBQProdutoPRECOFOB.Value ;  // : TFl:=oatField;
         RxMemData_tmp.FieldByName('PRECOFOBTOTAL').Value:= IBQProdutoPRECOFOB.Value ; // IBQProdutoPRECOFOBTOTAL.Value ;  // : TFloatField;
         RxMemData_tmp.FieldByName('PRECOSCC').Value:= IBQProdutoPRECOSCC.Value ;  // : TFloatField;
         RxMemData_tmp.FieldByName('VALORSCCTOTAL').Value:= IBQProdutoVALORSCCTOTAL.Value ;  // : TFloatField;
         RxMemData_tmp.Post ;
         IBQProduto.Next ;
     end;


     if IBQExportado.RecordCount > IBQboock.RecordCount then begin
        RxMemData_tmp.First ;
        n_reg := IBQExportado.RecordCount ;
        while not IBQExportado.Eof do begin
           if RxMemData_tmp.Eof  then  BEGIN
              RxMemData_tmp.APPEND  ;
              LINHA := LINHA + 1   ;
              RxMemData_tmp.FieldByName('LINHA').Value:= LINHA ;
           END
           else
              RxMemData_tmp.Edit ;

           RxMemData_tmp.FieldByName('CONTRATO').Value:= IBQExportadoCONTRATO.Value ; 	  // : TIBStringField;
           RxMemData_tmp.FieldByName('NAVIO').Value:=  IBQExportadoNAVIO.Value ; // : TIBStringField;
           RxMemData_tmp.FieldByName('QUANTIDADEEXP').Value:=  IBQExportadoQUANTIDADEEXP.Value ; // : TFloatField;
           RxMemData_tmp.FieldByName('VALOR').Value:=  IBQExportadoVALOR.Value ; // : TFloatField;
           RxMemData_tmp.FieldByName('DATAEMBARQUE').Value:=  IBQExportadoDATAEMBARQUE.Value ; // : TDateTimeField;
           RxMemData_tmp.FieldByName('FATURA').Value:=  IBQExportadoFATURA.Value ; // : TIBStringField;
           RxMemData_tmp.FieldByName('ETADESTINO').Value:=  IBQExportadoETADESTINO.Value ; // : TDateTimeField;
           RxMemData_tmp.FieldByName('OBS').Value:=  IBQExportadoOBS.Value ; // : TIBStringField;
           RxMemData_tmp.Post;
           RxMemData_tmp.NEXT ;
           IBQExportado.Next ;
        end;

        // tratando boockiado
        RxMemData_tmp.First ;
        n_reg := IBQExportado.RecordCount ;
        while not IBQboock.Eof do begin
           if RxMemData_tmp.Eof  then BEGIN
              RxMemData_tmp.Append ;
              LINHA := LINHA + 1  ;
              RxMemData_tmp.FieldByName('LINHA').Value:= LINHA ;
           END
           else
              RxMemData_tmp.Edit ;

           RxMemData_tmp.FieldByName('NAVIO_BOOCK').Value:= IBQboockNAVIO_BOOCK.Value ; //: TIBStringField;
           RxMemData_tmp.FieldByName('QUANTIDADE').Value:= IBQboockQUANTIDADE.Value ; //: TFloatField;
           RxMemData_tmp.Post;
           RxMemData_tmp.NEXT ;
           IBQboock.Next ;
        end;
     end
     else begin
        // tratando boockiado
        RxMemData_tmp.First ;

        n_reg := IBQboock.RecordCount ;
        while not IBQboock.Eof do begin
           if RxMemData_tmp.Eof  then   BEGIN
              RxMemData_tmp.Append    ;
              LINHA := LINHA + 1  ;
              RxMemData_tmp.FieldByName('LINHA').Value:= LINHA ;
           END
           else
              RxMemData_tmp.Edit ;

           RxMemData_tmp.FieldByName('CONTRATO').Value:= IBQboockCONTRATO.Value ; 	  // : TIBStringField;
           RxMemData_tmp.FieldByName('NAVIO_BOOCK').Value:= IBQboockNAVIO_BOOCK.Value ; //: TIBStringField;
           RxMemData_tmp.FieldByName('QUANTIDADE').Value:= IBQboockQUANTIDADE.Value ; //: TFloatField;
           RxMemData_tmp.Post;
           RxMemData_tmp.NEXT ;
           IBQboock.Next ;
        end;
        RxMemData_tmp.First ;

        // tratando exportado
        n_reg := IBQExportado.RecordCount ;
        while not IBQExportado.Eof do  begin

           if RxMemData_tmp.Eof  then BEGIN
              RxMemData_tmp.Append    ;
              LINHA := LINHA + 1 ;
              RxMemData_tmp.FieldByName('LINHA').Value:= LINHA ;
           END
           else
              RxMemData_tmp.Edit ;

           RxMemData_tmp.FieldByName('CONTRATO').Value:= IBQExportadoCONTRATO.Value ; 	  // : TIBStringField;
           RxMemData_tmp.FieldByName('NAVIO').Value:=  IBQExportadoNAVIO.Value ; // : TIBStringField;
           RxMemData_tmp.FieldByName('QUANTIDADEEXP').Value:=  IBQExportadoQUANTIDADEEXP.Value ; // : TFloatField;
           RxMemData_tmp.FieldByName('VALOR').Value:=  IBQExportadoVALOR.Value ; // : TFloatField;
           RxMemData_tmp.FieldByName('DATAEMBARQUE').Value:=  IBQExportadoDATAEMBARQUE.Value ; // : TDateTimeField;
           RxMemData_tmp.FieldByName('FATURA').Value:=  IBQExportadoFATURA.Value ; // : TIBStringField;
           RxMemData_tmp.FieldByName('ETADESTINO').Value:=  IBQExportadoETADESTINO.Value ; // : TDateTimeField;
           RxMemData_tmp.FieldByName('OBS').Value:=  IBQExportadoOBS.Value ; // : TIBStringField;
           RxMemData_tmp.Post;
           RxMemData_tmp.NEXT ;
           IBQExportado.Next ;
        end;

     end;
     IBQContratos.Next ;
     copy_dados ;
  end;
  // 27/07/2012
  RxMemoryData_Excel.SaveToFile('teste_DADOS.xml',dfXML);
  RxMemoryData_Excel_DT.SaveToFile('teste_DT_DADOS.xml',dfXML);

  Screen.Cursor := crDefault;
end;

procedure TFormInforme.copy_dados;
var
 N_REG : integer ;
begin
  // copia os registras da tabela temporaria     para tabela principal
  RxMemData_tmp.First;
  while not RxMemData_tmp.eof  do begin
      RxMemoryData_Excel_DT.Append ;

      //
      //RxMemoryData_Excel_DT.FieldByName('LINHA').
      //

      RxMemoryData_Excel_DT.FieldByName('LINHA').VALUE            :=  RxMemData_tmp.FieldByName('LINHA').VALUE;
      RxMemoryData_Excel_DT.FieldByName('CONTRATO').VALUE         :=  RxMemData_tmp.FieldByName('CONTRATO').VALUE;
      RxMemoryData_Excel_DT.FieldByName('NOMEMIX').VALUE          :=  RxMemData_tmp.FieldByName('NOMEMIX').VALUE;
      RxMemoryData_Excel_DT.FieldByName('RAZAO').VALUE            :=  RxMemData_tmp.FieldByName('RAZAO').VALUE;
      RxMemoryData_Excel_DT.FieldByName('NOME').VALUE             :=  RxMemData_tmp.FieldByName('NOME').VALUE;
      RxMemoryData_Excel_DT.FieldByName('C_C').VALUE              :=  RxMemData_tmp.FieldByName('C_C').VALUE;
      RxMemoryData_Excel_DT.FieldByName('FORMPAGO').VALUE         :=  RxMemData_tmp.FieldByName('FORMPAGO').VALUE ;
      {
      if not RxMemData_tmp.FieldByName('FORMPAGO').IsNull then
         RxMemoryData_Excel_DT.FieldByName('FORMPAGO').VALUE         :=  RxMemData_tmp.FieldByName('FORMPAGO').VALUE
      else
         RxMemoryData_Excel_DT.FieldByName('FORMPAGO').VALUE         := '___' ; // RxMemData_tmp.FieldByName('FORMPAGO').VALUE;
      }
      RxMemoryData_Excel_DT.FieldByName('QUANTIDADETOTAL').VALUE  :=  RxMemData_tmp.FieldByName('QUANTIDADETOTAL').VALUE;
      RxMemoryData_Excel_DT.FieldByName('SDATAEMBARQUE').VALUE    :=  RxMemData_tmp.FieldByName('SDATAEMBARQUE').VALUE;
      RxMemoryData_Excel_DT.FieldByName('PRECOFOB').VALUE         :=  RxMemData_tmp.FieldByName('PRECOFOB').VALUE;
      RxMemoryData_Excel_DT.FieldByName('PRECOFOBTOTAL').VALUE    :=  RxMemData_tmp.FieldByName('PRECOFOBTOTAL').VALUE;
      RxMemoryData_Excel_DT.FieldByName('PRECOSCC').VALUE         :=  RxMemData_tmp.FieldByName('PRECOSCC').VALUE;
      RxMemoryData_Excel_DT.FieldByName('VALORSCCTOTAL').VALUE    :=  RxMemData_tmp.FieldByName('VALORSCCTOTAL').VALUE;
      // NAVIO_BUQ
      // RxMemoryData_Excel.FieldByName('NAVIO_BOOCK').VALUE      :=  RxMemData_tmp.FieldByName('NAVIO_BOOCK').VALUE;
      // 27/07/2012
      RxMemoryData_Excel_DT.FieldByName('NAVIO_BUQ').VALUE        :=  RxMemData_tmp.FieldByName('NAVIO_BOOCK').VALUE;
      //RxMemoryData_Excel_DT.FieldByName('NAVIO_BOOCK').VALUE      :=  RxMemData_tmp.FieldByName('NAVIO_BOOCK').VALUE;
      RxMemoryData_Excel_DT.FieldByName('QUANTIDADE').VALUE       :=  RxMemData_tmp.FieldByName('QUANTIDADE').VALUE;
      RxMemoryData_Excel_DT.FieldByName('NAVIO').VALUE            :=  RxMemData_tmp.FieldByName('NAVIO').VALUE;
      RxMemoryData_Excel_DT.FieldByName('QUANTIDADEEXP').VALUE    :=  RxMemData_tmp.FieldByName('QUANTIDADEEXP').VALUE;
      RxMemoryData_Excel_DT.FieldByName('VALOR').VALUE            :=  RxMemData_tmp.FieldByName('VALOR').VALUE;
      RxMemoryData_Excel_DT.FieldByName('DATAEMBARQUE').VALUE     :=  RxMemData_tmp.FieldByName('DATAEMBARQUE').VALUE;
      RxMemoryData_Excel_DT.FieldByName('FATURA').VALUE           :=  RxMemData_tmp.FieldByName('FATURA').VALUE;
      RxMemoryData_Excel_DT.FieldByName('ETADESTINO').VALUE       :=  RxMemData_tmp.FieldByName('ETADESTINO').VALUE;
      RxMemoryData_Excel_DT.FieldByName('OBS').VALUE              :=  RxMemData_tmp.FieldByName('OBS').VALUE;

      N_REG := RxMemData_tmp.RecordCount ;

      RxMemoryData_Excel_DT.Post ;
      RxMemData_tmp.Next ;
  end ;
  // deleta os dados da tabela temporaria
  // 27/07/2012
  //RxMemData_tmp.First;
  //while not RxMemData_tmp.eof  do begin
  //    RxMemData_tmp.Delete ;
  //end ;
  RxMemData_tmp.EmptyDataSet ;
end;

procedure TFormInforme.DS_ContratoDataChange(Sender: TObject;
  Field: TField);
var
  s_sql : string ;
begin
  IF IBQContratos.RecordCount > 0 THEN BEGIN
     s_sql := ' and Informe.Contrato = '+ AtribuiAspas ( IBQContratos.FieldValues['Contrato'] ) ;
     IBQProduto.Close;
     IBQProduto.sql.clear;
     IBQProduto.sql.Add(SC_PRODUTOS_princ+SC_PRODUTOS_where + S_SQL_WHERE + S_EMBARQUE + s_sql + SC_PRODUTOS_order)   ;
     IBQProduto.sql.SaveToFile('_IBQProduto.sql');
     IBQProduto.Open;
     IBQProduto.Last ;
     IBQProduto.First;

     IBQboock.Close;
     IBQboock.sql.clear ;
     IBQboock.sql.Add( SC_Boocking_princ  +   SC_Boocking_where + S_SQL_WHERE + s_sql +SC_Boocking_order )  ;
     IBQboock.sql.SaveToFile('_IBQboock.sql');
     IBQboock.Open;
     IBQboock.Last ;
     IBQboock.First;

     IBQExportado.Close;
     IBQExportado.sql.clear ;
     IBQExportado.sql.Add( SC_ExportadoTransito_princ  +   SC_ExportadoTransito_where + S_SQL_WHERE + S_EMBARQUE + s_sql  +SC_ExportadoTransito_order )    ;
     IBQExportado.SQL.SaveToFile('_IBQExportado.sql');
     IBQExportado.Open;
     IBQExportado.Last ;
     IBQExportado.First;

     Caption_GrupBox;

   END;
end;


procedure TFormInforme.Caption_GrupBox;
begin
  GroupB_contrato.Caption    := 'Contrato Número de Linhas = '  + inttostr(IBQContratos.RecordCount )     ;
  GroupBox_Exportado.Caption := 'Exportado Número de Linhas = ' + inttostr(IBQExportado.RecordCount)  ;
  GroupBox_Prod.Caption      := 'Produtos Número de Linhas= '  + inttostr(IBQProduto.RecordCount)  ;
  GroupBox_Boock.Caption     := 'Boock Número de Linhas = '     + inttostr(IBQboock.RecordCount) ;
end;

procedure TFormInforme.BtnVisualizarClick(Sender: TObject);
begin
InicializaVariaveis;
if RxMemoryData_Excel.RecordCount > 0 then begin
   frDBDataSet1.DataSet := RxMemoryData_Excel;
//   RxMemoryData_Excel.SaveToFile('teste_DADOS2.xml',dfXML);
//   RxMemoryData_Excel_DT.SaveToFile('teste_DT_DADOS3.xml',dfXML);
   frReport.ShowReport ;
   end
else
   MessageDlg('Não existem Registros Selecionados !',mtError,[mbOk],0);

end;

// NOVO_MENU
procedure TFormInforme.MenuItem1Click(Sender: TObject);
begin
  Ed_Filtrar(DCERBO_TMP, FormInforme, DBGrid_CERBO);
  StatusTabela;

end;

procedure TFormInforme.MenuItem2Click(Sender: TObject);
begin
  Ed_Ordenar(DCERBO_TMP, FormInforme, DBGrid_CERBO);
  StatusTabela;
end;

procedure TFormInforme.MenuItem3Click(Sender: TObject);
begin
  Ed_OrdenarComposto(DCERBO_TMP, FormInforme, DBGrid_CERBO);
  StatusTabela;
end;

procedure TFormInforme.MenuItem5Click(Sender: TObject);
begin
  Ed_ApagarColuna(DCERBO_TMP, FormInforme, DBGrid_CERBO);
end;

procedure TFormInforme.MenuItem7Click(Sender: TObject);
begin
  Ed_Quantificar(DCERBO_TMP, FormInforme, DBGrid_CERBO);
end;

procedure TFormInforme.MenuItem8Click(Sender: TObject);
begin
  Ed_TotalizarColuna(DCERBO_TMP, FormInforme, DBGrid_CERBO);
end;

procedure TFormInforme.MenuItem9Click(Sender: TObject);
begin
  Ed_CalcularMedia(DCERBO_TMP, FormInforme, DBGrid_CERBO);
end;

procedure TFormInforme.MenuItem11Click(Sender: TObject);
begin
  Ed_Imprimir(DCERBO_TMP, FormInforme, DBGrid_CERBO, DS_CERBO);
end;

procedure TFormInforme.BitBtn4Click(Sender: TObject);
begin

DCERBO_L.Last ;
DCERBO_L.First;


InicializaVariaveis ;

if DCERBO_L.RecordCount > 0 then begin
   frReport_comissao.ShowReport ;
end
else
   MessageDlg('Não existem Registros Selecionados !',mtError,[mbOk],0);
   
end;

procedure TFormInforme.InicializaVariaveis;
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
  frVariables['Titulo_1']     := s_TITULO_cli;
  frVariables['Titulo_2']     := s_TITULO_div;
  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);

  if frReport_Comissao.FindObject('Logomarca') <> nil then
     if FileExists(Sistema.LogoUsr) then
        TfrPictureView(frReport_Comissao.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);

end;

procedure TFormInforme.GridConsultaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

    GridConsulta.Canvas.Font.Color:= clBlack;
    GridConsulta.Canvas.Brush.Color :=  RetCorFundo(TabGlobal.DInforme.StatusCT.CONTEUDO) ; // $00FFF4DF;
    GridConsulta.DefaultDrawDataCell(Rect, GridConsulta.columns[datacol].field, State);



end;

procedure TFormInforme.DBGrid_ContratoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

    DBGrid_Contrato.Canvas.Font.Color:= clBlack;
    DBGrid_Contrato.Canvas.Brush.Color :=  RetCorFundo(IBQContratosSTATUSCT.Value) ; // $00FFF4DF;
    DBGrid_Contrato.DefaultDrawDataCell(Rect, DBGrid_Contrato.columns[datacol].field, State);
end;

procedure TFormInforme.DBGrid_CERBODrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  DBGrid_CERBO.Canvas.Font.Color:= clBlack;
  DBGrid_CERBO.Canvas.Brush.Color := RetCorFundo(DCERBO_TMP.StatusCT.Conteudo) ; // $00FFF4DF;
  DBGrid_CERBO.DefaultDrawDataCell(Rect, GridConsulta.columns[datacol].field, State);

end;

end.
