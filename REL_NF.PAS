{
   Programa.: REL_NF.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
mascara do campo de data recebimento
   [if( [ MascData([DOrdemCobranca."Recebimento"] , 'dd/mm/yyyy') ] > 0 , [MascData([DOrdemCobranca."Recebimento"] , 'dd/mm/yyyy')]  ,[ '  /  /    '] )]
[IBQuery_soma."ANOMES"]
}
unit REL_NF;

interface

{$I Princ.inc}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, BaseD, Atributo, Tabela, Menus, Calculos, db,
  {$I LTab.pas}
  XLookUp, XDBDate, Mask, XDate, XEdit, XNum, FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Tabs, comctrls, XBanner, checklst, IBDatabase, IBCustomDataSet, IBQuery,
  FR_E_RTF, FR_E_CSV, FR_E_HTM, CMS_FUNCOES;
 // CORRECAO DE CAMPO CADASTRO PARA DataNF
CONST
SQL_SOMA =
'SELECT ' + NOVA_LINHA +
   // correcao 08/01/2012 problema identificado em teste charles
   //'RESULTADO.anomes ' + NOVA_LINHA +
  ' iif( RESULTADO.anomes is null , ''0000/00'' ,  RESULTADO.anomes) as   anomes '  + NOVA_LINHA +
  ',RESULTADO.VALOR_NF_LIQ ' + NOVA_LINHA +
  ',RESULTADO.VALORRECEBIDO ' + NOVA_LINHA +    // 07/12/2011  a funcao trunc foi incluida para o aredondamento do resultado   
  ',( trunc( RESULTADO.VALOR_NF_LIQ ,2 ) -  trunc( RESULTADO.VALORRECEBIDO ,2 ) )  as PENDENTE ' + NOVA_LINHA +
'FROM ( ' + NOVA_LINHA +
  ' select  extract(year from  DataNF)  || ''/'' || iif(  extract(month from  DataNF)  < 10 , ''0''|| extract(month from  DataNF) ,extract(month from  DataNF))   as anomes ' + NOVA_LINHA +
         ', sum(iif ( VALOR_NF_LIQ is null , 0, VALOR_NF_LIQ )   ) as VALOR_NF_LIQ ' + NOVA_LINHA +
         ', sum(iif ( VALORRECEBIDO is null , 0, VALORRECEBIDO )) as VALORRECEBIDO ' + NOVA_LINHA +
  'from ordemcobranca '+ NOVA_LINHA +
  'WHERE ' +  NOVA_LINHA ;
   
SQL_SOMA_ORDER = NOVA_LINHA +
  ' group by anomes   order by  anomes desc  ) AS RESULTADO ' ;

SQL_detalahes =
'Select '+ NOVA_LINHA +
  'OrdemCobranca.NumOrdCobranca AS NumOrdCobranca,'+ NOVA_LINHA +
  'OrdemCobranca.FORCOD AS FORCOD,'+ NOVA_LINHA +
  'OrdemCobranca.Cadastro AS Cadastro,'+ NOVA_LINHA +
  'OrdemCobranca.FATURA AS FATURA,'+ NOVA_LINHA +
  'OrdemCobranca.DataFatura AS DataFatura,'+ NOVA_LINHA +
  'OrdemCobranca.Status AS Status,'+ NOVA_LINHA +
  'OrdemCobranca.CTTO AS CTTO,'+ NOVA_LINHA +
  'OrdemCobranca.MOEDACOMISSAO AS MOEDACOMISSAO,'+ NOVA_LINHA +
  'OrdemCobranca.Valor AS Valor,'+ NOVA_LINHA +
  'OrdemCobranca.ValorDesconto AS ValorDesconto,'+ NOVA_LINHA +
  'OrdemCobranca.VALOR_LIQ AS VALOR_LIQ,'+ NOVA_LINHA +
  'OrdemCobranca.NumNFEmit AS NumNFEmit,'+ NOVA_LINHA +
  'OrdemCobranca.DataNF AS DataNF,'+ NOVA_LINHA +
  'OrdemCobranca.Comentario AS Comentario,'+ NOVA_LINHA +
  'OrdemCobranca.VALOR_NF AS VALOR_NF,'+ NOVA_LINHA +
  'OrdemCobranca.VALOR_IRRF AS VALOR_IRRF,'+ NOVA_LINHA +
  'OrdemCobranca.VALOR_PIS_COF AS VALOR_PIS_COF,'+ NOVA_LINHA +
  'OrdemCobranca.VALOR_NF_LIQ AS VALOR_NF_LIQ,'+ NOVA_LINHA +
  'OrdemCobranca.DataLiq AS DataLiq,'+ NOVA_LINHA +
  'OrdemCobranca.DataProtesto AS DataProtesto,'+ NOVA_LINHA +
  'OrdemCobranca.Recebimento AS Recebimento,'+ NOVA_LINHA +
  'OrdemCobranca.VALORRECEBIDO AS VALORRECEBIDO,'+ NOVA_LINHA +
  'Fornecedores.RAZAO AS RAZAO,'+ NOVA_LINHA +
  'Tab_pais.NOME AS NOME,'+ NOVA_LINHA +
  'OrdemCobranca.TEXTO_PADRAO AS TEXTO_PADRAO,'+ NOVA_LINHA +
  'OrdemCobranca.Usuario AS Usuario,'+ NOVA_LINHA +
  'Fornecedores.ID AS ID'+ NOVA_LINHA +
'from OrdemCobranca'+ NOVA_LINHA +
'Left Outer Join Fornecedores on'+ NOVA_LINHA +
  'OrdemCobranca.FORCOD = Fornecedores.FORCOD'+ NOVA_LINHA +
'Left Outer Join Tab_pais on'+ NOVA_LINHA +
  'Fornecedores.ID = Tab_pais.ID'+ NOVA_LINHA +
'Where ' + NOVA_LINHA ;
SQL_detalahes_orde =  NOVA_LINHA +
'Order By OrdemCobranca.NumOrdCobranca DESC';

type
  TFormREL_NF = class(TForm)
    PnSup: TPanel;
    ShapeSup: TShape;
    LbTituloForm: TLabel;
    BtnAjuda: TSpeedButton;
    BtnFechar: TSpeedButton;
    frDBDataSet: TfrDBDataSet;
    frDBDataSet_DOrdemCobrancaProdExp: TfrDBDataSet;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    Selecao_1: TScrollBox;
    Divisao: TTabSet;
    Panel1: TPanel;
    BtnVisualizar: TBitBtn;
    BtnCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DT_INCIAL: TXDateEdit;
    DT_FINAL: TXDateEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    CBox_INIC: TComboBox;
    CBox_FIM: TComboBox;
    RadG_Fat: TRadioGroup;
    frDBDataSet_soma: TfrDBDataSet;
    IBQuery_soma: TIBQuery;
    frHTMExport1: TfrHTMExport;
    RadioGr_dadosExportacao: TRadioGroup;
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
    s_texto_periodo : string ;
    { Private declarations }
    DOrdemCobranca : TDOrdemCobranca;
    DOrdemCobrancaProdExp : TDOrdemCobrancaProdExp;
    QyRelatorio: TTabela;
    procedure CalculosDOrdemCobranca(DataSet: TDataSet);
    procedure AtualizaDetalhe_DOrdemCobranca(Sender: TObject; Field: TField);
    procedure CalculosDOrdemCobrancaProdExp(DataSet: TDataSet);
    procedure AtualizaDetalhe_DOrdemCobrancaProdExp(Sender: TObject; Field: TField);
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
  FormREL_NF: TFormREL_NF;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, Abertura, GridPesquisa, Interno, UCMS_CONST, RotinaEd;

procedure TFormREL_NF.ConstroiSql;
var
  s_filtro : string ;
  S_CLICOD  : STRING ;
  N_INC  , N_FIN : INTEGER ;

begin
  s_filtro := '' ;
  s_texto_periodo := '' ;
  s_texto_periodo :=  DT_INCIAL.Text + ' a ' + DT_FINAL.Text ;
  if DT_INCIAL.DateValue <> CMS_Data_vazia then
     s_filtro := 'OrdemCobranca.DataNF >= ' + AtribuiAspas( COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2)) ; // '' + COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2) + ''''

  if DT_FINAL.DateValue <> CMS_Data_vazia then
     if s_filtro = '' then
        s_filtro := 'OrdemCobranca.DataNF <= ' + AtribuiAspas( COPY( DT_FINAL.Text , 7, 4)+ '/'+ COPY( DT_FINAL.Text , 4,2)+'/'+ COPY( DT_FINAL.Text , 1,2) ) // '' + COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2) + ''''
     else
        s_filtro :=  s_filtro + ' and OrdemCobranca.DataNF <= ' + AtribuiAspas(COPY( DT_FINAL.Text , 7, 4)+ '/'+ COPY( DT_FINAL.Text , 4,2)+'/'+ COPY( DT_FINAL.Text , 1,2)) ; // '' + COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2) + ''''

  IF CBox_INIC.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_INIC.Text) + 2   ;
     N_FIN := POS('<<',CBox_INIC.Text)   ;
     S_CLICOD := COPY( CBox_INIC.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' OrdemCobranca.FORCOD >= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND OrdemCobranca.FORCOD >= '+ S_CLICOD ;
  END;

  IF CBox_FIM.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_FIM.Text) + 2   ;
     N_FIN := POS('<<',CBox_FIM.Text)   ;
     S_CLICOD := COPY( CBox_FIM.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := ' OrdemCobranca.FORCOD <= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND OrdemCobranca.FORCOD <= '+ S_CLICOD ;
  END;

  // sem fatuar
  if (RadG_Fat.ItemIndex = 1)  then
      IF  S_FILTRO = '' THEN
         S_FILTRO := ' OrdemCobranca.FATURA is null '
      else
         S_FILTRO := S_FILTRO + ' and OrdemCobranca.FATURA is null ';
  // com fatura
  if (RadG_Fat.ItemIndex = 2)  then
      IF  S_FILTRO = '' THEN
         S_FILTRO := ' not OrdemCobranca.FATURA is null '
      else
         S_FILTRO := S_FILTRO + ' and not OrdemCobranca.FATURA is null ';


  IF  S_FILTRO <> '' THEN
      S_FILTRO := S_FILTRO +  ' AND  not OrdemCobranca.NumNFEmit is null '
  else
      S_FILTRO := ' not OrdemCobranca.NumNFEmit is null ' ;

  IBQuery_soma.CLOSE ;
  IBQuery_soma.SQL.Clear ;
  IBQuery_soma.SQL.Add(SQL_SOMA + S_FILTRO + SQL_SOMA_ORDER )  ;
  IBQuery_soma.SQL.SaveToFile('_IBQuery_soma_REL_NF.SQL');
  IBQuery_soma.Prepare  ;
  IBQuery_soma.Open;

  // DOrdemCobranca.Filtro.Clear;
  {04-Início do Bloco Modular. Modificações não serão preservadas}
  DOrdemCobranca.Filtro.Clear;
  DOrdemCobranca.AtualizaSql(False);
  Parametros(DOrdemCobranca);
  DOrdemCobranca.Open;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  DOrdemCobranca.close;
  DOrdemCobranca.Filtro.Clear;
  DOrdemCobranca.Filtro.Add(S_FILTRO)     ;
  DOrdemCobranca.AtualizaSql;
//  DOrdemCobranca.AtribuiRelacionamentos;
  DOrdemCobranca.SQL.SaveToFile('_DOrdemCobranca_REL_NF.SQL');
  Parametros(DOrdemCobranca);
//  DOrdemCobranca.Open;
  QyRelatorio := DOrdemCobranca;

{
  if RadioGr_dadosExportacao.ItemIndex = 1 then begin
     frReport.LoadFromFile(Sistema.Pasta + '..\Relatórios\Layout_NF.frf');
     DOrdemCobrancaProdExp.Close ;
     frDBDataSet_DOrdemCobrancaProdExp.Close ;
     frDBDataSet_DOrdemCobrancaProdExp.DataSet := DOrdemCobrancaProdExp;
     frDBDataSet_DOrdemCobrancaProdExp.CloseDataSource := false ;
     frDBDataSet_DOrdemCobrancaProdExp.DataSet.Close ;
  end;
}

  if RadioGr_dadosExportacao.ItemIndex = 1 then
     frReport.LoadFromFile(Sistema.Pasta + '\Relatorios\REL_NF_EXP.frf')
  else
      frReport.LoadFromFile(Sistema.Pasta + '\Relatorios\REL_NF.frf');

//  QyRelatorio := DOrdemCobranca;
  frDBDataSet.DataSet := DOrdemCobranca;
  frDBDataSet_soma.DataSet :=  IBQuery_soma ;
  frDBDataSet.DataSet := DOrdemCobranca;
  frDBDataSet_DOrdemCobrancaProdExp.DataSet := DOrdemCobrancaProdExp;
//  frDBDataSet.DataSet := DOrdemCobranca;
//  frDBDataSet_DOrdemCobrancaProdExp.DataSet := DOrdemCobrancaProdExp;



//  frDBDataSet.DataSet := DOrdemCobranca;
//  frDBDataSet_DOrdemCobrancaProdExp.DataSet := DOrdemCobrancaProdExp;


end;

procedure TFormREL_NF.Parametros(Tabela: TTabela);
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

procedure TFormREL_NF.FormShow(Sender: TObject);
begin
  Carrega_CB(CBox_INIC,CBox_FIM,'SELECT RAZAO || '' >> '' || FORCOD || '' << ''  AS CAMPOS FROM FORNECEDORES ORDER BY RAZAO', 'CAMPOS',SELF);

  DOrdemCobranca := TDOrdemCobranca.Create(Self);
//  DOrdemCobranca_sql.Transaction := DOrdemCobranca.Transaction ;
//  DOrdemCobranca_sql.Database := DOrdemCobranca.Database ;

//  DOrdemCobrancaProdExp_sql.Transaction := DOrdemCobranca.Transaction ;
//  DOrdemCobrancaProdExp_sql.Database := DOrdemCobranca.Database ;



  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Nota Fiscal de Serviço';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}
//  DOrdemCobranca := TDOrdemCobranca.Create(Self);
  DOrdemCobranca.OnCalcFields := CalculosDOrdemCobranca;
  DOrdemCobranca.DataSource.OnDataChange := AtualizaDetalhe_DOrdemCobranca;
  DOrdemCobrancaProdExp := TDOrdemCobrancaProdExp.Create(Self);
  DOrdemCobrancaProdExp.OnCalcFields := CalculosDOrdemCobrancaProdExp;
  DOrdemCobrancaProdExp.DataSource.OnDataChange := AtualizaDetalhe_DOrdemCobrancaProdExp;
  QyRelatorio := DOrdemCobranca;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  FormResize(Self);
  frReport.OnUserFunction := FuncoesExtras;
  IBQuery_soma.Transaction := DOrdemCobranca.Transaction ;
  IBQuery_soma.Database := DOrdemCobranca.Database ;
{
  DOrdemCobranca.Transaction := DOrdemCobranca_old.Transaction ;
  DOrdemCobranca.Database := DOrdemCobranca_old.Database ;

  DOrdemCobrancaProdExp_t.Transaction := DOrdemCobranca_old.Transaction ;
  DOrdemCobrancaProdExp_t.Database := DOrdemCobranca_old.Database ;
}
//  frDBDataSet_soma.DataSet :=  IBQuery_soma ;
//  frDBDataSet.DataSet := DOrdemCobranca;
//  frDBDataSet_DOrdemCobrancaProdExp.DataSet := DOrdemCobrancaProdExp;
//  frReport.LoadFromFile(Sistema.Pasta + '..\Relatórios\Layout_NF.frf');
end;

procedure TFormREL_NF.BtnFecharClick(Sender: TObject);
begin
  Close;            
end;

procedure TFormREL_NF.InicializaVariaveis;
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
  // 07/12/2011 criado neste periodo para incluir  o periodo o relatorio
  // RETIRADA PARA FACILITAR
  frVariables['ANOMES_1']       := '  ->  ' ;//s_texto_periodo;
  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormREL_NF.BtnVisualizarClick(Sender: TObject);
begin
  ConstroiSql;
  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
  QyRelatorio.Close;
end;

procedure TFormREL_NF.FormResize(Sender: TObject);
begin
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
end;

procedure TFormREL_NF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFormREL_NF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin


  {07-Início do Bloco Modular. Modificações não serão preservadas}
  DOrdemCobranca.Free;
  DOrdemCobrancaProdExp.Free;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

{08-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormREL_NF.CalculosDOrdemCobranca(DataSet: TDataSet);
begin
end;

procedure TFormREL_NF.CalculosDOrdemCobrancaProdExp(DataSet: TDataSet);
begin
  DOrdemCobrancaProdExp.COMISAOSFATURA_EX.Conteudo := CalculaDOrdemCobrancaProdExp_COMISAOSFATURA_EX_Rel(Self);
  DOrdemCobrancaProdExp.VALORCONVERTIDO_EX.Conteudo := CalculaDOrdemCobrancaProdExp_VALORCONVERTIDO_EX_Rel(Self);
end;

procedure TFormREL_NF.AtualizaDetalhe_DOrdemCobranca(Sender: TObject;
  Field: TField);
begin

  DOrdemCobrancaProdExp.AtribuiFiltroMestre(True, False);
  DOrdemCobrancaProdExp.AtualizaSql(False);
  Parametros(DOrdemCobrancaProdExp);
  DOrdemCobrancaProdExp.Open;

end;

procedure TFormREL_NF.AtualizaDetalhe_DOrdemCobrancaProdExp(Sender: TObject;
  Field: TField);
begin
end;

{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormREL_NF.FuncoesExtras(const Name: String; p1, p2,
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

procedure TFormREL_NF.FormKeyDown(Sender: TObject; var Key: Word;
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
