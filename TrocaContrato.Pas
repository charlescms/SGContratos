{
   Programa.: TrocaContrato.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
}
unit TrocaContrato;

interface

{$I Princ.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Tabs, BaseD, Db, Grids, DBGrids,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Atributo, dbctrls, Clipbrd, Tabela, Menus, IniFiles, Printers, Calculos,
  {$I LTab.pas}
  JPeg, XLookUp, XDBDate, Mask, XDBEdit, XDBNum, XEdit, XBanner, XDate, XNum;

type
  TFormTrocaContrato = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    CMB_CONTRATO: TComboBox;
    Ed_CONTRATO_NV: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure CMB_CONTRATOExit(Sender: TObject);
    procedure Ed_CONTRATO_NVExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FormTrocaContrato: TFormTrocaContrato;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, Abertura, GridPesquisa,RotinaEd, UCMS_CONST;

procedure TFormTrocaContrato.FormShow(Sender: TObject);
//var
//   Tab_tmp: TTabela;
begin
{
  Tab_tmp := TTabela.Create(self);
  Tab_tmp.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  Tab_tmp.Transaction := TabGlobal.DContratoTransporte.Transaction ;
  Tab_tmp.SQL.Clear;
  Tab_tmp.SQL.Add('select contrato from ContratoTransporte order by contrato') ;
  Tab_tmp.Prepare ;
  Tab_tmp.Open ;

  CMB_CONTRATO.Items.Clear;
  while not Tab_tmp.Eof do begin
        CMB_CONTRATO.Items.Add(Tab_tmp.FieldValues['CONTRATO']);
        Tab_tmp.Next ;
  end ;
  Tab_tmp.Close;
  Tab_tmp.Free;
}
  Carrega_CB(CMB_CONTRATO,nil,'select contrato from ContratoTransporte order by contrato','CONTRATO',Self);

  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Troca Contrato';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  FormPrincipal.PnImagemFundo.Visible := False;
  Sistema.JanelasMDI := Sistema.JanelasMDI + 01;
  if Sistema.JanelasMDI < 1 then   // Pouco provável + ...
    Sistema.JanelasMDI := 1;
end;

procedure TFormTrocaContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {
    Ajusta Janelas e Pano de Fundo
  }
//  Tab_tmp.Close;
//  Tab_tmp.Free;
  

  Sistema.JanelasMDI := Sistema.JanelasMDI - 01;
  if Sistema.JanelasMDI <= 0 then
    FormPrincipal.PnImagemFundo.Visible := True;
  Action := caFree;
  FormTrocaContrato := nil;
end;

procedure TFormTrocaContrato.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFormTrocaContrato.BitBtn1Click(Sender: TObject);
begin
//       PTabela(TabGlobal.DExportadoTransito, ['NumOrdCobranca'], [TabGlobal.DOrdemCobranca.NumOrdCobranca.Conteudo], 'NumOrdCobranca = ''''' )
IF ( CMB_CONTRATO.Text <> '') AND ( Ed_CONTRATO_NV.Text<> '') THEN begin
   if NOT PTabela(TabGlobal.DContratoTransporte,['Contrato'],[Ed_CONTRATO_NV.Text]) then begin
      if PTabela(TabGlobal.DContratoTransporte,['Contrato'],[CMB_CONTRATO.Text]) then begin
         IF VNivel = TRUE THEN BEGIN
            if MessageDlg( MSG_ConfirmaTroca ,mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
               PTabela(TabGlobal.DContratoTransporte,['Contrato'],[CMB_CONTRATO.Text],'Contrato = '+ AtribuiAspas(Ed_CONTRATO_NV.Text) ) ; // CamposArray: Array of String; ValoresArray: Array of Variant; Update: String): Boolean; overload;
               PTabela(TabGlobal.DProdutoContratoT,['Contrato'],[CMB_CONTRATO.Text],'Contrato = '+ AtribuiAspas(Ed_CONTRATO_NV.Text) ) ;
               PTabela(TabGlobal.DExportadoTransito,['Contrato'],[CMB_CONTRATO.Text],'Contrato = '+ AtribuiAspas(Ed_CONTRATO_NV.Text) ) ;
               PTabela(TabGlobal.DBoocking,['Contrato'],[CMB_CONTRATO.Text],'Contrato = '+ AtribuiAspas(Ed_CONTRATO_NV.Text) ) ;

               Carrega_CB(CMB_CONTRATO,nil,'select contrato from ContratoTransporte order by contrato','CONTRATO',Self);
               MessageDlg( MSG_trocadeContratoRealizada ,mtWarning, [mbOK], 0);
            end;
         END
         ELSE
            MessageDlg( MSG_USUARIONAOAUTORIZADO ,mtWarning, [mbOK], 0);
        
      END
      ELSE
        MessageDlg( MSG_OsDadosdeTrocaNaoSaoValidos ,mtWarning, [mbOK], 0);
   END
   ELSE
      MessageDlg( MSG_ONumeroDeContratojaExiste ,mtWarning, [mbOK], 0);
 end
ELSE
 MessageDlg( MSG_OsDadosdeTrocaNaoSaoValidos ,mtWarning, [mbOK], 0)
end;

procedure TFormTrocaContrato.CMB_CONTRATOExit(Sender: TObject);
begin
if CMB_CONTRATO.Text <> '' then begin
   if not PTabela(TabGlobal.DContratoTransporte,['Contrato'],[CMB_CONTRATO.Text]) then begin
      MessageDlg( MSG_OsDadosdeTrocaNaoSaoValidos ,mtWarning, [mbOK], 0);
      exit;
   end;
end;


end;

procedure TFormTrocaContrato.Ed_CONTRATO_NVExit(Sender: TObject);
begin
if Ed_CONTRATO_NV.Text <> '' then begin
   if PTabela(TabGlobal.DContratoTransporte,['Contrato'],[Ed_CONTRATO_NV.Text]) then begin
      MessageDlg( MSG_ONumeroDeContratojaExiste ,mtWarning, [mbOK], 0);
      exit;
   end;
end;
end;

end.
