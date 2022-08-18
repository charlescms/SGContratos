{
   Programa.: OrdCobrancaProd.PAS
   Copyright: Modular Software 2006
            : Todos os direitos reservados
   Site.....: http://www.xmaker.com.br
}
unit OrdCobrancaProd;

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
  TFormOrdCobrancaProd = class(TForm)
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
    COMISAOSFATURA: TXDBNumEdit;
    COMISAOSFATURA_EX: TXDBNumEdit;
    Comissao: TXDBNumEdit;
    Contrato: TXDBEdit;
    CopiarImagem: TMenuItem;
    CortarImagem: TMenuItem;
    DataEmbarque: TXDBDateEdit;
    DataLiq: TXDBDateEdit;
    DataOrdCobranca: TXDBDateEdit;
    DataSource: TDataSource;
    DlgAbrirImagem: TOpenDialog;
    DlgSalvarComoImagem: TSaveDialog;
    ETADestino: TXDBDateEdit;
    Fatura: TXDBEdit;
    FormPago: TXDBLookUp;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    LbcCadastro: TLabel;
    LbcComentario: TLabel;
    LbcCOMISAOSFATURA: TLabel;
    LbcCOMISAOSFATURA_EX: TLabel;
    LbcComissao: TLabel;
    LbcContrato: TLabel;
    LbcDataEmbarque: TLabel;
    LbcDataLiq: TLabel;
    LbcDataOrdCobranca: TLabel;
    LbcETADestino: TLabel;
    LbcFatura: TLabel;
    LbcFormPago: TLabel;
    LbcMOEDACOMISSAO: TLabel;
    LbcNavio: TLabel;
    LbcNomeMix: TLabel;
    LbcNumOrdCobranca: TLabel;
    LbcOBS: TLabel;
    LbcPrecoFOB: TLabel;
    LbcQuantidadeExp: TLabel;
    LbcRate: TLabel;
    LbcSeq: TLabel;
    LbcStatus: TLabel;
    LbcTAXACONVERCAO: TLabel;
    LbcUsuario: TLabel;
    LbcValor: TLabel;
    LbcVALOR_EX: TLabel;
    LbcVALORCONVERTIDO: TLabel;
    LbcVALORCONVERTIDO_EX: TLabel;
    LbcValorDesconto: TLabel;
    LbcVALORDESCONTO_EX: TLabel;
    MenuImagem: TPopupMenu;
    MnSep01: TMenuItem;
    MOEDACOMISSAO: TDBComboBox;
    Navio: TXDBEdit;
    NoManutencao: TNotebook;
    NomeMix: TXDBLookUp;
    NumOrdCobranca: TXDBEdit;
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
    TAXACONVERCAO: TXDBNumEdit;
    Usuario: TXDBEdit;
    Valor: TXDBNumEdit;
    VALOR_EX: TXDBNumEdit;
    VALORCONVERTIDO: TXDBNumEdit;
    VALORCONVERTIDO_EX: TXDBNumEdit;
    ValorDesconto: TXDBNumEdit;
    VALORDESCONTO_EX: TXDBNumEdit;
    procedure NumOrdCobrancaExit(Sender: TObject);
    procedure ContratoExit(Sender: TObject);
    procedure SeqExit(Sender: TObject);
    procedure NavioExit(Sender: TObject);
    procedure DataEmbarqueExit(Sender: TObject);
    procedure QuantidadeExpExit(Sender: TObject);
    procedure FaturaExit(Sender: TObject);
    procedure StDocumentoExit(Sender: TObject);
    procedure CadastroExit(Sender: TObject);
    procedure ETADestinoExit(Sender: TObject);
    procedure FormPagoExit(Sender: TObject);
    procedure PrecoFOBExit(Sender: TObject);
    procedure RateExit(Sender: TObject);
    procedure StatusExit(Sender: TObject);
    procedure StatusDrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
    procedure OBSExit(Sender: TObject);
    procedure DataLiqExit(Sender: TObject);
    procedure NomeMixExit(Sender: TObject);
    procedure ComissaoExit(Sender: TObject);
    procedure VALOR_EXExit(Sender: TObject);
    procedure VALORDESCONTO_EXExit(Sender: TObject);
    procedure COMISAOSFATURA_EXExit(Sender: TObject);
    procedure VALORCONVERTIDO_EXExit(Sender: TObject);
    procedure ValorExit(Sender: TObject);
    procedure ValorDescontoExit(Sender: TObject);
    procedure MOEDACOMISSAOExit(Sender: TObject);
    procedure MOEDACOMISSAODrawItem(Control: TWinControl; Index: Integer;
                              Rect: TRect; State: TOwnerDrawState);
    procedure COMISAOSFATURAExit(Sender: TObject);
    procedure TAXACONVERCAOExit(Sender: TObject);
    procedure VALORCONVERTIDOExit(Sender: TObject);
    procedure UsuarioExit(Sender: TObject);
    procedure ComentarioExit(Sender: TObject);
    procedure DataOrdCobrancaExit(Sender: TObject);
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
  FormOrdCobrancaProd: TFormOrdCobrancaProd;
  LastControl: TWinControl;

implementation

{$R *.DFM}

uses Publicas, Princ, Rotinas, RotinaEd, Abertura, GridPesquisa, Interno;

procedure TFormOrdCobrancaProd.FormShow(Sender: TObject);
Var
  I: Integer;
begin
  {05-Início do Bloco Modular. Modificações não serão preservadas}
  TabelaPrincipal    := TabGlobal.DOrdemCobrancaProdExp;
  TituloModulo       := 'Produtos Ordem Cobrança';
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
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.DataOrdCobranca, -2, DataOrdCobrancaExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.Comentario, -2, ComentarioExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.Usuario, -2, UsuarioExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.VALORCONVERTIDO, -2, VALORCONVERTIDOExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.TAXACONVERCAO, -2, TAXACONVERCAOExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.COMISAOSFATURA, -2, COMISAOSFATURAExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.MOEDACOMISSAO, -2, MOEDACOMISSAOExit, MOEDACOMISSAODrawItem, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.ValorDesconto, -2, ValorDescontoExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.Valor, -2, ValorExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.VALORCONVERTIDO_EX, -2, VALORCONVERTIDO_EXExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.COMISAOSFATURA_EX, -2, COMISAOSFATURA_EXExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.VALORDESCONTO_EX, -2, VALORDESCONTO_EXExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.VALOR_EX, -2, VALOR_EXExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.Comissao, -2, ComissaoExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.NomeMix, -2, NomeMixExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.DataLiq, -2, DataLiqExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.OBS, -2, OBSExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.Status, -2, StatusExit, StatusDrawItem, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.Rate, -2, RateExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.PrecoFOB, -2, PrecoFOBExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.FormPago, -2, FormPagoExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.ETADestino, -2, ETADestinoExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.Cadastro, -2, CadastroExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.StDocumento, -2, StDocumentoExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.Fatura, -2, FaturaExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.QuantidadeExp, -2, QuantidadeExpExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.DataEmbarque, -2, DataEmbarqueExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.Navio, -2, NavioExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.Seq, -1, SeqExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.Contrato, -1, ContratoExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
  AtribuiCampoEdicao(TabGlobal.DOrdemCobrancaProdExp, TabGlobal.DOrdemCobrancaProdExp.NumOrdCobranca, -1, NumOrdCobrancaExit, Nil, ListaCamposEd, FormOrdCobrancaProd, DataSource, ChamaGridPesquisa);
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

function TFormOrdCobrancaProd.AbreTabelas: Boolean;
begin
  {07-Início do Bloco Modular. Modificações não serão preservadas}
  Result := True;
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormOrdCobrancaProd.CamposCalculados;
begin
  {08-Início do Bloco Modular. Modificações não serão preservadas}
  {99-Final do Bloco Modular. Modificações não serão preservadas}
end;

procedure TFormOrdCobrancaProd.HabilitaEdicao(Valor: Boolean = true);
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

function TFormOrdCobrancaProd.ConfirmaInclusao: Boolean;
begin
  Result := True;
end;

function TFormOrdCobrancaProd.ConfirmaModificacao: Boolean;
begin
  Result := True;
end;

function TFormOrdCobrancaProd.ConfirmaExclusao: Boolean;
begin
  Result := True;
end;

function TFormOrdCobrancaProd.ConfirmaGravacao: Boolean;
begin
  Result := True;
end;

procedure TFormOrdCobrancaProd.TelaManutencao;
begin
  if (TabelaPrincipal.Inclusao) or
     (TabelaPrincipal.Modificacao) then
    HabilitaEdicao
  else
    HabilitaEdicao(False);
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormOrdCobrancaProd.AtribuiValoresPadrao;
begin
  ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd, True);
  TabelaPrincipal.AtribuiRelacionamentos;

end;

procedure TFormOrdCobrancaProd.FocoCampo;
begin

end;

procedure TFormOrdCobrancaProd.AntesdeSalvar;
begin

end;

procedure TFormOrdCobrancaProd.AntesdeIncluir;
begin

end;

procedure TFormOrdCobrancaProd.AntesdeModificar;
begin

end;

procedure TFormOrdCobrancaProd.AntesdeExcluir;
begin

end;

procedure TFormOrdCobrancaProd.DepoisdeIncluir;
begin

end;

procedure TFormOrdCobrancaProd.DepoisdeModificar;
begin

end;

procedure TFormOrdCobrancaProd.DepoisdeExcluir;
begin

end;

procedure TFormOrdCobrancaProd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSalvar.Enabled then
    TabelaPrincipal.Cancela;
end;

procedure TFormOrdCobrancaProd.FormClose(Sender: TObject;
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

procedure TFormOrdCobrancaProd.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFormOrdCobrancaProd.FormKeyUp(Sender: TObject; var Key: Word;
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

procedure TFormOrdCobrancaProd.BtnSalvarClick(Sender: TObject);
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

procedure TFormOrdCobrancaProd.BtnDesistirClick(Sender: TObject);
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

procedure TFormOrdCobrancaProd.VerificaAtualizacoes;
begin
  if not BtnSalvar.Enabled then
    BtnDesistirClick(Self)
  else
    if MessageDlg('Salvar Registro ?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      BtnSalvarClick(Self)
    else
      BtnDesistirClick(Self);
end;

procedure TFormOrdCobrancaProd.BtnIncluirClick(Sender: TObject);
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

procedure TFormOrdCobrancaProd.BtnModificarClick(Sender: TObject);
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

procedure TFormOrdCobrancaProd.BtnExcluirClick(Sender: TObject);
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

procedure TFormOrdCobrancaProd.BtnPrimeiroClick(Sender: TObject);
begin
  TabelaPrincipal.First;
  TelaManutencao;
end;

procedure TFormOrdCobrancaProd.BtnAnteriorClick(Sender: TObject);
begin
  TabelaPrincipal.Prior;
  TelaManutencao;
end;

procedure TFormOrdCobrancaProd.BtnProximoClick(Sender: TObject);
begin
  TabelaPrincipal.Next;
  TelaManutencao;
end;

procedure TFormOrdCobrancaProd.BtnUltimoClick(Sender: TObject);
begin
  TabelaPrincipal.Last;
  if TabelaPrincipal.Eof then
  begin
    TabelaPrincipal.Prior;
    TabelaPrincipal.Next;
  end;
  TelaManutencao;
end;

procedure TFormOrdCobrancaProd.TabPaginasClick(Sender: TObject);
begin
  if NoManutencao.PageIndex <> TabPaginas.TabIndex then
    NoManutencao.SetFocus;
  NoManutencao.PageIndex := TabPaginas.TabIndex;
end;

procedure TFormOrdCobrancaProd.PosicionaNoCampo(Campo: TAtributo);
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

procedure TFormOrdCobrancaProd.ErroValidacaoCampo(MsgErro: String; Campo: TAtributo);
begin
  MessageDlg(MsgErro, mtError, [mbOk], 0);
  ErroValidacao := True;
  PosicionaNoCampo(Campo);
end;

procedure TFormOrdCobrancaProd.MudaSeForUltimo;
begin
  if (NoManutencao.PageIndex <> NoManutencao.Pages.Count - 1) and
     (ActiveControl = BtnSalvar) then
    if TabPaginas.TabIndex + 1 <= TabPaginas.Tabs.Count-1 then
      TabPaginas.TabIndex := TabPaginas.TabIndex + 1;
end;

procedure TFormOrdCobrancaProd.CortarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CutToClipBoard;
end;

procedure TFormOrdCobrancaProd.CopiarImagemClick(Sender: TObject);
begin
  if ActiveControl is TDBImage then
    TDBImage(ActiveControl).CopyToClipBoard;
end;

procedure TFormOrdCobrancaProd.ColarImagemClick(Sender: TObject);
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

procedure TFormOrdCobrancaProd.AbrirImagemClick(Sender: TObject);
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

procedure TFormOrdCobrancaProd.SalvarImagemClick(Sender: TObject);
begin
  if DlgSalvarComoImagem.Execute and (ActiveControl is TDBImage) then
    TDBImage(ActiveControl).Picture.SaveToFile(DlgSalvarComoImagem.FileName);
end;

function TFormOrdCobrancaProd.AbandonandoEdicao: Boolean;
begin
  Result := (ActiveControl = BtnDesistir);
end;

procedure TFormOrdCobrancaProd.ChamaGridPesquisa(Sender: TObject);
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

procedure TFormOrdCobrancaProd.ValidaColunaGrid(Sender: TField);
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

procedure TFormOrdCobrancaProd.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFormOrdCobrancaProd.NumOrdCobrancaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.NumOrdCobranca.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.NumOrdCobranca);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.ContratoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.Contrato.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.Contrato);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.SeqExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.Seq.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.Seq);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.NavioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.Navio.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.Navio);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.DataEmbarqueExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.DataEmbarque.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.DataEmbarque);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.QuantidadeExpExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.QuantidadeExp.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.QuantidadeExp);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.FaturaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.Fatura.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.Fatura);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.StDocumentoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.StDocumento.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.StDocumento);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.CadastroExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.Cadastro.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.Cadastro);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.ETADestinoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.ETADestino.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.ETADestino);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.FormPagoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.FormPago.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.FormPago);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.PrecoFOBExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.PrecoFOB.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.PrecoFOB);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.RateExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.Rate.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.Rate);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.StatusExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.Status.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.Status);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.StatusDrawItem(Control: TWinControl; Index: Integer;
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
  if TabGlobal.DOrdemCobrancaProdExp.Status.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DOrdemCobrancaProdExp.Status.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DOrdemCobrancaProdExp.Status.DescValorValido[Index]));
end;

procedure TFormOrdCobrancaProd.OBSExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.OBS.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.OBS);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.DataLiqExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.DataLiq.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.DataLiq);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.NomeMixExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.NomeMix.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.NomeMix);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.ComissaoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.Comissao.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.Comissao);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.VALOR_EXExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.VALOR_EX.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.VALOR_EX);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.VALORDESCONTO_EXExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.VALORDESCONTO_EX.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.VALORDESCONTO_EX);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.COMISAOSFATURA_EXExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.COMISAOSFATURA_EX.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.COMISAOSFATURA_EX);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.VALORCONVERTIDO_EXExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.VALORCONVERTIDO_EX.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.VALORCONVERTIDO_EX);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.ValorExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.Valor.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.Valor);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.ValorDescontoExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.ValorDesconto.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.ValorDesconto);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.MOEDACOMISSAOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.MOEDACOMISSAO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.MOEDACOMISSAO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.MOEDACOMISSAODrawItem(Control: TWinControl; Index: Integer;
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
  if TabGlobal.DOrdemCobrancaProdExp.MOEDACOMISSAO.DescValorValido[Index] = '' then
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DOrdemCobrancaProdExp.MOEDACOMISSAO.ValorValido[Index]))
  else
    Canvas.TextOut(Rect.Left + 2, Rect.Top, RetiraHK(TabGlobal.DOrdemCobrancaProdExp.MOEDACOMISSAO.DescValorValido[Index]));
end;

procedure TFormOrdCobrancaProd.COMISAOSFATURAExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.COMISAOSFATURA.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.COMISAOSFATURA);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.TAXACONVERCAOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.TAXACONVERCAO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.TAXACONVERCAO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.VALORCONVERTIDOExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.VALORCONVERTIDO.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.VALORCONVERTIDO);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.UsuarioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.Usuario.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.Usuario);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.ComentarioExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.Comentario.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.Comentario);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

procedure TFormOrdCobrancaProd.DataOrdCobrancaExit(Sender: TObject);
var MsgErro : string;
begin
  if AbandonandoEdicao then
    Exit;
  if not TabGlobal.DOrdemCobrancaProdExp.DataOrdCobranca.Valido(MsgErro, not SalvarRegistro) then
    ErroValidacaoCampo(MsgErro, TabGlobal.DOrdemCobrancaProdExp.DataOrdCobranca);
  if not SalvarRegistro then
    ExecutaPreValidacoes(TabelaPrincipal, Self, ListaCamposEd);
end;

end.
