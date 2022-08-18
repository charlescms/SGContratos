{  [ if( [DOrdemCobrancaProdExp."DataLiq"] > 0 , [MascData([DOrdemCobrancaProdExp."DataLiq"], 'dd/mm/yyyy')] ,' ') ]
   [ if( [DOrdemCobrancaProdExp."DataOrdCobranca"] > 0 , [MascData([DOrdemCobrancaProdExp."DataOrdCobranca"], 'dd/mm/yyyy')] ,' ') ]
   Programa.: REL_FATURATAB.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br

   [[if( [DOrdemCobrncaProdExp."ValorConvertido"] > 0  , [SUM([DOrdemCobrncaProdExp."ValorConvertido"], BAMDA101)] ,0 )]]
   // NOME DO ARQUIVO REL_FATURATAB3.FRF
}
unit REL_FATURATAB;

interface

{$I Princ.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, BaseD, Atributo, Tabela, Menus, Calculos, db,
  {$I LTab.pas}
  XLookUp, XDBDate, Mask, XDate, XEdit, XNum, FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Tabs, comctrls, XBanner, checklst, Grids, DBGrids;

type
  TFormREL_FATURATAB = class(TForm)
    PnSup: TPanel;
    ShapeSup: TShape;
    LbTituloForm: TLabel;
    BtnAjuda: TSpeedButton;
    BtnFechar: TSpeedButton;
    frDBDataSet: TfrDBDataSet;
    {01-Início do Bloco Modular. Modificações não serão preservadas}
    frDBDataSet_DFaturaProdExp: TfrDBDataSet;
    frDBDataSet_DComplementoFatura: TfrDBDataSet;
    Label1: TLabel;
    ComboBox1: TComboBox;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    Selecao_1: TScrollBox;
    Divisao: TTabSet;
    Panel1: TPanel;
    BtnVisualizar: TBitBtn;
    BtnCancelar: TBitBtn;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
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
    procedure FormCreate(Sender: TObject);
  private
    s_titulo ,sNumOrdemCobrmaca  : string ;
    iTipoRelatorio : integer ; // { Fatura = 0 ou OrdemCobranca = 1 }
    l_formeCriado : boolean ;
    ENDERECO_EXP: TStringList;
    { Private declarations }
    QyRelatorio:TTabela;
    {02-Início do Bloco Modular. Modificações não serão preservadas}
    // FaturaTab: TDFaturaTab;
    DOrdemCobranca :TDOrdemCobranca    ;
    //DFaturaProdExp: TDFaturaProdExp;
    DOrdemCobrancaProdExp : TDOrdemCobrancaProdExp    ;
    //DComplementoFatura: TDComplementoFatura;
    DOrdemCobrancaDescont : TDOrdemCobrancaDescont ;
    procedure CalculosDFaturaTab(DataSet: TDataSet);
    procedure AtualizaDetalhe_DFaturaTab(Sender: TObject; Field: TField);
    procedure CalculosDFaturaProdExp(DataSet: TDataSet);
    procedure AtualizaDetalhe_DFaturaProdExp(Sender: TObject; Field: TField);
    procedure CalculosDComplementoFatura(DataSet: TDataSet);
    procedure AtualizaDetalhe_DComplementoFatura(Sender: TObject; Field: TField);
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure ConstroiSql;
    procedure InicializaVariaveis;
    procedure Parametros(Tabela: TTabela);
    procedure Get_End_Export(i_cod: integer );
    procedure Fnalizar ;
  public
    { Public declarations }
    {03-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    procedure Set_TipoRelatorio(iTipo : integer ) ;
    procedure set_NumOrdCobranca(s_NumOrdCobranca: string );
  //  procedure set_Tipo(iTipo: integer );
    procedure exibir_rel(s_NumOrdCobranca: string  );
  end;

var
  FormREL_FATURATAB: TFormREL_FATURATAB;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, Abertura, GridPesquisa, Interno, RotinaEd;

procedure TFormREL_FATURATAB.Set_TipoRelatorio(iTipo : integer ) ;
begin
iTipoRelatorio :=  iTipo ;


end;

procedure TFormREL_FATURATAB.ConstroiSql;
var
  I: Integer;
  S_L : TStringList ; // TSTRINGS ;
begin
try
  S_L := TStringList.Create ;
  {04-Início do Bloco Modular. Modificações não serão preservadas}
  DOrdemCobranca.Filtro.Clear;
  // 07/12/2011 CORRECAO DE FIGURA NAO EXIBIDA
  if iTipoRelatorio = 0 then
     DOrdemCobranca.Filtro.Add('(OrdemCobranca.FATURA = :ComboBox1)')
  else
     DOrdemCobranca.Filtro.Add('(OrdemCobranca.NumOrdCobranca = ' + AtribuiAspas( sNumOrdemCobrmaca) + ' )');


  DOrdemCobranca.AtualizaSql(False);
  Parametros(DOrdemCobranca);
  DOrdemCobranca.SQL.SaveToFile('_REL_FATURATAB_F_DOrdemCobranca.SQL');
  DOrdemCobranca.Open;
  frDBDataSet.DataSet := DOrdemCobranca;
  frDBDataSet_DFaturaProdExp.DataSet := DOrdemCobrancaProdExp;
  frDBDataSet_DComplementoFatura.DataSet := DOrdemCobrancaDescont;
  I  := 0 ;
  WHILE DOrdemCobrancaProdExp.Fields.Count > I  DO BEGIN
        S_L.Add( DOrdemCobrancaProdExp.Fields[I].FieldName ) ;
        I := I + 1 ;
  END ;

  S_L.SaveToFile('FILD.TXT');
  S_L.Clear;
  S_L.Free ;

  {99-Final do Bloco Modular. Modificações não serão preservadas}
  QyRelatorio := DOrdemCobranca;

except
  on Erro: Exception do
  begin
    MessageDlg('Erro cms0006 : ' + Erro.Message, mtError, [mbOk], 0);
  end;
end;


end;

procedure TFormREL_FATURATAB.Parametros(Tabela: TTabela);
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

procedure TFormREL_FATURATAB.FormShow(Sender: TObject);
Var
  I: Integer;
begin
try
if not l_formeCriado  then begin
   ENDERECO_EXP:= TStringList.Create;
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := '' ; // 'Faturas ';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  DOrdemCobranca := TDOrdemCobranca.Create(Self);
  DOrdemCobranca.OnCalcFields := CalculosDFaturaTab;
  DOrdemCobranca.DataSource.OnDataChange := AtualizaDetalhe_DFaturaTab;
  DOrdemCobrancaProdExp := tDOrdemCobrancaProdExp.Create(Self);
  DOrdemCobrancaProdExp.OnCalcFields := CalculosDFaturaProdExp;
  DOrdemCobrancaProdExp.DataSource.OnDataChange := AtualizaDetalhe_DFaturaProdExp;
  DOrdemCobrancaDescont := TDOrdemCobrancaDescont.Create(Self);
  DOrdemCobrancaDescont.OnCalcFields := CalculosDComplementoFatura;
  DOrdemCobrancaDescont.DataSource.OnDataChange := AtualizaDetalhe_DComplementoFatura;
  QyRelatorio := DOrdemCobranca;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  FormResize(Self);
  frReport.OnUserFunction := FuncoesExtras;

  if iTipoRelatorio = 0 then
     Carrega_CB(ComboBox1,nil,'select FATURA from OrdemCobranca order by FATURA ','FATURA',self)
  ELSE begin
     Label1.Caption := 'Ordem Cobrança Surimpex' ;
     Carrega_CB(ComboBox1,nil,'select NumOrdCobranca from OrdemCobranca order by NumOrdCobranca ','NumOrdCobranca',self) ;
  end ;

  DataSource1.DataSet  := DOrdemCobranca ;
  DataSource2.DataSet  := DOrdemCobrancaProdExp;
  DataSource3.DataSet  := DOrdemCobrancaDescont ;
end;

except
  on Erro: Exception do
  begin
    MessageDlg('Erro cms0003 : ' + Erro.Message, mtError, [mbOk], 0);
  end;
end;

end;

procedure TFormREL_FATURATAB.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormREL_FATURATAB.InicializaVariaveis;
begin
try
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
  frVariables['Titulo_1']     := s_titulo ; //''; Caption;
  frVariables['Titulo_2']     := '';

  // NOVAS VARIAVEIS        ENDERECO_EXP
  frVariables['ENDERECO_EXP']     := ENDERECO_EXP.Text;
  frVariables['ENDERECO_REL']     := TabGlobal.DPARAMETROS.ENDERECOEMPRESA.Conteudo.Text;
  frVariables['TEXTO_PADRAO']     := TabGlobal.DPARAMETROS.TEXTOFATURA.Conteudo.Text;


  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);

except
  on Erro: Exception do
  begin
    MessageDlg('Erro cms0008 : ' + Erro.Message, mtError, [mbOk], 0);
  end;
end;


end;

procedure TFormREL_FATURATAB.BtnVisualizarClick(Sender: TObject);
var
  I: Integer;
  S_L : TStringList ; // TSTRINGS ;
begin
try
  ConstroiSql;
  Get_End_Export(DOrdemCobranca.FORCOD.Conteudo);

  s_titulo := '' ;
  if iTipoRelatorio = 1 then
     s_titulo := 'Ordem Cobrança ' + ComboBox1.Text  ;

  if iTipoRelatorio = 0 then
     frReport.LoadFromFile(Sistema.Pasta + '\Relatorios\REL_FATURATAB.frf')
  else
     frReport.LoadFromFile(Sistema.Pasta + '\Relatorios\REL_ORDCOBRANCA.frf') ;



  InicializaVariaveis;
  try
    if QyRelatorio.Eof then
      MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
    else
      BEGIN

        S_L := TStringList.Create ;
        I  := 0 ;
        WHILE DOrdemCobrancaProdExp.Fields.Count > I  DO BEGIN
              S_L.Add( DOrdemCobrancaProdExp.Fields[I].FieldName ) ;
              I := I + 1 ;
        END ;

        S_L.SaveToFile('FILD2.TXT');
        S_L.Clear;
        S_L.Free ;

        s_titulo := '' ;

        frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
      END;
  except
  on Erro: Exception do
  begin
    MessageDlg('Erro cms0009 : ' + Erro.Message, mtError, [mbOk], 0);
  end;
  end;




except
  on Erro: Exception do
  begin
    MessageDlg('Erro cms0005 : ' + Erro.Message, mtError, [mbOk], 0);
  end;
end;

end;

procedure TFormREL_FATURATAB.FormResize(Sender: TObject);
begin
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
end;

procedure TFormREL_FATURATAB.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFormREL_FATURATAB.Fnalizar ;
begin
  ENDERECO_EXP.Free ;
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  DOrdemCobranca.Free;
  DOrdemCobrancaProdExp.Free;
  DOrdemCobrancaDescont.Free;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormREL_FATURATAB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Fnalizar ;

//  ENDERECO_EXP.Free ;
//  {07-Início do Bloco Modular. Modificações não serão preservadas}
//  DOrdemCobranca.Free;
//  DOrdemCobrncaProdExp.Free;
//  DOrdemCobrancaDescont.Free;
//  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

{08-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormREL_FATURATAB.CalculosDFaturaTab(DataSet: TDataSet);
begin
end;

procedure TFormREL_FATURATAB.CalculosDFaturaProdExp(DataSet: TDataSet);
begin
end;

procedure TFormREL_FATURATAB.CalculosDComplementoFatura(DataSet: TDataSet);
begin
end;

procedure TFormREL_FATURATAB.AtualizaDetalhe_DFaturaTab(Sender: TObject;
  Field: TField);
begin
  DOrdemCobrancaProdExp.AtribuiFiltroMestre(True, False);
  DOrdemCobrancaProdExp.AtualizaSql(False);
  Parametros(DOrdemCobrancaProdExp);
  DOrdemCobrancaProdExp.Open;

  DOrdemCobrancaDescont.AtribuiFiltroMestre(True, False);
  DOrdemCobrancaDescont.AtualizaSql(False);
  Parametros(DOrdemCobrancaDescont);
  DOrdemCobrancaDescont.Open;

end;

procedure TFormREL_FATURATAB.AtualizaDetalhe_DFaturaProdExp(Sender: TObject;
  Field: TField);
begin
end;

procedure TFormREL_FATURATAB.AtualizaDetalhe_DComplementoFatura(Sender: TObject;
  Field: TField);
begin
end;
{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormREL_FATURATAB.FuncoesExtras(const Name: String; p1, p2,
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

procedure TFormREL_FATURATAB.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then   // Calendário
    Interno108
  else if Key = VK_F6 then // Calculadora
    Interno109
  else if Key = VK_F7 then // Agenda
    Interno110;
end;

procedure TFormREL_FATURATAB.Get_End_Export(i_cod: integer );
var
  t_tmp : TTabela;
begin
try

IF i_cod > 0 THEN BEGIN
   t_tmp := TTabela.Create(nil);
   t_tmp.DataBase := DOrdemCobranca.DataBase ;
   t_tmp.Transaction := DOrdemCobranca.Transaction ;
   t_tmp.SQL.Clear ;
   t_tmp.SQL.Add('SELECT  FORNECEDORES.ENDERECO , FORNECEDORES.CID , TAB_PAIS.NOME FROM  FORNECEDORES , TAB_PAIS WHERE  FORNECEDORES.ID = TAB_PAIS.ID  and FORNECEDORES.FORCOD = ' + inttostr(i_cod) );
   // t_tmp.Prepare;
   // t_tmp.Open ;
   t_tmp.AtualizaSql;
   ENDERECO_EXP.Clear ;
   ENDERECO_EXP.Add(t_tmp.FieldValues['ENDERECO'] ) ;
   ENDERECO_EXP.Add(t_tmp.FieldValues['CID'] + t_tmp.FieldValues['NOME'] ) ;
   t_tmp.close ;
   t_tmp.Free ;
END
ELSE BEGIN
  ENDERECO_EXP.Clear ;
  ENDERECO_EXP.Add( '  ' ) ;
END;
except
  on Erro: Exception do
  begin
    MessageDlg('Erro cms0007 : ' + Erro.Message, mtError, [mbOk], 0);
  end;
end;

end;


procedure TFormREL_FATURATAB.BitBtn1Click(Sender: TObject);
begin
  ConstroiSql;

end;

procedure TFormREL_FATURATAB.set_NumOrdCobranca(s_NumOrdCobranca: string );
begin
  ComboBox1.Text :=  s_NumOrdCobranca ;
  sNumOrdemCobrmaca := s_NumOrdCobranca ;

  ConstroiSql ;
end;

procedure TFormREL_FATURATAB.exibir_rel(s_NumOrdCobranca: string );
begin

  ComboBox1.Text :=  s_NumOrdCobranca ;
  sNumOrdemCobrmaca := s_NumOrdCobranca ;

  FormShow(self);
  BtnVisualizarClick(self);
  Fnalizar ;
end;

procedure TFormREL_FATURATAB.FormCreate(Sender: TObject);
Var
  I: Integer;
begin
try
  s_titulo := '' ;
  iTipoRelatorio :=  0 ;
  l_formeCriado := true ;
  ENDERECO_EXP:= TStringList.Create;
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Faturas ';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  DOrdemCobranca := TDOrdemCobranca.Create(Self);
  DOrdemCobranca.OnCalcFields := CalculosDFaturaTab;
  DOrdemCobranca.DataSource.OnDataChange := AtualizaDetalhe_DFaturaTab;
  DOrdemCobrancaProdExp := TDOrdemCobrancaProdExp.Create(Self);
  DOrdemCobrancaProdExp.OnCalcFields := CalculosDFaturaProdExp;
  DOrdemCobrancaProdExp.DataSource.OnDataChange := AtualizaDetalhe_DFaturaProdExp;
  DOrdemCobrancaDescont := TDOrdemCobrancaDescont.Create(Self);
  DOrdemCobrancaDescont.OnCalcFields := CalculosDComplementoFatura;
  DOrdemCobrancaDescont.DataSource.OnDataChange := AtualizaDetalhe_DComplementoFatura;
  QyRelatorio := DOrdemCobranca;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  FormResize(Self);
  frReport.OnUserFunction := FuncoesExtras;

  if iTipoRelatorio = 0 then
     Carrega_CB(ComboBox1,nil,'select FATURA from OrdemCobranca order by FATURA ','FATURA',self)
  ELSE
     Carrega_CB(ComboBox1,nil,'select NumOrdCobranca from OrdemCobranca order by NumOrdCobranca ','NumOrdCobranca',self) ;



  DataSource1.DataSet  := DOrdemCobranca ;
  DataSource2.DataSet  := DOrdemCobrancaProdExp;
  DataSource3.DataSet  := DOrdemCobrancaDescont ;

except
  on Erro: Exception do
  begin
    MessageDlg('Erro cms0002 : ' + Erro.Message, mtError, [mbOk], 0);
  end;
end;

end;


end.
