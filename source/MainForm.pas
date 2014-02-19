unit MainForm;

interface

{$DEFINE DEMO_MODE}

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.Samples.Spin, Vcl.ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc,
  Vcl.Grids;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    edUrl: TEdit;
    Button1: TButton;
    Label1: TLabel;
    sePort: TSpinEdit;
    Label2: TLabel;
    IdHTTP1: TIdHTTP;
    XMLDocument1: TXMLDocument;
    Panel2: TPanel;
    CheckListBox1: TCheckListBox;
    Button2: TButton;
    StringGrid1: TStringGrid;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    function GetProjectXml: string;
    function FindProject(ProjName: string): IXmlNode;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  node: IXmlNode;
begin
  XMLDocument1.LoadFromXML(GetProjectXml);
  node := XmlDocument1.DocumentElement.ChildNodes.First;
  while Assigned(node) do
  begin
    CheckListBox1.Items.Add(node.Attributes['name']);
    node := node.NextSibling;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Timer1Timer(Sender);
  Timer1.Enabled := True;
end;

function TForm1.FindProject(ProjName: string): IXmlNode;
begin
  Result := XmlDocument1.DocumentElement.ChildNodes.First;
  while Assigned(Result) do
  begin
    if Result.Attributes['name'] = ProjName then
      Break;
    Result := Result.NextSibling;
  end;
end;

function TForm1.GetProjectXml: string;
{$IFDEF DEMO_MODE}
var
  sl: TStringList;
begin
  sl := TStringList.Create;
  try
    sl.LoadFromFile('../testdata/test.xml');
    Result := sl.Text;
  finally
    sl.Free;
  end;
{$ELSE}
var
  url: string;
  sl: TStringList;
begin
  url := Format('http://%s:%d/app/rest/cctray/projects.xml', [edUrl.Text, sePort.Value]);
  Result := IdHTTP1.Get(url);
  sl := TStringList.Create;
  try
    sl.Text := Result;
    sl.SaveToFile('../testdata/test.xml');
  finally
    sl.Free;
  end;
{$ENDIF}
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  I, Count: Integer;
  node: IXmlNode;
begin
  Count := 0;
  for I := 0 to CheckListBox1.Items.Count - 1 do
    if CheckListBox1.Checked[I] then
      Inc(Count);
  StringGrid1.RowCount := Count + 1;
  StringGrid1.ColCount := 6;
  StringGrid1.Cells[0, 0] := 'Status';
  StringGrid1.Cells[1, 0] := 'Label';
  StringGrid1.Cells[2, 0] := 'Activity';
  StringGrid1.Cells[3, 0] := 'Name';
  StringGrid1.ColWidths[3] := 450;
  StringGrid1.Cells[4, 0] := 'Time';
  StringGrid1.ColWidths[4] := 180;
  StringGrid1.Cells[5, 0] := 'URL';
  Count := 1;
  for I := 0 to CheckListBox1.Items.Count - 1 do
  begin
    if CheckListBox1.Checked[I] then
    begin
      StringGrid1.Cells[3, Count] := CheckListBox1.Items[I];
      node := FindProject(StringGrid1.Cells[3, Count]);
      StringGrid1.Cells[0, Count] := node.Attributes['lastBuildStatus'];
      StringGrid1.Cells[1, Count] := node.Attributes['lastBuildLabel'];
      StringGrid1.Cells[2, Count] := node.Attributes['activity'];
      StringGrid1.Cells[4, Count] := node.Attributes['lastBuildTime'];
      StringGrid1.Cells[5, Count] := node.Attributes['webUrl'];
      Inc(Count);
    end;
  end;
end;

end.
