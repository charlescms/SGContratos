unit AtrL0009;

interface

uses SysUtils, Classes, Graphics, DB, DBTables, Publicas,
  Rotinas, Validar, Atributo, Estrutur, Controls;

Type
  TDOrdemCobranca_NumOrdCobranca = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_FORCOD = class(TTipoInteiro)
  public
    constructor Create(AOwner: TComponent); override;
    { Validação }
    function Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean; override;
  end;

Type
  TDOrdemCobranca_Cadastro = class(TTipoData)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: TDateTime; override;
  end;

Type
  TDOrdemCobranca_FATURA = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_DataFatura = class(TTipoData)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_Status = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: String; override;
    { Valores válidos }
    procedure IncluiValoresValidos; override;
  end;

Type
  TDOrdemCobranca_CTTO = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_MOEDACOMISSAO = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: String; override;
    { Validação }
    function Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean; override;
    { Valores válidos }
    procedure IncluiValoresValidos; override;
  end;

Type
  TDOrdemCobranca_Valor = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_ValorDesconto = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_VALOR_LIQ = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_NumNFEmit = class(TTipoInteiro)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_DataNF = class(TTipoData)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_Comentario = class(TTipoMemo)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_VALOR_NF = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_VALOR_IRRF = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_VALOR_PIS_COF = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_VALOR_NF_LIQ = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_DataLiq = class(TTipoData)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_DataProtesto = class(TTipoData)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_Recebimento = class(TTipoData)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_VALORRECEBIDO = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_RAZAO = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_NOME = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_TEXTO_PADRAO = class(TTipoMemo)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_Usuario = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: String; override;
    { Pre-Validação }
    function PreValidacao: Boolean; override;
  end;

Type
  TDOrdemCobranca_ID = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobranca_TextoDsconto = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: String; override;
  end;


implementation

uses Abertura;

constructor TDOrdemCobranca_NumOrdCobranca.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'NumOrdCobranca';
  Tipo              := tpAlfanumerico;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Ord. Cobrnça';
  Mascara           := '9999/9999';
  CaractereEdicao   := '_';
  Ajuda             := 'Informe o número da ordem Cobrança';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 0;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := True;
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
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'NumOrdCobranca';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_FORCOD.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'FORCOD';
  Tipo              := tpInteiro;
  Tamanho           := 6;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Exportador';
  Mascara           := '999999';
  CaractereEdicao   := '_';
  Ajuda             := 'Código do Exportador';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 21;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 21;
  Index_Default     := 21;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'FORCOD';
  TabEstrangeira    := 'Fornecedores';
  ChaveEstrangeira  := 'FORCOD';
  CamposVisuais     := 'RAZAO';
  EstiloPesquisa    := 1;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDOrdemCobranca_FORCOD.Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean;
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
      MsgErro := Format('Exportador inválido !',[Titulo])
    else
      MsgErro := Format(MensagemErro,[Titulo]);
    exit;
  end;
  Result  := True;
  MsgErro := '';
end;

constructor TDOrdemCobranca_Cadastro.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Cadastro';
  Tipo              := tpData;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Cadastro';
  Mascara           := '99/99/9999';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 4;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 4;
  Index_Default     := 4;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'Cadastro';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDOrdemCobranca_Cadastro.ValorPadrao: TDateTime;
begin
  Result := DataAtual;
end;

constructor TDOrdemCobranca_FATURA.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'FATURA';
  Tipo              := tpAlfanumerico;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Fatura Surimpex';
  Mascara           := '9999/9999';
  CaractereEdicao   := '_';
  Ajuda             := 'Informe o número da fatura';
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
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'FATURA';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_DataFatura.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'DataFatura';
  Tipo              := tpData;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Data Fatura';
  Mascara           := '99/99/9999';
  CaractereEdicao   := '_';
  Ajuda             := 'Data em que a futura foi gerada';
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
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'DataFatura';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_Status.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Status';
  Tipo              := tpAlfanumerico;
  Tamanho           := 1;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Status';
  Mascara           := 'X';
  CaractereEdicao   := ' ';
  Ajuda             := 'Status da Fatura';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 20;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 20;
  Index_Default     := 20;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'Status';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDOrdemCobranca_Status.ValorPadrao: String;
begin
  Result := '0';
end;

procedure TDOrdemCobranca_Status.IncluiValoresValidos;
begin
  inherited IncluiValoresValidos;
  IncluiValorValido('0', 'Em processamento');
  IncluiValorValido('1', 'Fatura Surimpex');
  IncluiValorValido('2', 'NF Emitida');
  IncluiValorValido('3', 'NF Paga');
  IncluiValorValido('4', 'Protesto');
  IncluiValorValido('5', 'Conciliação Emitida');
  IncluiValorValido('6', 'Conciliação Realizada');
  IncluiValorValido('7', 'Aplicar Rate');
  IncluiValorValido('8', 'Fatura Escluido');
  IncluiValorValido('9', 'Boocking');
  IncluiValorValido('A', 'Em Execução');
  IncluiValorValido('B', 'Exportação Bloqueada');
  Valor.OnGetText := GetText;
end;

constructor TDOrdemCobranca_CTTO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'CTTO';
  Tipo              := tpAlfanumerico;
  Tamanho           := 10;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'CTTO';
  Mascara           := 'XXXXXXXXXX';
  CaractereEdicao   := ' ';
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
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'CTTO';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_MOEDACOMISSAO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'MOEDACOMISSAO';
  Tipo              := tpAlfanumerico;
  Tamanho           := 3;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Moeda Comissão';
  Mascara           := 'XXX';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 22;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 22;
  Index_Default     := 22;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'MOEDACOMISSAO';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDOrdemCobranca_MOEDACOMISSAO.ValorPadrao: String;
begin
  Result := 'R$ ';
end;

function TDOrdemCobranca_MOEDACOMISSAO.Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean;
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
      MsgErro := Format('Moeda Comissão inválido !',[Titulo])
    else
      MsgErro := Format(MensagemErro,[Titulo]);
    exit;
  end;
  Result  := True;
  MsgErro := '';
end;

procedure TDOrdemCobranca_MOEDACOMISSAO.IncluiValoresValidos;
begin
  inherited IncluiValoresValidos;
  IncluiValorValido('', '');
  IncluiValorValido('R$ ', 'Real');
  IncluiValorValido('USR', 'Dolar');
  IncluiValorValido('EUR', 'Euro');
  Valor.OnGetText := GetText;
end;

constructor TDOrdemCobranca_Valor.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Valor';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 3;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Valor Fatura Exp.';
  Mascara           := 'ZZZ.ZZZ.ZZ9,999';
  CaractereEdicao   := '_';
  Ajuda             := 'Informe o Valor da Faturs Exp.';
  Calculado         := False;
  Calculado_F       := True;
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
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'Valor';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_ValorDesconto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'ValorDesconto';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Desconto';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := 'Informe o Valor do Desconto';
  Calculado         := False;
  Calculado_F       := True;
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
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'ValorDesconto';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_VALOR_LIQ.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'VALOR_LIQ';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'VL. Liquido';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := 'Informe o VL. Liquido';
  Calculado         := False;
  Calculado_F       := True;
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
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'VALOR_LIQ';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_NumNFEmit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'NumNFEmit';
  Tipo              := tpInteiro;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Nota Fiscal';
  Mascara           := '99999999';
  CaractereEdicao   := '_';
  Ajuda             := 'Informe o número da nota fiscal';
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
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'NumNFEmit';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_DataNF.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'DataNF';
  Tipo              := tpData;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Data NF';
  Mascara           := '99/99/9999';
  CaractereEdicao   := '_';
  Ajuda             := 'Data de Emissão Fatura';
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
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'DataNF';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_Comentario.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Comentario';
  Tipo              := tpMemo;
  Tamanho           := 100;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Comentário';
  Mascara           := '';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 23;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 23;
  Index_Default     := 23;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'Comentario';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_VALOR_NF.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'VALOR_NF';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Valor NF Bruto';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := 'Informe o valor da Nota Foscal';
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
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'VALOR_NF';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_VALOR_IRRF.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'VALOR_IRRF';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'VL. IRRF';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := 'Informe o Valor do IRRF';
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
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'VALOR_IRRF';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_VALOR_PIS_COF.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'VALOR_PIS_COF';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'VL. PIS/COF/CSSL';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := 'Informe  VL. PIS/COF/CSSL';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 15;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 15;
  Index_Default     := 15;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'VALOR_PIS_COF';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_VALOR_NF_LIQ.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'VALOR_NF_LIQ';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'VL NF Liquido';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := True;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 14;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 14;
  Index_Default     := 14;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'VALOR_NF_LIQ';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_DataLiq.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'DataLiq';
  Tipo              := tpData;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Data Liq.';
  Mascara           := '99/99/9999';
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
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'DataLiq';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_DataProtesto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'DataProtesto';
  Tipo              := tpData;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Dt Protesto';
  Mascara           := '99/99/9999';
  CaractereEdicao   := '_';
  Ajuda             := 'Data em que entrou em protesto';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 16;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 16;
  Index_Default     := 16;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'DataProtesto';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_Recebimento.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Recebimento';
  Tipo              := tpData;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Recebimento';
  Mascara           := '99/99/9999';
  CaractereEdicao   := '_';
  Ajuda             := 'Informe a data de Recebimento do  montane da NF';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 17;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 17;
  Index_Default     := 17;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'Recebimento';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_VALORRECEBIDO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'VALORRECEBIDO';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 3;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Vl. Recebido';
  Mascara           := 'ZZZ.ZZZ.ZZ9,999';
  CaractereEdicao   := '_';
  Ajuda             := 'Informe o Valor Recebido da nota fiscal';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 18;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 18;
  Index_Default     := 18;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'VALORRECEBIDO';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_RAZAO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'RAZAO';
  Tipo              := tpAlfanumerico;
  Tamanho           := 50;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Razão Social';
  Mascara           := 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  CaractereEdicao   := ' ';
  Ajuda             := 'Razão Social';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 13;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 13;
  Index_Default     := 13;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'Fornecedores';
  NomeOriginal      := 'RAZAO';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_NOME.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'NOME';
  Tipo              := tpAlfanumerico;
  Tamanho           := 48;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Nome Pais';
  Mascara           := 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  CaractereEdicao   := ' ';
  Ajuda             := 'Data do Compromisso / Lembrete';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 19;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 19;
  Index_Default     := 19;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'Tab_pais';
  NomeOriginal      := 'NOME';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_TEXTO_PADRAO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'TEXTO_PADRAO';
  Tipo              := tpMemo;
  Tamanho           := 60;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Texto Contrato';
  Mascara           := '';
  CaractereEdicao   := ' ';
  Ajuda             := 'Texto padrão Fatura';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 24;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 24;
  Index_Default     := 24;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'TEXTO_PADRAO';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_Usuario.Create(AOwner: TComponent);
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
  Valor.Index       := 25;
  Valor.Visible     := False;
  Visible_Default   := False;
  Chave             := False;
  Index             := 25;
  Index_Default     := 25;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= True;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'Usuario';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDOrdemCobranca_Usuario.ValorPadrao: String;
begin
  Result := Sistema.Usuario;
end;

function TDOrdemCobranca_Usuario.PreValidacao: Boolean;
begin
  Result := Sistema.Master;
end;

constructor TDOrdemCobranca_ID.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'ID';
  Tipo              := tpAlfanumerico;
  Tamanho           := 5;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'ID';
  Mascara           := '999999999';
  CaractereEdicao   := '_';
  Ajuda             := 'Cód. Pais';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 28;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 28;
  Index_Default     := 28;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'Fornecedores';
  NomeOriginal      := 'ID';
  TabEstrangeira    := 'Tab_pais';
  ChaveEstrangeira  := 'ID';
  CamposVisuais     := 'NOME';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobranca_TextoDsconto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'TextoDsconto';
  Tipo              := tpAlfanumerico;
  Tamanho           := 60;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'T. Desconto';
  Mascara           := '';
  CaractereEdicao   := ' ';
  Ajuda             := 'Testo de Linha de Desconto';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 27;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 27;
  Index_Default     := 27;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobranca';
  NomeOriginal      := 'TextoDsconto';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDOrdemCobranca_TextoDsconto.ValorPadrao: String;
begin
  Result := 'Desconto';
end;

end.
