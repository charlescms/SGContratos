unit AtrL0011;

interface

uses SysUtils, Classes, Graphics, DB, DBTables, Publicas,
  Rotinas, Validar, Atributo, Estrutur, Controls;

Type
  TDOrdemCobrancaProdExp_NumOrdCobranca = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_Contrato = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_Seq = class(TTipoInteiro)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_Navio = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_DataEmbarque = class(TTipoData)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_QuantidadeExp = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_Fatura = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_StDocumento = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Valores válidos }
    procedure IncluiValoresValidos; override;
  end;

Type
  TDOrdemCobrancaProdExp_Cadastro = class(TTipoData)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_ETADestino = class(TTipoData)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_FormPago = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_PrecoFOB = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_DataOrdCobranca = class(TTipoData)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_Rate = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_Status = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Valores válidos }
    procedure IncluiValoresValidos; override;
  end;

Type
  TDOrdemCobrancaProdExp_OBS = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_Comentario = class(TTipoMemo)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_DataLiq = class(TTipoData)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_NomeMix = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_Comissao = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_VALOR_EX = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_VALORDESCONTO_EX = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_COMISAOSFATURA_EX = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_VALORCONVERTIDO_EX = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_Valor = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: Double; override;
  end;

Type
  TDOrdemCobrancaProdExp_ValorDesconto = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: Double; override;
  end;

Type
  TDOrdemCobrancaProdExp_MOEDACOMISSAO = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Valores válidos }
    procedure IncluiValoresValidos; override;
  end;

Type
  TDOrdemCobrancaProdExp_TAXACONVERCAO = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDOrdemCobrancaProdExp_COMISAOSFATURA = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: Double; override;
  end;

Type
  TDOrdemCobrancaProdExp_VALORCONVERTIDO = class(TTipoFracionario)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: Double; override;
  end;

Type
  TDOrdemCobrancaProdExp_Usuario = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: String; override;
    { Pre-Validação }
    function PreValidacao: Boolean; override;
  end;


implementation

uses Abertura;

constructor TDOrdemCobrancaProdExp_NumOrdCobranca.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'NumOrdCobranca';
  Tipo              := tpAlfanumerico;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Número Ordem Cobrança';
  Mascara           := '9999/9999';
  CaractereEdicao   := '_';
  Ajuda             := 'Informe o número da Ordem Cobrança';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 0;
  Valor.Visible     := False;
  Visible_Default   := False;
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
  NomeTabela        := 'OrdemCobrancaProdExp';
  NomeOriginal      := 'NumOrdCobranca';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_Contrato.Create(AOwner: TComponent);
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
  Valor.Index       := 1;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := True;
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
  NomeTabela        := 'OrdemCobrancaProdExp';
  NomeOriginal      := 'Contrato';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_Seq.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Seq';
  Tipo              := tpInteiro;
  Tamanho           := 2;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Seq.';
  Mascara           := '99';
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
  Chave             := True;
  Index             := 10;
  Index_Default     := 10;
  AutoIncremento    := 1;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobrancaProdExp';
  NomeOriginal      := 'Seq';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_Navio.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Navio';
  Tipo              := tpAlfanumerico;
  Tamanho           := 15;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Navio';
  Mascara           := 'XXXXXXXXXXXXXXX';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 11;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 11;
  Index_Default     := 11;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'Navio';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_DataEmbarque.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'DataEmbarque';
  Tipo              := tpData;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Data Embarque';
  Mascara           := '99/99/9999';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 12;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 12;
  Index_Default     := 12;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'DataEmbarque';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_QuantidadeExp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'QuantidadeExp';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 3;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Quantidade';
  Mascara           := 'ZZZ.ZZZ.ZZ9,999';
  CaractereEdicao   := '_';
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
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'QuantidadeExp';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_Fatura.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Fatura';
  Tipo              := tpAlfanumerico;
  Tamanho           := 20;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Número Fatura';
  Mascara           := '';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 2;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 2;
  Index_Default     := 2;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'Fatura';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_StDocumento.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'StDocumento';
  Tipo              := tpAlfanumerico;
  Tamanho           := 1;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Status Contrato';
  Mascara           := 'X';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 17;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 17;
  Index_Default     := 17;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'StDocumento';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

procedure TDOrdemCobrancaProdExp_StDocumento.IncluiValoresValidos;
begin
  inherited IncluiValoresValidos;
  IncluiValorValido('P', 'Presente');
  IncluiValorValido('N', 'Não Presente');
  Valor.OnGetText := GetText;
end;

constructor TDOrdemCobrancaProdExp_Cadastro.Create(AOwner: TComponent);
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
  Valor.Index       := 22;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 22;
  Index_Default     := 22;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'Cadastro';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_ETADestino.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'ETADestino';
  Tipo              := tpData;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'ETA Destino';
  Mascara           := '99/99/9999';
  CaractereEdicao   := '_';
  Ajuda             := '';
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
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'ETADestino';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_FormPago.Create(AOwner: TComponent);
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
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'FormPago';
  TabEstrangeira    := 'TbFormaPagamento';
  ChaveEstrangeira  := 'FormPago';
  CamposVisuais     := 'FormPago';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_PrecoFOB.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'PrecoFOB';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Preço FOB Exp';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 16;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 16;
  Index_Default     := 16;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'PrecoFOB';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_DataOrdCobranca.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'DataOrdCobranca';
  Tipo              := tpData;
  Tamanho           := 8;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Data Ord. Cobrança';
  Mascara           := '99/99/9999';
  CaractereEdicao   := '_';
  Ajuda             := 'Data em que a Ord. Cobrança foi gerada';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 3;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 3;
  Index_Default     := 3;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'DataOrdCobranca';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_Rate.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Rate';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 6;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Rate';
  Mascara           := 'ZZZ.ZZ9,999999';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 20;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 20;
  Index_Default     := 20;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'Rate';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_Status.Create(AOwner: TComponent);
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
  Valor.Index       := 4;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 4;
  Index_Default     := 4;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'Status';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

procedure TDOrdemCobrancaProdExp_Status.IncluiValoresValidos;
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

constructor TDOrdemCobrancaProdExp_OBS.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'OBS';
  Tipo              := tpAlfanumerico;
  Tamanho           := 15;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Obsevação';
  Mascara           := 'XXXXXXXXXXXXXXX';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 18;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 18;
  Index_Default     := 18;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'OBS';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_Comentario.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'Comentario';
  Tipo              := tpMemo;
  Tamanho           := 50;
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
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'Comentario';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_DataLiq.Create(AOwner: TComponent);
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
  Valor.Index       := 21;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 21;
  Index_Default     := 21;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'DataLiq';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_NomeMix.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'NomeMix';
  Tipo              := tpAlfanumerico;
  Tamanho           := 30;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Nome Mix';
  Mascara           := 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
  CaractereEdicao   := ' ';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 23;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 23;
  Index_Default     := 23;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 2;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ContratoTransporte';
  NomeOriginal      := 'NomeMix';
  TabEstrangeira    := 'Produtos';
  ChaveEstrangeira  := 'Produto';
  CamposVisuais     := 'Produto';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_Comissao.Create(AOwner: TComponent);
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
  Valor.Index       := 24;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 24;
  Index_Default     := 24;
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

constructor TDOrdemCobrancaProdExp_VALOR_EX.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'VALOR_EX';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 3;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Valor Fatura Exp.';
  Mascara           := 'ZZZ.ZZZ.ZZ9,999';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 26;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 26;
  Index_Default     := 26;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'Valor';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_VALORDESCONTO_EX.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'VALORDESCONTO_EX';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Desconto';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 27;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 27;
  Index_Default     := 27;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'ValorDesconto';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_COMISAOSFATURA_EX.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'COMISAOSFATURA_EX';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Comisão s/Fatura';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := True;
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
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'ComisaoSFatura';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_VALORCONVERTIDO_EX.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'VALORCONVERTIDO_EX';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Valor Convertido';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := True;
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 29;
  Valor.ReadOnly    := True;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 29;
  Index_Default     := 29;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := True;
  NomeTabela        := 'ExportadoTransito';
  NomeOriginal      := 'ValorConvertido';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_Valor.Create(AOwner: TComponent);
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
  NomeTabela        := 'OrdemCobrancaProdExp';
  NomeOriginal      := 'Valor';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDOrdemCobrancaProdExp_Valor.ValorPadrao: Double;
begin
  Result := 0;
end;

constructor TDOrdemCobrancaProdExp_ValorDesconto.Create(AOwner: TComponent);
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
  Calculado_F       := False;
  Valor.FieldName   := Nome;
  Valor.Size        := TamanhoDado;
  Valor.DisplayLabel:= Titulo;
  Valor.Calculated  := Calculado;
  Valor.Index       := 25;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 25;
  Index_Default     := 25;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobrancaProdExp';
  NomeOriginal      := 'ValorDesconto';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDOrdemCobrancaProdExp_ValorDesconto.ValorPadrao: Double;
begin
  Result := 0;
end;

constructor TDOrdemCobrancaProdExp_MOEDACOMISSAO.Create(AOwner: TComponent);
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
  Valor.Index       := 5;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 5;
  Index_Default     := 5;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobrancaProdExp';
  NomeOriginal      := 'MOEDACOMISSAO';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

procedure TDOrdemCobrancaProdExp_MOEDACOMISSAO.IncluiValoresValidos;
begin
  inherited IncluiValoresValidos;
  IncluiValorValido('', '');
  IncluiValorValido('R$ ', 'Real');
  IncluiValorValido('USR', 'Dolar');
  IncluiValorValido('EUR', 'Euro');
  Valor.OnGetText := GetText;
end;

constructor TDOrdemCobrancaProdExp_TAXACONVERCAO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'TAXACONVERCAO';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 11;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Taxa';
  Mascara           := 'ZZ9,99999999999';
  CaractereEdicao   := '_';
  Ajuda             := 'Taxa de Converção';
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
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobrancaProdExp';
  NomeOriginal      := 'TAXACONVERCAO';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDOrdemCobrancaProdExp_COMISAOSFATURA.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'COMISAOSFATURA';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Comisão s/Fatura';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
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
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobrancaProdExp';
  NomeOriginal      := 'COMISAOSFATURA';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDOrdemCobrancaProdExp_COMISAOSFATURA.ValorPadrao: Double;
begin
  Result := 0;
end;

constructor TDOrdemCobrancaProdExp_VALORCONVERTIDO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'VALORCONVERTIDO';
  Tipo              := tpFracionario;
  Tamanho           := 12;
  CasasDecimais     := 2;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Valor Convertido';
  Mascara           := 'Z.ZZZ.ZZZ.ZZ9,99';
  CaractereEdicao   := '_';
  Ajuda             := '';
  Calculado         := False;
  Calculado_F       := True;
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
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobrancaProdExp';
  NomeOriginal      := 'VALORCONVERTIDO';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDOrdemCobrancaProdExp_VALORCONVERTIDO.ValorPadrao: Double;
begin
  Result := 0;
end;

constructor TDOrdemCobrancaProdExp_Usuario.Create(AOwner: TComponent);
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
  Valor.Index       := 30;
  Valor.Visible     := True;
  Visible_Default   := True;
  Chave             := False;
  Index             := 30;
  Index_Default     := 30;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= True;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'OrdemCobrancaProdExp';
  NomeOriginal      := 'Usuario';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDOrdemCobrancaProdExp_Usuario.ValorPadrao: String;
begin
  Result := Sistema.Usuario;
end;

function TDOrdemCobrancaProdExp_Usuario.PreValidacao: Boolean;
begin
  Result := Sistema.Master;
end;

end.
