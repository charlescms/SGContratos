{
   Programa.: FaturaComplFatu.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
}
unit FaturaComplFatu;

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
  TFormFaturaComplFatu = class(TForm)
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
    ColarImagem: TMenuItem;
    CopiarImagem: TMenuItem;
    CortarImagem: TMenuItem;
    DataSource: TDataSource;
    DlgAbrirImagem: TOpenDialog;
    DlgSalvarComoImagem: TSaveDialog;
    LbcNumFatura: TLabel;
    LbcObservacao: TLabel;
    LbcSeq: TLabel;
    LbcUsuario: TLabel;
    LbcValor: TLabel;
    MenuImagem: TPopupMenu;
    MnSep01: TMenuItem;
    NoManutencao: TNotebook;
    NumFatura: TXDBEdit;
    Observacao: TXDBEdit;
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
    SalvarImagem: TMenuItem;
    Seq: TXDBNumEdit;
    TabPaginas: TTabSet;
    Usuario: TXDBEdit;
    Valor: TXDBNumEdit;
    procedure NumFaturaExit(Sender: TObject);
    procedure SeqExit(Sender: TObject);
    procedure ValorExit(Sender: TObject);
    procedure UsuarioExit(Sender: TObject);
    procedure ObservacaoExit(Sender: TObject);
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
  FormFaturaComplFatu: TFormFaturaComplFatu;
  LastControl: TWinControl;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, RotinaEd, Abertura, GridPesquisa, Interno;

procedure TFormFaturaComplFatu.FormShow(Sender: TObject);
Var
  I: Integer;
begin
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  TabelaPrincipal    := TabGlobal.DComplementoFatura;
  TituloModulo       := 'Cadastro Complemento Fatura';
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
  AtribuiCampoEdicao(TabGlobal.DComplementoFatura, TabGlobal.DComplementoFatura.Observacao, -2, ObservacaoExit, Nil, ListaCamposEd, FormFaturaComplFatu, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DComplementoFatura, TabGlobal.DComplementoFatura.Usuario, -2, UsuarioExit, Nil, ListaCamposEd, FormFaturaComplFatu, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DComplementoFatura, TabGlobal.DComplementoFatura.Valor, -2, ValorExit, Nil, ListaCamposEd, FormFaturaComplFatu, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DComplementoFatura, TabGlobal.DComplementoFatura.Seq, -1, SeqExit, Nil, ListaCamposEd, FormFaturaComplFatu, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DComplementoFatura, TabGlobal.DComplementoFatura.NumFatura, -1, NumFaturaExit, Nil, ListaCamposEd, FormFaturaComplFatu, DataSource, ChamaGridPesquisa);
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

function TFormFaturaComplFatu.AbreTabelas: Boolean;
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  Result := True;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormFaturaComplFatu.CamposCalculados;
begin
  {08-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormFaturaComplFatu.HabilitaEdicao(Valor: Boolean = true);
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

function TFormFaturaComplFatu.ConfirmaInclusao: Boolean;
begin
  Result := True;
end;

function TFormFaturaComplFatu.ConfirmaModificacao: Boolean;
begin
  Result := True;
end;

function TFormFaturaComplFatu.ConfirmaExclusao: Boolean;
begin
  Result := True;
end;

function TFormFaturaComplFatu.ConfirmaGravacao: Boolean;
begin
  Result := True;
end;

procedure TFormFaturaComplFatu.TelaManutencao;
begin
  if (TabelaPrincipal.Inclusao) or
     (TabelaPrincipal.Modificacao) then
    HabilitaEdicao
  else
    HabilitaEdicao(False);
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormFaturaComplFatu.AtribuiValoresPadrao;
begin
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd, True);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormFaturaComplFatu.FocoCampo;
begin

end;

procedure TFormFaturaComplFatu.AntesdeSalvar;
begin

end;

procedure TFormFaturaComplFatu.AntesdeIncluir;
begin

end;

procedure TFormFaturaComplFatu.AntesdeModificar;
begin

end;

procedure TFormFaturaComplFatu.AntesdeExcluir;
begin

end;

procedure TFormFaturaComplFatu.DepoisdeIncluir;
begin

end;

procedure TFormFaturaComplFatu.DepoisdeModificar;
begin

end;

procedure TFormFaturaComplFatu.DepoisdeExcluir;
begin

end;

procedure TFormFaturaComplFatu.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSalvar.Enabled then
    TabelaPrincipal.Cancela;
end;

procedure TFormFaturaComplFatu.FormClose(Sender: TObject;
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

procedure TFormFaturaComplFatu.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormFaturaComplFatu.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TFormFaturaComplFatu.BtnSalvarClick(Sender: TObject);
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

procedure TFormFaturaComplFatu.BtnDesistirClick(Sender: TObject);
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

procedure TFormFaturaComplFatu.VerificaAtualizacoes;
begin
  if not BtnSalvar.Enabled then
    BtnDesistirClick(Self)
  else
    if MessageDlg('Salvar Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      BtnSalvarClick(Self)
    else
      BtnDesistirClick(Self);
end;

procedure TFormFaturaComplFatu.BtnIncluirClick(Sender: TObject);
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

procedure TFormFaturaComplFatu.BtnModificarClick(Sender: TObject);
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

procedure TFormFaturaComplFatu.BtnExcluirClick(Sender: TObject);
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

procedure TFormFaturaComplFatu.BtnPrimeiroClick(Sender: TObject);
begin
  TabelaPrincipal.First;
  TelaManutencao;
end;

procedure TFormFaturaComplFatu.BtnAnteriorClick(Sender: TObject);
begin
  TabelaPrincipal.Prior;
  TelaManutencao;
end;

procedure TFormFaturaComplFatu.BtnProximoClick(Sender: TObject);
begin
  TabelaPrincipal.Next;
  TelaManutencao;
end;

procedure TFormFaturaComplFatu.BtnUltimoClick(Sender: TObject);
begin
  TabelaPrincipal.Last;
  if TabelaPrincipal.Eof then
  begin
    TabelaPrincipal.Prior;
    TabelaPrincipal.Next;
  end;
  TelaManutencao;
end;

procedure TFormFaturaComplFatu.TabPaginasClick(Sender: TObject);
begin
  if NoManutencao.PageIndex <> TabPaginas.TabIndex then
    NoManutencao.SetFocus;
  NoManutencao.PageIndex := TabPaginas.TabIndex;
end;

procedure TFormFaturaComplFatu.PosicionaNoCampo(Campo: TAtributo);
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

procedure TFormFaturaComplFatu.ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
begin
  MessageDlg(MsgErro, mtError, [mbOk], 0);
  ErroValidacao := True;
  PosicionaNoCampo(Campo);
end;

procedure TFormFaturaComplFatu.MudaSeForUltimo;
begin
  if (NoManutencao.PageIndex <> NoManutencao.Pages.Count - 1) and
     (ActiveControl = BtnSalvar) then
    if TabPaginas.TabIndex + 1 <= TabPaginas.Tabs.Count-1 then
      TabPaginas.TabIndex := TabPaginas.TabIndex + 1;
end;

procedure TFormFaturaComplFatu.CortarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CutToClipBoard;
end;

procedure TFormFaturaComplFatu.CopiarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CopyToClipBoard;
end;

procedure TFormFaturaComplFatu.ColarImagemClick(Sender: TObject);
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

procedure TFormFaturaComplFatu.AbrirImagemClick(Sender: TObject);
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

procedure TFormFaturaComplFatu.SalvarImagemClick(Sender: TObject);
begin
  if DlgSalvarComoImagem.Execute and (ActiveControl is TDBImage) then
    TDBImage(ActiveControl).Picture.SaveToFile(DlgSalvarComoImagem.FileName);
end;

function TFormFaturaComplFatu.AbandonandoEdicao: Boolean;
begin
  Result := (ActiveControl = BtnDesistir);
end;

procedure TFormFaturaComplFatu.ChamaGridPesquisa(Sender: TObject);
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

procedure TFormFaturaComplFatu.ValidaColunaGrid(Sender: TField);
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

procedure TFormFaturaComplFatu.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFormFaturaComplFatu.NumFaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DComplementoFatura.NumFatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DComplementoFatura.NumFatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaComplFatu.SeqExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DComplementoFatura.Seq.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DComplementoFatura.Seq);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaComplFatu.ValorExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DComplementoFatura.Valor.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DComplementoFatura.Valor);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaComplFatu.UsuarioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DComplementoFatura.Usuario.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DComplementoFatura.Usuario);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormFaturaComplFatu.ObservacaoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DComplementoFatura.Observacao.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DComplementoFatura.Observacao);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

end.
