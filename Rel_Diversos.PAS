{
   Programa.: Rel_Diversos.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
      08/06/2011 relatorio concluido
}
unit Rel_Diversos;

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

 sC_NF            =  '';
 sC_NF_RECEBIDA   =  'NF Recebida' ;
 sC_NF_N_RECEBIDA =  'NF não Recebida' ;
 sc_PDTE_Emitir_NF =  'PDTE Emitir NF' ;
 //  ValorConvertido  [DContratoTransporte."ValorConvertido"]
 SC_SQL_TOTAL ='SELECT distinct'+NOVA_LINHA +
               '       ContratoTransporte.contrato  as "Contrato",'+NOVA_LINHA +
               '       Fornecedores.razao as "Provedor",'+NOVA_LINHA +
               '       ContratoTransporte.nomemix as "Produto",'+NOVA_LINHA +
               '       ROUND(ContratoTransporte.Comissao, 2)  || '' / ''|| ContratoTransporte.FormComissao    as "% Comission" ,'+NOVA_LINHA +
               '       ContratoTransporte.FormComissao as "Unid.",'+NOVA_LINHA +
// 30/042012   '       ContratoTransporte.ValorTotalExp as "Valor Ejecutado",'+NOVA_LINHA +
               '       ExportadoTransito.Valor as "Valor Ejecutado",'+NOVA_LINHA +
               '       ExportadoTransito.Fatura as "No Factura",'+NOVA_LINHA +     // CORRECAO 06/12/2011
// 30/042012   '       ContratoTransporte.QUANTTOTALEXP as "Cantidad",'+NOVA_LINHA +
               '       ExportadoTransito.QuantidadeExp as "Cantidad",'+NOVA_LINHA +
               '       ExportadoTransito.ComisaoSFatura as "Valor de La Comision" ,'+NOVA_LINHA +
               '       ExportadoTransito.NumNFEmit as "No Nota Fiscal",'+NOVA_LINHA +
               '       ExportadoTransito.datanf as "Fecha de Emision NF",'+NOVA_LINHA +
//03/05/2012   '       ExportadoTransito.Valor_NF as "Valor Fechamento"  ,'+NOVA_LINHA +
               '       ExportadoTransito.ValorConvertido as "ValorConvertido"  ,'+NOVA_LINHA +
               '       ExportadoTransito.Recebimento  as   "Fecha de Cobro" '+NOVA_LINHA +
               ' from  ContratoTransporte, ExportadoTransito,Fornecedores '+NOVA_LINHA +
               ' where ContratoTransporte.contrato = ExportadoTransito.contrato '+NOVA_LINHA +
               '   and ContratoTransporte.forcod =  Fornecedores.forcod ' ;
 SC_SQL_TOTAL_ORDER = 'order by Fornecedores.razao , ContratoTransporte.contrato , ExportadoTransito.datanf '     ;

type

  TFormRel_Diversos = class(TForm)
    PnSup: TPanel;
    ShapeSup: TShape;
    LbTituloForm: TLabel;
    BtnAjuda: TSpeedButton;
    BtnFechar: TSpeedButton;
    frDBDataSet: TfrDBDataSet;
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    GroupBox4: TGroupBox;
    CBox_FIM: TComboBox;
    CBox_INIC: TComboBox;
    GroupBox3: TGroupBox;
    XDT_FIM: TXDateEdit;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    XDT_INIC: TXDateEdit;
    GroupBox_Grid: TGroupBox;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    Selecao_1: TScrollBox;
    Divisao: TTabSet;
    Panel1: TPanel;
    BtnVisualizar: TBitBtn;
    BtnCancelar: TBitBtn;
    dbnvgr1: TDBNavigator;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ds_grid: TDataSource;
    BitBtn1: TBitBtn;
    cbb_nf: TComboBox;
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
    S_FILTRO : STRING ;
 //   DContratoTransporte : TIBQuery; //TDContratoTransporte ;
    { Private declarations }
    QyRelatorio: TIBQuery;
    DContratoTransporte : TDContratoTransporte ;

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
  FormRel_Diversos: TFormRel_Diversos;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, Abertura, GridPesquisa, Interno , RotinaEd;

procedure TFormRel_Diversos.ConstroiSql;
// var
//  I: Integer;
begin
  {04==== -Início do Bloco Modular. Modificações não serão preservadas}
{
  for I:=0 to DContratoTransporte.Campos.Count-1 do
    TAtributo(DContratoTransporte.Campos[I]).Valor.DataSet := Nil;
  DContratoTransporte.FiltroExtra.Clear;
  DContratoTransporte.ChaveIndice := '';
  DContratoTransporte.Filtro.Clear;
  DContratoTransporte.SQLPrincipal.Clear;
  DContratoTransporte.SQLPrincipal.Add('select distinct');
  DContratoTransporte.SQLPrincipal.Add('       ContratoTransporte.contrato  as "Contrato"  ,');
  DContratoTransporte.SQLPrincipal.Add('       Fornecedores.razao as "Provedor",');
  DContratoTransporte.SQLPrincipal.Add('       ContratoTransporte.nomemix as "Produto",');
  DContratoTransporte.SQLPrincipal.Add('       ROUND(ContratoTransporte.Comissao, 2)  || '' / ''|| ContratoTransporte.FormComissao    as "% Comission"         ,');
  DContratoTransporte.SQLPrincipal.Add('       ContratoTransporte.FormComissao as "Unid.",');
  DContratoTransporte.SQLPrincipal.Add('       ContratoTransporte.ValorTotalExp as "Valor Ejecutado",');
  DContratoTransporte.SQLPrincipal.Add('       ExportadoTransito.NumFatura as "No Factura",');
  DContratoTransporte.SQLPrincipal.Add('       ContratoTransporte.QUANTTOTALEXP as "Cantidad",');
  DContratoTransporte.SQLPrincipal.Add('       ExportadoTransito.ComisaoSFatura as "Valor de La Comision" ,');
  DContratoTransporte.SQLPrincipal.Add('       ExportadoTransito.NumNFEmit as "No Nota Fiscal",');
  DContratoTransporte.SQLPrincipal.Add('       ExportadoTransito.datanf as "Fecha de Emision NF",');
  DContratoTransporte.SQLPrincipal.Add('       ExportadoTransito.Valor_NF as "Valor Fechamento"  ,');
  DContratoTransporte.SQLPrincipal.Add('       ExportadoTransito.Recebimento  as   "Fecha de Cobro"');
  DContratoTransporte.SQLPrincipal.Add('from  ContratoTransporte, ExportadoTransito,Fornecedores');
  DContratoTransporte.SQLPrincipal.Add('where ContratoTransporte.contrato = ExportadoTransito.contrato');
  DContratoTransporte.SQLPrincipal.Add('  and ContratoTransporte.forcod =  Fornecedores.forcod');
  DContratoTransporte.AtualizaSql(False);
  Parametros(DContratoTransporte);
  DContratoTransporte.Open;
  
  DContratoTransporte.First ;
  DContratoTransporte.Last ;
  GroupBox_Grid.Caption := 'Núm. Linhas = ' + INTTOSTR(DContratoTransporte.RecordCount)   ;


  frDBDataSet.DataSet := DContratoTransporte;
  //exit;
  // SQL Personalizado

  //DContratoTransporte.Filtro.Clear;

  //DContratoTransporte.AtualizaSql(False);
  //Parametros(DContratoTransporte);
  //DContratoTransporte.Open;
  //frDBDataSet.DataSet := DContratoTransporte;
  DContratoTransporte.Close;
  Parametros(DContratoTransporte);
  DContratoTransporte.Open;

}
  {99======-Final do Bloco Modular. Modificações não serão preservadas}

end;

procedure TFormRel_Diversos.Parametros(Tabela: TTabela);
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

procedure TFormRel_Diversos.FormShow(Sender: TObject);
//Var
//  I: Integer;
begin
  {05-Início do Bloco Modular. Modificações não serão preservadas}

  Caption := 'Diversos';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}

  DContratoTransporte.OnCalcFields := CalculosDContratoTransporte;
  DContratoTransporte.DataSource.OnDataChange := AtualizaDetalhe_DContratoTransporte;
  QyRelatorio := DContratoTransporte;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  ConstroiSql;
  DContratoTransporte.Close;
  DContratoTransporte.SQL.Clear;
  DContratoTransporte.SQL.add(SC_SQL_TOTAL + SC_SQL_TOTAL_ORDER ) ;
  DContratoTransporte.SQL.SaveToFile('_Rel_Diversos_I_DContratoTransporte.SQL');
  DContratoTransporte.Open ;
  DContratoTransporte.Last ;
  DContratoTransporte.First ;
  GroupBox_Grid.Caption := 'Núm. Linhas = ' + INTTOSTR(DContratoTransporte.RecordCount)   ;


  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  FormResize(Self);

  frDBDataSet.DataSet := DContratoTransporte;
  ds_grid.DataSet := DContratoTransporte;
  frReport.OnUserFunction := FuncoesExtras;
  GroupBox_Grid.Align := alClient ;
  // CARREGANDO   LIST BOX
  Carrega_CB(CBox_INIC,CBox_FIM,'SELECT RAZAO || '' >> '' || FORCOD || '' << ''  AS CAMPOS FROM FORNECEDORES ORDER BY RAZAO', 'CAMPOS',SELF);
  dbnvgr1.DataSource := ds_grid ;
  QyRelatorio := DContratoTransporte;
  XDT_INIC.DateValue := dt0112;
  XDT_FIM.DateValue  := Date ;
end;

procedure TFormRel_Diversos.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormRel_Diversos.InicializaVariaveis;
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
  // 28/08/2012 solicitacao da carina
  frVariables['Titulo_1']     := cbb_nf.Text + ' ( ' + XDT_INIC.Text + ' a '+ XDT_FIM.Text + ' ) '  ; //19/06/2012 Caption;
  frVariables['Titulo_2']     := 'Relatório Auditoria';
  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormRel_Diversos.BtnVisualizarClick(Sender: TObject);
begin

  ConstroiSql;
  BitBtn1Click(Sender)   ;
  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório

  // QyRelatorio.Close;

end;

procedure TFormRel_Diversos.FormResize(Sender: TObject);
begin
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
end;

procedure TFormRel_Diversos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
  begin
    Key := #0;
    {Atua como a tecla TAB}
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFormRel_Diversos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  DContratoTransporte.Free;

  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

{08-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormRel_Diversos.CalculosDContratoTransporte(DataSet: TDataSet);
begin
end;

procedure TFormRel_Diversos.AtualizaDetalhe_DContratoTransporte(Sender: TObject;
  Field: TField);
begin
end;

{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormRel_Diversos.FuncoesExtras(const Name: String; p1, p2,
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

procedure TFormRel_Diversos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then   // Calendário
    Interno108
  else if Key = VK_F6 then // Calculadora
    Interno109
  else if Key = VK_F7 then // Agenda
    Interno110;
end;

procedure TFormRel_Diversos.BitBtn1Click(Sender: TObject);
VAR
  S_CLICOD,s_titulo, s_titulo_c , sF_tipo_nf, S_FILTRO2  : STRING ;
  N_INC  , N_FIN : INTEGER ;
begin

  Screen.Cursor := crHourGlass;

  S_FILTRO    := '';
  s_titulo    := '' ;
  s_titulo_c  := '' ;
  S_FILTRO2   := '' ;
  // 28/08/2012
  // S_FILTRO3   := '' ;
  sF_tipo_nf  := '';
  Caption     := ' Diversos ';

  // 19/062012 filtro solicitado pela karina
  IF  XDT_INIC.DateValue <> -693594 THEN
  begin
      //S_FILTRO  := ' CONTRATOTRANSPORTE.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue)) + NOVA_LINHA ;
      // S_FILTRO2 := ' ExportadoTransito.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue))  + NOVA_LINHA ;
      //26/06/2012
      // S_FILTRO3 := ' ExportadoTransito.Recebimento >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue))  + NOVA_LINHA ;
      S_FILTRO2 := ' ExportadoTransito.datanf >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue))  + NOVA_LINHA ;
      S_FILTRO  := ' ExportadoTransito.datanf >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue))  + NOVA_LINHA ;

  end;

  //-693594
  //IF  XDT_FIM.Text <> '  /  /    ' THEN    ExportadoTransito.datanf
  IF  XDT_FIM.DateValue <> -693594 THEN
  begin
      IF S_FILTRO = '' THEN
      begin
         // S_FILTRO  := ' CONTRATOTRANSPORTE.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))  + NOVA_LINHA;
         // S_FILTRO2 := ' ExportadoTransito.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))   + NOVA_LINHA;
         // 28/08/2012
         //S_FILTRO3 := ' ExportadoTransito.Recebimento <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))   + NOVA_LINHA;
         S_FILTRO2 := ' ExportadoTransito.datanf <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))   + NOVA_LINHA;
         S_FILTRO  := ' ExportadoTransito.datanf <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))   + NOVA_LINHA;

      end
      ELSE
      begin
         // S_FILTRO  := S_FILTRO + ' AND CONTRATOTRANSPORTE.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))  + NOVA_LINHA;
         // S_FILTRO2 := S_FILTRO2 + ' AND ExportadoTransito.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) + NOVA_LINHA;
         // 28/08/2012
         // S_FILTRO3 := S_FILTRO3 + ' AND ExportadoTransito.Recebimento <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) + NOVA_LINHA;
         S_FILTRO2 := S_FILTRO2 + ' AND ExportadoTransito.datanf <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) + NOVA_LINHA;
         S_FILTRO  := S_FILTRO2 + ' AND ExportadoTransito.datanf <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) + NOVA_LINHA;

      end

  end;

  // 19/06/2012
  if (( S_FILTRO <> '') and (S_FILTRO2 <> '')) then
     S_FILTRO := ' (( ' + S_FILTRO + ' ) or ( '+ S_FILTRO2 + '))';




  IF ( XDT_FIM.DateValue <> -693594 ) and ( XDT_INIC.DateValue <> -693594) THEN
     s_titulo := ' Periodo ( '+ XDT_INIC.Text + ' a ' + XDT_FIM.Text  + ' )'
  else
     IF XDT_FIM.DateValue <> -693594 then
        s_titulo := ' Periodo ( '+  XDT_FIM.Text  + ' )'
     else
        IF XDT_INIC.DateValue <> -693594 then
           s_titulo := ' Periodo ( '+ XDT_INIC.Text + ' )';


  IF CBox_INIC.Text <> '' THEN
  BEGIN

     N_INC := POS('>>',CBox_INIC.Text) + 2   ;
     N_FIN := POS('<<',CBox_INIC.Text)   ;
     S_CLICOD := COPY( CBox_INIC.Text, N_INC, N_FIN - N_INC );

     IF S_FILTRO = '' THEN
        S_FILTRO := ' CONTRATOTRANSPORTE.FORCOD >= '+ S_CLICOD
     ELSE
        S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.FORCOD >= '+ S_CLICOD ;

  END;

  IF CBox_FIM.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_FIM.Text) + 2   ;
     N_FIN := POS('<<',CBox_FIM.Text)   ;
     S_CLICOD := COPY( CBox_FIM.Text, N_INC, N_FIN - N_INC );
     IF S_FILTRO = '' THEN
        S_FILTRO := ' CONTRATOTRANSPORTE.FORCOD <= '+ S_CLICOD
     ELSE
        S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.FORCOD <= '+ S_CLICOD ;
  END;

  IF (CBox_INIC.Text <> '') and ( CBox_FIM.Text <> '' ) THEN
     s_titulo_c := ' Codido de Fornecedor ( '+ CBox_INIC.Text + ' a ' +CBox_FIM.Text   + ' )'
  else
     IF CBox_FIM.Text <> '' then
        s_titulo_c := ' Codido de Fornecedor ( '+ CBox_FIM.Text + ' )'
     else
        IF CBox_INIC.Text <> '' then
           s_titulo_c := ' Codido de Fornecedor ( '+ CBox_INIC.Text + ' )';

  IF ( s_titulo_c <> '') and ( s_titulo <> '' ) THEN
     Caption  := Caption + ' ' + s_titulo + ' e ' + s_titulo_c
  else
     IF s_titulo_c <> '' then
        Caption  := Caption + ' '  + s_titulo_c
     else
        Caption  := Caption + ' ' + s_titulo  ;
  // [DContratoTransporte."Fecha de Cobro"]  ExportadoTransito.Recebimento

  if cbb_nf.Text = (sC_NF_RECEBIDA)  then   begin
     sF_tipo_nf := '  (ExportadoTransito.Recebimento is not null) and (ExportadoTransito.NumNFEmit <> 0 ) and (ExportadoTransito.NumNFEmit is not null) '  + NOVA_LINHA;
     // 28/08/2012
//     if S_FILTRO3 <> '' then
//        sF_tipo_nf := sF_tipo_nf + ' AND ( '+ S_FILTRO3 + ') ';

  end;

  if cbb_nf.Text = (sC_NF_N_RECEBIDA) then
     sF_tipo_nf := ' (ExportadoTransito.Recebimento is null) and (ExportadoTransito.NumNFEmit is not null) '  + NOVA_LINHA ;

  // 03/05/2012
  if cbb_nf.Text = (sc_PDTE_Emitir_NF) then
     sF_tipo_nf := ' ( ExportadoTransito.DataNF  is  null) and (ExportadoTransito.Recebimento is null) ' + NOVA_LINHA;

  IF S_FILTRO <> '' THEN
     S_FILTRO := ' AND ' + S_FILTRO  ;

  IF sF_tipo_nf <> '' THEN
     S_FILTRO := S_FILTRO + ' AND ' +  sF_tipo_nf ;

  DContratoTransporte.Close;
  DContratoTransporte.SQL.Clear;
  DContratoTransporte.SQL.add(SC_SQL_TOTAL ) ;
  DContratoTransporte.SQL.add( S_FILTRO   + NOVA_LINHA + SC_SQL_TOTAL_ORDER );
  DContratoTransporte.SQL.SaveToFile('_Rel_Diversos_F_DContratoTransporte.SQL');
  DContratoTransporte.Prepare ;
  DContratoTransporte.Open ;
  DContratoTransporte.Last ;
  DContratoTransporte.First ;

  GroupBox_Grid.Caption := 'Núm. Linhas = ' + INTTOSTR(DContratoTransporte.RecordCount);
  
  Screen.Cursor := crDefault;
end;

procedure TFormRel_Diversos.FormCreate(Sender: TObject);
 var
  I: Integer;
begin

  DContratoTransporte := TDContratoTransporte.Create(Self);

  DContratoTransporte.Database  := TabGlobal.DContratoTransporte.DataBase ;
  DContratoTransporte.Transaction := TabGlobal.DContratoTransporte.Transaction ;
  
  for I:=0 to DContratoTransporte.Campos.Count-1 do
    TAtributo(DContratoTransporte.Campos[I]).Valor.DataSet := Nil;

 cbb_nf.Items.Clear ;
 cbb_nf.Items.Add(sC_NF)           ;
 cbb_nf.Items.Add(sC_NF_RECEBIDA)  ;
 cbb_nf.Items.Add(sC_NF_N_RECEBIDA);
 cbb_nf.Items.Add(sc_PDTE_Emitir_NF);


end;

end.
