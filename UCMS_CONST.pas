unit UCMS_CONST;

interface

CONST
 NOVA_LINHA = CHR(13)+CHR(10) ;
  // select distinct SUBSTRING( NumFatura from 1 for 4 ) || '/' || SUBSTRING( NumFatura from 5 for 8 ) AS  CAMPOS from  ExportadoTransito WHERE NumFatura IS NOT NULL

 MSG_ConfirmaAtualizaroRATEemtodososregistroselecionados = 'Confirma Atualizar o RATE em todos os registro selecionados' ;
 MSG_ConfirmaAtualizaroNumerodaNotaFiscalemtodososregistroselecionados = 'Confirma Atualizar o N�mero da Nota Fiscal em todos os registro selecionados' ;
 MSG_FILTROTEMQUESERCRIADO = 'Filtro tem que ser criado! ' ;
 MSG_FATURASURIMPEXJACRIADA = 'Fatura surimpex j� criada! ' ;
 MSG_ConfirmaAtualizaroNumerodeFaturaemtodasosregistrosselecionadosjaExportados = 'Confirma Atualizar o N�mero de Fatura em todas os registros selecionados j� Exportados ?' ;
 MSG_ConfirmaGerarFaturasemoRATE  = 'Confirma Gerar Fatura sem o RATE ?' ;
 MSG_ConfirmaExcluirFatura    = 'Confirma Excluir Fatura ?' ;
// MSG_ConfirmaExcluirFatura    = 'Confirma Excluir Fatura ?' ;
 MSG_Exportacaonaopodeserbloqueada    = 'Exporta��o n�o pode ser bloqueada!' ;
 MSG_NaoExistemRegistrosSelecionados  = 'N�o Existem Registros Selecionados';
 MSG_ConfirmaCriarNumerodeFatura = 'Confirma criar N�umero de Fatura';
 MSG_ConfirmaTrocadeSituacao = 'Confirma Troca de Situa��o?';
 // msg de obrigatoriedade do sistema
 
 MSG_RateTemqueSerAtualizado = 'Os Registros tem que ser selecionados' + NOVA_LINHA + ' e o Rate tem que ser Aplicado ! ' ;
 MSG_ONumerodaFaturatemqueestaemBRANCO = 'O N�mero da Fatura tem que esta em BRANCO !' ;
 MSG_ONumerodaFaturatnaopodesergeradoOrdemCobrancacomNFemitido = 'O N�mero da Fatura n�o pode ser gerado Ordem Cobran�a com NF j� emitida ! ';
 MSG_DescontonaopodeserIncluidoFaturaembranco = 'O Desconto n�o pode ser Incluido. '+NOVA_LINHA+'O n�mero da Fatura esta em branco !' ;
 msg_AplicacaoSoPodeSerExecutadaNoMomentoDaFatura = 'Aplicacao s� Pode Ser Executada no Momento de Cria��o da Fatura!' ;
 msg_AplicacaoSoPodeSerExecutadaseExistirnumerodeNF = 'Aplicacao So Pode Ser Executada se Existir numerode NF!';
 MSG_Obotaomodificartemqueseracionado = 'O bot�o modificar tem que ser acionado!'  ;
 MSG_NumeroFaturaEmBranco = 'N�mero Fatura em Branco !'     ;
 MSG_ConfirmaAtualizaroNumerodeNFparaOrdemdeCobranca = 'Confirma Atualizar o N�mero de NF para Ordem de Cobranca? '   ;
 MSG_MoedaInformacaoObrigatoria = 'Moeda � um informa��o Obrigat�ria, n�o pode ser branca ';

 MSG_OsDadosdeTrocaNaoSaoValidos = 'Os Dados de Troca N�o S�o Validos';
 MSG_ONumeroDeContratoNaoExiste = 'O N�mero De Contrato N�o Existe';

 MSG_ONumeroDeContratojaExiste = 'O N�mero De Contrato j� Existe';

 CONT_registros_nAo_foram_selecionados  = ' registros n�o foram selecionados ' ;

 MSG_ConfirmaTroca  = 'Confirma Troca de N�mero de Contrato ?' ;

 MSG_USUARIONAOAUTORIZADO = 'Usuario n�o Autorizado ';
 MSG_trocadeContratoRealizada = 'Troca de N�mero de Contrato Realizada';
 MSG_NaoExisteNumeroFatura = 'N�o Existe N�mero Fatura Surimpex .';
 MSG_NaoExisteNumeroOrdemCobranca = 'N�o Existe N�mero Ordem de Cobran�a Surimpex .';


 S_CONT_REL_COMISSAO = 'REL_COMISSAO';
 S_CONT_REL_ORCAMENT = 'REL_ORCAMENTO';

s_ST_AB  = 'AB' ;     //, 'Aberto');
s_ST_BO  = 'BO' ;     //, 'Boocking');
s_ST_EM  = 'EM' ;     //, 'Em Execu��o ( Exporta��o )');
s_ST_EX  = 'EX' ;     //, 'Execu��o ( Exporta��o Concluida )');
s_ST_CM  = 'CM' ;     //, 'Comiss�es Pendentes');
s_ST_OC  = 'OC' ;     //, 'Ordem Cobran�a');
s_ST_FA  = 'FA' ;     //, 'Fatura Emitida');
s_ST_NF  = 'NF' ;     //, 'Nota Fiscal');
s_ST_OK  = 'OK' ;     //, 'Concluido');
s_ST_PR  = 'PR' ;     //, 'Problema');
                            //       123456789012345678901
s_ST_AB_F  = '0' ;//'AB' ;  // '0', 'Em processamento'      );    //, 'Em processamento');
s_ST_FA_F  = '1' ;//'FA' ;  // '1', 'Fatura Surimpex'       );    //, 'Fatura Surimpex');
s_ST_NF_F  = '2' ;//'NF' ;  // '2', 'NF Emitida'            );    //, 'NF Emitida');
s_ST_OK_F  = '3' ;//'OK' ;  // '3', 'NF Paga'               );    //, 'NF Paga  NF Paga
s_ST_PR_F  = '4' ;//'PR' ;  // '4', 'Protesto'              );    //, 'Protesto');      Protesto
s_ST_CM_F  = '5' ;//'CM' ;  // '5', 'Concilia��o Emitida'   );    //, conciliacao emitida cor rosa 'Comiss�es Pendentes miss�es Pendentes');
s_ST_OC_F  = '6' ;//'OC' ;  // '6', 'Concilia��o Realizada' );    //, Conciliacao aplicada rate aplicada ao registro cor rosa  'Ordem Cobran�a');
s_ST_RT_F  = '7' ;//'BO' ;  // '7', 'Aplicar Rate'          );    //, 'Aplicar Rate');
s_ST_EX_F  = '8' ;//'EX' ;  // '8', 'Fatura Escluido'       );    //, 'Execu��o ( Exporta��o Concluida )');
s_ST_BO_F  = '9' ;//'BO' ;  // '9', 'Boocking'              );    //, 'Boocking');
s_ST_EM_F  = 'A' ;//'EM' ;  // 'A', 'Em Execu��o'           );    //, 'Em Execu��o ( Exporta��o )');
s_ST_BL_F  = 'B' ;//'EM' ;  // 'B', 'Exporta��o Bloqueada'  );    //, 'Exporta��o Bloqueada'

S_CONSTANTE_STATUS =
  'CASE ' +
  ' WHEN CERBO.Status = ''0'' THEN ''Em Processamento''      ' +
  ' WHEN CERBO.Status = ''1'' THEN ''Fatura Surimpex''       ' +
  ' WHEN CERBO.Status = ''2'' THEN ''NF Emitida''            ' +
  ' WHEN CERBO.Status = ''3'' THEN ''NF Paga''               ' +
  ' WHEN CERBO.Status = ''4'' THEN ''Protesto''              ' +
  ' WHEN CERBO.Status = ''5'' THEN ''Conc. Emitida''   ' +
  ' WHEN CERBO.Status = ''6'' THEN ''Conc. Realizada'' ' +
  ' WHEN CERBO.Status = ''7'' THEN ''Aplicar Rate''          ' +
  ' WHEN CERBO.Status = ''8'' THEN ''Fatura Escluido''       ' +
  ' WHEN CERBO.Status = ''9'' THEN ''Boocking''              ' +
  ' WHEN CERBO.Status = ''A'' THEN ''Em Execu��o''           ' +
  ' WHEN CERBO.Status = ''B'' THEN ''Exp. Bloqueada''  ' +
//  ' WHEN CERBO.Status = ''E'' THEN ''Exporta��o Bloqueada''  ' +
  'ELSE'                                                       +
  '    ''Indefinido'' '                                        +
  'end AS Status ';


  CMB_Em_processamento     = 'Em processamento';        // '0', 'Em processamento');
  CMB_Fatura_Surimpex      = 'Fatura Surimpex';         // '1', 'Fatura Surimpex');
  CMB_NF_Emitida           = 'NF Emitida';              // '2', 'NF Emitida');
  CMB_NF_Paga              = 'NF Paga';                 // '3', 'NF Paga');
  CMB_Protesto             = 'Protesto';                // '4', 'Protesto');
  CMB_Conciliacao_Emitida  = 'Concilia��o Emitida';     // '5', 'Concilia��o Emitida');
  CMB_Conciliacao_Realizada= 'Concilia��o Realizada';   // '6', 'Concilia��o Realizada');
  CMB_Aplicar_Rate         = 'Aplicar Rate';            // '7', 'Aplicar Rate');
  CMB_Fatura_Escluido      = 'Fatura Escluido';         // '8', 'Fatura Escluido');
  CMB_Boocking             = 'Boocking';                // '9', 'Boocking');
  CMB_Em_Execucao          = 'Em Execu��o';             // 'A', 'Em Execu��o');
  CMB_Exportacao_Bloqueada = 'Exporta��o Bloqueada';    // 'B', 'Exporta��o Bloqueada');



















// contantes sistemicas charles
CMS_Data_vazia = -693594;
implementation

end.
