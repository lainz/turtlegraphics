unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  BGRAGraphicControl, BGRAVirtualScreen, BGRABitmap, BGRABitmapTypes;

type

  { TfrmTurtle }

  TfrmTurtle = class(TForm)
    BGRAGraphicControl1: TBGRAVirtualScreen;
    Timer1: TTimer;
    procedure BGRAGraphicControl1Click(Sender: TObject);
    procedure BGRAGraphicControl1Redraw(Sender: TObject; Bitmap: TBGRABitmap);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    centerX, centerY: Integer;
    gAngle: single;
    procedure move(Bitmap: TBGRABitmap; distance: single);
    procedure rotate(Bitmap: TBGRABitmap; angle: single);
    procedure translate(Bitmap: TBGRABitmap; x: single; y: single);
    procedure reset(Bitmap: TBGRABitmap);
    procedure set_color(Bitmap: TBGRABitmap; r, g, b, a: byte);
  public

  end;

var
  frmTurtle: TfrmTurtle;

implementation

{$R *.lfm}

{ TfrmTurtle }

procedure TfrmTurtle.BGRAGraphicControl1Redraw(Sender: TObject; Bitmap: TBGRABitmap);
var
  i, j: integer;
begin
  // spiraling
  reset(Bitmap);
  translate(Bitmap, centerX, centerY);
  for i := 1 to 490 do
  begin
    move(Bitmap, i);
    rotate(Bitmap, gAngle);
  end;

  {// square
  reset(Bitmap);
  set_color(Bitmap, 255, 128, 64, 255);

  translate(Bitmap, (Bitmap.Width div 2) - 25, (Bitmap.Height div 2) - 25);
  for i := 1 to 4 do
  begin
    move(Bitmap, 50);
    rotate(Bitmap, gAngle);
  end;

  // 5 points star
  reset(Bitmap);
  set_color(Bitmap, 0, 128, 192, 255);

  translate(Bitmap, (Bitmap.Width div 2) - 100, (Bitmap.Height div 2) - 50);
  for i := 1 to 5 do
  begin
    move(Bitmap, 200);
    rotate(Bitmap, gAngle);
  end;

  // 9 triangles
  reset(Bitmap);
  set_color(Bitmap, 255, 0, 0, 255);

  translate(Bitmap, (Bitmap.Width div 2) - 50, (Bitmap.Height div 2) - 120);
  for i := 1 to 3 do
  begin
    move(Bitmap, 200);
    for j := 1 to 2 do
    begin
      rotate(Bitmap, gAngle);
      move(Bitmap, 100);
    end;
    for j := 1 to 2 do
    begin
      rotate(Bitmap, -gAngle);
      move(Bitmap, 100);
    end;
    rotate(Bitmap, 120);
  end;}
end;

procedure TfrmTurtle.BGRAGraphicControl1Click(Sender: TObject);
begin
  Timer1.Enabled:=True;
end;

procedure TfrmTurtle.FormCreate(Sender: TObject);
begin
  gAngle := 0;
  centerX := Width div 2;
  centerY := Height div 2;
end;

procedure TfrmTurtle.Timer1Timer(Sender: TObject);
begin
  gAngle := gAngle + 0.1;
  Caption := FloatToStr(gAngle);
  BGRAGraphicControl1.DiscardBitmap;
  if (gAngle >= 360) then
    Timer1.Enabled:=False;
end;

procedure TfrmTurtle.move(Bitmap: TBGRABitmap; distance: single);
begin
  Bitmap.Canvas2D.beginPath;
  Bitmap.Canvas2D.moveTo(0, 0);
  Bitmap.Canvas2D.translate(distance, 0);
  Bitmap.Canvas2D.lineTo(0, 0);
  Bitmap.Canvas2D.stroke;
end;

procedure TfrmTurtle.rotate(Bitmap: TBGRABitmap; angle: single);
begin
  Bitmap.Canvas2D.rotate(angle * pi / 180);
end;

procedure TfrmTurtle.translate(Bitmap: TBGRABitmap; x: single; y: single);
begin
  Bitmap.Canvas2D.translate(x, y);
end;

procedure TfrmTurtle.reset(Bitmap: TBGRABitmap);
begin
  Bitmap.Canvas2D.resetTransform;
end;

procedure TfrmTurtle.set_color(Bitmap: TBGRABitmap; r, g, b, a: byte);
begin
  Bitmap.Canvas2D.strokeStyle(BGRA(r, g, b, a));
end;

end.


