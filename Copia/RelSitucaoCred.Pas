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
  sql_total_alimentos = ' ' +
        'SELECT ' +   NOVA_LINHA +
				'   ContratoTransporte.NomeMix as  NomeMix ,' +   NOVA_LINHA +
				'   SUM(ContratoTransporte.QuantidadeTotal) as QuantidadeTotal,' +   NOVA_LINHA +
				'   SUM(ContratoTransporte.ValorSCCTotal) as ValorSCCTotal,' +   NOVA_LINHA +
				'   SUM(ContratoTransporte.QUANTTOTALEXP) as QUANTTOTALEXP,' +   NOVA_LINHA +
				'   SUM(ContratoTransporte.ValorTotalExp) as ValorTotalExp' +   NOVA_LINHA +
        'FROM   ContratoTransporte' +   NOVA_LINHA ;
  sql_total_alimentos_grup = ' ' +
        ' GROUP BY ContratoTransporte.NomeMix ORDER BY ContratoTransporte.NomeMix' +   NOVA_LINHA ;

type
  TFormRelSitucaoCred = class(TForm)
    PnSup: TPanel;
    ShapeSup: TShape;
    LbTituloForm: TLabel;
    BtnAjuda: TSpeedButton;
    BtnFechar: TSpeedButton;
    frDBDataSet: TfrDBDataSet;
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    Selecao_1: TScrollBox;
    Divisao: TTabSet;
    Panel1: TPanel;
    BtnVisualizar: TBitBtn;
    BtnCancelar: TBitBtn;
    GroupBox_dados: TGroupBox;
    DS_situacao: TDataSource;
    DBNav_situacao: TDBNavigator;
    DBGrid_Situacao: TDBGrid;
    Panel_filtro: TPanel;
    GroupBox_Filtro: TGroupBox;
    GroupBox_total_grup: TGroupBox;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery_Total_Prod: TIBQuery;
    DS_total_Prod: TDataSource;
    DBNav_total_prod: TDBNavigator;
    DBGrid_total_prod: TDBGrid;
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
  private
    { Private declarations }
    QyRelatorio: TTabela;
    {02-Início do Bloco Modular. Modificações não serão preservadas}
    DSituacao: TDSituacao;
    procedure CalculosDSituacao(DataSet: TDataSet);
    procedure AtualizaDetalhe_DSituacao(Sender: TObject; Field: TField);
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
  FormRelSitucaoCred: TFormRelSitucaoCred;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, Abertura, GridPesquisa, Interno;

procedure TFormRelSitucaoCred.ConstroiSql;
var
  I: Integer;
begin
  {04-Início do Bloco Modular. Modificações não serão preservadas}
  DSituacao.Filtro.Clear;
  DSituacao.AtualizaSql(False);
  Parametros(DSituacao);
  DSituacao.Open;
  frDBDataSet.DataSet := DSituacao;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
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
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Situação Credito';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  DSituacao := TDSituacao.Create(Self);
  DSituacao.OnCalcFields := CalculosDSituacao;
  DSituacao.DataSource.OnDataChange := AtualizaDetalhe_DSituacao;
  QyRelatorio := DSituacao;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;

  if not DSituacao.Active  then
     ConstroiSql ;

//  DBNav_total_prod
  frReport.OnUserFunction := FuncoesExtras;
  DS_situacao.DataSet :=  DSituacao ;

  DBNav_situacao.DataSource := DS_situacao ;
  DBGrid_Situacao.DataSource := DS_situacao ;

  GroupBox_total_grup.Width := int(( Selecao_1.Width - Panel_filtro.Width ) / 2 )
  GroupBox_total_grup.Align := alBottom ;


  DBNav_situacao.Align := alTop ;
  DBGrid_Situacao.Align := alClient ;

  Panel_filtro.Align := alBottom ;
  GroupBox_dados.Align := alClient ;

  GroupBox_total_grup.Align := alBottom ;
  DBNav_total_prod.Align := alTop ;
  DBGrid_total_prod.Align := alClient ;

  IBQuery_Total_Prod.Database := BaseDados.BD_Base_Dados ;
  IBQuery_Total_Prod.Transaction := BaseDados.TRS_BD_Base_Dados ;
  IBQuery_Total_Prod.SQL.Clear ;
  IBQuery_Total_Prod.SQL.Add(sql_total_alimentos + sql_total_alimentos_grup );
  IBQuery_Total_Prod.Prepare ;
  IBQuery_Total_Prod.Open ;


  DS_total_Prod.DataSet := IBQuery_Total_Prod ;

  DBNav_total_prod.DataSource := DS_total_Prod ;
  DBGrid_total_prod.DataSource := DS_total_Prod ;



  FormResize(Self);

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
  frVariables['Titulo_1']     := Caption;
  frVariables['Titulo_2']     := '';
  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormRelSitucaoCred.BtnVisualizarClick(Sender: TObject);
begin
  ConstroiSql;
  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
//  QyRelatorio.Close;
end;

procedure TFormRelSitucaoCred.FormResize(Sender: TObject);
begin
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
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
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  DSituacao.Free;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
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

end.
