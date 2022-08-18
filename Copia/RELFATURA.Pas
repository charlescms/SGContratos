{
   Programa.: RELFATURA.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
}
unit RELFATURA;

interface

{$I Princ.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,  DateUtils,
  StdCtrls, Buttons, ExtCtrls, BaseD, Atributo, Tabela, Menus, Calculos, db,
  {$I LTab.pas}
  XLookUp, XDBDate, Mask, XDate, XEdit, XNum, FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Tabs, comctrls, XBanner, checklst;

type
  TFormRELFATURA = class(TForm)
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    Btn_GetFat: TBitBtn;
    Btn_grava: TBitBtn;
    Btn_imprime: TBitBtn;
    BtnAjuda: TSpeedButton;
    BtnCancelar: TBitBtn;
    BtnFechar: TSpeedButton;
    BtnVisualizar: TBitBtn;
    Divisao: TTabSet;
    frDBDataSet: TfrDBDataSet;
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LbTituloForm: TLabel;
    Panel1: TPanel;
    PnSup: TPanel;
    Selecao_1: TScrollBox;
    ShapeSup: TShape;
    XNumE_desconto: TXNumEdit;
    XNumE_fatura: TXNumEdit;
    XNumE_Final: TXNumEdit;
    XNumE_Inicial: TXNumEdit;
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
    procedure Btn_GetFatClick(Sender: TObject);
    procedure Btn_gravaClick(Sender: TObject);
    procedure XNumE_InicialBtnClick(Sender: TObject);
    procedure XNumE_FinalBtnClick(Sender: TObject);
    procedure Btn_imprimeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    ENDERECO_EXP: TStringList;
//    ENDERECO_REL: string;;
//    TEXTO_PADRAO: string;

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
    procedure ConstroiSql_NOVO;
    procedure Get_End_Export(i_cod: integer );
  public
    { Public declarations }

    {03-Início do Bloco Modular. Modificações não serão preservadas}

    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure EXIBIR_REL;
    procedure set_cod_exportador(cod_ini, cod_final : integer );

  end;

var
  FormRELFATURA: TFormRELFATURA;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, Abertura, GridPesquisa, Interno;

procedure TFormRELFATURA.ConstroiSql;
var
  I: Integer;
  s_filtro : string ;
begin

//  DFatura.Filtro.Add('(ContratoTransporte.FORCOD >= :ComboBox1)');
//  DFatura.Filtro.Add('AND (ContratoTransporte.FORCOD <= :ComboBox2)');
  s_filtro := '';
  if XNumE_Inicial.ValueInt > 0 then
     s_filtro := ' (ContratoTransporte.FORCOD >= '+inttostr(XNumE_Inicial.ValueInt)+') ' ;

  if XNumE_Final.ValueInt > 0 then
     if s_filtro = '' then
        s_filtro := ' (ContratoTransporte.FORCOD <= '+inttostr(XNumE_Final.ValueInt)+') '
     else
        s_filtro := s_filtro + ' and  (ContratoTransporte.FORCOD <= '+inttostr(XNumE_Final.ValueInt)+') ' ;

  if XNumE_fatura.ValueInt > 0 then
     if s_filtro = '' then
        s_filtro := ' (ExpotadoTransito.NumFatura <= '+inttostr(XNumE_fatura.ValueInt)+') '
     else
        s_filtro := s_filtro + ' and  (ExpotadoTransito.NumFatura <= '+inttostr(XNumE_fatura.ValueInt)+') ' ;

  {04-Início do Bloco Modular. Modificações não serão preservadas}
  DFatura.Filtro.Clear;
  DFatura.Filtro.Add('(ContratoTransporte.FORCOD >= :ComboBox1)');
  DFatura.Filtro.Add('AND (ContratoTransporte.FORCOD <= :ComboBox2)');
  DFatura.AtualizaSql(False);
  Parametros(DFatura);
  DFatura.Open;
  frDBDataSet.DataSet := DFatura;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  DFatura.close ;
  DFatura.Filtro.Clear;
  DFatura.Filtro.Add(s_filtro);
  DFatura.AtualizaSql(False);
  Parametros(DFatura);
  DFatura.Open;
  frDBDataSet.DataSet := DFatura;

end;


procedure TFormRELFATURA.ConstroiSql_NOVO;
var
  I: Integer;
begin

  DFatura.AtualizaSql(False);
  Parametros(DFatura);
  DFatura.Open;
  frDBDataSet.DataSet := DFatura;

end;



procedure TFormRELFATURA.Parametros(Tabela: TTabela);
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

procedure TFormRELFATURA.FormShow(Sender: TObject);
Var
  I: Integer;
begin

  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Fatura';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  DFatura := TDFatura.Create(Self);
  DFatura.OnCalcFields := CalculosDFatura;
  DFatura.DataSource.OnDataChange := AtualizaDetalhe_DFatura;
  QyRelatorio := DFatura;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  FormResize(Self);
  frReport.OnUserFunction := FuncoesExtras;
  Btn_GetFat.Hint  := 'Gerar o número da Fatura Surimpex';
  Btn_imprime.Hint := 'Imprime direto para Impressora';
  Btn_grava.Hint   := 'Grava Fatura e desconto';
end;

procedure TFormRELFATURA.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormRELFATURA.InicializaVariaveis;
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
  frVariables['Titulo_2']     := '';

  // NOVAS VARIAVEIS        ENDERECO_EXP
  frVariables['ENDERECO_EXP']     := ENDERECO_EXP.Text;
  frVariables['ENDERECO_REL']     := TabGlobal.DPARAMETROS.ENDERECOEMPRESA.Conteudo.Text;
  frVariables['TEXTO_PADRAO']     := TabGlobal.DPARAMETROS.TEXTOFATURA.Conteudo.Text;

  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormRELFATURA.BtnVisualizarClick(Sender: TObject);
begin

  IF XNumE_Inicial.ValueInt > 0 THEN
     Get_End_Export(XNumE_Inicial.ValueInt);

  ConstroiSql;
  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
  QyRelatorio.Close;
end;

procedure TFormRELFATURA.EXIBIR_REL;
begin
  frReport.OnUserFunction := FuncoesExtras;
  ConstroiSql_NOVO;
  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
  QyRelatorio.Close;
end;

procedure TFormRELFATURA.FormResize(Sender: TObject);
begin
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
end;

procedure TFormRELFATURA.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFormRELFATURA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ENDERECO_EXP.Free ;
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  DFatura.Free;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

{08-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormRELFATURA.CalculosDFatura(DataSet: TDataSet);
begin
end;

procedure TFormRELFATURA.AtualizaDetalhe_DFatura(Sender: TObject;
  Field: TField);
begin
end;
{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormRELFATURA.FuncoesExtras(const Name: String; p1, p2,
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

procedure TFormRELFATURA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then   // Calendário
    Interno108
  else if Key = VK_F6 then // Calculadora
    Interno109
  else if Key = VK_F7 then // Agenda
    Interno110;
end;

procedure TFormRELFATURA.Btn_GetFatClick(Sender: TObject);
var
   i_ano, i_seq  : integer  ;
   s_faturnaNova : string  ;
begin
   // recupera o ano
   i_ano := strtoint (copy ( TabGlobal.DPARAMETROS.NumFatura.ValorString , 1, 4)) ;
   // recupera a seq
   i_seq := strtoint (copy ( TabGlobal.DPARAMETROS.NumFatura.ValorString , 4, 4)) + 1 ;
   // determina mudanca de ano
   if i_ano < YearOf(date) then
      i_ano :=  YearOf(date) ;
   // transforma em um unic numero
   s_faturnaNova := trim(inttostr( i_ano )) + trim(inttostr( i_seq )) ;

   XNumE_fatura.ValueInt := strtoint(s_faturnaNova );

   if TabGlobal.DPARAMETROS.State <>  dsEdit 	 then
      TabGlobal.DPARAMETROS.Edit ;

   TabGlobal.DPARAMETROS.NumFatura.Conteudo := strtoint (s_faturnaNova );
   TabGlobal.DPARAMETROS.Post ;

end;

procedure TFormRELFATURA.Btn_gravaClick(Sender: TObject);
var
    s_titulo : string  ;
begin
s_titulo := LbTituloForm.Caption ;
Screen.Cursor := crHourGlass      ;
LbTituloForm.Caption := LbTituloForm.Caption + 'Gravando Fatura' ;
Refresh ;
// para todos os registro gravar

TabGlobal.DFatura.First ; // primeiro
while TabGlobal.DFatura.Eof do begin
  if (( TabGlobal.DFatura.State <>  dsEdit)    and
      (TabGlobal.DFatura.State  <>  dsinsert)) then
       TabGlobal.DFatura.Edit ;

  if TabGlobal.DFatura.NumFatura.Conteudo = 0 then begin
     TabGlobal.DFatura.NumFatura.Conteudo :=  XNumE_fatura.ValueInt ;
     TabGlobal.DFatura.ValorDesconto.Conteudo := XNumE_desconto.Value ;
     TabGlobal.DFatura.Status.Conteudo := '1';  
     TabGlobal.DFatura.DataFatura.Conteudo := date ;
  end;


  TabGlobal.DFatura.Post ;
  TabGlobal.DFatura.Next ;
end;

Screen.Cursor := crDefault ;
LbTituloForm.Caption := s_titulo ;

Refresh ;

end;

procedure TFormRELFATURA.XNumE_InicialBtnClick(Sender: TObject);
begin
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    FormGridPesquisa.Atalho := VK_F8;
//    FormGridPesquisa.Campo  := TabGlobal.DFornecedores.FORCOD;
    FormGridPesquisa.Campo  := TabGlobal.DFatura.FORCOD;
    FormGridPesquisa.Avulso := True;
    if FormGridPesquisa.ShowModal = mrOk then
       XNumE_Inicial.ValueInt := FormGridPesquisa.Resultado;
  Finally
    FormGridPesquisa.Free;
  end;

end;

procedure TFormRELFATURA.XNumE_FinalBtnClick(Sender: TObject);
begin
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    FormGridPesquisa.Atalho := VK_F8;
//    FormGridPesquisa.Campo  := TabGlobal.DFornecedores.FORCOD;
    FormGridPesquisa.Campo  := TabGlobal.DFatura.FORCOD;
    FormGridPesquisa.Avulso := True;
    if FormGridPesquisa.ShowModal = mrOk then
       XNumE_Final.ValueInt := FormGridPesquisa.Resultado;
  Finally
    FormGridPesquisa.Free;
  end;

end;

procedure TFormRELFATURA.set_cod_exportador(cod_ini, cod_final : integer );
begin
    XNumE_Inicial.ValueInt := cod_ini;
    XNumE_Final.ValueInt  := cod_final;
end;

procedure TFormRELFATURA.Btn_imprimeClick(Sender: TObject);
begin
  ConstroiSql;
  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowPreparedReport ;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
  QyRelatorio.Close;

end;

procedure TFormRELFATURA.Get_End_Export(i_cod: integer );
var
  t_tmp : TTabela;
begin
  t_tmp := TTabela.Create(nil);
  t_tmp.DataBase := DFatura.DataBase ;
  t_tmp.Transaction := DFatura.Transaction ;
  t_tmp.SQL.Clear ;
  t_tmp.SQL.Add('SELECT  FORNECEDORES.ENDERECO , FORNECEDORES.CID , TAB_PAIS.NOME FROM  FORNECEDORES , TAB_PAIS WHERE  FORNECEDORES.ID = TAB_PAIS.ID  and FORNECEDORES.FORCOD = ' + inttostr(i_cod) );
  t_tmp.Open ;
  ENDERECO_EXP.Clear ;
  ENDERECO_EXP.Add(t_tmp.FieldValues['ENDERECO'] ) ;
  ENDERECO_EXP.Add(t_tmp.FieldValues['CID'] + t_tmp.FieldValues['NOME'] ) ;
  t_tmp.close ;
  t_tmp.Free ;
end;

procedure TFormRELFATURA.FormCreate(Sender: TObject);
begin
  ENDERECO_EXP:= TStringList.Create;
end;

end.
