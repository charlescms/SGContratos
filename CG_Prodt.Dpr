{
 Empresa....: CMS
 Programa...: CG_Prodt.Dpr - Gerenciador dos Módulos do Projeto
 Sistema....: 
 Data.......: 26/10/2011
 Versão.....: 1.0001
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
  REL_INFOR_EXCEL in 'REL_INFOR_EXCEL.PAS' {FormREL_INFOR_EXCEL},
  Abertura in 'Abertura.PAS' {TabGlobal: TTabGlobal},
  BaseD in 'BaseD.PAS' {BaseDados: TDataModule};


begin
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TBaseDados, BaseDados);
  Application.CreateForm(TTabGlobal, TabGlobal);
  Application.Run;
end.
