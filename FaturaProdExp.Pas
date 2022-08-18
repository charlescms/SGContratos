{
   Programa.: FaturaProdExp.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
}
unit FaturaProdExp;

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
  TFormFaturaProdExp = class(TForm)
    AbrirImagem: TMenuItem;
    BtnAnterior: TSpeedButton;
    BtnDesistir: TBitBtn;
    BtnExcluir: TBitBtn;
    BtnIncluir: TBitBtn;
    BtnModificar: TBitBtn;
    BtnPrimeiro: TSpeedButton;
    BtnProximo: TSpeedButton;
    BtnSalvar: TBitBtn;
    BtnUltimo: TSpeedButton;
    Cadastro: TXDBDateEdit;
    ColarImagem: TMenuItem;
    Comentario: TDBMemo;
    ComisaoSFatura: TXDBNumEdit;
    Contrato: TXDBEdit;
    CopiarImagem: TMenuItem;
    CortarImagem: TMenuItem;
    DataEmbarque: TXDBDateEdit;
    DataFatura: TXDBDateEdit;
    DataLiq: TXDBDateEdit;
    DataSource: TDataSource;
    DlgAbrirImagem: TOpenDialog;
    DlgSalvarComoImagem: TSaveDialog;
    ETADestino: TXDBDateEdit;
    Fatura: TXDBEdit;
    FormPago: TXDBLookUp;
    LbcCadastro: TLabel;
    LbcComentario: TLabel;
    LbcComisaoSFatura: TLabel;
    LbcContrato: TLabel;
    LbcDataEmbarque: TLabel;
    LbcDataFatura: TLabel;
    LbcDataLiq: TLabel;
    LbcETADestino: TLabel;
    LbcFatura: TLabel;
    LbcFormPago: TLabel;
    LbcNavio: TLabel;
    LbcNumFatura: TLabel;
    LbcOBS: TLabel;
    LbcPrecoFOB: TLabel;
    LbcQuantidadeExp: TLabel;
    LbcRate: TLabel;
    LbcSeq: TLabel;
    LbcStatus: TLabel;
    LbcValor: TLabel;
    LbcValorConvertido: TLabel;
    LbcValorDesconto: TLabel;
    MenuImagem: TPopupMenu;
    MnSep01: TMenuItem;
    Navio: TXDBEdit;
    NoManutencao: TNotebook;
    NumFatura: TXDBEdit;
    OBS: TXDBEdit;
    Pagina0: TScrollBox;
    Pagina1: TScrollBox;
    Pagina10: TScrollBox;
    Pagina2: TScrollBox;
    Pagina3: TScrollBox;
    Pagina4: TScrollBox;
    Pagina5: TScrollBox;
    Pagina6: TScrollBox;
    Pagina7: TScrollBox;
    Pagina8: TScrollBox;
    Pagina9: TScrollBox;
    PnSalva: TPanel;
    PrecoFOB: TXDBNumEdit;
    QuantidadeExp: TXDBNumEdit;
    Rate: TXDBNumEdit;
    SalvarImagem: TMenuItem;
    Seq: TXDBNumEdit;
    Status: TDBComboBox;
    StDocumento: TDBRadioGroup;
    TabPaginas: TTabSet;
    Valor: TXDBNumEdit;
    ValorConvertido: TXDBNumEdit;
    ValorDesconto: TXDBNumEdit;
    procedure NumFaturaExit(Sender: TObject);
    procedure ContratoExit(Sender: TObject);
    procedure SeqExit(Sender: TObject);
    procedure NavioExit(Sender: TObject);
    procedure DataEmbarqueExit(Sender: TObject);
    procedure QuantidadeExpExit(Sender: TObject);
    procedure FaturaExit(Sender: TObject);
    procedure StDocumentoExit(Sender: TObject);
    procedure ValorExit(Sender: TObject);
    procedure ValorDescontoExit(Sender: TObject);
    procedure CadastroExit(Sender: TObject);
    procedure ETADestinoExit(Sender: TObject);
    procedure FormPagoExit(Sender: TObject);
    procedure PrecoFOBExit(Sender: TObject);
    procedure ComisaoSFaturaExit(Sender: TObject);
    procedure DataFaturaExit(Sender: TObject);
    procedure RateExit(Sender: TObject);
    procedure ValorConvertidoExit(Sender: TObject);
    procedure StatusExit(Sender: TObject);
    procedure StatusDrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
    procedure OBSExit(Sender: TObject);
    procedure ComentarioExit(Sender: TObject);
    procedure DataLiqExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnDesistirClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TabPaginasClick(Sender: TObject);
    procedure CortarImagemClick(Sender: TObject);
    procedure CopiarImagemClick(Sender: TObject);
    procedure ColarImagemClick(Sender: TObject);
    procedure AbrirImagemClick(Sender: TObject);
    procedure SalvarImagemClick(Sender: TObject);
    procedure ChamaGridPesquisa(Sender: TObject);
    procedure ValidaColunaGrid(Sender: TField);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnModificarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnPrimeiroClick(Sender: TObject);
    procedure BtnAnteriorClick(Sender: TObject);
    procedure BtnProximoClick(Sender: TObject);
    procedure BtnUltimoClick(Sender: TObject);
  private
    { Private declarations }
    Navegando: Boolean;
    ListaCamposED: TListaCampos; {Conterá a lista de campos em edição na ED}
    TituloModulo: String;
    ConsultasSalvas: TList;
    PaginaIni: Integer;
    ErroValidacao: Boolean;
    SalvarRegistro: Boolean;
    function AbreTabelas: Boolean;
    procedure MudaSeForUltimo;
    function AbandonandoEdicao: Boolean;
    procedure TelaManutencao;
    procedure AtribuiValoresPadrao;
    procedure FocoCampo;
    procedure PosicionaNoCampo(Campo: TAtributo);
    procedure VerificaAtualizacoes;
    procedure ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
    procedure AntesdeSalvar;
    procedure AntesdeIncluir;
    procedure AntesdeModificar;
    procedure AntesdeExcluir;
    procedure DepoisdeIncluir;
    procedure DepoisdeModificar;
    procedure DepoisdeExcluir;
    function ConfirmaInclusao: Boolean;
    function ConfirmaModificacao: Boolean;
    function ConfirmaExclusao: Boolean;
    function ConfirmaGravacao: Boolean;
    procedure CamposCalculados;
    procedure HabilitaEdicao(Valor: Boolean = true);
  public
    { Public declarations }
    {03-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
    TabelaPrincipal: TTabela;
    {04-Início do Bloco Modular. Modificações não serão preservadas}
    {99-Final do Bloco Modular. Modificações não serão preservadas}
  end;

var
  FormFaturaProdExp: TFormFaturaProdExp;
  LastControl: TWinControl;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, RotinaEd, Abertura, GridPesquisa, Interno;

procedure TFormFaturaProdExp.FormShow(Sender: TObject);
Var
  I: Integer;
begin
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  TabelaPrincipal    := TabGlobal.DFaturaProdExp;
  TituloModulo       := 'Faturas Produtos Exportados';
  Caption            := TituloModulo;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  Navegando          := False;
  DataSource.DataSet := TabelaPrincipal;
  ListaCamposED      := TListaCampos.Create;
  ConsultasSalvas    := TList.Create;
  PaginaIni          := 0;
  ErroValidacao      := False;
  TabPaginas.TabIndex:= 0;
  {06-Início do Bloco Modular. Modificações não serão preservadas}
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.DataLiq, -2, DataLiqExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.Comentario, -2, ComentarioExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.OBS, -2, OBSExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.Status, -2, StatusExit, StatusDrawItem, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.ValorConvertido, -2, ValorConvertidoExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.Rate, -2, RateExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.DataFatura, -2, DataFaturaExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.ComisaoSFatura, -2, ComisaoSFaturaExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.PrecoFOB, -2, PrecoFOBExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.FormPago, -2, FormPagoExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.ETADestino, -2, ETADestinoExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.Cadastro, -2, CadastroExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.ValorDesconto, -2, ValorDescontoExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.Valor, -2, ValorExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.StDocumento, -2, StDocumentoExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.Fatura, -2, FaturaExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.QuantidadeExp, -2, QuantidadeExpExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.DataEmbarque, -2, DataEmbarqueExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.Navio, -2, NavioExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.Seq, -1, SeqExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.Contrato, -1, ContratoExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DFaturaProdExp, TabGlobal.DFaturaProdExp.NumFatura, -1, NumFaturaExit, Nil, ListaCamposEd, FormFaturaProdExp, DataSource, ChamaGridPesquisa);
  {99-Final do Bloco Modular. Modificações não serão preservadas}
  CamposCalculados;
  if not AbreTabelas then exit;
  AjustaColunasConsulta(TabelaPrincipal);
  BtnSalvar.Enabled   := False;
  BtnDesistir.Enabled := False;
  NoManutencao.PageIndex        := 0;
  if TabPaginas.Tabs.Count <= 1 then
    TabPaginas.Visible := False;
  TelaManutencao;
end;

function TFormFaturaProdExp.AbreTabelas: Boolean;
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  Result := True;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormFaturaProdExp.CamposCalculados;
begin
  {08-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormFaturaProdExp.HabilitaEdicao(Valor: Boolean = true);
var
  I: Integer;
  Comp: TComponent;
  CampoED: TCampoEdicao;
begin
  for I := 0 to 10 do
  begin
    Comp := FindComponent('Pagina' + IntToStr(I));
    if Comp <> nil then
      TScrollBox(Comp).Enabled := Valor;
  end;
  if Valor then
    for I:=0 to ListaCamposED.Count-1 do
    begin
      CampoED := TCampoEdicao(ListaCamposED[I]);
      if (CampoED.Controle.TabOrder = 0) and (CampoED.Controle.CanFocus) then
      begin
        CampoED.Controle.SetFocus;
        Break;
      end;
    end;
end;

function TFormFaturaProdExp.ConfirmaInclusao: Boolean;
begin
  Result := True;
end;

function TFormFaturaProdExp.ConfirmaModificacao: Boolean;
begin
  Result := True;
end;

function TFormFaturaProdExp.ConfirmaExclusao: Boolean;
begin
  Result := True;
end;

function TFormFaturaProdExp.ConfirmaGravacao: Boolean;
begin
  Result := True;
end;

procedure TFormFaturaProdExp.TelaManutencao;
begin
  if (TabelaPrincipal.Inclusao) or
     (TabelaPrincipal.Modificacao) then
    HabilitaEdicao
  else
    HabilitaEdicao(False);
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormFaturaProdExp.AtribuiValoresPadrao;
begin
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd, True);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormFaturaProdExp.FocoCampo;
begin

end;

procedure TFormFaturaProdExp.AntesdeSalvar;
begin

end;

procedure TFormFaturaProdExp.AntesdeIncluir;
begin

end;

procedure TFormFaturaProdExp.AntesdeModificar;
begin

end;

procedure TFormFaturaProdExp.AntesdeExcluir;
begin

end;

procedure TFormFaturaProdExp.DepoisdeIncluir;
begin

end;

procedure TFormFaturaProdExp.DepoisdeModificar;
begin

end;

procedure TFormFaturaProdExp.DepoisdeExcluir;
begin

end;

procedure TFormFaturaProdExp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSalvar.Enabled then
    TabelaPrincipal.Cancela;
end;

procedure TFormFaturaProdExp.FormClose(Sender: TObject;
  var Action: TCloseAction);
Var
  I: Integer;
begin
  //TabelaPrincipal.AtribuiRelacionamentos(False); // Habilite esta opção caso seja realmente necessário...
  ListaCamposED.Free;
  for I := 0 to ConsultasSalvas.Count - 1 do
    TConsultasSalvas(ConsultasSalvas[I]).Free;
  ConsultasSalvas.Free;
end;

procedure TFormFaturaProdExp.FormKeyPress(Sender: TObject; var Key: Char);
var
  ControleCampo: TWinControl;
begin
  ControleCampo := ActiveControl;
  while (ControleCampo <> nil) and (ControleCampo.Owner <> Self) do
    ControleCampo := ControleCampo.Parent;
  if Key = Chr(13) then
  begin
    Key := #0;
    {Atua como a tecla TAB}
    Perform(WM_NEXTDLGCTL, 0, 0);
    LastControl := ControleCampo;
    MudaSeForUltimo;
  end
  else if Key = Chr(27) then
    Close;
end;

procedure TFormFaturaProdExp.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
    if Key = 73 then // Ctrl + I -> Incluir
      BtnIncluirClick(Self)
    else if Key = 77 then // Ctrl + M -> Modificar
      BtnModificarClick(Self)
    else if Key = 69 then // Ctrl + E -> Excluir
      BtnExcluirClick(Self);
end;

procedure TFormFaturaProdExp.BtnSalvarClick(Sender: TObject);
Var
  EInclusao, Ok: Boolean;
begin
  if Not ConfirmaGravacao then
  begin
    MessageDlg('Gravação Cancelada !',mtError,[mbOk],0);
    exit;
  end;
  SalvarRegistro := True;
  if CamposDadosValidos(ListaCamposEd, ErroValidacao) then  // Validações Ok ?!
  begin
    EInclusao := TabelaPrincipal.Inclusao;
    Screen.Cursor := crHourGlass;
    try
      Ok := False;
      if EInclusao then
        if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
        begin
          ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd, False, True);
          if TabelaPrincipal.PesquisaRelacionados(TabelaPrincipal.NomeTabela) then
          begin
            MessageDlg('Duplicidade - Registro já cadastrado !',mtWarning,[mbOk],0);
            exit;
          end;
        end;
      AntesdeSalvar;
      if TabelaPrincipal.Salva then
        Ok := True;
    finally
      if Ok then
        if EInclusao then
          DepoisdeIncluir
        else
          DepoisdeModificar;
      Screen.Cursor := crDefault;
    end;
    BtnSalvar.Enabled   := False;
    BtnDesistir.Enabled := False;
    BtnIncluir.Enabled  := True;
    BtnModificar.Enabled:= True;
    BtnExcluir.Enabled  := True;
    BtnPrimeiro.Enabled := True;
    BtnAnterior.Enabled := True;
    BtnProximo.Enabled  := True;
    BtnUltimo.Enabled   := True;
    TelaManutencao;
    ErroValidacao := False;
  end;
  SalvarRegistro := False;
  BtnIncluir.SetFocus;
end;

procedure TFormFaturaProdExp.BtnDesistirClick(Sender: TObject);
begin
  if TabelaPrincipal.Inclusao then
    TabelaPrincipal.ExclusaoCascata;
  TabelaPrincipal.Cancela;
  BtnSalvar.Enabled   := False;
  BtnDesistir.Enabled := False;
  BtnIncluir.Enabled  := True;
  BtnModificar.Enabled:= True;
  BtnExcluir.Enabled  := True;
  BtnPrimeiro.Enabled := True;
  BtnAnterior.Enabled := True;
  BtnProximo.Enabled  := True;
  BtnUltimo.Enabled   := True;
  ErroValidacao       := False;
  if not Navegando then
    TelaManutencao
  else
    HabilitaEdicao(False);
  Navegando := False;
end;

procedure TFormFaturaProdExp.VerificaAtualizacoes;
begin
  if not BtnSalvar.Enabled then
    BtnDesistirClick(Self)
  else
    if MessageDlg('Salvar Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      BtnSalvarClick(Self)
    else
      BtnDesistirClick(Self);
end;

procedure TFormFaturaProdExp.BtnIncluirClick(Sender: TObject);
begin
  if ProcuraRestricao(TabelaPrincipal.NomeTabela,'I') then
  begin
    MessageDlg('Inclusão não Permitida !',mtError,[mbOk],0);
    exit;
  end;
  if Not ConfirmaInclusao then
  begin
    MessageDlg('Inclusão Cancelada !',mtError,[mbOk],0);
    exit;
  end;
  if TabelaPrincipal.Inclusao then
  begin
    MessageDlg('Operação de Inclusão já Ativa !',mtError,[mbOk],0);
    exit;
  end
  else if TabelaPrincipal.Modificacao then
  begin
    MessageDlg('Operação de Modificação está Ativa !',mtError,[mbOk],0);
    exit;
  end;
  HabilitaCamposChave(ListaCamposEd);
  TabPaginas.TabIndex:= 0;
  TelaManutencao;
  AntesdeIncluir;
  TabelaPrincipal.Inclui(ListaCamposED);
  BtnSalvar.Enabled   := True;
  BtnDesistir.Enabled := True;
  BtnIncluir.Enabled  := False;
  BtnModificar.Enabled:= False;
  BtnExcluir.Enabled  := False;
  BtnPrimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  HabilitaEdicao;
  AtribuiValoresPadrao;
  FocoCampo;
end;

procedure TFormFaturaProdExp.BtnModificarClick(Sender: TObject);
begin
  if TAtributo(TabelaPrincipal.ChavePrimaria[0]).Valor.IsNull then
    exit;
  if ProcuraRestricao(TabelaPrincipal.NomeTabela,'M') then
  begin
    MessageDlg('Modificação não Permitida !',mtError,[mbOk],0);
    exit;
  end;
  if Not ConfirmaModificacao then
  begin
    MessageDlg('Modificação Cancelada !',mtError,[mbOk],0);
    exit;
  end;
  if TabelaPrincipal.Inclusao then
  begin
    MessageDlg('Operação de Inclusão está Ativa !',mtError,[mbOk],0);
    exit;
  end
  else if TabelaPrincipal.Modificacao then
  begin
    MessageDlg('Operação de Modificação já Ativa !',mtError,[mbOk],0);
    exit;
  end;
  DesabilitaCamposChave(ListaCamposEd);
  TabPaginas.TabIndex:= 0;
  TelaManutencao;
  Screen.Cursor := crHourGlass;
  try
    if Sistema.Rede then
      TabelaPrincipal.Refresh;
    AntesdeModificar;
    TabelaPrincipal.Modifica;
    HabilitaEdicao;
  finally
    Screen.Cursor := crDefault;
  end;
  BtnSalvar.Enabled   := True;
  BtnDesistir.Enabled := True;
  BtnIncluir.Enabled  := False;
  BtnModificar.Enabled:= False;
  BtnPrimeiro.Enabled := False;
  BtnAnterior.Enabled := False;
  BtnProximo.Enabled  := False;
  BtnUltimo.Enabled   := False;
  BtnExcluir.Enabled  := False;
  FocoCampo;
end;

procedure TFormFaturaProdExp.BtnExcluirClick(Sender: TObject);
begin
  if TAtributo(TabelaPrincipal.ChavePrimaria[0]).Valor.IsNull then
    exit;
  if ProcuraRestricao(TabelaPrincipal.NomeTabela,'E') then
  begin
    MessageDlg('Exclusão não Permitida !',mtError,[mbOk],0);
    exit;
  end;
  if Not ConfirmaExclusao then
  begin
    MessageDlg('Exclusão Cancelada !',mtError,[mbOk],0);
    exit;
  end;
  if TabelaPrincipal.Inclusao then
  begin
    MessageDlg('Operação de Inclusão está Ativa !'+^M+^M+'Clique em Desistir para Cancelar Inclusão ...',mtError,[mbOk],0);
    exit;
  end
  else if TabelaPrincipal.Modificacao then
  begin
    MessageDlg('Operação de Modificação está Ativa !',mtError,[mbOk],0);
    exit;
  end;
  if MessageDlg('Excluir Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    Screen.Cursor := crHourGlass;
    try
      if Sistema.Rede then
        TabelaPrincipal.Refresh;
      AntesdeExcluir;
      TabelaPrincipal.Exclui;
    finally
      DepoisdeExcluir;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFormFaturaProdExp.BtnPrimeiroClick(Sender: TObject);
begin
  TabelaPrincipal.First;
  TelaManutencao;
end;

procedure TFormFaturaProdExp.BtnAnteriorClick(Sender: TObject);
begin
  TabelaPrincipal.Prior;
  TelaManutencao;
end;

procedure TFormFaturaProdExp.BtnProximoClick(Sender: TObject);
begin
  TabelaPrincipal.Next;
  TelaManutencao;
end;

procedure TFormFaturaProdExp.BtnUltimoClick(Sender: TObject);
begin
  TabelaPrincipal.Last;
  if TabelaPrincipal.Eof then
  begin
    TabelaPrincipal.Prior;
    TabelaPrincipal.Next;
  end;
  TelaManutencao;
end;

procedure TFormFaturaProdExp.TabPaginasClick(Sender: TObject);
begin
  if NoManutencao.PageIndex <> TabPaginas.TabIndex then
    NoManutencao.SetFocus;
  NoManutencao.PageIndex := TabPaginas.TabIndex;
end;

procedure TFormFaturaProdExp.PosicionaNoCampo(Campo: TAtributo);
var
  I: Integer;
  CampoED: TCampoEdicao;
begin
  I := ListaCamposED.ProcuraCampoED(Campo);
  if I = -1 then
    Exit;
  CampoED := TCampoEdicao(ListaCamposED[I]);
  if (CampoED.Pagina <> -1) then
    TabPaginas.TabIndex := CampoED.Pagina;
  CampoED.Controle.SetFocus;
end;

procedure TFormFaturaProdExp.ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
begin
  MessageDlg(MsgErro, mtError, [mbOk], 0);
  ErroValidacao := True;
  PosicionaNoCampo(Campo);
end;

procedure TFormFaturaProdExp.MudaSeForUltimo;
begin
  if (NoManutencao.PageIndex <> NoManutencao.Pages.Count - 1) and
     (ActiveControl = BtnSalvar) then
    if TabPaginas.TabIndex + 1 <= TabPaginas.Tabs.Count-1 then
      TabPaginas.TabIndex := TabPaginas.TabIndex + 1;
end;

procedure TFormFaturaProdExp.CortarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CutToClipBoard;
end;

procedure TFormFaturaProdExp.CopiarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CopyToClipBoard;
end;

procedure TFormFaturaProdExp.ColarImagemClick(Sender: TObject);
begin
  if (ActiveControl is TDBImage) and Clipboard.HasFormat(CF_PICTURE) then
  begin
    (ActiveControl as TDBImage).PasteFromClipBoard;
    if TDBImage(ActiveControl).Picture.Graphic is TBitmap then
      TDBImage(ActiveControl).DataSource.DataSet.UpdateRecord
    else
    begin
      MessageDlg('Formato Inválido !', mtError, [mbOk], 0);
      TDBImage(ActiveControl).DataSource.DataSet.Cancel;
    end;
  end
  else
    MessageDlg('Área de Transferência não contém imagem !', mtError, [mbOk], 0);
end;

procedure TFormFaturaProdExp.AbrirImagemClick(Sender: TObject);
var
  image_BD : TPicture;
begin
  if DlgAbrirImagem.Execute and FileExists(DlgAbrirImagem.FileName) and
    (ActiveControl is TDBImage) then
  begin
    image_BD := TPicture.Create();
    try
      image_BD.LoadFromFile(DlgAbrirImagem.FileName);
      Clipboard.Assign(image_BD);
      TDBImage(ActiveControl).PasteFromClipboard;
      Clipboard.Clear;
    finally
      image_BD.Free;
    end;
  end;
end;

procedure TFormFaturaProdExp.SalvarImagemClick(Sender: TObject);
begin
  if DlgSalvarComoImagem.Execute and (ActiveControl is TDBImage) then
    TDBImage(ActiveControl).Picture.SaveToFile(DlgSalvarComoImagem.FileName);
end;

function TFormFaturaProdExp.AbandonandoEdicao: Boolean;
begin
  Result := (ActiveControl = BtnDesistir);
end;

procedure TFormFaturaProdExp.ChamaGridPesquisa(Sender: TObject);
Var
  I: Integer;
  CampoED: TCampoEdicao;
  Campo: TAtributo;
begin
  for I:=0 to ListaCamposED.Count-1 do
  begin
    CampoED := TCampoEdicao(ListaCamposED[I]);
    if CampoED.Controle = Sender then
    begin
      Campo := CampoED.Campo;
      Break;
    end;
  end;
  if (Campo = nil) or (Campo.Valor.ReadOnly) then exit;
  FormGridPesquisa := TFormGridPesquisa.Create(Application);
  Try
    if Sender is TXDBEdit then
      FormGridPesquisa.Atalho := TXDBEdit(Sender).ClickKey
    else if Sender is TXDBNumEdit then
      FormGridPesquisa.Atalho := TXDBNumEdit(Sender).ClickKey
    else if Sender is TXDBDateEdit then
      FormGridPesquisa.Atalho := TXDBDateEdit(Sender).ClickKey;
    FormGridPesquisa.Campo  := Campo;
    FormGridPesquisa.ShowModal;
  Finally
    FormGridPesquisa.Free;
  end;
end;

procedure TFormFaturaProdExp.ValidaColunaGrid(Sender: TField);
var
  MsgErro : String;
  I: Integer;
  Campo: TAtributo;
begin
  if AbandonandoEdicao then
    Exit;
  for I:=0 to TTabela(Sender.DataSet).Campos.Count-1 do
  begin
    Campo := TAtributo(TTabela(Sender.DataSet).Campos[I]);
    if Campo.Valor = Sender then
      Break;
  end;
  if Campo = nil then exit;
  if not Campo.Valido(MsgErro) then
    raise Exception.Create(MsgErro);
end;

procedure TFormFaturaProdExp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then   // Calendário
    Interno108
  else if Key = VK_F6 then // Calculadora
    Interno109
  else if Key = VK_F7 then // Agenda
    Interno110;
end;

{11-Início do Bloco Modular. Modificações não serão preservadas}
{99-Final do Bloco Modular. Modificações não serão preservadas}

procedure TFormFaturaProdExp.NumFaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.NumFatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.NumFatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.ContratoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.Contrato.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.Contrato);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.SeqExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.Seq.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.Seq);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.NavioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.Navio.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.Navio);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.DataEmbarqueExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.DataEmbarque.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.DataEmbarque);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.QuantidadeExpExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.QuantidadeExp.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.QuantidadeExp);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.FaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.Fatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.Fatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.StDocumentoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.StDocumento.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.StDocumento);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.ValorExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.Valor.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.Valor);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.ValorDescontoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.ValorDesconto.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.ValorDesconto);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.CadastroExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.Cadastro.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.Cadastro);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.ETADestinoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.ETADestino.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.ETADestino);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.FormPagoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.FormPago.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.FormPago);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.PrecoFOBExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.PrecoFOB.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.PrecoFOB);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.ComisaoSFaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.ComisaoSFatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.ComisaoSFatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.DataFaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.DataFatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.DataFatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.RateExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.Rate.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.Rate);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.ValorConvertidoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.ValorConvertido.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.ValorConvertido);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.StatusExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.Status.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.Status);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.StatusDrawItem(Control: TWinControl; Index: Integer;
                                        Rect: TRect; State: TOwnerDrawState);
var Canvas : TCanvas;
begin
  if Control is TDBListBox then
    Canvas  := (Control as TDBListBox).Canvas
  else if Control is TDBComboBox then
    Canvas  := (Control as TDBComboBox).Canvas
  else
    Canvas  := (Control as TComboBox).Canvas;
  Canvas.FillRect(Rect);
  if TabGlobal.DFaturaProdExp.Status.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DFaturaProdExp.Status.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DFaturaProdExp.Status.DescValorValido[Index]));
end;

procedure TFormFaturaProdExp.OBSExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.OBS.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.OBS);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.ComentarioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.Comentario.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.Comentario);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaProdExp.DataLiqExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DFaturaProdExp.DataLiq.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DFaturaProdExp.DataLiq);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

end.
