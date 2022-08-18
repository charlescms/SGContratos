{
   Programa.: REL_NF.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
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
  FR_E_RTF, FR_E_CSV, FR_E_HTM;

CONST
SQL_SOMA =
'SELECT ' +
   'RESULTADO.anomes ' +
  ',RESULTADO.VALOR_NF_LIQ ' +
  ',RESULTADO.VALORRECEBIDO ' +
  ',( RESULTADO.VALOR_NF_LIQ -  RESULTADO.VALORRECEBIDO )  as PENDENTE ' +
'FROM ( ' +
  ' select  extract(year from  cadastro)  || ''/'' || iif(  extract(month from  cadastro)  < 10 , ''0''|| extract(month from  cadastro) ,extract(month from  cadastro))   as anomes ' +
         ', sum(iif ( VALOR_NF_LIQ is null , 0, VALOR_NF_LIQ )   ) as VALOR_NF_LIQ ' +
         ', sum(iif ( VALORRECEBIDO is null , 0, VALORRECEBIDO )) as VALORRECEBIDO ' +
  'from ordemcobranca '+
  'WHERE ';
SQL_SOMA_ORDER =
  ' group by anomes   order by  anomes desc  ) AS RESULTADO ' ;

SQL_detalahes =
'Select '+
  'OrdemCobranca.NumOrdCobranca AS NumOrdCobranca,'+
  'OrdemCobranca.FORCOD AS FORCOD,'+
  'OrdemCobranca.Cadastro AS Cadastro,'+
  'OrdemCobranca.FATURA AS FATURA,'+
  'OrdemCobranca.DataFatura AS DataFatura,'+
  'OrdemCobranca.Status AS Status,'+
  'OrdemCobranca.CTTO AS CTTO,'+
  'OrdemCobranca.MOEDACOMISSAO AS MOEDACOMISSAO,'+
  'OrdemCobranca.Valor AS Valor,'+
  'OrdemCobranca.ValorDesconto AS ValorDesconto,'+
  'OrdemCobranca.VALOR_LIQ AS VALOR_LIQ,'+
  'OrdemCobranca.NumNFEmit AS NumNFEmit,'+
  'OrdemCobranca.DataNF AS DataNF,'+
  'OrdemCobranca.Comentario AS Comentario,'+
  'OrdemCobranca.VALOR_NF AS VALOR_NF,'+
  'OrdemCobranca.VALOR_IRRF AS VALOR_IRRF,'+
  'OrdemCobranca.VALOR_PIS_COF AS VALOR_PIS_COF,'+
  'OrdemCobranca.VALOR_NF_LIQ AS VALOR_NF_LIQ,'+
  'OrdemCobranca.DataLiq AS DataLiq,'+
  'OrdemCobranca.DataProtesto AS DataProtesto,'+
  'OrdemCobranca.Recebimento AS Recebimento,'+
  'OrdemCobranca.VALORRECEBIDO AS VALORRECEBIDO,'+
  'Fornecedores.RAZAO AS RAZAO,'+
  'Tab_pais.NOME AS NOME,'+
  'OrdemCobranca.TEXTO_PADRAO AS TEXTO_PADRAO,'+
  'OrdemCobranca.Usuario AS Usuario,'+
  'Fornecedores.ID AS ID'+
'from OrdemCobranca'+
'Left Outer Join Fornecedores on'+
  'OrdemCobranca.FORCOD = Fornecedores.FORCOD'+
'Left Outer Join Tab_pais on'+
  'Fornecedores.ID = Tab_pais.ID'+
'Where ';
SQL_detalahes_orde =
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
    frCSVExport1: TfrCSVExport;
    frRTFExport1: TfrRTFExport;
    RadioGr_dadosExportacao: TRadioGroup;
    DOrdemCobranca: TIBQuery;
    DOrdemCobrancaProdExp: TIBQuery;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    DOrdemCobrancaProdExpNUMORDCOBRANCA: TIBStringField;
    DOrdemCobrancaProdExpCONTRATO: TIBStringField;
    DOrdemCobrancaProdExpSEQ: TSmallintField;
    DOrdemCobrancaProdExpNAVIO: TIBStringField;
    DOrdemCobrancaProdExpDATAEMBARQUE: TDateTimeField;
    DOrdemCobrancaProdExpQUANTIDADEEXP: TFloatField;
    DOrdemCobrancaProdExpFATURA: TIBStringField;
    DOrdemCobrancaProdExpSTDOCUMENTO: TIBStringField;
    DOrdemCobrancaProdExpCADASTRO: TDateTimeField;
    DOrdemCobrancaProdExpETADESTINO: TDateTimeField;
    DOrdemCobrancaProdExpFORMPAGO: TIBStringField;
    DOrdemCobrancaProdExpPRECOFOB: TFloatField;
    DOrdemCobrancaProdExpDATAORDCOBRANCA: TDateTimeField;
    DOrdemCobrancaProdExpRATE: TFloatField;
    DOrdemCobrancaProdExpSTATUS: TIBStringField;
    DOrdemCobrancaProdExpOBS: TIBStringField;
    DOrdemCobrancaProdExpCOMENTARIO: TMemoField;
    DOrdemCobrancaProdExpDATALIQ: TDateTimeField;
    DOrdemCobrancaProdExpNOMEMIX: TIBStringField;
    DOrdemCobrancaProdExpCOMISSAO: TFloatField;
    DOrdemCobrancaProdExpVALOR_EX: TFloatField;
    DOrdemCobrancaProdExpVALORDESCONTO_EX: TFloatField;
    DOrdemCobrancaProdExpVALOR: TFloatField;
    DOrdemCobrancaProdExpVALORDESCONTO: TFloatField;
    DOrdemCobrancaProdExpMOEDACOMISSAO: TIBStringField;
    DOrdemCobrancaProdExpTAXACONVERCAO: TFloatField;
    DOrdemCobrancaProdExpCOMISAOSFATURA: TFloatField;
    DOrdemCobrancaProdExpVALORCONVERTIDO: TFloatField;
    DOrdemCobrancaProdExpUSUARIO: TIBStringField;
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
    DOrdemCobranca_old: TDOrdemCobranca;
    DOrdemCobrancaProdExp_old : TDOrdemCobrancaProdExp;
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
  if DT_INCIAL.DateValue <> CMS_Data_vazia then
     s_filtro := 'OrdemCobranca.Cadastro >= ' + AtribuiAspas( COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2)) ; // '' + COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2) + ''''
     //s_filtro := 'OrdemCobranca.Cadastro >= ''' + COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2) + ''''

  if DT_FINAL.DateValue <> CMS_Data_vazia then
     if s_filtro = '' then
        s_filtro := 'OrdemCobranca.Cadastro <= ' + AtribuiAspas( COPY( DT_FINAL.Text , 7, 4)+ '/'+ COPY( DT_FINAL.Text , 4,2)+'/'+ COPY( DT_FINAL.Text , 1,2) ) // '' + COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2) + ''''
     else
        s_filtro :=  s_filtro + ' and OrdemCobranca.Cadastro <= ' + AtribuiAspas(COPY( DT_FINAL.Text , 7, 4)+ '/'+ COPY( DT_FINAL.Text , 4,2)+'/'+ COPY( DT_FINAL.Text , 1,2)) ; // '' + COPY( DT_INCIAL.Text , 7, 4)+ '/'+ COPY( DT_INCIAL.Text , 4,2)+'/'+ COPY( DT_INCIAL.Text , 1,2) + ''''

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
  IBQuery_soma.SQL.SaveToFile('..\sql\IBQuery_soma_REL_NF.SQL');
  IBQuery_soma.Prepare  ;
  IBQuery_soma.Open;

//  DOrdemCobranca.Filtro.Clear;
//  DOrdemCobranca.Filtro.Add(S_FILTRO)     ;
//  DOrdemCobranca.SQL.SaveToFile('..\sql\DOrdemCobranca_REL_NF.SQL');

  DOrdemCobranca.CLOSE ;
  DOrdemCobranca.SQL.Clear ;
  DOrdemCobranca.SQL.Add(SQL_detalahes + S_FILTRO + SQL_detalahes_orde )  ;
  DOrdemCobranca.SQL.SaveToFile('..\sql\IBQuery_soma_REL_NF.SQL');
  DOrdemCobranca.Prepare  ;
  DOrdemCobranca.Open;



  // DOrdemCobranca.Filtro.Clear;
  {04-Início do Bloco Modular. Modificações não serão preservadas}
//  DOrdemCobranca.AtualizaSql(False);
//  DOrdemCobranca.SQL.SaveToFile('..\sql\DOrdemCobranca_REL_NF2.SQL');
//  DOrdemCobranca.Open;
//  Parametros(DOrdemCobranca);




  {99-Final do Bloco Modular. Modificações não serão preservadas}
  if RadioGr_dadosExportacao.ItemIndex = 1 then begin
     DOrdemCobrancaProdExp.Close ;
     frDBDataSet_DOrdemCobrancaProdExp.DataSet := DOrdemCobrancaProdExp;
  end;

  frDBDataSet.DataSet := DOrdemCobranca;
  frDBDataSet_soma.DataSet :=  IBQuery_soma ;

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

  DOrdemCobranca_old := TDOrdemCobranca.Create(Self);
  DOrdemCobranca.Transaction := DOrdemCobranca_old.Transaction ;
  DOrdemCobranca.Database := DOrdemCobranca_old.Database ;

  DOrdemCobrancaProdExp_t.Transaction := DOrdemCobranca_old.Transaction ;
  DOrdemCobrancaProdExp_t.Database := DOrdemCobranca_old.Database ;



  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'Nota Fiscal de Serviço';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}
//  DOrdemCobranca_old := TDOrdemCobranca.Create(Self);
  DOrdemCobranca_old.OnCalcFields := CalculosDOrdemCobranca;
  DOrdemCobranca_old.DataSource.OnDataChange := AtualizaDetalhe_DOrdemCobranca;
  DOrdemCobrancaProdExp := TDOrdemCobrancaProdExp.Create(Self);
  DOrdemCobrancaProdExp.OnCalcFields := CalculosDOrdemCobrancaProdExp;
  DOrdemCobrancaProdExp.DataSource.OnDataChange := AtualizaDetalhe_DOrdemCobrancaProdExp;
  QyRelatorio := DOrdemCobranca_old;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  FormResize(Self);
  frReport.OnUserFunction := FuncoesExtras;
  IBQuery_soma.Transaction := DOrdemCobranca_old.Transaction ;
  IBQuery_soma.Database := DOrdemCobranca_old.Database ;
{
  DOrdemCobranca.Transaction := DOrdemCobranca_old.Transaction ;
  DOrdemCobranca.Database := DOrdemCobranca_old.Database ;

  DOrdemCobrancaProdExp_t.Transaction := DOrdemCobranca_old.Transaction ;
  DOrdemCobrancaProdExp_t.Database := DOrdemCobranca_old.Database ;
}
//  frDBDataSet_soma.DataSet :=  IBQuery_soma ;
//  frDBDataSet.DataSet := DOrdemCobranca;
//  frDBDataSet_DOrdemCobrancaProdExp.DataSet := DOrdemCobrancaProdExp;

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
