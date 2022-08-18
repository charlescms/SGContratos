{
   Programa.: Rel_Diversos.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
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
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ds_grid: TDataSource;
    DContratoTransporte2: TIBQuery;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    BitBtn1: TBitBtn;
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
  private
    { Private declarations }
    QyRelatorio: TTabela;
    {02-Início do Bloco Modular. Modificações não serão preservadas}
    DContratoTransporte: TDContratoTransporte;
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

uses Publicas, Princ, Rotinas, Abertura, GridPesquisa, Interno;

procedure TFormRel_Diversos.ConstroiSql;
var
  I: Integer;
begin
  {04-Início do Bloco Modular. Modificações não serão preservadas}
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
  DContratoTransporte.SQLPrincipal.Add('       ExpotadoTransito.NumFatura as "No Factura",');
  DContratoTransporte.SQLPrincipal.Add('       ContratoTransporte.QUANTTOTALEXP as "Cantidad",');
  DContratoTransporte.SQLPrincipal.Add('       ExpotadoTransito.ComisaoSFatura as "Valor de La Comision" ,');
  DContratoTransporte.SQLPrincipal.Add('       ExpotadoTransito.NumNFEmit as "No Nota Fiscal",');
  DContratoTransporte.SQLPrincipal.Add('       ExpotadoTransito.datanf as "Fecha de Emision NF",');
  DContratoTransporte.SQLPrincipal.Add('       ExpotadoTransito.Valor_NF as "Valor Fechamento"  ,');
  DContratoTransporte.SQLPrincipal.Add('       ExpotadoTransito.Recebimento  as   "Fecha de Cobro"');
  DContratoTransporte.SQLPrincipal.Add('from  ContratoTransporte, ExpotadoTransito,Fornecedores');
  DContratoTransporte.SQLPrincipal.Add('where ContratoTransporte.contrato = ExpotadoTransito.contrato');
  DContratoTransporte.SQLPrincipal.Add('  and ContratoTransporte.forcod =  Fornecedores.forcod');
  DContratoTransporte.AtualizaSql(False);
  Parametros(DContratoTransporte);
  DContratoTransporte.Open;
  frDBDataSet.DataSet := DContratoTransporte;
  exit;
  // SQL Personalizado

  DContratoTransporte.Filtro.Clear;
  DContratoTransporte.AtualizaSql(False);
  Parametros(DContratoTransporte);
  DContratoTransporte.Open;
  frDBDataSet.DataSet := DContratoTransporte;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
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
Var
  I: Integer;
begin
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Diversos';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  DContratoTransporte := TDContratoTransporte.Create(Self);
  DContratoTransporte.OnCalcFields := CalculosDContratoTransporte;
  DContratoTransporte.DataSource.OnDataChange := AtualizaDetalhe_DContratoTransporte;
  QyRelatorio := DContratoTransporte;
  {99-Final do Bloco Modular. Modificações não serão preservadas}


  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  FormResize(Self);
  ConstroiSql;
  ds_grid.DataSet := DContratoTransporte;
  frReport.OnUserFunction := FuncoesExtras;
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
  frVariables['Titulo_1']     := Caption;
  frVariables['Titulo_2']     := '';
  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormRel_Diversos.BtnVisualizarClick(Sender: TObject);
begin
  ConstroiSql;
  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
  QyRelatorio.Close;
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
  S_FILTRO , S_CLICOD: STRING ;
  N_INC  , N_FIN : INTEGER ;
begin

  Screen.Cursor := crHourGlass;
  S_FILTRO := '';
  Caption := 'RESUMEN CONTRATION ';

  IF  XDT_INIC.DateValue <> -693594 THEN
      S_FILTRO := ' CONTRATOTRANSPORTE.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue)) ;
    //-693594
  //IF  XDT_FIM.Text <> '  /  /    ' THEN
  IF  XDT_FIM.DateValue <> -693594 THEN
      IF  S_FILTRO = '' THEN
          S_FILTRO := ' CONTRATOTRANSPORTE.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))
      ELSE
          S_FILTRO := S_FILTRO + ' AND CONTRATOTRANSPORTE.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;

  IF CBox_INIC.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_INIC.Text) + 2   ;
     N_FIN := POS('<<',CBox_INIC.Text)   ;
     S_CLICOD := COPY( CBox_INIC.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' CONTRATOTRANSPORTE.FORCOD >= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.FORCOD >= '+ S_CLICOD ;
     CAPTION := CAPTION + COPY( CBox_INIC.Text,1, N_INC  );
  END;

  IF CBox_FIM.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_FIM.Text) + 2   ;
     N_FIN := POS('<<',CBox_FIM.Text)   ;
     S_CLICOD := COPY( CBox_FIM.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' CONTRATOTRANSPORTE.FORCOD <= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.FORCOD <= '+ S_CLICOD ;
     CAPTION := CAPTION + COPY( CBox_INIC.Text,1, N_INC  );
  END;

//  IF  S_FILTRO <> '' THEN
//      S_SQL_PROD_WHERE := SC_SQL_PROD_WHERE_N + ' AND ' + S_FILTRO
//  ELSE
//      S_SQL_PROD_WHERE := SC_SQL_PROD_WHERE_N ;

  DContratoTransporte.Close;
  // DContratoTransporte.SQL.Clear;
  // DContratoTransporte.SQL.Add(SC_SQL_PROD + S_SQL_PROD_WHERE + SC_SQL_PROD_ORDER );
  // DContratoTransporte.SQL.SaveToFile('_DContratoTransporte.SQL');
  // DContratoTransporte.
  DContratoTransporte.Filtro.clear;
  DContratoTransporte.Filtro.add( S_FILTRO);
  DContratoTransporte.SQL.SaveToFile('_DContratoTransporte.SQL');
  DContratoTransporte.Prepare ;
  DContratoTransporte.Open ;

  GroupBox_Grid.Caption := 'Núm. Linhas = ' + INTTOSTR(DContratoTransporte.RecordCount)   ;

  Screen.Cursor := crDefault;


end;

end.
