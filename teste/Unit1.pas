unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBDatabase, ExtCtrls, DBCtrls,
  Grids, DBGrids, IBTable, FR_DSet, FR_DBSet, FR_Class;

type
  TForm1 = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    IBTable1: TIBTable;
    DBGrid3: TDBGrid;
    DataSource3: TDataSource;
    IBTable2: TIBTable;
    DBGrid4: TDBGrid;
    DataSource4: TDataSource;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSet2: TfrDBDataSet;
    frReport2: TfrReport;
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
