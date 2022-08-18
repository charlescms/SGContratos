{
   Programa.: RELCOMPEN.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
   08/06/2011 relatorio concluido
   nome = folha rel6 relcompen
   titulo relatorio de comissoes ou ordem de cobrancao
}
unit RELCOMPEN;

interface

{$I Princ.inc}



uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, BaseD, Atributo, Tabela, Menus, Calculos, db,
  {$I LTab.pas}
  XLookUp, XDBDate, Mask, XDate, XEdit, XNum, FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Tabs, comctrls, XBanner, checklst, FR_E_TXT, FR_E_HTM, FR_E_RTF, FR_E_CSV;


//CONST
//  S_CONT_REL_COMISSAO = 'REL_COMISSAO';
//  S_CONT_REL_ORCAMENT = 'REL_ORCAMENTO';

type
  TFormRELCOMPEN = class(TForm)
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    BtnAjuda: TSpeedButton;
    BtnCancelar: TBitBtn;
    BtnFechar: TSpeedButton;
    BtnVisualizar: TBitBtn;
    Divisao: TTabSet;
    frDBDataSet: TfrDBDataSet;
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    LbTituloForm: TLabel;
    Panel1: TPanel;
    PnSup: TPanel;
    Selecao_1: TScrollBox;
    ShapeSup: TShape;
    frCSVExport1: TfrCSVExport;
    frRTFExport1: TfrRTFExport;
    frHTMExport1: TfrHTMExport;
    frTextExport1: TfrTextExport;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
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
  private
    S_TIPO_REL : STRING ;
    s_titulo : string ;
    s_titulo2 : string ;
    s_filtro : string;
    { Private declarations }
    QyRelatorio: TTabela;
    {02-Início do Bloco Modular. Modificações não serão preservadas}
    DFatura: TDFatura;
    procedure CalculosDFatura(DataSet: TDataSet);
    procedure AtualizaDetalhe_DFatura(Sender: TObject; Field: TField);
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure ConstroiSql;
    procedure InicializaVariaveis;
    procedure Parametros(Tabela: TTabela);

  public

    { Public declarations }
    // procedure set_tabela(Tabela: TTabela);
     procedure set_titulo(s_str: string ) ;
     procedure set_titulo2(s_str: string ) ;
     procedure set_filtro(s_str: string ) ;
     procedure set_TIPO_REL(LS_TIPO_REL : STRING) ;
    {03-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
  end;

var
  FormRELCOMPEN: TFormRELCOMPEN;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, Abertura, GridPesquisa, Interno, RotinaEd, UCMS_CONST;

procedure TFormRELCOMPEN.set_TIPO_REL(LS_TIPO_REL : STRING) ;
BEGIN
S_TIPO_REL := LS_TIPO_REL ;

END;

procedure TFormRELCOMPEN.ConstroiSql;
var
  I: Integer;
begin
  {04-Início do Bloco Modular. Modificações não serão preservadas}
  DFatura.Filtro.Clear;
  DFatura.AtualizaSql(False);
  Parametros(DFatura);
  DFatura.Open;
  frDBDataSet.DataSet := DFatura;
  {99-Final do Bloco Modular. Modificações não serão preservadas}

  DFatura.Filtro.Clear;
  DFatura.Filtro.add(s_filtro);
  DFatura.AtualizaSql(False);
  Parametros(DFatura);
  DFatura.Open;
  frDBDataSet.DataSet := DFatura;
end;

procedure TFormRELCOMPEN.Parametros(Tabela: TTabela);
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

procedure TFormRELCOMPEN.FormShow(Sender: TObject);
Var
  I: Integer;
begin

  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Relatório de Comissão Pendentes - Conosur';
  {99-Final do Bloco Modular. Modificações não serão preservadas}

  // VERIFICA SE A TABELA RELATORIO NAO FOI INIICALIZADA
  // IF  QyRelatorio = NIL THEN BEGIN

  // DFatura := TDFatura.Create(Self);
  {06-Início do Bloco Modular. Modificações não serão preservadas}
//  DFatura := TDFatura.Create(Self);
  DFatura.OnCalcFields := CalculosDFatura;
  DFatura.DataSource.OnDataChange := AtualizaDetalhe_DFatura;
  QyRelatorio := DFatura;
  {99-Final do Bloco Modular. Modificações não serão preservadas}

  // END;

  if s_titulo <> '' then
     Caption := s_titulo ;

  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  FormResize(Self);
  frReport.OnUserFunction := FuncoesExtras;
end;

procedure TFormRELCOMPEN.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormRELCOMPEN.InicializaVariaveis;
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
  frVariables['Titulo_1']     := Caption;
  frVariables['Titulo_2']     := s_titulo2;
  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormRELCOMPEN.BtnVisualizarClick(Sender: TObject);
begin
  //IF  DFatura <> NIL THEN
  ConstroiSql;

  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else BEGIN
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
    TabGlobal.DFATURA.First;
    WHILE NOT TabGlobal.DFATURA.Eof DO BEGIN

//        IF S_CONT_REL_COMISSAO =S_TIPO_REL THEN
//          Atualiza_ST(DFatura.Contrato.Conteudo,S_ST_CM)
//        ELSE
//          Atualiza_ST(DFatura.Contrato.Conteudo,S_ST_OC);
        TabGlobal.DFATURA.Modifica;

        // 03/05/2012
        IF TabGlobal.DFatura.Selecionado.Conteudo = 'S' then
        begin
           IF S_CONT_REL_COMISSAO =S_TIPO_REL THEN
              if ( TabGlobal.DFATURA.Status.Conteudo = s_ST_AB_F ) or
                 ( TabGlobal.DFATURA.Status.Conteudo = s_ST_CM_F ) then
                 TabGlobal.DFATURA.Status.Conteudo := s_ST_CM_F
           ELSE
              if ( TabGlobal.DFATURA.Status.Conteudo = s_ST_AB_F ) or
                 ( TabGlobal.DFATURA.Status.Conteudo = s_ST_OC_F ) then
                 TabGlobal.DFATURA.Status.Conteudo := s_ST_OC_F ;
        end;

        TabGlobal.DFATURA.Salva;

        TabGlobal.DFATURA.Next
    END;
    TabGlobal.DFATURA.Refresh ;

  END;

  QyRelatorio.Close;
end;
{
procedure TFormRELCOMPEN.BtnVisualizarClick(Sender: TObject);
begin
  //IF  DFatura <> NIL THEN
  ConstroiSql;

  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else BEGIN
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
    DFatura.First;
    WHILE NOT DFatura.Eof DO BEGIN

//        IF S_CONT_REL_COMISSAO =S_TIPO_REL THEN
//          Atualiza_ST(DFatura.Contrato.Conteudo,S_ST_CM)
//        ELSE
//          Atualiza_ST(DFatura.Contrato.Conteudo,S_ST_OC);
        DFatura.Modifica;
        IF S_CONT_REL_COMISSAO =S_TIPO_REL THEN
           if ( DFatura.Status.Conteudo = s_ST_AB_F ) or
              ( DFatura.Status.Conteudo = s_ST_CM_F ) then
              DFatura.Status.Conteudo := s_ST_CM_F
        ELSE
           if ( DFatura.Status.Conteudo = s_ST_AB_F ) or
              ( DFatura.Status.Conteudo = s_ST_OC_F ) then
              DFatura.Status.Conteudo := s_ST_OC_F ;

        DFatura.Salva;

        DFatura.Next
    END;
    DFatura.Refresh ;

  END;

  QyRelatorio.Close;
end;

}

procedure TFormRELCOMPEN.FormResize(Sender: TObject);
begin
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
end;

procedure TFormRELCOMPEN.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFormRELCOMPEN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  DFatura.Free;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

{08-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormRELCOMPEN.CalculosDFatura(DataSet: TDataSet);
begin
end;

procedure TFormRELCOMPEN.AtualizaDetalhe_DFatura(Sender: TObject;
  Field: TField);
begin
end;
{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormRELCOMPEN.FuncoesExtras(const Name: String; p1, p2,
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

procedure TFormRELCOMPEN.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then   // Calendário
    Interno108
  else if Key = VK_F6 then // Calculadora
    Interno109
  else if Key = VK_F7 then // Agenda
    Interno110;
end;

//procedure TFormRELCOMPEN.set_tabela(Tabela: TTabela);
//begin
// DFatura := TDFatura (Tabela);
//end;

procedure TFormRELCOMPEN.set_titulo(s_str: string ) ;
begin
  s_titulo :=  s_str ;
end;

procedure TFormRELCOMPEN.set_titulo2(s_str: string ) ;
begin
  s_titulo2 :=  s_str ;
end;

procedure TFormRELCOMPEN.set_filtro(s_str: string ) ;
begin
  s_filtro :=  s_str ;
end;

procedure TFormRELCOMPEN.FormCreate(Sender: TObject);
begin
  s_filtro := '' ;
  DFatura := TDFatura.Create(Self);
//  DFatura := TabGlobal.DFATURA ;
//  DFatura.OnCalcFields := CalculosDFatura;
//  DFatura.DataSource.OnDataChange := AtualizaDetalhe_DFatura;
//  QyRelatorio := DFatura;

end;

end.
