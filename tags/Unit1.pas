unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IBDatabase, DB, Menus, IBCustomDataSet, IBQuery, FR_Class,
  FR_Desgn, FR_DSet, FR_DBSet, StdCtrls, Buttons, Tabs, Grids, DBGrids,
  DBCtrls, ComCtrls, Mask, XDate, ExtCtrls;

type
  TForm1 = class(TForm)
    PnSup: TPanel;
    ShapeSup: TShape;
    LbTituloForm: TLabel;
    BtnAjuda: TSpeedButton;
    BtnFechar: TSpeedButton;
    Selecao_1: TScrollBox;
    Panel_filtro: TPanel;
    GroupBox_Filtro: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    XDT_INIC: TXDateEdit;
    XDT_FIM: TXDateEdit;
    GBoxCliente: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    CBox_Cliente_I: TComboBox;
    CBox_Cliente_F: TComboBox;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    CBox_Exportador_I: TComboBox;
    CBox_Exportador_F: TComboBox;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    XDT_INIC_EMB: TXDateEdit;
    XDT_FIM_EMB: TXDateEdit;
    GroupBox_FormaPag: TGroupBox;
    CBox_FormaPag: TComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    GroupBox_dados: TGroupBox;
    DBNav_Qsituacao: TDBNavigator;
    DBGrid_QSituacao: TDBGrid;
    GroupBox_navio: TGroupBox;
    DBNav_navio: TDBNavigator;
    DBGrid_navio: TDBGrid;
    Panel3: TPanel;
    GroupBox_total_grup: TGroupBox;
    DBNav_total_prod: TDBNavigator;
    DBGrid_total_prod: TDBGrid;
    GroupBox_total_pais: TGroupBox;
    DBNav_Total_pais: TDBNavigator;
    DBGrid_total_pais: TDBGrid;
    TabSheet2: TTabSheet;
    GroupBox_situacao: TGroupBox;
    DBNav_situacao: TDBNavigator;
    DBGrid_Situacao111: TDBGrid;
    GridConsulta: TDBGrid;
    Divisao: TTabSet;
    Panel1: TPanel;
    BtnVisualizar: TBitBtn;
    BtnCancelar: TBitBtn;
    BitB_FILTRO: TBitBtn;
    frDBDataSet: TfrDBDataSet;
    frDesigner: TfrDesigner;
    frReport: TfrReport;
    IBQuery_Total_Prod: TIBQuery;
    IBQuery_Total_ProdNOMEMIX: TIBStringField;
    IBQuery_Total_ProdQUANTIDADETOTAL: TFloatField;
    IBQuery_Total_ProdVALORSCCTOTAL: TFloatField;
    IBQuery_Total_ProdQUANTTOTALEXP: TFloatField;
    IBQuery_Total_ProdVALORTOTALEXP: TFloatField;
    DS_total_Prod: TDataSource;
    frDBDataSet_Total_Prod: TfrDBDataSet;
    QSituacao: TIBQuery;
    IBQuery_navio: TIBQuery;
    IBQuery_navioCONTRATO: TIBStringField;
    IBQuery_navioNAVIO: TIBStringField;
    IBQuery_navioDATAEMBARQUE: TDateTimeField;
    IBQuery_navioQUANTIDADEEXP: TFloatField;
    IBQuery_navioVALOR: TFloatField;
    frDBDataSet_Navio: TfrDBDataSet;
    DS_situacao: TDataSource;
    DS_Navio: TDataSource;
    DS_QSituacao: TDataSource;
    IBQuery_Pais: TIBQuery;
    IBQuery_PaisNOME: TIBStringField;
    IBQuery_PaisQUANTIDADETOTAL: TFloatField;
    IBQuery_PaisVALORSCCTOTAL: TFloatField;
    IBQuery_PaisQUANTTOTALEXP: TFloatField;
    IBQuery_PaisVALORTOTALEXP: TFloatField;
    DS_PAIS: TDataSource;
    frDBDataSet1: TfrDBDataSet;
    PopConsulta: TPopupMenu;
    mnu_Filtrar: TMenuItem;
    mnu_Ordenar: TMenuItem;
    mnu_OrdenarComposto: TMenuItem;
    N1: TMenuItem;
    mnu_ApagarColuna: TMenuItem;
    N2: TMenuItem;
    mnu_Quantificar: TMenuItem;
    mnu_TotalizarColuna: TMenuItem;
    mnu_CalcularMedia: TMenuItem;
    N3: TMenuItem;
    mnu_Imprimir: TMenuItem;
    mnu_SalvarConsulta: TMenuItem;
    mnu_ExcluirConsulta: TMenuItem;
    IBQuery_TOTAL_PRODUTO: TIBQuery;
    IBQuery_TOTAL_PAIS: TIBQuery;
    DS_TOTAL_PRODUTO: TDataSource;
    DS_TOTAL_PAIS: TDataSource;
    frDBDataSet_TOTAL_PRODUTO: TfrDBDataSet;
    frDBDataSet_TOTAL_PAIS: TfrDBDataSet;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
