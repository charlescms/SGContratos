unit AtrL0016;

interface

uses SysUtils, Classes, Graphics, DB, DBTables, Publicas,
  Rotinas, Validar, Atributo, Estrutur, Controls;

Type
  TDRESUMENCONTRATACION_CODIGO = class(TTipoInteiro)
  public
    constructor Create(AOwner: TComponent); override;
    { Validação }
    function Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean; override;
  end;

Type
  TDRESUMENCONTRATACION_CLICOD = class(TTipoInteiro)
  public
    constructor Create(AOwner: TComponent); override;
    { Validação }
    function Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean; override;
  end;

Type
  TDRESUMENCONTRATACION_seq = class(TTipoInteiro)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDRESUMENCONTRATACION_FormPago = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDRESUMENCONTRATACION_NOME = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDRESUMENCONTRATACION_NomeMix = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDRESUMENCONTRATACION_Observacoes = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDRESUMENCONTRATACION_QuantidadeTotal = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: Double; override;
  end;

Type
  TDRESUMENCONTRATACION_QUANTTOTALEXP = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: Double; override;
  end;

Type
  TDRESUMENCONTRATACION_QuantadePendente = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: Double; override;
  end;

Type
  TDRESUMENCONTRATACION_ValorSCCTotal = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: Double; override;
  end;

Type
  TDRESUMENCONTRATACION_ValorTotalExp = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: Double; override;
  end;

Type
  TDRESUMENCONTRATACION_ValorTotalPendente = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: Double; override;
  end;

Type
  TDRESUMENCONTRATACION_Usuario = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: String; override;
    { Pre-Validação }
    function PreValidacao: Boolean; override;
  end;


implementation

uses Abertura;

constructor TDRESUMENCONTRATACION_CODIGO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'CODIGO';
  Tipo              := tpInteiro;
  Tamanho           := 9;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Sequência';
  Mascara           := '999999999';
  CaractereEdicao   := '_';
  Ajuda             := 'Cliente ';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 4;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := True;
  Index             := 4;
  Index_Default     := 4;
  AutoIncremento    := 1;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'CODIGO';
  TabEstrangeira    := 'Clientes';
  ChaveEstrangeira  := 'CLICOD';
  CamposVisuais     := 'RAZAO;CLICOD;NOMFAN;CONTATO;NOMRES';
  EstiloPesquisa    := 1;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDRESUMENCONTRATACION_CODIGO.Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean;
begin
  if EmSaida then
  begin
    Result := True;
    exit;
  end;
  if not VALORNULO(ValorString) then
  begin
    Result := False;
    if Trim(MensagemErro) = '' then
      MsgErro := Format('Sequência inválido !',[Titulo])
    else
      MsgErro := Format(MensagemErro,[Titulo]);
    exit;
  end;
  Result  := True;
  MsgErro := '';
end;

constructor TDRESUMENCONTRATACION_CLICOD.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'CLICOD';
  Tipo              := tpInteiro;
  Tamanho           := 9;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Cliente';
  Mascara           := '999999999';
  CaractereEdicao   := '_';
  Ajuda             := 'Código do Cliente ';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 0;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 0;
  Index_Default     := 0;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'CLICOD';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDRESUMENCONTRATACION_CLICOD.Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean;
begin
  if EmSaida then
  begin
    Result := True;
    exit;
  end;
  if not VALORNULO(ValorString) then
  begin
    Result := False;
    if Trim(MensagemErro) = '' then
      MsgErro := Format('Cliente inválido !',[Titulo])
    else
      MsgErro := Format(MensagemErro,[Titulo]);
    exit;
  end;
  Result  := True;
  MsgErro := '';
end;

constructor TDRESUMENCONTRATACION_seq.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'seq';
  Tipo              := tpInteiro;
  Tamanho           := 2;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Seq';
  Mascara           := '99';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 1;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 1;
  Index_Default     := 1;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'seq';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDRESUMENCONTRATACION_FormPago.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'FormPago';
  Tipo              := tpAlfanumerico;
  Tamanho           := 10;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'F. Pag p/Fatura';
  Mascara           := 'XXXXXXXXXX';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 5;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 5;
  Index_Default     := 5;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'FormPago';
  TabEstrangeira    := 'TbFormaPagamento';
  ChaveEstrangeira  := 'FormPago';
  CamposVisuais     := 'FormPago';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDRESUMENCONTRATACION_NOME.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'NOME';
  Tipo              := tpAlfanumerico;
  Tamanho           := 50;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Divisão';
  Mascara           := 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  CaractereEdicao   := ' ';
  Ajuda             := 'Informe o nome da divisão';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 12;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 12;
  Index_Default     := 12;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'NOME';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDRESUMENCONTRATACION_NomeMix.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'NomeMix';
  Tipo              := tpAlfanumerico;
  Tamanho           := 30;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Produtos';
  Mascara           := 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 2;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 2;
  Index_Default     := 2;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 2;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'NomeMix';
  TabEstrangeira    := 'Produtos';
  ChaveEstrangeira  := 'Produto';
  CamposVisuais     := 'Produto';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDRESUMENCONTRATACION_Observacoes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Observacoes';
  Tipo              := tpAlfanumerico;
  Tamanho           := 60;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Observações';
  Mascara           := '';
  CaractereEdicao   := ' ';
  Ajuda             := 'Informe Observações';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 3;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 3;
  Index_Default     := 3;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'Observacoes';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDRESUMENCONTRATACION_QuantidadeTotal.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'QuantidadeTotal';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 3;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Quant. Total (TM)';
  Mascara           := 'ZZZ.ZZZ.ZZ9,999';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 6;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 6;
  Index_Default     := 6;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 2;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'QuantidadeTotal';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDRESUMENCONTRATACION_QuantidadeTotal.ValorPadrao: Double;
begin
  Result := 0;
end;

constructor TDRESUMENCONTRATACION_QUANTTOTALEXP.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'QUANTTOTALEXP';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 3;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Quant. T. Exp.';
  Mascara           := 'ZZZ.ZZZ.ZZ9,999';
  CaractereEdicao   := '_';
  Ajuda             := 'Qunatidade Tota Exportada';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 7;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 7;
  Index_Default     := 7;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 2;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'QUANTTOTALEXP';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDRESUMENCONTRATACION_QUANTTOTALEXP.ValorPadrao: Double;
begin
  Result := 0;
end;

constructor TDRESUMENCONTRATACION_QuantadePendente.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'QuantadePendente';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 1;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Quant. Pendente';
  Mascara           := 'ZZ.ZZZ.ZZZ.ZZ9,9';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 9;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 9;
  Index_Default     := 9;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 2;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'QuantadePendente';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDRESUMENCONTRATACION_QuantadePendente.ValorPadrao: Double;
begin
  Result := 0;
end;

constructor TDRESUMENCONTRATACION_ValorSCCTotal.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'ValorSCCTotal';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 3;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Valor SCC Total';
  Mascara           := 'ZZZ.ZZZ.ZZ9,999';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 8;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 8;
  Index_Default     := 8;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 2;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'ValorSCCTotal';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDRESUMENCONTRATACION_ValorSCCTotal.ValorPadrao: Double;
begin
  Result := 0;
end;

constructor TDRESUMENCONTRATACION_ValorTotalExp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'ValorTotalExp';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Valor Total Exp.';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 10;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 10;
  Index_Default     := 10;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 2;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'ValorTotalExp';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDRESUMENCONTRATACION_ValorTotalExp.ValorPadrao: Double;
begin
  Result := 0;
end;

constructor TDRESUMENCONTRATACION_ValorTotalPendente.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'ValorTotalPendente';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Valor Total Pendente';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 11;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 11;
  Index_Default     := 11;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 2;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'ValorTotalPendente';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDRESUMENCONTRATACION_ValorTotalPendente.ValorPadrao: Double;
begin
  Result := 0;
end;

constructor TDRESUMENCONTRATACION_Usuario.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Usuario';
  Tipo              := tpAlfanumerico;
  Tamanho           := 20;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Usuário';
  Mascara           := '';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 13;
  Valor.Visible     := False;
  Visible_Default   := False;
  Chave             := False;
  Index             := 13;
  Index_Default     := 13;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= True;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'RESUMENCONTRATACION';
  NomeOriginal      := 'Usuario';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDRESUMENCONTRATACION_Usuario.ValorPadrao: String;
begin
  Result := Sistema.Usuario;
end;

function TDRESUMENCONTRATACION_Usuario.PreValidacao: Boolean;
begin
  Result := Sistema.Master;
end;

end.
