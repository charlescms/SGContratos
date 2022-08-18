unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FR_Desgn, FR_DSet, FR_DBSet, FR_Class, DB, ExtCtrls, DBCtrls,
  Grids, DBGrids, IBCustomDataSet, IBQuery, IBDatabase, StdCtrls;

type
  TForm1 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    DContratoTransporte: TIBQuery;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DataSource1: TDataSource;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frDesigner1: TfrDesigner;
    Button1: TButton;
    DContratoTransporteContrato: TIBStringField;
    DContratoTransporteProvedor: TIBStringField;
    DContratoTransporteProduto: TIBStringField;
    DContratoTransporteComission: TIBStringField;
    DContratoTransporteUnid: TIBStringField;
    DContratoTransporteValorEjecutado: TFloatField;
    DContratoTransporteNoFactura: TIBStringField;
    DContratoTransporteCantidad: TFloatField;
    DContratoTransporteValordeLaComision: TFloatField;
    DContratoTransporteNoNotaFiscal: TIntegerField;
    DContratoTransporteFechadeEmisionNF: TDateTimeField;
    DContratoTransporteValorFechamento: TFloatField;
    DContratoTransporteFechadeCobro: TDateTimeField;
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
