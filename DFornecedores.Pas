{
 Classe da tabela: Fornecedores - Exportador
}

unit DFornecedores;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0007,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDFornecedores = class(TTabela)
  public
    FORCOD: TDFornecedores_FORCOD;
    DATCAD: TDFornecedores_DATCAD;
    RAZAO: TDFornecedores_RAZAO;
    NOMCON: TDFornecedores_NOMCON;
    TIPPESSOA: TDFornecedores_TIPPESSOA;
    CNPJ: TDFornecedores_CNPJ;
    CPF: TDFornecedores_CPF;
    IEST: TDFornecedores_IEST;
    IMUN: TDFornecedores_IMUN;
    CDPAIS: TDFornecedores_CDPAIS;
    DDD: TDFornecedores_DDD;
    TEL1: TDFornecedores_TEL1;
    TEL2: TDFornecedores_TEL2;
    FAX: TDFornecedores_FAX;
    ENDERECO: TDFornecedores_ENDERECO;
    BAI: TDFornecedores_BAI;
    CEP: TDFornecedores_CEP;
    CID: TDFornecedores_CID;
    UF: TDFornecedores_UF;
    EMAIL1: TDFornecedores_EMAIL1;
    EMAIL2: TDFornecedores_EMAIL2;
    SITE: TDFornecedores_SITE;
    TBATIVCOD: TDFornecedores_TBATIVCOD;
    OBS: TDFornecedores_OBS;
    ID: TDFornecedores_ID;
    NOME: TDFornecedores_NOME;
    MOEDACOMISSAO: TDFornecedores_MOEDACOMISSAO;
    Usuario: TDFornecedores_Usuario;
    constructor Create(AOwner: TComponent); override;
    procedure CriaForeignKeys; override;
    function PodeExcluir: Boolean; override;
    procedure ExclusaoCascata; override;
    function PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean; overload; override;
    function PesquisaRelacionados(Tabela: String): Boolean; overload; override;
    procedure CalculaCampos; override;
    procedure Parametros(Tabela: TTabela); override;
    procedure AtribuiRelacionamentos(Atribui: Boolean = True); override;
    procedure AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True); override;
    procedure AtribuiMestre(DataSet: TDataSet); override;
    procedure ProcessoDireto1(DataSet: TDataSet);
    procedure ProcessoDireto2(DataSet: TDataSet);
    procedure AtualizaCalculados(DataSet: TDataSet);
    procedure ProcessoInverso1(DataSet: TDataSet);
    procedure ProcessoInverso2(DataSet: TDataSet);
  end;

implementation

uses Publicas, Validar, Rotinas, Abertura, Calculos, RotinaEd;

constructor TDFornecedores.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'Fornecedores';
  Titulo           := 'Exportador';
  Name             := 'DFornecedores';
  Database         := BaseDados.BD_Base_Dados;
  {$IFDEF IBX}
  Transaction      := BaseDados.TRS_BD_Base_Dados;
  UpdateSql        := TIBUpdateSQL.Create(AOwner);
  {$ELSE}
  RequestLive      := True;
  AutoRefresh      := True;
  CachedUpdates    := True;
  UpdateSql        := TXSQLUpdateSQL.Create(AOwner);
  DatabaseName     := BaseDados.BD_Base_Dados.DatabaseName;
  {$ENDIF}
  Local            := False;
  Open_begin       := False;
  Versao           := 6;
  UsarGenerator    := True;
  TableType        := ttTable;
  DataSource.Name  := 'DsFornecedores';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Fornecedores';
    // Exclusão de Registro
    DeleteSQL.Add('delete from Fornecedores');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  FORCOD = :OLD_FORCOD');
    // Inserção de Registro
    InsertSQL.Add('insert into Fornecedores');
    InsertSQL.Add('  (');
    InsertSQL.Add('  FORCOD,');
    InsertSQL.Add('  DATCAD,');
    InsertSQL.Add('  RAZAO,');
    InsertSQL.Add('  NOMCON,');
    InsertSQL.Add('  TIPPESSOA,');
    InsertSQL.Add('  CNPJ,');
    InsertSQL.Add('  CPF,');
    InsertSQL.Add('  IEST,');
    InsertSQL.Add('  IMUN,');
    InsertSQL.Add('  CDPAIS,');
    InsertSQL.Add('  DDD,');
    InsertSQL.Add('  TEL1,');
    InsertSQL.Add('  TEL2,');
    InsertSQL.Add('  FAX,');
    InsertSQL.Add('  ENDERECO,');
    InsertSQL.Add('  BAI,');
    InsertSQL.Add('  CEP,');
    InsertSQL.Add('  CID,');
    InsertSQL.Add('  UF,');
    InsertSQL.Add('  EMAIL1,');
    InsertSQL.Add('  EMAIL2,');
    InsertSQL.Add('  SITE,');
    InsertSQL.Add('  TBATIVCOD,');
    InsertSQL.Add('  OBS,');
    InsertSQL.Add('  ID,');
    InsertSQL.Add('  MOEDACOMISSAO,');
    InsertSQL.Add('  Usuario');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :FORCOD,');
    InsertSQL.Add('  :DATCAD,');
    InsertSQL.Add('  :RAZAO,');
    InsertSQL.Add('  :NOMCON,');
    InsertSQL.Add('  :TIPPESSOA,');
    InsertSQL.Add('  :CNPJ,');
    InsertSQL.Add('  :CPF,');
    InsertSQL.Add('  :IEST,');
    InsertSQL.Add('  :IMUN,');
    InsertSQL.Add('  :CDPAIS,');
    InsertSQL.Add('  :DDD,');
    InsertSQL.Add('  :TEL1,');
    InsertSQL.Add('  :TEL2,');
    InsertSQL.Add('  :FAX,');
    InsertSQL.Add('  :ENDERECO,');
    InsertSQL.Add('  :BAI,');
    InsertSQL.Add('  :CEP,');
    InsertSQL.Add('  :CID,');
    InsertSQL.Add('  :UF,');
    InsertSQL.Add('  :EMAIL1,');
    InsertSQL.Add('  :EMAIL2,');
    InsertSQL.Add('  :SITE,');
    InsertSQL.Add('  :TBATIVCOD,');
    InsertSQL.Add('  :OBS,');
    InsertSQL.Add('  :ID,');
    InsertSQL.Add('  :MOEDACOMISSAO,');
    InsertSQL.Add('  :Usuario');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update Fornecedores');
    ModifySQL.Add('set');
    ModifySQL.Add('  FORCOD = :FORCOD,');
    ModifySQL.Add('  DATCAD = :DATCAD,');
    ModifySQL.Add('  RAZAO = :RAZAO,');
    ModifySQL.Add('  NOMCON = :NOMCON,');
    ModifySQL.Add('  TIPPESSOA = :TIPPESSOA,');
    ModifySQL.Add('  CNPJ = :CNPJ,');
    ModifySQL.Add('  CPF = :CPF,');
    ModifySQL.Add('  IEST = :IEST,');
    ModifySQL.Add('  IMUN = :IMUN,');
    ModifySQL.Add('  CDPAIS = :CDPAIS,');
    ModifySQL.Add('  DDD = :DDD,');
    ModifySQL.Add('  TEL1 = :TEL1,');
    ModifySQL.Add('  TEL2 = :TEL2,');
    ModifySQL.Add('  FAX = :FAX,');
    ModifySQL.Add('  ENDERECO = :ENDERECO,');
    ModifySQL.Add('  BAI = :BAI,');
    ModifySQL.Add('  CEP = :CEP,');
    ModifySQL.Add('  CID = :CID,');
    ModifySQL.Add('  UF = :UF,');
    ModifySQL.Add('  EMAIL1 = :EMAIL1,');
    ModifySQL.Add('  EMAIL2 = :EMAIL2,');
    ModifySQL.Add('  SITE = :SITE,');
    ModifySQL.Add('  TBATIVCOD = :TBATIVCOD,');
    ModifySQL.Add('  OBS = :OBS,');
    ModifySQL.Add('  ID = :ID,');
    ModifySQL.Add('  MOEDACOMISSAO = :MOEDACOMISSAO,');
    ModifySQL.Add('  Usuario = :Usuario');
    ModifySQL.Add('where');
    ModifySQL.Add('  FORCOD = :OLD_FORCOD');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  Fornecedores.FORCOD AS FORCOD,');
    RefreshSQL.Add('  Fornecedores.DATCAD AS DATCAD,');
    RefreshSQL.Add('  Fornecedores.RAZAO AS RAZAO,');
    RefreshSQL.Add('  Fornecedores.NOMCON AS NOMCON,');
    RefreshSQL.Add('  Fornecedores.TIPPESSOA AS TIPPESSOA,');
    RefreshSQL.Add('  Fornecedores.CNPJ AS CNPJ,');
    RefreshSQL.Add('  Fornecedores.CPF AS CPF,');
    RefreshSQL.Add('  Fornecedores.IEST AS IEST,');
    RefreshSQL.Add('  Fornecedores.IMUN AS IMUN,');
    RefreshSQL.Add('  Fornecedores.CDPAIS AS CDPAIS,');
    RefreshSQL.Add('  Fornecedores.DDD AS DDD,');
    RefreshSQL.Add('  Fornecedores.TEL1 AS TEL1,');
    RefreshSQL.Add('  Fornecedores.TEL2 AS TEL2,');
    RefreshSQL.Add('  Fornecedores.FAX AS FAX,');
    RefreshSQL.Add('  Fornecedores.ENDERECO AS ENDERECO,');
    RefreshSQL.Add('  Fornecedores.BAI AS BAI,');
    RefreshSQL.Add('  Fornecedores.CEP AS CEP,');
    RefreshSQL.Add('  Fornecedores.CID AS CID,');
    RefreshSQL.Add('  Fornecedores.UF AS UF,');
    RefreshSQL.Add('  Fornecedores.EMAIL1 AS EMAIL1,');
    RefreshSQL.Add('  Fornecedores.EMAIL2 AS EMAIL2,');
    RefreshSQL.Add('  Fornecedores.SITE AS SITE,');
    RefreshSQL.Add('  Fornecedores.TBATIVCOD AS TBATIVCOD,');
    RefreshSQL.Add('  Fornecedores.OBS AS OBS,');
    RefreshSQL.Add('  Fornecedores.ID AS ID,');
    RefreshSQL.Add('  TAB_PAIS.NOME AS NOME,');
    RefreshSQL.Add('  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,');
    RefreshSQL.Add('  Fornecedores.Usuario AS Usuario');
    RefreshSQL.Add('from Fornecedores');
    RefreshSQL.Add('Left Outer Join TbAtividades on');
    RefreshSQL.Add('  Fornecedores.TBATIVCOD = TbAtividades.TBATIVCOD');
    RefreshSQL.Add('Left Outer Join TAB_PAIS on');
    RefreshSQL.Add('  Fornecedores.ID = TAB_PAIS.ID');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  Fornecedores.FORCOD = :OLD_FORCOD');
  end;
  TabelasExtras.Add('TbAtividades');
  TabelasExtras.Add('TAB_PAIS');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  Fornecedores.FORCOD AS FORCOD,');
  SqlPrincipal.Add('  Fornecedores.DATCAD AS DATCAD,');
  SqlPrincipal.Add('  Fornecedores.RAZAO AS RAZAO,');
  SqlPrincipal.Add('  Fornecedores.NOMCON AS NOMCON,');
  SqlPrincipal.Add('  Fornecedores.TIPPESSOA AS TIPPESSOA,');
  SqlPrincipal.Add('  Fornecedores.CNPJ AS CNPJ,');
  SqlPrincipal.Add('  Fornecedores.CPF AS CPF,');
  SqlPrincipal.Add('  Fornecedores.IEST AS IEST,');
  SqlPrincipal.Add('  Fornecedores.IMUN AS IMUN,');
  SqlPrincipal.Add('  Fornecedores.CDPAIS AS CDPAIS,');
  SqlPrincipal.Add('  Fornecedores.DDD AS DDD,');
  SqlPrincipal.Add('  Fornecedores.TEL1 AS TEL1,');
  SqlPrincipal.Add('  Fornecedores.TEL2 AS TEL2,');
  SqlPrincipal.Add('  Fornecedores.FAX AS FAX,');
  SqlPrincipal.Add('  Fornecedores.ENDERECO AS ENDERECO,');
  SqlPrincipal.Add('  Fornecedores.BAI AS BAI,');
  SqlPrincipal.Add('  Fornecedores.CEP AS CEP,');
  SqlPrincipal.Add('  Fornecedores.CID AS CID,');
  SqlPrincipal.Add('  Fornecedores.UF AS UF,');
  SqlPrincipal.Add('  Fornecedores.EMAIL1 AS EMAIL1,');
  SqlPrincipal.Add('  Fornecedores.EMAIL2 AS EMAIL2,');
  SqlPrincipal.Add('  Fornecedores.SITE AS SITE,');
  SqlPrincipal.Add('  Fornecedores.TBATIVCOD AS TBATIVCOD,');
  SqlPrincipal.Add('  Fornecedores.OBS AS OBS,');
  SqlPrincipal.Add('  Fornecedores.ID AS ID,');
  SqlPrincipal.Add('  TAB_PAIS.NOME AS NOME,');
  SqlPrincipal.Add('  Fornecedores.MOEDACOMISSAO AS MOEDACOMISSAO,');
  SqlPrincipal.Add('  Fornecedores.Usuario AS Usuario');
  SqlPrincipal.Add('from Fornecedores');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join TbAtividades on');
  FiltroExtra.Add('  Fornecedores.TBATIVCOD = TbAtividades.TBATIVCOD');
  FiltroExtra.Add('Left Outer Join TAB_PAIS on');
  FiltroExtra.Add('  Fornecedores.ID = TAB_PAIS.ID');
  Sql.Add('order by Fornecedores.FORCOD DESC');
  FORCOD := TDFornecedores_FORCOD.Create(AOwner);
  FORCOD.Valor.DataSet := Self;
  RAZAO := TDFornecedores_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  CDPAIS := TDFornecedores_CDPAIS.Create(AOwner);
  CDPAIS.Valor.DataSet := Self;
  DDD := TDFornecedores_DDD.Create(AOwner);
  DDD.Valor.DataSet := Self;
  TEL1 := TDFornecedores_TEL1.Create(AOwner);
  TEL1.Valor.DataSet := Self;
  CID := TDFornecedores_CID.Create(AOwner);
  CID.Valor.DataSet := Self;
  UF := TDFornecedores_UF.Create(AOwner);
  UF.Valor.DataSet := Self;
  CNPJ := TDFornecedores_CNPJ.Create(AOwner);
  CNPJ.Valor.DataSet := Self;
  TEL2 := TDFornecedores_TEL2.Create(AOwner);
  TEL2.Valor.DataSet := Self;
  CPF := TDFornecedores_CPF.Create(AOwner);
  CPF.Valor.DataSet := Self;
  IEST := TDFornecedores_IEST.Create(AOwner);
  IEST.Valor.DataSet := Self;
  IMUN := TDFornecedores_IMUN.Create(AOwner);
  IMUN.Valor.DataSet := Self;
  NOMCON := TDFornecedores_NOMCON.Create(AOwner);
  NOMCON.Valor.DataSet := Self;
  FAX := TDFornecedores_FAX.Create(AOwner);
  FAX.Valor.DataSet := Self;
  ENDERECO := TDFornecedores_ENDERECO.Create(AOwner);
  ENDERECO.Valor.DataSet := Self;
  BAI := TDFornecedores_BAI.Create(AOwner);
  BAI.Valor.DataSet := Self;
  CEP := TDFornecedores_CEP.Create(AOwner);
  CEP.Valor.DataSet := Self;
  EMAIL1 := TDFornecedores_EMAIL1.Create(AOwner);
  EMAIL1.Valor.DataSet := Self;
  EMAIL2 := TDFornecedores_EMAIL2.Create(AOwner);
  EMAIL2.Valor.DataSet := Self;
  SITE := TDFornecedores_SITE.Create(AOwner);
  SITE.Valor.DataSet := Self;
  OBS := TDFornecedores_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  DATCAD := TDFornecedores_DATCAD.Create(AOwner);
  DATCAD.Valor.DataSet := Self;
  TBATIVCOD := TDFornecedores_TBATIVCOD.Create(AOwner);
  TBATIVCOD.Valor.DataSet := Self;
  TIPPESSOA := TDFornecedores_TIPPESSOA.Create(AOwner);
  TIPPESSOA.Valor.DataSet := Self;
  ID := TDFornecedores_ID.Create(AOwner);
  ID.Valor.DataSet := Self;
  MOEDACOMISSAO := TDFornecedores_MOEDACOMISSAO.Create(AOwner);
  MOEDACOMISSAO.Valor.DataSet := Self;
  NOME := TDFornecedores_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  Usuario := TDFornecedores_Usuario.Create(AOwner);
  Usuario.Valor.DataSet := Self;
//CRIANDO CHAVE PRIMARIA 
  ChavePrimaria.Add(FORCOD);
//CRIANDO CAMPOS 
  Campos.Add(FORCOD);
  Campos.Add(DATCAD);
  Campos.Add(RAZAO);
  Campos.Add(NOMCON);
  Campos.Add(TIPPESSOA);
  Campos.Add(CNPJ);
  Campos.Add(CPF);
  Campos.Add(IEST);
  Campos.Add(IMUN);
  Campos.Add(CDPAIS);
  Campos.Add(DDD);
  Campos.Add(TEL1);
  Campos.Add(TEL2);
  Campos.Add(FAX);
  Campos.Add(ENDERECO);
  Campos.Add(BAI);
  Campos.Add(CEP);
  Campos.Add(CID);
  Campos.Add(UF);
  Campos.Add(EMAIL1);
  Campos.Add(EMAIL2);
  Campos.Add(SITE);
  Campos.Add(TBATIVCOD);
  Campos.Add(OBS);
  Campos.Add(ID);
  Campos.Add(NOME);
  Campos.Add(MOEDACOMISSAO);
  Campos.Add(Usuario);
  TituloIndices.Add('Código');
  Indices.Add('Fornecedores.FORCOD');
  Crescente.Add('S');
  TituloPrimaria := 'Código';
  ChPrimaria     := 'Fornecedores.FORCOD';
//CRIANDO TituloIndices 
  TituloIndices.Add('Por Razão Social');
  Indices.Add('RAZAO');
  Crescente.Add('S');
  TituloIndice   := 'Código';
  ChaveIndice    := 'Fornecedores.FORCOD DESC';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;
////////////////////////////////
//   CRIANDO PROCEDIMENTOS    //
////////////////////////////////

procedure TDFornecedores.CriaForeignKeys;
var
  Script_ForeignKeys: TSQLScript;
begin
  if ForeignKeys.Count > 0 then
  begin
    Script_ForeignKeys := TSQLScript.Create(Self);
    with Script_ForeignKeys do
    begin
      Database         := BaseDados.BD_Base_Dados;
      {$IFDEF IBX}
      Transaction      := BaseDados.TRS_BD_Base_Dados;
      with Script do
      {$ELSE}
      DatabaseName     := BaseDados.BD_Base_Dados.DatabaseName;
      with SQL do
      {$ENDIF}
      AddStrings(ForeignKeys);
      Executar;
      Free;
    end;
  end;
end;

function TDFornecedores.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDFornecedores.ExclusaoCascata;
begin
end;

function TDFornecedores.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TAB_PAIS') then
    if (UpperCase('ID') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DTAB_PAIS, ['ID'], [ID.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDFornecedores.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TAB_PAIS') then
    if PTabela(TabGlobal.DTAB_PAIS, ['ID'], [ID.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('TbAtividades') then
    if PTabela(TabGlobal.DTbAtividades, ['TBATIVCOD'], [TBATIVCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Fornecedores') then
    if PTabela(TabGlobal.DFornecedores, ['FORCOD'], [FORCOD.Valor.Value]) then
      Result := True;
end;

procedure TDFornecedores.CalculaCampos;
begin
end;

procedure TDFornecedores.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
end;

procedure TDFornecedores.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
var
  I: Integer;
begin
  Filtro.Clear;
  FiltroRelac.Clear;
  if Atribui then
  begin
  end
  else
    for I:=0 to Campos.Count-1 do
      TAtributo(Campos[I]).Valor.OnValidate := nil;
  if Atualiza then
    AtualizaSql;
end;

procedure TDFornecedores.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDFornecedores.ProcessoDireto1(DataSet: TDataSet);
var
  QueryLc: TTabela;
  EmEdicao: Boolean;
begin
  {$IFDEF IBX}
  Transaction.CommitRetaining;
  {$ELSE}
  {$ENDIF}
  Inclusao    := False;
  Modificacao := False;
end;

procedure TDFornecedores.ProcessoDireto2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  {$IFDEF IBX}
  Transaction.CommitRetaining;
  {$ELSE}
  {$ENDIF}
  Inclusao    := False;
  Modificacao := False;
end;

procedure TDFornecedores.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (FORCOD.SempreAtribui) and (FORCOD.AutoIncremento > 0) then
      AutoIncremento('FORCOD', True, FORCOD.AutoIncremento);
end;

procedure TDFornecedores.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDFornecedores.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDFornecedores.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
