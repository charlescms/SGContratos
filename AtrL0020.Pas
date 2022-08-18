unit AtrL0020;

interface

uses SysUtils, Classes, Graphics, DB, DBTables, Publicas,
  Rotinas, Validar, Atributo, Estrutur, Controls;

Type
  TDTbCategClientes_CATCLICOD = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDTbCategClientes_DESCRICAO = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
  end;

Type
  TDTbCategClientes_Usuario = class(TTipoAlfanumerico)
  public
    constructor Create(AOwner: TComponent); override;
    { Valor padrão }
    function ValorPadrao: String; override;
    { Pre-Validação }
    function PreValidacao: Boolean; override;
  end;


implementation

uses Abertura;

constructor TDTbCategClientes_CATCLICOD.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'CATCLICOD';
  Tipo              := tpAlfanumerico;
  Tamanho           := 3;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Cód Categoria';
  Mascara           := 'AAA';
  CaractereEdicao   := ' ';
  Ajuda             := 'Categoria do Cliente';
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
  SempreAtribui     := False;
  PreValidacao_ativa:= False;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'TbCategClientes';
  NomeOriginal      := 'CATCLICOD';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDTbCategClientes_DESCRICAO.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Nome              := 'DESCRICAO';
  Tipo              := tpAlfanumerico;
  Tamanho           := 30;
  CasasDecimais     := 0;
  TipoEdicao        := tpEdit;
  TipoSQL           := '';
  SQL_Extra         := '';
  Titulo            := 'Descrição';
  Mascara           := 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
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
  NomeTabela        := 'TbCategClientes';
  NomeOriginal      := 'DESCRICAO';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

constructor TDTbCategClientes_Usuario.Create(AOwner: TComponent);
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
  Valor.Index       := 2;
  Valor.Visible     := False;
  Visible_Default   := False;
  Chave             := False;
  Index             := 2;
  Index_Default     := 2;
  AutoIncremento    := 0;
  Incremento_Auto   := False;
  SempreAtribui     := True;
  PreValidacao_ativa:= True;
  Acao              := 1;
  LimparCampo       := False;
  MensagemErro      := '';
  Extra             := False;
  NomeTabela        := 'TbCategClientes';
  NomeOriginal      := 'Usuario';
  TabEstrangeira    := '';
  ChaveEstrangeira  := '';
  CamposVisuais     := '';
  EstiloPesquisa    := 0;
  AcaoPesquisa      := 0;
  FiltroFixo.Clear;
end;

function TDTbCategClientes_Usuario.ValorPadrao: String;
begin
  Result := Sistema.Usuario;
end;

function TDTbCategClientes_Usuario.PreValidacao: Boolean;
begin
  Result := Sistema.Master;
end;

end.
