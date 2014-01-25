unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  with image1.canvas do begin
    brush.Style:=bssolid;
    brush.color:=clwhite;
    fillrect(0,0,512,512);
    brush.color:=clblack;
    if CheckBox1.Checked=true then fillrect(0,0,512,512);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
  var
  n,i,a,x,y,xa,xb,xc,ya,yb,yc: Integer;
begin
  randomize;
  xa:=strtoint(Edit2.Text) or 0;
  ya:=strtoint(Edit3.Text) or 0;
  xb:=strtoint(Edit4.Text) or 0;
  yb:=strtoint(Edit5.Text) or 0;
  xc:=strtoint(Edit6.Text) or 0;
  yc:=strtoint(Edit7.Text) or 0;
  x:=xa;
  y:=ya;
  n:=strtoint(Edit1.Text);
  with image1.canvas do begin
    for i:=0 to n do begin
      if Checkbox1.Checked=true then begin
        pen.color:=(strtoint(inttostr(random(256))+inttostr(random(256))+inttostr(random(256))));
      end else pen.color:=clblack;
      line(x,y,x+1,y+1);
      a:=random(3);
      case a of
        0:begin x:=(x+xa)div 2; y:=(y+ya)div 2 end;
        1:begin x:=(x+xb)div 2; y:=(y+yb)div 2 end;
        2:begin x:=(x+xc)div 2; y:=(y+yc)div 2 end;
      end;
      line(x,y,x+1,y+1);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  with image1.canvas do rectangle(-1,-1,513,513);
end;

end.

