{
   Programa.: Exportacao.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
}
unit Exportacao;

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
  TFormExportacao = class(TForm)
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
    Comissao: TXDBNumEdit;
    Contrato: TXDBEdit;
    CopiarImagem: TMenuItem;
    CortarImagem: TMenuItem;
    DataEmbarque: TXDBDateEdit;
    DataSource: TDataSource;
    DlgAbrirImagem: TOpenDialog;
    DlgSalvarComoImagem: TSaveDialog;
    ETADestino: TXDBDateEdit;
    Fatura: TXDBEdit;
    FormComissao: TDBComboBox;
    FormPago: TXDBLookUp;
    Label1: TLabel;
    Label2: TLabel;
    LbcCadastro: TLabel;
    LbcComentario: TLabel;
    LbcComisaoSFatura: TLabel;
    LbcComissao: TLabel;
    LbcContrato: TLabel;
    LbcDataEmbarque: TLabel;
    LbcETADestino: TLabel;
    LbcFatura: TLabel;
    LbcFormComissao: TLabel;
    LbcFormPago: TLabel;
    LbcNavio: TLabel;
    LbcOBS: TLabel;
    LbcPrecoFOB: TLabel;
    LbcQuantidade: TLabel;
    LbcSeq: TLabel;
    LbcValor: TLabel;
    MenuImagem: TPopupMenu;
    MnSep01: TMenuItem;
    Navio: TXDBEdit;
    NoManutencao: TNotebook;
    OBS: TXDBEdit;
    Pagina0: TScrollBox;
    Pagina1: TScrollBox;
    PnSalva: TPanel;
    PrecoFOB: TXDBNumEdit;
    QuantidadeExp: TXDBNumEdit;
    SalvarImagem: TMenuItem;
    Seq: TXDBNumEdit;
    StDocumento: TDBRadioGroup;
    TabPaginas: TTabSet;
    Valor: TXDBNumEdit;
    procedure ContratoExit(Sender: TObject);
    procedure SeqExit(Sender: TObject);
    procedure CadastroExit(Sender: TObject);
    procedure NavioExit(Sender: TObject);
    procedure ValorExit(Sender: TObject);
    procedure DataEmbarqueExit(Sender: TObject);
    procedure FaturaExit(Sender: TObject);
    procedure OBSExit(Sender: TObject);
    procedure ComisaoSFaturaExit(Sender: TObject);
    procedure ETADestinoExit(Sender: TObject);
    procedure StDocumentoExit(Sender: TObject);
    procedure ComentarioExit(Sender: TObject);
    procedure PrecoFOBExit(Sender: TObject);
    procedure FormComissaoExit(Sender: TObject);
    procedure FormComissaoDrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
    procedure ComissaoExit(Sender: TObject);
    procedure FormPagoExit(Sender: TObject);
    procedure QuantidadeExpExit(Sender: TObject);
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
    procedure Atualizar_boock(OP, Contrato : STRING; Quantidade: DOUBLE);
  end;

var
  FormExportacao: TFormExportacao;
  LastControl: TWinControl;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, RotinaEd, Abertura, GridPesquisa, Interno  ;

procedure TFormExportacao.FormShow(Sender: TObject);
Var
  I: Integer;
begin
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  TabelaPrincipal    := TabGlobal.DExpotadoTransito;
  TituloModulo       := 'Exportação';
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
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.QuantidadeExp, -2, QuantidadeExpExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.FormPago, -2, FormPagoExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.Comissao, -2, ComissaoExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.FormComissao, -2, FormComissaoExit, FormComissaoDrawItem, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.PrecoFOB, -2, PrecoFOBExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.Comentario, -2, ComentarioExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.StDocumento, -2, StDocumentoExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.ETADestino, -2, ETADestinoExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.ComisaoSFatura, -2, ComisaoSFaturaExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.OBS, -2, OBSExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.Fatura, -2, FaturaExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.DataEmbarque, -2, DataEmbarqueExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.Valor, -2, ValorExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.Navio, -2, NavioExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.Cadastro, -2, CadastroExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.Seq, -1, SeqExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DExpotadoTransito, TabGlobal.DExpotadoTransito.Contrato, -1, ContratoExit, Nil, ListaCamposEd, FormExportacao, DataSource, ChamaGridPesquisa);
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

function TFormExportacao.AbreTabelas: Boolean;
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  Result := True;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormExportacao.CamposCalculados;
begin
  {08-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormExportacao.HabilitaEdicao(Valor: Boolean = true);
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

function TFormExportacao.ConfirmaInclusao: Boolean;
begin
  Result := True;
end;

function TFormExportacao.ConfirmaModificacao: Boolean;
begin
  Result := True;
end;

function TFormExportacao.ConfirmaExclusao: Boolean;
begin
  Result := True;
end;

function TFormExportacao.ConfirmaGravacao: Boolean;
begin
  Result := True;
end;

procedure TFormExportacao.TelaManutencao;
begin
  if (TabelaPrincipal.Inclusao) or
     (TabelaPrincipal.Modificacao) then
    HabilitaEdicao
  else
    HabilitaEdicao(False);
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormExportacao.AtribuiValoresPadrao;
begin
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd, True);
  TabelaPrincipal.AtribuiRelacionamentos;

  //
  TabGlobal.DExpotadoTransito.Comissao.CONTEUDO := TabGlobal.DContratoTransporte.Comissao.CONTEUDO ;
  TabGlobal.DExpotadoTransito.FORMCOMISSAO.CONTEUDO := TabGlobal.DContratoTransporte.FORMCOMISSAO.CONTEUDO ;

end;

procedure TFormExportacao.FocoCampo;
begin

end;

procedure TFormExportacao.AntesdeSalvar;
begin

end;

procedure TFormExportacao.AntesdeIncluir;
begin

end;

procedure TFormExportacao.AntesdeModificar;
begin
  atualizar_boock('S',TabGlobal.DExpotadoTransito.Contrato.Conteudo , TabGlobal.DExpotadoTransito.QuantidadeExp.Conteudo);
end;

procedure TFormExportacao.AntesdeExcluir;
begin
  atualizar_boock('S',TabGlobal.DExpotadoTransito.Contrato.Conteudo , TabGlobal.DExpotadoTransito.QuantidadeExp.Conteudo);
end;

procedure TFormExportacao.DepoisdeIncluir;
begin
  atualizar_boock('A',TabGlobal.DExpotadoTransito.Contrato.Conteudo , TabGlobal.DExpotadoTransito.QuantidadeExp.Conteudo);
end;

procedure TFormExportacao.DepoisdeModificar;
begin
  atualizar_boock('A',TabGlobal.DExpotadoTransito.Contrato.Conteudo , TabGlobal.DExpotadoTransito.QuantidadeExp.Conteudo);
end;

procedure TFormExportacao.DepoisdeExcluir;
begin

end;

procedure TFormExportacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSalvar.Enabled then
    TabelaPrincipal.Cancela;
end;

procedure TFormExportacao.FormClose(Sender: TObject;
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

procedure TFormExportacao.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormExportacao.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TFormExportacao.BtnSalvarClick(Sender: TObject);
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

procedure TFormExportacao.BtnDesistirClick(Sender: TObject);
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

procedure TFormExportacao.VerificaAtualizacoes;
begin
  if not BtnSalvar.Enabled then
    BtnDesistirClick(Self)
  else
    if MessageDlg('Salvar Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      BtnSalvarClick(Self)
    else
      BtnDesistirClick(Self);
end;

procedure TFormExportacao.BtnIncluirClick(Sender: TObject);
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

procedure TFormExportacao.BtnModificarClick(Sender: TObject);
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

procedure TFormExportacao.BtnExcluirClick(Sender: TObject);
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

procedure TFormExportacao.BtnPrimeiroClick(Sender: TObject);
begin
  TabelaPrincipal.First;
  TelaManutencao;
end;

procedure TFormExportacao.BtnAnteriorClick(Sender: TObject);
begin
  TabelaPrincipal.Prior;
  TelaManutencao;
end;

procedure TFormExportacao.BtnProximoClick(Sender: TObject);
begin
  TabelaPrincipal.Next;
  TelaManutencao;
end;

procedure TFormExportacao.BtnUltimoClick(Sender: TObject);
begin
  TabelaPrincipal.Last;
  if TabelaPrincipal.Eof then
  begin
    TabelaPrincipal.Prior;
    TabelaPrincipal.Next;
  end;
  TelaManutencao;
end;

procedure TFormExportacao.TabPaginasClick(Sender: TObject);
begin
  if NoManutencao.PageIndex <> TabPaginas.TabIndex then
    NoManutencao.SetFocus;
  NoManutencao.PageIndex := TabPaginas.TabIndex;
end;

procedure TFormExportacao.PosicionaNoCampo(Campo: TAtributo);
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

procedure TFormExportacao.ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
begin
  MessageDlg(MsgErro, mtError, [mbOk], 0);
  ErroValidacao := True;
  PosicionaNoCampo(Campo);
end;

procedure TFormExportacao.MudaSeForUltimo;
begin
  if (NoManutencao.PageIndex <> NoManutencao.Pages.Count - 1) and
     (ActiveControl = BtnSalvar) then
    if TabPaginas.TabIndex + 1 <= TabPaginas.Tabs.Count-1 then
      TabPaginas.TabIndex := TabPaginas.TabIndex + 1;
end;

procedure TFormExportacao.CortarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CutToClipBoard;
end;

procedure TFormExportacao.CopiarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CopyToClipBoard;
end;

procedure TFormExportacao.ColarImagemClick(Sender: TObject);
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

procedure TFormExportacao.AbrirImagemClick(Sender: TObject);
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

procedure TFormExportacao.SalvarImagemClick(Sender: TObject);
begin
  if DlgSalvarComoImagem.Execute and (ActiveControl is TDBImage) then
    TDBImage(ActiveControl).Picture.SaveToFile(DlgSalvarComoImagem.FileName);
end;

function TFormExportacao.AbandonandoEdicao: Boolean;
begin
  Result := (ActiveControl = BtnDesistir);
end;

procedure TFormExportacao.ChamaGridPesquisa(Sender: TObject);
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

procedure TFormExportacao.ValidaColunaGrid(Sender: TField);
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

procedure TFormExportacao.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFormExportacao.ContratoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.Contrato.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.Contrato);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.SeqExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.Seq.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.Seq);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.CadastroExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.Cadastro.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.Cadastro);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.NavioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.Navio.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.Navio);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.ValorExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.Valor.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.Valor);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.DataEmbarqueExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.DataEmbarque.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.DataEmbarque);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.FaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.Fatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.Fatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.OBSExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.OBS.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.OBS);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.ComisaoSFaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.ComisaoSFatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.ComisaoSFatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.ETADestinoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.ETADestino.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.ETADestino);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.StDocumentoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.StDocumento.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.StDocumento);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.ComentarioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.Comentario.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.Comentario);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.Atualizar_boock(OP, Contrato : STRING; Quantidade: DOUBLE);
VAR
//   TMP_Tabela: TTabela;
   N_BOOCK : INTEGER ;
BEGIN

  //TMP_Tabela:= TTabela.Create(NIL);
  //TMP_Tabela.;
  N_BOOCK := 0 ;
  TabGlobal.DBoocking.Refresh ;
  TabGlobal.DBoocking.Prior ;
  WHILE NOT TabGlobal.DBoocking.Eof DO BEGIN
       IF TabGlobal.DBoocking.Contrato.Conteudo = Contrato THEN
          N_BOOCK := N_BOOCK + 1 ;
       TabGlobal.DBoocking.Next ;
  END;

  TabGlobal.DBoocking.Refresh ;
  TabGlobal.DBoocking.Prior ;

  IF OP = 'A' THEN BEGIN

     WHILE NOT TabGlobal.DBoocking.Eof DO BEGIN

       IF ((TabGlobal.DBoocking.Contrato.Conteudo = Contrato) AND
          (TabGlobal.DBoocking.StatusBK.Conteudo = 'NA')) THEN BEGIN

          TabGlobal.DBoocking.Edit ;

          IF N_BOOCK = 1 THEN BEGIN
             TabGlobal.DBoocking.QuntTransp.Conteudo := TabGlobal.DBoocking.QuntTransp.Conteudo  + Quantidade ;
             IF (TabGlobal.DBoocking.Quantidade.Conteudo - TabGlobal.DBoocking.QuntTransp.Conteudo) = 0 THEN
                TabGlobal.DBoocking.StatusBK.Conteudo := 'RE';
             IF (TabGlobal.DBoocking.Quantidade.Conteudo - TabGlobal.DBoocking.QuntTransp.Conteudo) < 0 THEN
                TabGlobal.DBoocking.StatusBK.Conteudo := 'PR';
             IF (TabGlobal.DBoocking.Quantidade.Conteudo - TabGlobal.DBoocking.QuntTransp.Conteudo) > 0 THEN
                TabGlobal.DBoocking.StatusBK.Conteudo := 'NA';

             END
          ELSE BEGIN
             N_BOOCK := N_BOOCK - 1 ;
             IF TabGlobal.DBoocking.Quantidade.Conteudo < Quantidade THEN BEGIN
                TabGlobal.DBoocking.StatusBK.Conteudo := 'RE';
                TabGlobal.DBoocking.QuntTransp.Conteudo := TabGlobal.DBoocking.Quantidade.Conteudo ;
                Quantidade := Quantidade - TabGlobal.DBoocking.Quantidade.Conteudo ;
                END
             ELSE BEGIN
                TabGlobal.DBoocking.QuntTransp.Conteudo := TabGlobal.DBoocking.QuntTransp.Conteudo  + Quantidade;
                IF (( TabGlobal.DBoocking.Quantidade.Conteudo - TabGlobal.DBoocking.QuntTransp.Conteudo) = 0 ) THEN
                   TabGlobal.DBoocking.StatusBK.Conteudo := 'RE';
                IF ((TabGlobal.DBoocking.Quantidade.Conteudo - TabGlobal.DBoocking.QuntTransp.Conteudo) < 0) THEN
                   TabGlobal.DBoocking.StatusBK.Conteudo := 'PR';
                IF ((TabGlobal.DBoocking.Quantidade.Conteudo - TabGlobal.DBoocking.QuntTransp.Conteudo) > 0) THEN
                   TabGlobal.DBoocking.StatusBK.Conteudo := 'NA';

             END;
          END;

         TabGlobal.DBoocking.POST;

       END;

       TabGlobal.DBoocking.Next ;
     END;

  END;

  IF OP = 'S' THEN BEGIN
     WHILE NOT TabGlobal.DBoocking.Eof DO BEGIN
       IF ((TabGlobal.DBoocking.Contrato.Conteudo = Contrato) AND
           ((TabGlobal.DBoocking.StatusBK.Conteudo = 'RE')    OR
            (TabGlobal.DBoocking.StatusBK.Conteudo = 'PR')))  THEN BEGIN
          TabGlobal.DBoocking.Edit ;
          IF N_BOOCK = 1 THEN BEGIN

             TabGlobal.DBoocking.QuntTransp.Conteudo := TabGlobal.DBoocking.QuntTransp.Conteudo  - Quantidade ;
             TabGlobal.DBoocking.StatusBK.Conteudo := 'NA';
             END
          ELSE BEGIN
             N_BOOCK := N_BOOCK - 1 ;
             IF TabGlobal.DBoocking.Quantidade.Conteudo < Quantidade THEN BEGIN
                TabGlobal.DBoocking.StatusBK.Conteudo := 'NA';
                TabGlobal.DBoocking.QuntTransp.Conteudo := 0;
                Quantidade := Quantidade - TabGlobal.DBoocking.Quantidade.Conteudo ;
                END
             ELSE BEGIN
                TabGlobal.DBoocking.QuntTransp.Conteudo := TabGlobal.DBoocking.QuntTransp.Conteudo  - Quantidade ;
                TabGlobal.DBoocking.StatusBK.Conteudo := 'NA';
             END;

          END;
          TabGlobal.DBoocking.POST;
       END;
       TabGlobal.DBoocking.Next   ;
     END;
  END;


END;
procedure TFormExportacao.PrecoFOBExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.PrecoFOB.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.PrecoFOB);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.FormComissaoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.FormComissao.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.FormComissao);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.FormComissaoDrawItem(Control: TWinControl; Index: Integer;
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
  if TabGlobal.DExpotadoTransito.FormComissao.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DExpotadoTransito.FormComissao.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DExpotadoTransito.FormComissao.DescValorValido[Index]));
end;

procedure TFormExportacao.ComissaoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.Comissao.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.Comissao);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.FormPagoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.FormPago.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.FormPago);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormExportacao.QuantidadeExpExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DExpotadoTransito.QuantidadeExp.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DExpotadoTransito.QuantidadeExp);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

end.


