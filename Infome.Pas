{  charles
   Programa.: Infome.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
      08/06/2011 relatorio concluido
}

unit Infome;

interface

{$I Princ.inc}




uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, BaseD, Atributo, Tabela, Menus, Calculos, db,
  {$I LTab.pas}
  XLookUp, XDBDate, Mask, XDate, XEdit, XNum, FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  {$IFDEF DELPHI5}{$ELSE}Variants, MaskUtils,{$ENDIF}
  Tabs, comctrls, XBanner, checklst, Grids, DBGrids, DBCtrls,
  IBCustomDataSet, IBQuery;

const
 NOVA_LINHA = CHR(13)+CHR(10) ;
 SC_SQL_TOTAL ='SELECT ' +  NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	AS QuantidadeTotal, ' +   NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	AS VALORSCCTOTAL ,  ' +    NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	AS QUANTTOTALEXP,   ' +    NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	AS VALORTOTALEXP,   ' +    NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)   AS QUANTADEPENDENTE, ' +  NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE) AS VALORTOTALPENDENTE,' +  NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO) AS VALORTOTALCOMISSAO , ' + NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado) AS ValorTotalComissaoExecutado , ' + NOVA_LINHA +
 	             '    Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente) AS VlTotalComissaoPendente , ' +  NOVA_LINHA +
               '    '' < = TOTAL GERAL  '' ' +  NOVA_LINHA +
               'FROM CONTRATOTRANSPORTE ' ;
 SC_SQL_TOTAL_WHERE = ' WHERE CONTRATOTRANSPORTE.CADASTRO = '  ;


 SC_SQL_PROD ='SELECT ' +
	            '    Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL) 	AS QuantidadeTotal, ' +  NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)   	AS VALORSCCTOTAL ,  ' +   NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)   	AS QUANTTOTALEXP,   ' +  NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)   	AS VALORTOTALEXP,   ' +   NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE)   AS QUANTADEPENDENTE, ' +   NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE) AS VALORTOTALPENDENTE,' +   NOVA_LINHA +
              '    Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO) AS VALORTOTALCOMISSAO ,' +   NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado) AS ValorTotalComissaoExecutado , ' +  NOVA_LINHA +
	            '    Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente) AS VlTotalComissaoPendente , ' +  NOVA_LINHA +
              '    CONTRATOTRANSPORTE.NOMEMIX ' +  NOVA_LINHA +
              'FROM CONTRATOTRANSPORTE ' ;
  SC_SQL_PROD_WHERE = ' WHERE CONTRATOTRANSPORTE.CADASTRO = '  ;
  SC_SQL_PROD_ORDER = ' GROUP BY CONTRATOTRANSPORTE.NOMEMIX' ;

  SC_SQL_PAIS =  'SELECT ' +   NOVA_LINHA +
	               '    Sum(CONTRATOTRANSPORTE.QUANTIDADETOTAL)  	AS QuantidadeTotal,' +   NOVA_LINHA +
	               '    Sum(CONTRATOTRANSPORTE.VALORSCCTOTAL)    	AS VALORSCCTOTAL ,  ' +  NOVA_LINHA +
	               '    Sum(CONTRATOTRANSPORTE.QUANTTOTALEXP)    	AS QUANTTOTALEXP,   ' +  NOVA_LINHA +
	               '    Sum(CONTRATOTRANSPORTE.VALORTOTALEXP)    	AS VALORTOTALEXP,   ' +    NOVA_LINHA +
	               '    Sum(CONTRATOTRANSPORTE.QUANTADEPENDENTE) 	AS QUANTADEPENDENTE,'  +   NOVA_LINHA +
	               '    Sum(CONTRATOTRANSPORTE.VALORTOTALPENDENTE) AS VALORTOTALPENDENTE,' +   NOVA_LINHA +
	               '    Sum(CONTRATOTRANSPORTE.VALORTOTALCOMISSAO) AS VALORTOTALCOMISSAO ,' +    NOVA_LINHA +
                 '    Sum(CONTRATOTRANSPORTE.ValorTotalComissaoExecutado) AS ValorTotalComissaoExecutado , ' +   NOVA_LINHA +
	               '    Sum(CONTRATOTRANSPORTE.VlTotalComissaoPendente) AS VlTotalComissaoPendente , ' +    NOVA_LINHA +
                 '   ''TOTAL '' || TAB_PAIS.NOME AS PAIS ' +    NOVA_LINHA +
                 ' FROM CONTRATOTRANSPORTE,TAB_PAIS '  +    NOVA_LINHA;

  SC_SQL_PAIS_WHERE = ' WHERE CONTRATOTRANSPORTE.ID=TAB_PAIS.ID ' +    NOVA_LINHA ;


  SC_SQL_PAIS_ORDER   = ' GROUP BY TAB_PAIS.NOME'   +    NOVA_LINHA  ;


type
  TFormInfome = class(TForm)
    PnSup: TPanel;
    ShapeSup: TShape;
    LbTituloForm: TLabel;
    BtnAjuda: TSpeedButton;
    BtnFechar: TSpeedButton;
    frDBDataSet: TfrDBDataSet;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    CBox_FIM: TComboBox;
    CBox_INIC: TComboBox;
    XDT_FIM: TXDateEdit;
    XDT_INIC: TXDateEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    GroupBox1: TGroupBox;
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    Selecao_1: TScrollBox;
    Divisao: TTabSet;
    Panel1: TPanel;
    BtnVisualizar: TBitBtn;
    BtnCancelar: TBitBtn;
    DBNav_PROD: TDBNavigator;
    DBGrid_PROD: TDBGrid;
    DBNav_PAIS: TDBNavigator;
    DBGrid_PAIS: TDBGrid;
    DContratoTransporte: TIBQuery;
    IBQuery_pais: TIBQuery;
    DS_PROD: TDataSource;
    DS_PAIS: TDataSource;
    BitBtn1: TBitBtn;
    Panel_Filtro: TPanel;
    DBGrid3: TDBGrid;
    DS_TOT: TDataSource;
    IBQ_TOT: TIBQuery;
    PRODUTO: TGroupBox;
    PAIS: TGroupBox;
    TOTAL: TGroupBox;
    frDBDataSet_IBQuery_pais: TfrDBDataSet;
    Cbox_div_I: TComboBox;
    Label5: TLabel;
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
    procedure BitBtn1Click(Sender: TObject);
    procedure CBox_INICChange(Sender: TObject);
  private
    Caption_REL : STRING ;
    { Private declarations }
    QyRelatorio,T_SQL , T_SQL_PROD,T_SQL_PAIS : TTabela;
    {02-Início do Bloco Modular. Modificações não serão preservadas}
//    DContratoTransporte1: TDContratoTransporte;
    DProdutoContratoT: TDProdutoContratoT;
    DExportadoTransito: TDExportadoTransito;
    DBoocking: TDBoocking;
    procedure CalculosDContratoTransporte(DataSet: TDataSet);
    procedure AtualizaDetalhe_DContratoTransporte(Sender: TObject; Field: TField);
    procedure CalculosDProdutoContratoT(DataSet: TDataSet);
    procedure AtualizaDetalhe_DProdutoContratoT(Sender: TObject; Field: TField);
    procedure CalculosDExportadoTransito(DataSet: TDataSet);
    procedure AtualizaDetalhe_DExportadoTransito(Sender: TObject; Field: TField);
    procedure CalculosDBoocking(DataSet: TDataSet);
    procedure AtualizaDetalhe_DBoocking(Sender: TObject; Field: TField);
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
  FormInfome: TFormInfome;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, Abertura, GridPesquisa, Interno, RotinaEd;

procedure TFormInfome.ConstroiSql;
var
  I: Integer;
begin
  {[[[04]]] -Início do Bloco Modular. Modificações não serão preservadas}
{
  DContratoTransporte.Filtro.Clear;
  DContratoTransporte.AtualizaSql(False);

  Parametros(DContratoTransporte);

  DContratoTransporte.Open;
}
  // frDBDataSet.DataSet := DContratoTransporte;
//  frDBDataSet_DProdutoContratoT.DataSet := DProdutoContratoT;
//  frDBDataSet_DExportadoTransito.DataSet := DExportadoTransito;
//  frDBDataSet_DBoocking.DataSet := DBoocking;
  {[[[99]]]-Final do Bloco Modular. Modificações não serão preservadas}
  {
  T_SQL_PROD.AtualizaSql(FALSE);
  T_SQL_PROD.Open ;

  frDBDataSet.DataSet := T_SQL_PROD ;
  frDBDataSet_DProdutoContratoT.DataSet := DProdutoContratoT;
  frDBDataSet_DExportadoTransito.DataSet := DExportadoTransito;
  frDBDataSet_DBoocking.DataSet := DBoocking;
  }

  frDBDataSet.DataSet := DContratoTransporte;
  frDBDataSet_IBQuery_pais.DataSet :=  IBQuery_pais ;
end;

procedure TFormInfome.Parametros(Tabela: TTabela);
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

procedure TFormInfome.FormShow(Sender: TObject);
Var
  I: Integer;
  S_SQL_PROD_WHERE , S_SQL_PAIS_WHERE : STRING ;
begin
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  Caption := 'INFORMES';
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  DProdutoContratoT := TDProdutoContratoT.Create(Self);
  DProdutoContratoT.OnCalcFields := CalculosDProdutoContratoT;
  DProdutoContratoT.DataSource.OnDataChange := AtualizaDetalhe_DProdutoContratoT;
  DExportadoTransito := TDExportadoTransito.Create(Self);
  DExportadoTransito.OnCalcFields := CalculosDExportadoTransito;
  DExportadoTransito.DataSource.OnDataChange := AtualizaDetalhe_DExportadoTransito;
  DBoocking := TDBoocking.Create(Self);
  DBoocking.OnCalcFields := CalculosDBoocking;
  DBoocking.DataSource.OnDataChange := AtualizaDetalhe_DBoocking;

  {99-Final do Bloco Modular. Modificações não serão preservadas}

  // CARREGANDO   LIST BOX
  Carrega_CB(CBox_INIC,CBox_FIM,'SELECT RAZAO || '' >> '' || CLICOD || '' <<''  AS CAMPOS FROM CLIENTES ORDER BY RAZAO', 'CAMPOS',SELF);
  Carrega_CB(Cbox_div_I,nil,'select divisoes.nome || '' | Cliente  = '' ||  clientes.razao || '' [[ '' || divisoes.seq || '' ]] '' || '' << '' || divisoes.clicod|| '' >> ''   AS CAMPOS  from divisoes , clientes where divisoes.clicod =  clientes.clicod  order by divisoes.nome  ', 'CAMPOS',SELF);


  T_SQL_PROD.SQL.Clear;
  S_SQL_PROD_WHERE :=   SC_SQL_PROD_WHERE +  AtribuiAspas ( FormatDateTime('YYYY/MM/DD',DATE) )  + '' ;
  T_SQL_PROD.SQL.Add(SC_SQL_PROD + S_SQL_PROD_WHERE + SC_SQL_PROD_ORDER );
  T_SQL_PROD.SQL.SaveToFile('_T_SQL_PROD.SQL');
  T_SQL_PROD.Prepare ;
  T_SQL_PROD.Open ;

  T_SQL_PAIS.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  T_SQL_PAIS.Transaction := TabGlobal.DContratoTransporte.Transaction ;

  T_SQL_PAIS.SQL.Clear;
  S_SQL_PAIS_WHERE := SC_SQL_PAIS_WHERE + ' AND CONTRATOTRANSPORTE.CADASTRO = '  + '' + AtribuiAspas ( FormatDateTime('YYYY/MM/DD',DATE)) + '' ;
  T_SQL_PAIS.SQL.Add(SC_SQL_PAIS + S_SQL_PAIS_WHERE + SC_SQL_PAIS_ORDER );
  T_SQL_PAIS.SQL.SaveToFile('_T_SQL_PAIS.SQL');

  T_SQL_PAIS.Prepare ;
  T_SQL_PAIS.Open ;

  DS_PAIS.DataSet := T_SQL_PAIS ;
  DS_PROD.DataSet := T_SQL_PROD;

  DContratoTransporte.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  DContratoTransporte.Transaction := TabGlobal.DContratoTransporte.Transaction ;
  DContratoTransporte.SQL.Clear ;

  DContratoTransporte.SQL.Add(SC_SQL_PROD + S_SQL_PROD_WHERE + SC_SQL_PROD_ORDER) ;
  DContratoTransporte.SQL.SaveToFile('_DContratoTransporte.sql');
  DContratoTransporte.Prepare ;
  DContratoTransporte.Open ;

  IBQuery_pais.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  IBQuery_pais.Transaction := TabGlobal.DContratoTransporte.Transaction ;
  IBQuery_pais.SQL.Clear ;
  IBQuery_pais.SQL.Add(SC_SQL_PAIS + S_SQL_PAIS_WHERE + SC_SQL_PAIS_ORDER ) ;
  IBQuery_pais.SQL.SaveToFile('_IBQuery_pais.SQL');
  IBQuery_pais.Prepare ;
  IBQuery_pais.Open ;


  IBQ_TOT.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  IBQ_TOT.Transaction := TabGlobal.DContratoTransporte.Transaction ;
  IBQ_TOT.DataBase := TabGlobal.DContratoTransporte.DataBase ;
  IBQ_TOT.Transaction := TabGlobal.DContratoTransporte.Transaction ;
  IBQ_TOT.SQL.Clear ;
  IBQ_TOT.SQL.Add(SC_SQL_TOTAL + S_SQL_PROD_WHERE  ) ;
  IBQ_TOT.SQL.SaveToFile('_IBQ_TOT.SQL');
  IBQ_TOT.Prepare ;
  IBQ_TOT.Open ;


  QyRelatorio := T_SQL_PROD;  // DContratoTransporte;

  BtnAjuda.Visible  := False;
  BtnFechar.Visible := False;
  FormResize(Self);
  frReport.OnUserFunction := FuncoesExtras;
  PAIS.Height :=   ( Selecao_1.Height - ( Panel_Filtro.Height + total.Height )) div 2 ;
  PAIS.Align := alBottom    ;
  PRODUTO.Align := alClient  ;
end;

procedure TFormInfome.BtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFormInfome.InicializaVariaveis;
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
  frVariables['Titulo_1']     := Caption_REL;
  frVariables['Titulo_2']     := '';
  if frReport.FindObject('Logomarca') <> nil then
    if FileExists(Sistema.LogoUsr) then
      TfrPictureView(frReport.FindObject('Logomarca')).Picture.LoadFromFile(Sistema.LogoUsr);
end;

procedure TFormInfome.BtnVisualizarClick(Sender: TObject);
begin
  BitBtn1Click(SENDER);
  ConstroiSql;


  IBQuery_pais.Close ;
  IBQuery_pais.SQL.SaveToFile('_rel_IBQuery_pais.sql');
  IBQuery_pais.open;
  DContratoTransporte.Close ;
  DContratoTransporte.sql.SaveToFile('_rel_DContratoTransporte.sql');
  DContratoTransporte.open;

  InicializaVariaveis;
  if QyRelatorio.Eof then
    MessageDlg('Nenhum registro selecionado !',mtInformation,[mbOk],0)
  else
    frReport.ShowReport;  // DesignReport  ->  Permite ao usuário final editar o Layout do Relatório
//  QyRelatorio.Close;
end;

procedure TFormInfome.FormResize(Sender: TObject);
begin
  BtnAjuda.Left  := ShapeSup.Width - 37;
  BtnFechar.Left := ShapeSup.Width - 19;
end;

procedure TFormInfome.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(13) then
    begin
      Key := #0;
      {Atua como a tecla TAB}
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
end;

procedure TFormInfome.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}

  DProdutoContratoT.Free;
  DExportadoTransito.Free;
  DBoocking.Free;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  T_SQL.Close ;
  T_SQL.Free ;

  T_SQL_PROD.Close ;
  T_SQL_PROD.Free ;
  T_SQL_PAIS.Close ;
  T_SQL_PAIS.Free ;

end;

{08-Início do Bloco Modular. Modificações não serão preservadas}
procedure TFormInfome.CalculosDContratoTransporte(DataSet: TDataSet);
begin
end;

procedure TFormInfome.CalculosDProdutoContratoT(DataSet: TDataSet);
begin
end;

procedure TFormInfome.CalculosDExportadoTransito(DataSet: TDataSet);
begin
end;

procedure TFormInfome.CalculosDBoocking(DataSet: TDataSet);
begin
  DBoocking.SALDO.Conteudo := CalculaDBoocking_SALDO_Rel(Self);
end;

procedure TFormInfome.AtualizaDetalhe_DContratoTransporte(Sender: TObject;
  Field: TField);
begin
  DProdutoContratoT.AtribuiFiltroMestre(True, False);
  DProdutoContratoT.AtualizaSql(False);
  Parametros(DProdutoContratoT);
  DProdutoContratoT.Open;

  DExportadoTransito.AtribuiFiltroMestre(True, False);
  DExportadoTransito.AtualizaSql(False);
  Parametros(DExportadoTransito);
  DExportadoTransito.Open;

  DBoocking.AtribuiFiltroMestre(True, False);
  DBoocking.AtualizaSql(False);
  Parametros(DBoocking);
  DBoocking.Open;

end;

procedure TFormInfome.AtualizaDetalhe_DProdutoContratoT(Sender: TObject;
  Field: TField);
begin
end;

procedure TFormInfome.AtualizaDetalhe_DExportadoTransito(Sender: TObject;
  Field: TField);
begin
end;

procedure TFormInfome.AtualizaDetalhe_DBoocking(Sender: TObject;
  Field: TField);
begin
end;
{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormInfome.FuncoesExtras(const Name: String; p1, p2,
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

procedure TFormInfome.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then   // Calendário
    Interno108
  else if Key = VK_F6 then // Calculadora
    Interno109
  else if Key = VK_F7 then // Agenda
    Interno110;
end;

procedure TFormInfome.FormCreate(Sender: TObject);
begin

  T_SQL:= TTabela.Create(NIL);
  T_SQL_PROD:= TTabela.Create(NIL);
  T_SQL_PAIS:= TTabela.Create(NIL);

  // DATA SET PRODUTOS
  T_SQL_PROD.DataBase :=  TabGlobal.DContratoTransporte.DataBase ;
  T_SQL_PROD.Transaction := TabGlobal.DContratoTransporte.Transaction ;

   // DATA SET PRODUTOS
  T_SQL_PAIS.DataBase    :=  TabGlobal.DContratoTransporte.DataBase ;
  T_SQL_PAIS.Transaction := TabGlobal.DContratoTransporte.Transaction ;

end;

procedure TFormInfome.BitBtn1Click(Sender: TObject);
VAR
  S_SQL_PROD_WHERE ,   S_SQL_PAIS_WHERE , S_FILTRO , S_CLICOD, S_DIVCOD: STRING ;
  N_INC  , N_FIN : INTEGER ;
begin

  Screen.Cursor := crHourGlass;
  S_FILTRO := '';
  Caption := 'Resumo Informe Divisão';
  CAPTION_rel := 'Resumen Informe ';

  IF  XDT_INIC.DateValue <> -693594 THEN
      S_FILTRO := ' CONTRATOTRANSPORTE.CADASTRO >= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_INIC.DateValue)) ;
    //-693594
  IF  XDT_FIM.DateValue <> -693594 THEN
      IF  S_FILTRO = '' THEN
          S_FILTRO := '     CONTRATOTRANSPORTE.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue))
      ELSE
          S_FILTRO := S_FILTRO + ' AND CONTRATOTRANSPORTE.CADASTRO <= '+ AtribuiAspas ( FormatDateTime('YYYY/MM/DD',XDT_FIM.DateValue)) ;

  IF CBox_INIC.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_INIC.Text) + 2   ;
     N_FIN := POS('<<',CBox_INIC.Text)   ;
     S_CLICOD := COPY( CBox_INIC.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := '     CONTRATOTRANSPORTE.CLICOD >= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.CLICOD >= '+ S_CLICOD ;
     CAPTION := CAPTION + COPY( CBox_INIC.Text,1, N_INC  );
  END;

  IF CBox_FIM.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_FIM.Text) + 2   ;
     N_FIN := POS('<<',CBox_FIM.Text)   ;
     S_CLICOD := COPY( CBox_FIM.Text, N_INC, N_FIN - N_INC );
     IF  S_FILTRO = '' THEN
         S_FILTRO := '     CONTRATOTRANSPORTE.CLICOD <= '+ S_CLICOD
     ELSE
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.CLICOD <= '+ S_CLICOD ;
     CAPTION := CAPTION + COPY( CBox_INIC.Text,1, N_INC  );
  END;

  // inicio divisao
  IF Cbox_div_I.Text <> '' THEN BEGIN
     N_INC := POS('<<',Cbox_div_I.Text) + 2   ;
     N_FIN := POS('>>',Cbox_div_I.Text)   ;
     S_CLICOD := COPY( Cbox_div_I.Text, N_INC, N_FIN - N_INC );
     N_INC := POS('[[',Cbox_div_I.Text) + 2   ;
     N_FIN := POS(']]',Cbox_div_I.Text)   ;
     S_DIVCOD := COPY( Cbox_div_I.Text, N_INC, N_FIN - N_INC );

     N_FIN := POS('|',Cbox_div_I.Text)   ;
     CAPTION_rel  :=  CAPTION_rel + COPY( Cbox_div_I.Text, 1 , N_FIN - 1 );


     IF  S_FILTRO = '' THEN BEGIN
         S_FILTRO := ' CONTRATOTRANSPORTE.CLICOD = '+  ( S_CLICOD  ) + ' AND  CONTRATOTRANSPORTE.SEQ = '+  ( S_DIVCOD  );
     END
     ELSE BEGIN
         S_FILTRO := S_FILTRO +' AND CONTRATOTRANSPORTE.CLICOD = '+  ( S_CLICOD  ) + ' AND  CONTRATOTRANSPORTE.SEQ = '+  ( S_DIVCOD  );
     END;
  END;


  IF  S_FILTRO <> '' THEN
      S_SQL_PROD_WHERE := ' WHERE ' + S_FILTRO
  ELSE
      S_SQL_PROD_WHERE := ' ';

  T_SQL_PROD.Close;
  T_SQL_PROD.SQL.Clear;
  T_SQL_PROD.SQL.Add(SC_SQL_PROD + S_SQL_PROD_WHERE + SC_SQL_PROD_ORDER );
  T_SQL_PROD.SQL.SaveToFile('_T_SQL_PROD.SQL');
  T_SQL_PROD.Prepare ;
  T_SQL_PROD.Open ;
  T_SQL_PROD.Last ;
  T_SQL_PROD.First ;


  PRODUTO.Caption := 'PRODUTO  Núm. Linhas = ' + INTTOSTR(T_SQL_PROD.RecordCount)   ;

  IF  S_FILTRO <> '' THEN
      S_SQL_PAIS_WHERE := SC_SQL_PAIS_WHERE + ' AND '  + S_FILTRO
  ELSE
      S_SQL_PAIS_WHERE := SC_SQL_PAIS_WHERE ;

  T_SQL_PAIS.Close ;
  T_SQL_PAIS.SQL.Clear;
  T_SQL_PAIS.SQL.Add(SC_SQL_PAIS + S_SQL_PAIS_WHERE + SC_SQL_PAIS_ORDER );
  T_SQL_PAIS.SQL.SaveToFile('_T_SQL_PAIS.SQL');
  T_SQL_PAIS.Prepare ;
  T_SQL_PAIS.Open ;

  T_SQL_PAIS.Last ;
  T_SQL_PAIS.First ;
  PAIS.Caption := 'PAIS Núm. Linhas = ' + INTTOSTR(T_SQL_PAIS.RecordCount)     ;
  IBQ_TOT.Close ;
  IBQ_TOT.SQL.Clear ;
  IBQ_TOT.SQL.Add(SC_SQL_TOTAL + S_SQL_PROD_WHERE  ) ;
  IBQ_TOT.SQL.SaveToFile('_IBQ_TOT.SQL');
  IBQ_TOT.Prepare ;
  IBQ_TOT.Open ;

  DContratoTransporte.Close;
  DContratoTransporte.SQL.Clear;
  DContratoTransporte.SQL.Add(SC_SQL_PROD + S_SQL_PROD_WHERE + SC_SQL_PROD_ORDER );
  DContratoTransporte.SQL.SaveToFile('_DContratoTransporte.SQL');
  DContratoTransporte.Prepare ;
  DContratoTransporte.Open ;
  IBQuery_pais.Close ;
  IBQuery_pais.SQL.Clear;
  IBQuery_pais.SQL.Add(SC_SQL_PAIS + S_SQL_PAIS_WHERE + SC_SQL_PAIS_ORDER );
  IBQuery_pais.SQL.SaveToFile('_IBQuery_pais.SQL');
  IBQuery_pais.Prepare ;
  IBQuery_pais.Open ;
  Screen.Cursor := crDefault;


end;

procedure TFormInfome.CBox_INICChange(Sender: TObject);
var
  N_INC  , N_FIN : INTEGER ;
  S_CLICOD : string ;
begin

  Cbox_div_I.Items.Clear ;
  IF CBox_INIC.Text <> '' THEN BEGIN
     N_INC := POS('>>',CBox_INIC.Text) + 2   ;
     N_FIN := POS('<<',CBox_INIC.Text)   ;
     S_CLICOD := COPY( CBox_INIC.Text, N_INC, N_FIN - N_INC );
     if S_CLICOD <> '' then
        Carrega_CB(Cbox_div_I,nil,'select divisoes.nome || '' | Cliente  = '' ||  clientes.razao || '' [[ '' || divisoes.seq || '' ]] '' || '' << '' || divisoes.clicod|| '' >> ''   AS CAMPOS  from divisoes , clientes where ( divisoes.clicod = clientes.clicod ) and  ( clientes.clicod = '+AtribuiAspas (S_CLICOD ) + ' ) order by divisoes.nome  ', 'CAMPOS',SELF)
     else
        Carrega_CB(Cbox_div_I,nil,'select divisoes.nome || '' | Cliente  = '' ||  clientes.razao || '' [[ '' || divisoes.seq || '' ]] '' || '' << '' || divisoes.clicod|| '' >> ''   AS CAMPOS  from divisoes , clientes where divisoes.clicod =  clientes.clicod  order by divisoes.nome  ', 'CAMPOS',SELF);

  END
  else
    Carrega_CB(Cbox_div_I,nil,'select divisoes.nome || '' | Cliente  = '' ||  clientes.razao || '' [[ '' || divisoes.seq || '' ]] '' || '' << '' || divisoes.clicod|| '' >> ''   AS CAMPOS  from divisoes , clientes where divisoes.clicod =  clientes.clicod  order by divisoes.nome  ', 'CAMPOS',SELF);
end;

end.
