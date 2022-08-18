{
 Classe da tabela: Clientes - Clientes
}

unit DClientes;

interface

{$I Princ.inc}

uses SysUtils, StdCtrls, Tabela, BaseD, classes, Atributo, Estrutur,
     AtrL0001,
     {$IFDEF IBX}
     IBDatabase, IBSQL, IB, IBQuery, IBUpdateSQL,
     {$ELSE}
     XSEngine,
     {$ENDIF}
     DB, Dialogs;

type
  TDClientes = class(TTabela)
  public
    CLICOD: TDClientes_CLICOD;
    RAZAO: TDClientes_RAZAO;
    NOMFAN: TDClientes_NOMFAN;
    NOMRES: TDClientes_NOMRES;
    CONTATO: TDClientes_CONTATO;
    TIPPESSOA: TDClientes_TIPPESSOA;
    CPF: TDClientes_CPF;
    RG: TDClientes_RG;
    CNPJ: TDClientes_CNPJ;
    IEST: TDClientes_IEST;
    IMUN: TDClientes_IMUN;
    DDD: TDClientes_DDD;
    TEL1: TDClientes_TEL1;
    TEL2: TDClientes_TEL2;
    FAX: TDClientes_FAX;
    ENDERECO: TDClientes_ENDERECO;
    BAI: TDClientes_BAI;
    CEP: TDClientes_CEP;
    CID: TDClientes_CID;
    UF: TDClientes_UF;
    DATCAD: TDClientes_DATCAD;
    EMAIL1: TDClientes_EMAIL1;
    EMAIL2: TDClientes_EMAIL2;
    SITE: TDClientes_SITE;
    ENDERECO_COB: TDClientes_ENDERECO_COB;
    BAI_COB: TDClientes_BAI_COB;
    CEP_COB: TDClientes_CEP_COB;
    CID_COB: TDClientes_CID_COB;
    UF_COB: TDClientes_UF_COB;
    SITCLICOD: TDClientes_SITCLICOD;
    CATCLICOD: TDClientes_CATCLICOD;
    TBATIVCOD: TDClientes_TBATIVCOD;
    LIMCRE: TDClientes_LIMCRE;
    LIMCREUSA: TDClientes_LIMCREUSA;
    OBS: TDClientes_OBS;
    ID: TDClientes_ID;
    NOME: TDClientes_NOME;
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

constructor TDClientes.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  NomeTabela       := 'Clientes';
  Titulo           := 'Clientes';
  Name             := 'DClientes';
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
  DataSource.Name  := 'DsClientes';
  with UpdateSql do
  begin
    Name           := 'UpdSql_Clientes';
    // Exclusão de Registro
    DeleteSQL.Add('delete from Clientes');
    DeleteSQL.Add('where');
    DeleteSQL.Add('  CLICOD = :OLD_CLICOD');
    // Inserção de Registro
    InsertSQL.Add('insert into Clientes');
    InsertSQL.Add('  (');
    InsertSQL.Add('  CLICOD,');
    InsertSQL.Add('  RAZAO,');
    InsertSQL.Add('  NOMFAN,');
    InsertSQL.Add('  NOMRES,');
    InsertSQL.Add('  CONTATO,');
    InsertSQL.Add('  TIPPESSOA,');
    InsertSQL.Add('  CPF,');
    InsertSQL.Add('  RG,');
    InsertSQL.Add('  CNPJ,');
    InsertSQL.Add('  IEST,');
    InsertSQL.Add('  IMUN,');
    InsertSQL.Add('  DDD,');
    InsertSQL.Add('  TEL1,');
    InsertSQL.Add('  TEL2,');
    InsertSQL.Add('  FAX,');
    InsertSQL.Add('  ENDERECO,');
    InsertSQL.Add('  BAI,');
    InsertSQL.Add('  CEP,');
    InsertSQL.Add('  CID,');
    InsertSQL.Add('  UF,');
    InsertSQL.Add('  DATCAD,');
    InsertSQL.Add('  EMAIL1,');
    InsertSQL.Add('  EMAIL2,');
    InsertSQL.Add('  SITE,');
    InsertSQL.Add('  ENDERECO_COB,');
    InsertSQL.Add('  BAI_COB,');
    InsertSQL.Add('  CEP_COB,');
    InsertSQL.Add('  CID_COB,');
    InsertSQL.Add('  UF_COB,');
    InsertSQL.Add('  SITCLICOD,');
    InsertSQL.Add('  CATCLICOD,');
    InsertSQL.Add('  TBATIVCOD,');
    InsertSQL.Add('  LIMCRE,');
    InsertSQL.Add('  LIMCREUSA,');
    InsertSQL.Add('  OBS,');
    InsertSQL.Add('  ID');
    InsertSQL.Add('  )');
    InsertSQL.Add('values');
    InsertSQL.Add('  (');
    InsertSQL.Add('  :CLICOD,');
    InsertSQL.Add('  :RAZAO,');
    InsertSQL.Add('  :NOMFAN,');
    InsertSQL.Add('  :NOMRES,');
    InsertSQL.Add('  :CONTATO,');
    InsertSQL.Add('  :TIPPESSOA,');
    InsertSQL.Add('  :CPF,');
    InsertSQL.Add('  :RG,');
    InsertSQL.Add('  :CNPJ,');
    InsertSQL.Add('  :IEST,');
    InsertSQL.Add('  :IMUN,');
    InsertSQL.Add('  :DDD,');
    InsertSQL.Add('  :TEL1,');
    InsertSQL.Add('  :TEL2,');
    InsertSQL.Add('  :FAX,');
    InsertSQL.Add('  :ENDERECO,');
    InsertSQL.Add('  :BAI,');
    InsertSQL.Add('  :CEP,');
    InsertSQL.Add('  :CID,');
    InsertSQL.Add('  :UF,');
    InsertSQL.Add('  :DATCAD,');
    InsertSQL.Add('  :EMAIL1,');
    InsertSQL.Add('  :EMAIL2,');
    InsertSQL.Add('  :SITE,');
    InsertSQL.Add('  :ENDERECO_COB,');
    InsertSQL.Add('  :BAI_COB,');
    InsertSQL.Add('  :CEP_COB,');
    InsertSQL.Add('  :CID_COB,');
    InsertSQL.Add('  :UF_COB,');
    InsertSQL.Add('  :SITCLICOD,');
    InsertSQL.Add('  :CATCLICOD,');
    InsertSQL.Add('  :TBATIVCOD,');
    InsertSQL.Add('  :LIMCRE,');
    InsertSQL.Add('  :LIMCREUSA,');
    InsertSQL.Add('  :OBS,');
    InsertSQL.Add('  :ID');
    InsertSQL.Add('  )');
    // Modificação de Registro
    ModifySQL.Add('update Clientes');
    ModifySQL.Add('set');
    ModifySQL.Add('  CLICOD = :CLICOD,');
    ModifySQL.Add('  RAZAO = :RAZAO,');
    ModifySQL.Add('  NOMFAN = :NOMFAN,');
    ModifySQL.Add('  NOMRES = :NOMRES,');
    ModifySQL.Add('  CONTATO = :CONTATO,');
    ModifySQL.Add('  TIPPESSOA = :TIPPESSOA,');
    ModifySQL.Add('  CPF = :CPF,');
    ModifySQL.Add('  RG = :RG,');
    ModifySQL.Add('  CNPJ = :CNPJ,');
    ModifySQL.Add('  IEST = :IEST,');
    ModifySQL.Add('  IMUN = :IMUN,');
    ModifySQL.Add('  DDD = :DDD,');
    ModifySQL.Add('  TEL1 = :TEL1,');
    ModifySQL.Add('  TEL2 = :TEL2,');
    ModifySQL.Add('  FAX = :FAX,');
    ModifySQL.Add('  ENDERECO = :ENDERECO,');
    ModifySQL.Add('  BAI = :BAI,');
    ModifySQL.Add('  CEP = :CEP,');
    ModifySQL.Add('  CID = :CID,');
    ModifySQL.Add('  UF = :UF,');
    ModifySQL.Add('  DATCAD = :DATCAD,');
    ModifySQL.Add('  EMAIL1 = :EMAIL1,');
    ModifySQL.Add('  EMAIL2 = :EMAIL2,');
    ModifySQL.Add('  SITE = :SITE,');
    ModifySQL.Add('  ENDERECO_COB = :ENDERECO_COB,');
    ModifySQL.Add('  BAI_COB = :BAI_COB,');
    ModifySQL.Add('  CEP_COB = :CEP_COB,');
    ModifySQL.Add('  CID_COB = :CID_COB,');
    ModifySQL.Add('  UF_COB = :UF_COB,');
    ModifySQL.Add('  SITCLICOD = :SITCLICOD,');
    ModifySQL.Add('  CATCLICOD = :CATCLICOD,');
    ModifySQL.Add('  TBATIVCOD = :TBATIVCOD,');
    ModifySQL.Add('  LIMCRE = :LIMCRE,');
    ModifySQL.Add('  LIMCREUSA = :LIMCREUSA,');
    ModifySQL.Add('  OBS = :OBS,');
    ModifySQL.Add('  ID = :ID');
    ModifySQL.Add('where');
    ModifySQL.Add('  CLICOD = :OLD_CLICOD');
    // Refresh de Registro
    RefreshSQL.Add('Select');
    RefreshSQL.Add('  Clientes.CLICOD AS CLICOD,');
    RefreshSQL.Add('  Clientes.RAZAO AS RAZAO,');
    RefreshSQL.Add('  Clientes.NOMFAN AS NOMFAN,');
    RefreshSQL.Add('  Clientes.NOMRES AS NOMRES,');
    RefreshSQL.Add('  Clientes.CONTATO AS CONTATO,');
    RefreshSQL.Add('  Clientes.TIPPESSOA AS TIPPESSOA,');
    RefreshSQL.Add('  Clientes.CPF AS CPF,');
    RefreshSQL.Add('  Clientes.RG AS RG,');
    RefreshSQL.Add('  Clientes.CNPJ AS CNPJ,');
    RefreshSQL.Add('  Clientes.IEST AS IEST,');
    RefreshSQL.Add('  Clientes.IMUN AS IMUN,');
    RefreshSQL.Add('  Clientes.DDD AS DDD,');
    RefreshSQL.Add('  Clientes.TEL1 AS TEL1,');
    RefreshSQL.Add('  Clientes.TEL2 AS TEL2,');
    RefreshSQL.Add('  Clientes.FAX AS FAX,');
    RefreshSQL.Add('  Clientes.ENDERECO AS ENDERECO,');
    RefreshSQL.Add('  Clientes.BAI AS BAI,');
    RefreshSQL.Add('  Clientes.CEP AS CEP,');
    RefreshSQL.Add('  Clientes.CID AS CID,');
    RefreshSQL.Add('  Clientes.UF AS UF,');
    RefreshSQL.Add('  Clientes.DATCAD AS DATCAD,');
    RefreshSQL.Add('  Clientes.EMAIL1 AS EMAIL1,');
    RefreshSQL.Add('  Clientes.EMAIL2 AS EMAIL2,');
    RefreshSQL.Add('  Clientes.SITE AS SITE,');
    RefreshSQL.Add('  Clientes.ENDERECO_COB AS ENDERECO_COB,');
    RefreshSQL.Add('  Clientes.BAI_COB AS BAI_COB,');
    RefreshSQL.Add('  Clientes.CEP_COB AS CEP_COB,');
    RefreshSQL.Add('  Clientes.CID_COB AS CID_COB,');
    RefreshSQL.Add('  Clientes.UF_COB AS UF_COB,');
    RefreshSQL.Add('  Clientes.SITCLICOD AS SITCLICOD,');
    RefreshSQL.Add('  Clientes.CATCLICOD AS CATCLICOD,');
    RefreshSQL.Add('  Clientes.TBATIVCOD AS TBATIVCOD,');
    RefreshSQL.Add('  Clientes.LIMCRE AS LIMCRE,');
    RefreshSQL.Add('  Clientes.LIMCREUSA AS LIMCREUSA,');
    RefreshSQL.Add('  Clientes.OBS AS OBS,');
    RefreshSQL.Add('  Clientes.ID AS ID,');
    RefreshSQL.Add('  TAB_PAIS.NOME AS NOME');
    RefreshSQL.Add('from Clientes');
    RefreshSQL.Add('Left Outer Join TbAtividades on');
    RefreshSQL.Add('  Clientes.TBATIVCOD = TbAtividades.TBATIVCOD');
    RefreshSQL.Add('Left Outer Join TbSitClientes on');
    RefreshSQL.Add('  Clientes.SITCLICOD = TbSitClientes.SITCLICOD');
    RefreshSQL.Add('Left Outer Join TbCategClientes on');
    RefreshSQL.Add('  Clientes.CATCLICOD = TbCategClientes.CATCLICOD');
    RefreshSQL.Add('Left Outer Join TAB_PAIS on');
    RefreshSQL.Add('  Clientes.ID = TAB_PAIS.ID');
    RefreshSQL.Add('where');
    RefreshSQL.Add('  Clientes.CLICOD = :OLD_CLICOD');
  end;
  TabelasExtras.Add('TbAtividades');
  TabelasExtras.Add('TbSitClientes');
  TabelasExtras.Add('TbCategClientes');
  TabelasExtras.Add('TAB_PAIS');
  UpdateObject     := UpdateSql;
    // Sql Principal
  SqlPrincipal.Add('Select');
  SqlPrincipal.Add('  Clientes.CLICOD AS CLICOD,');
  SqlPrincipal.Add('  Clientes.RAZAO AS RAZAO,');
  SqlPrincipal.Add('  Clientes.NOMFAN AS NOMFAN,');
  SqlPrincipal.Add('  Clientes.NOMRES AS NOMRES,');
  SqlPrincipal.Add('  Clientes.CONTATO AS CONTATO,');
  SqlPrincipal.Add('  Clientes.TIPPESSOA AS TIPPESSOA,');
  SqlPrincipal.Add('  Clientes.CPF AS CPF,');
  SqlPrincipal.Add('  Clientes.RG AS RG,');
  SqlPrincipal.Add('  Clientes.CNPJ AS CNPJ,');
  SqlPrincipal.Add('  Clientes.IEST AS IEST,');
  SqlPrincipal.Add('  Clientes.IMUN AS IMUN,');
  SqlPrincipal.Add('  Clientes.DDD AS DDD,');
  SqlPrincipal.Add('  Clientes.TEL1 AS TEL1,');
  SqlPrincipal.Add('  Clientes.TEL2 AS TEL2,');
  SqlPrincipal.Add('  Clientes.FAX AS FAX,');
  SqlPrincipal.Add('  Clientes.ENDERECO AS ENDERECO,');
  SqlPrincipal.Add('  Clientes.BAI AS BAI,');
  SqlPrincipal.Add('  Clientes.CEP AS CEP,');
  SqlPrincipal.Add('  Clientes.CID AS CID,');
  SqlPrincipal.Add('  Clientes.UF AS UF,');
  SqlPrincipal.Add('  Clientes.DATCAD AS DATCAD,');
  SqlPrincipal.Add('  Clientes.EMAIL1 AS EMAIL1,');
  SqlPrincipal.Add('  Clientes.EMAIL2 AS EMAIL2,');
  SqlPrincipal.Add('  Clientes.SITE AS SITE,');
  SqlPrincipal.Add('  Clientes.ENDERECO_COB AS ENDERECO_COB,');
  SqlPrincipal.Add('  Clientes.BAI_COB AS BAI_COB,');
  SqlPrincipal.Add('  Clientes.CEP_COB AS CEP_COB,');
  SqlPrincipal.Add('  Clientes.CID_COB AS CID_COB,');
  SqlPrincipal.Add('  Clientes.UF_COB AS UF_COB,');
  SqlPrincipal.Add('  Clientes.SITCLICOD AS SITCLICOD,');
  SqlPrincipal.Add('  Clientes.CATCLICOD AS CATCLICOD,');
  SqlPrincipal.Add('  Clientes.TBATIVCOD AS TBATIVCOD,');
  SqlPrincipal.Add('  Clientes.LIMCRE AS LIMCRE,');
  SqlPrincipal.Add('  Clientes.LIMCREUSA AS LIMCREUSA,');
  SqlPrincipal.Add('  Clientes.OBS AS OBS,');
  SqlPrincipal.Add('  Clientes.ID AS ID,');
  SqlPrincipal.Add('  TAB_PAIS.NOME AS NOME');
  SqlPrincipal.Add('from Clientes');
  Sql.AddStrings(SqlPrincipal);
    // Foreign Key
  FiltroExtra.Add('Left Outer Join TbAtividades on');
  FiltroExtra.Add('  Clientes.TBATIVCOD = TbAtividades.TBATIVCOD');
  FiltroExtra.Add('Left Outer Join TbSitClientes on');
  FiltroExtra.Add('  Clientes.SITCLICOD = TbSitClientes.SITCLICOD');
  FiltroExtra.Add('Left Outer Join TbCategClientes on');
  FiltroExtra.Add('  Clientes.CATCLICOD = TbCategClientes.CATCLICOD');
  FiltroExtra.Add('Left Outer Join TAB_PAIS on');
  FiltroExtra.Add('  Clientes.ID = TAB_PAIS.ID');
  Sql.Add('order by Clientes.CLICOD DESC');
  RAZAO := TDClientes_RAZAO.Create(AOwner);
  RAZAO.Valor.DataSet := Self;
  NOMFAN := TDClientes_NOMFAN.Create(AOwner);
  NOMFAN.Valor.DataSet := Self;
  CLICOD := TDClientes_CLICOD.Create(AOwner);
  CLICOD.Valor.DataSet := Self;
  DDD := TDClientes_DDD.Create(AOwner);
  DDD.Valor.DataSet := Self;
  TEL1 := TDClientes_TEL1.Create(AOwner);
  TEL1.Valor.DataSet := Self;
  CID := TDClientes_CID.Create(AOwner);
  CID.Valor.DataSet := Self;
  UF := TDClientes_UF.Create(AOwner);
  UF.Valor.DataSet := Self;
  TEL2 := TDClientes_TEL2.Create(AOwner);
  TEL2.Valor.DataSet := Self;
  CNPJ := TDClientes_CNPJ.Create(AOwner);
  CNPJ.Valor.DataSet := Self;
  SITCLICOD := TDClientes_SITCLICOD.Create(AOwner);
  SITCLICOD.Valor.DataSet := Self;
  TIPPESSOA := TDClientes_TIPPESSOA.Create(AOwner);
  TIPPESSOA.Valor.DataSet := Self;
  NOMRES := TDClientes_NOMRES.Create(AOwner);
  NOMRES.Valor.DataSet := Self;
  CONTATO := TDClientes_CONTATO.Create(AOwner);
  CONTATO.Valor.DataSet := Self;
  CPF := TDClientes_CPF.Create(AOwner);
  CPF.Valor.DataSet := Self;
  RG := TDClientes_RG.Create(AOwner);
  RG.Valor.DataSet := Self;
  IEST := TDClientes_IEST.Create(AOwner);
  IEST.Valor.DataSet := Self;
  IMUN := TDClientes_IMUN.Create(AOwner);
  IMUN.Valor.DataSet := Self;
  FAX := TDClientes_FAX.Create(AOwner);
  FAX.Valor.DataSet := Self;
  ENDERECO := TDClientes_ENDERECO.Create(AOwner);
  ENDERECO.Valor.DataSet := Self;
  BAI := TDClientes_BAI.Create(AOwner);
  BAI.Valor.DataSet := Self;
  CEP := TDClientes_CEP.Create(AOwner);
  CEP.Valor.DataSet := Self;
  DATCAD := TDClientes_DATCAD.Create(AOwner);
  DATCAD.Valor.DataSet := Self;
  OBS := TDClientes_OBS.Create(AOwner);
  OBS.Valor.DataSet := Self;
  EMAIL1 := TDClientes_EMAIL1.Create(AOwner);
  EMAIL1.Valor.DataSet := Self;
  EMAIL2 := TDClientes_EMAIL2.Create(AOwner);
  EMAIL2.Valor.DataSet := Self;
  SITE := TDClientes_SITE.Create(AOwner);
  SITE.Valor.DataSet := Self;
  TBATIVCOD := TDClientes_TBATIVCOD.Create(AOwner);
  TBATIVCOD.Valor.DataSet := Self;
  ENDERECO_COB := TDClientes_ENDERECO_COB.Create(AOwner);
  ENDERECO_COB.Valor.DataSet := Self;
  BAI_COB := TDClientes_BAI_COB.Create(AOwner);
  BAI_COB.Valor.DataSet := Self;
  CEP_COB := TDClientes_CEP_COB.Create(AOwner);
  CEP_COB.Valor.DataSet := Self;
  CID_COB := TDClientes_CID_COB.Create(AOwner);
  CID_COB.Valor.DataSet := Self;
  UF_COB := TDClientes_UF_COB.Create(AOwner);
  UF_COB.Valor.DataSet := Self;
  CATCLICOD := TDClientes_CATCLICOD.Create(AOwner);
  CATCLICOD.Valor.DataSet := Self;
  ID := TDClientes_ID.Create(AOwner);
  ID.Valor.DataSet := Self;
  NOME := TDClientes_NOME.Create(AOwner);
  NOME.Valor.DataSet := Self;
  LIMCRE := TDClientes_LIMCRE.Create(AOwner);
  LIMCRE.Valor.DataSet := Self;
  LIMCREUSA := TDClientes_LIMCREUSA.Create(AOwner);
  LIMCREUSA.Valor.DataSet := Self;
  ChavePrimaria.Add(CLICOD);
  Campos.Add(CLICOD);
  Campos.Add(RAZAO);
  Campos.Add(NOMFAN);
  Campos.Add(NOMRES);
  Campos.Add(CONTATO);
  Campos.Add(TIPPESSOA);
  Campos.Add(CPF);
  Campos.Add(RG);
  Campos.Add(CNPJ);
  Campos.Add(IEST);
  Campos.Add(IMUN);
  Campos.Add(DDD);
  Campos.Add(TEL1);
  Campos.Add(TEL2);
  Campos.Add(FAX);
  Campos.Add(ENDERECO);
  Campos.Add(BAI);
  Campos.Add(CEP);
  Campos.Add(CID);
  Campos.Add(UF);
  Campos.Add(DATCAD);
  Campos.Add(EMAIL1);
  Campos.Add(EMAIL2);
  Campos.Add(SITE);
  Campos.Add(ENDERECO_COB);
  Campos.Add(BAI_COB);
  Campos.Add(CEP_COB);
  Campos.Add(CID_COB);
  Campos.Add(UF_COB);
  Campos.Add(SITCLICOD);
  Campos.Add(CATCLICOD);
  Campos.Add(TBATIVCOD);
  Campos.Add(LIMCRE);
  Campos.Add(LIMCREUSA);
  Campos.Add(OBS);
  Campos.Add(ID);
  Campos.Add(NOME);
  TituloIndices.Add('Cliente');
  Indices.Add('Clientes.CLICOD');
  Crescente.Add('S');
  TituloPrimaria := 'Cliente';
  ChPrimaria     := 'Clientes.CLICOD';
  TituloIndices.Add('Por Razão Social');
  Indices.Add('RAZAO');
  Crescente.Add('S');
  TituloIndice   := 'Cliente';
  ChaveIndice    := 'Clientes.CLICOD DESC';
  AfterInsert    := AtribuiMestre;
  AfterPost      := ProcessoDireto1;
  AfterCancel    := ProcessoDireto2;
  BeforePost     := AtualizaCalculados;
  BeforeEdit     := ProcessoInverso1;
  BeforeDelete   := ProcessoInverso2;
end;

procedure TDClientes.CriaForeignKeys;
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

function TDClientes.PodeExcluir: Boolean;
begin
  PodeExcluir := True;
  if not Sistema.Integridade then
    exit;
end;

procedure TDClientes.ExclusaoCascata;
begin
  // Exclusão em Cascata Tabela: DDIVISOES
  TabGlobal.DDIVISOES.Filtro.Clear;
  TabGlobal.DDIVISOES.Filtro.Add('DIVISOES.CLICOD = :Clientes_CLICOD');
  TabGlobal.DDIVISOES.AtualizaSql;
  while not TabGlobal.DDIVISOES.Eof do
    if not TabGlobal.DDIVISOES.Exclui then
      TabGlobal.DDIVISOES.Next;
end;

function TDClientes.PesquisaRelacionados(Tabela, Campo: String; var Retorno: Variant; CampoFoco: String = ''): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TAB_PAIS') then
    if (UpperCase('ID') = UpperCase(CampoFoco)) then
      if PTabela(TabGlobal.DTAB_PAIS, ['ID'], [ID.Valor.Value], [Campo], Retorno) then
        Result := True;

end;

function TDClientes.PesquisaRelacionados(Tabela: String): Boolean;
begin
  Result := False;
  if UpperCase(Tabela) = UpperCase('TAB_PAIS') then
    if PTabela(TabGlobal.DTAB_PAIS, ['ID'], [ID.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('TbAtividades') then
    if PTabela(TabGlobal.DTbAtividades, ['TBATIVCOD'], [TBATIVCOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('TbSitClientes') then
    if PTabela(TabGlobal.DTbSitClientes, ['SITCLICOD'], [SITCLICOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('TbCategClientes') then
    if PTabela(TabGlobal.DTbCategClientes, ['CATCLICOD'], [CATCLICOD.Valor.Value]) then
      Result := True;

  if UpperCase(Tabela) = UpperCase('Clientes') then
    if PTabela(TabGlobal.DClientes, ['CLICOD'], [CLICOD.Valor.Value]) then
      Result := True;
end;

procedure TDClientes.CalculaCampos;
begin
end;

procedure TDClientes.AtribuiRelacionamentos(Atribui: Boolean = True);
begin
  TabGlobal.DDIVISOES.AtribuiFiltroMestre(Atribui);
end;

procedure TDClientes.AtribuiFiltroMestre(Atribui: Boolean = True; Atualiza: Boolean = True);
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

procedure TDClientes.AtribuiMestre(DataSet: TDataSet);
begin
end;

procedure TDClientes.ProcessoDireto1(DataSet: TDataSet);
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

procedure TDClientes.ProcessoDireto2(DataSet: TDataSet);
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

procedure TDClientes.AtualizaCalculados(DataSet: TDataSet);
begin
  CalculaCampos;
  if Inclusao then
    if (CLICOD.SempreAtribui) and (CLICOD.AutoIncremento > 0) then
      AutoIncremento('CLICOD', True, CLICOD.AutoIncremento);
end;

procedure TDClientes.ProcessoInverso1(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
end;

procedure TDClientes.ProcessoInverso2(DataSet: TDataSet);
var
  EmEdicao: Boolean;
begin
  if not PodeExcluir then Abort;
  ExclusaoCascata;
end;

procedure TDClientes.Parametros(Tabela: TTabela);
begin
  Parametros_Padrao(Tabela);
end;

end.
