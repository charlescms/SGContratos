unit AtrL0014;

interface

uses SysUtils, Classes, Graphics, DB, DBTables, Publicas,
  Rotinas, Validar, Atributo, Estrutur, Controls;

Type
  TDProdutoContratoT_Contrato = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDProdutoContratoT_Sequencia = class(TTipoInteiro)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDProdutoContratoT_Produto = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Validação }
    function Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean; override;
  end;

Type
  TDProdutoContratoT_FormPago = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Validação }
    function Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean; override;
  end;

Type
  TDProdutoContratoT_CodTbPorto = class(TTipoInteiro)
  public
    constructor Create(AOwner: TComponent); override;
    { Validação }
    function Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean; override;
  end;

Type
  TDProdutoContratoT_NomePorto = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDProdutoContratoT_PrecoFOB = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDProdutoContratoT_PrecoSCC = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDProdutoContratoT_Quantidade = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: Double; override;
  end;

Type
  TDProdutoContratoT_ValorSCC = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDProdutoContratoT_ComisaoSFatura = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDProdutoContratoT_OBS = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDProdutoContratoT_Complemento = class(TTipoMemo)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDProdutoContratoT_Cadastro = class(TTipoData)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: TDateTime; override;
  end;

Type
  TDProdutoContratoT_FormComissao = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Valores válidos }
    procedure IncluiValoresValidos; override;
  end;

Type
  TDProdutoContratoT_Comissao = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDProdutoContratoT_Usuario = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: String; override;
    { Pre-Validação }
    function PreValidacao: Boolean; override;
  end;


implementation

uses Abertura;

constructor TDProdutoContratoT_Contrato.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Contrato';
  Tipo              := tpAlfanumerico;
  Tamanho           := 15;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Contrato';
  Mascara           := 'XXXXXXXXXXXXXXX';
  CaractereEdicao   := ' ';
  Ajuda             := '';
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
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'Contrato';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDProdutoContratoT_Sequencia.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Sequencia';
  Tipo              := tpInteiro;
  Tamanho           := 3;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Seq.';
  Mascara           := '99999999';
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
  Chave             := True;
  Index             := 1;
  Index_Default     := 1;
  AutoIncremento    := 1;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'Sequencia';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDProdutoContratoT_Produto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Produto';
  Tipo              := tpAlfanumerico;
  Tamanho           := 30;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Produto';
  Mascara           := 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  CaractereEdicao   := ' ';
  Ajuda             := 'Informe o produto';
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
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'Produto';
  TabEstrangeira    := 'Produtos';
  ChaveEstrangeira  := 'Produto';
  CamposVisuais     := 'Produto';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDProdutoContratoT_Produto.Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean;
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
      MsgErro := Format('Produto inválido !',[Titulo])
    else
      MsgErro := Format(MensagemErro,[Titulo]);
    exit;
  end;
  if not TabGlobal.DProdutoContratoT.PesquisaRelacionados('Produtos') then
  begin
    Result  := False;
    if Trim(MensagemErro) = '' then
      MsgErro := Format('Produto não encontrado !',[Titulo])
    else
      MsgErro := Format(MensagemErro,[Titulo]);
    exit;
  end;
  Result  := True;
  MsgErro := '';
end;

constructor TDProdutoContratoT_FormPago.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'FormPago';
  Tipo              := tpAlfanumerico;
  Tamanho           := 10;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Forma Pagamento';
  Mascara           := 'XXXXXXXXXX';
  CaractereEdicao   := ' ';
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
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'FormPago';
  TabEstrangeira    := 'TbFormaPagamento';
  ChaveEstrangeira  := 'FormPago';
  CamposVisuais     := 'FormPago';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDProdutoContratoT_FormPago.Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean;
begin
  if EmSaida then
  begin
    Result := True;
    exit;
  end;
  if not TabGlobal.DProdutoContratoT.PesquisaRelacionados('TbFormaPagamento') then
  begin
    Result  := False;
    if Trim(MensagemErro) = '' then
      MsgErro := Format('Forma Pagamento não encontrado !',[Titulo])
    else
      MsgErro := Format(MensagemErro,[Titulo]);
    exit;
  end;
  Result  := True;
  MsgErro := '';
end;

constructor TDProdutoContratoT_CodTbPorto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'CodTbPorto';
  Tipo              := tpInteiro;
  Tamanho           := 2;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Porto Destino';
  Mascara           := '';
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
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'CodTbPorto';
  TabEstrangeira    := 'TbPorto';
  ChaveEstrangeira  := 'CodTbPorto';
  CamposVisuais     := 'NomePorto;CodTbPorto';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDProdutoContratoT_CodTbPorto.Valido(var MsgErro : String; EmSaida: Boolean = True): Boolean;
begin
  if EmSaida then
  begin
    Result := True;
    exit;
  end;
  if not TabGlobal.DProdutoContratoT.PesquisaRelacionados('TbPorto') then
  begin
    Result  := False;
    if Trim(MensagemErro) = '' then
      MsgErro := Format('Porto Destino não encontrado !',[Titulo])
    else
      MsgErro := Format(MensagemErro,[Titulo]);
    exit;
  end;
  Result  := True;
  MsgErro := '';
end;

constructor TDProdutoContratoT_NomePorto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'NomePorto';
  Tipo              := tpAlfanumerico;
  Tamanho           := 30;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Nome Porto';
  Mascara           := 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 10;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 10;
  Index_Default     := 10;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'TbPorto';
  NomeOriginal      := 'NomePorto';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDProdutoContratoT_PrecoFOB.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'PrecoFOB';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Preço FOB';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := '';
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
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'PrecoFOB';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDProdutoContratoT_PrecoSCC.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'PrecoSCC';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Preço SCC';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
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
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'PrecoSCC';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDProdutoContratoT_Quantidade.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Quantidade';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 3;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Quant. TM';
  Mascara           := 'ZZZ.ZZZ.ZZ9,999';
  CaractereEdicao   := '_';
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
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'Quantidade';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDProdutoContratoT_Quantidade.ValorPadrao: Double;
begin
  Result := 0;
end;

constructor TDProdutoContratoT_ValorSCC.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'ValorSCC';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Valor SCC';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := True;
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
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'ValorSCC';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDProdutoContratoT_ComisaoSFatura.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'ComisaoSFatura';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Comisão Prevista';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := '';
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
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'ComisaoSFatura';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDProdutoContratoT_OBS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'OBS';
  Tipo              := tpAlfanumerico;
  Tamanho           := 30;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Observação';
  Mascara           := 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 13;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 13;
  Index_Default     := 13;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'OBS';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDProdutoContratoT_Complemento.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Complemento';
  Tipo              := tpMemo;
  Tamanho           := 50;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Complemento';
  Mascara           := '';
  CaractereEdicao   := ' ';
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
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'Complemento';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDProdutoContratoT_Cadastro.Create(AOwner: TComponent);
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
  Ajuda             := 'Data de Criação do Registro';
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
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'Cadastro';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDProdutoContratoT_Cadastro.ValorPadrao: TDateTime;
begin
  Result := DataAtual;
end;

constructor TDProdutoContratoT_FormComissao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'FormComissao';
  Tipo              := tpAlfanumerico;
  Tamanho           := 2;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Forma Comissão';
  Mascara           := 'XX';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 14;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 14;
  Index_Default     := 14;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ContratoTransporte';
  NomeOriginal      := 'FormComissao';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

procedure TDProdutoContratoT_FormComissao.IncluiValoresValidos;
begin
  inherited IncluiValoresValidos;
  IncluiValorValido('TM', 'Tonelada');
  IncluiValorValido('PO', 'Porcentagem');
  Valor.OnGetText := GetText;
end;

constructor TDProdutoContratoT_Comissao.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Comissao';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Comissão';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 15;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 15;
  Index_Default     := 15;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ContratoTransporte';
  NomeOriginal      := 'Comissao';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDProdutoContratoT_Usuario.Create(AOwner: TComponent);
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
  Valor.Index       := 16;
  Valor.Visible     := False;
  Visible_Default   := False;
  Chave             := False;
  Index             := 16;
  Index_Default     := 16;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= True;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'ProdutoContratoT';
  NomeOriginal      := 'Usuario';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDProdutoContratoT_Usuario.ValorPadrao: String;
begin
  Result := Sistema.Usuario;
end;

function TDProdutoContratoT_Usuario.PreValidacao: Boolean;
begin
  Result := Sistema.Master;
end;

end.
