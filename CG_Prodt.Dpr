{
 Empresa....: CMS
 Programa...: CG_Prodt.Dpr - Gerenciador dos Módulos do Projeto
 Sistema....: 
 Data.......: 24/09/2013
 Versão.....: 3.28
 Analista...: Charles
 Programador: Charles
 Criação....: xMaker 5.1 Release: R05
 NºLicença..: Versão Open Source-
}

program CG_Prodt;

uses
  {$I LTab.Inc}
  {$I AtrL.Inc}
  WinTypes,
  WinProcs,
  SysUtils,
  Rotinas in 'ROTINAS.PAS',
  RotinaEd in 'ROTINAED.PAS',
  Extras in 'EXTRAS.PAS',
  Interno in 'INTERNO.PAS',
  Validar in 'VALIDAR.PAS',
  Publicas in 'PUBLICAS.PAS',
  Atributo in 'ATRIBUTO.PAS',
  Tabela in 'TABELA.PAS',
  Estrutur in 'ESTRUTUR.PAS',
  Calculos in 'CALCULOS.PAS',
  Forms,
  Splash in 'Splash.PAS' {FormSplash},
  Calend in 'Calend.PAS' {FormCalendario},
  Calculad in 'Calculad.PAS' {FormCalculadora},
  Acesso in 'Acesso.PAS' {FormAcesso},
  Senhas in 'Senhas.PAS' {FormSenhas},
  Sobre in 'Sobre.PAS' {FormSobre},
  Princ in 'Princ.PAS' {FormPrincipal},
  CfgEmp in 'CfgEmp.PAS' {FormConfiguraEmpresa},
  SelEmp in 'SelEmp.PAS' {FormSelecionaEmpresa},
  BatePapo in 'BatePapo.PAS' {FormBatePapo},
  Agenda in 'Agenda.PAS' {FormAgenda},
  AgEdit in 'AgEdit.PAS' {FormAgEdit},
  EdUsr in 'EdUsr.PAS' {FormEdUsr},
  EdGrp in 'EdGrp.PAS' {FormEdGrp},
  Ambiente in 'Ambiente.PAS' {FormAmbiente},
  Backup in 'Backup.PAS' {FormBackup},
  Restaura in 'Restaura.PAS' {FormRestaura},
  Filtro in 'Filtro.PAS' {FormFiltragem},
  GridPesquisa in 'GridPesquisa.PAS' {FormGridPesquisa},
  LogOperacoes in 'LogOperacoes.PAS' {FormLogOperacoes},
  LogProcura in 'LogProcura.PAS' {FormLogProcura},
  Aguarde in 'Aguarde.PAS' {FormAguarde},
  Fr_View in 'Fr_View.PAS' {frPreviewForm},
  OpcRel in 'OpcRel.PAS' {FormOpcRel},
  Exportacao in 'Exportacao.PAS' {FormExportacao},
  ProdutoContrato in 'ProdutoContrato.PAS' {FormProdutoContrato},
  TbPorto in 'TbPorto.PAS' {FormTbPorto},
  TbCondicaoCompr in 'TbCondicaoCompr.PAS' {FormTbCondicaoCompr},
  TbFormaPagament in 'TbFormaPagament.PAS' {FormTbFormaPagament},
  Divisao in 'Divisao.PAS' {FormDivisao},
  Atividades in 'Atividades.PAS' {FormAtividades},
  Boocking in 'Boocking.PAS' {FormBoocking},
  ClienteN in 'ClienteN.PAS' {FormClienteN},
  PaisN in 'PaisN.PAS' {FormPaisN},
  ExportadorN in 'ExportadorN.PAS' {FormExportadorN},
  TbCategClienteN in 'TbCategClienteN.PAS' {FormTbCategClienteN},
  TbSitClientesN in 'TbSitClientesN.PAS' {FormTbSitClientesN},
  ContratoN in 'ContratoN.PAS' {FormContratoN},
  Produtos in 'Produtos.PAS' {FormProdutos},
  Parametro in 'Parametro.PAS' {FormParametro},
  FaturaN in 'FaturaN.PAS' {FormFaturaN},
  RELCOMPEN in 'RELCOMPEN.PAS' {FormRELCOMPEN},
  RELFATURA in 'RELFATURA.PAS' {FormRELFATURA},
  Infome in 'Infome.PAS' {FormInfome},
  RESUMEN in 'RESUMEN.PAS' {FormRESUMEN},
  INFOMECOMERCIAL in 'INFOMECOMERCIAL.PAS' {FormINFOMECOMERCIAL},
  RELINFCOMDIRETO in 'RELINFCOMDIRETO.PAS' {FormRELINFCOMDIRETO},
  Informe in 'Informe.PAS' {FormInforme},
  RESUMENCONTRATA in 'RESUMENCONTRATA.PAS' {FormRESUMENCONTRATA},
  Rel_Diversos in 'Rel_Diversos.PAS' {FormRel_Diversos},
  RelSitucaoCred in 'RelSitucaoCred.PAS' {FormRelSitucaoCred},
  ResumenContForm in 'ResumenContForm.PAS' {FormResumenContForm},
  REL_FATURATAB in 'REL_FATURATAB.PAS' {FormREL_FATURATAB},
  OrdemCobranca in 'OrdemCobranca.PAS' {FormOrdemCobranca},
  OrdCobrancaDesc in 'OrdCobrancaDesc.PAS' {FormOrdCobrancaDesc},
  OrdCobrancaProd in 'OrdCobrancaProd.PAS' {FormOrdCobrancaProd},
  Rel_Agente in 'Rel_Agente.PAS' {FormRel_Agente},
  REL_NF in 'REL_NF.PAS' {FormREL_NF},
  Rel_ValorFatura in 'Rel_ValorFatura.PAS' {FormRel_ValorFatura},
  Rel_ValorRecebi in 'Rel_ValorRecebi.PAS' {FormRel_ValorRecebi},
  TrocaContrato in 'TrocaContrato.PAS' {FormTrocaContrato},
  RelOrdemCobranc in 'RelOrdemCobranc.PAS' {FormRelOrdemCobranc},
  FRM_Previsao in 'FRM_Previsao.PAS' {FormFRM_Previsao},
  Abertura in 'Abertura.PAS' {TabGlobal: TTabGlobal},
  BaseD in 'BaseD.PAS' {BaseDados: TDataModule};

var
  Hwnd : THandle;

begin
  Hwnd := FindWindow('TApplication', 'Gestor de Contrato');
  if Hwnd = 0 then
  begin
    Application.Initialize;
    Application.Title := '';
    Application.CreateForm(TFormPrincipal, FormPrincipal);
    Application.CreateForm(TBaseDados, BaseDados);
    Application.CreateForm(TTabGlobal, TabGlobal);
    Application.Run;
  end
  else
    SetForegroundWindow(Hwnd);
end.
