unit umain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  BGRAGraphicControl, BGRABitmap, BGRABitmapTypes;

type

  { TfrmTurtle }

  TfrmTurtle = class(TForm)
    BGRAGraphicControl1: TBGRAGraphicControl;
    procedure BGRAGraphicControl1Redraw(Sender: TObject; Bitmap: TBGRABitmap);
  private
    procedure move(Bitmap: TBGRABitmap; distance: integer);
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
  Bitmap.Fill(BGRAWhite);

  reset(Bitmap);
  set_color(Bitmap, 0, 0, 255, 255);

  // 5 points star
  translate(Bitmap, (Bitmap.Width div 2) - 100, (Bitmap.Height div 2) - 50);
  for i := 1 to 5 do
  begin
    move(Bitmap, 200);
    rotate(Bitmap, 144);
  end;

  reset(Bitmap);
  set_color(Bitmap, 0, 255, 0, 255);

  // 9 triangles
  translate(Bitmap, (Bitmap.Width div 2) - 50, (Bitmap.Height div 2) - 120);
  for i := 1 to 3 do
  begin
    move(Bitmap, 200);
    for j := 1 to 2 do
    begin
      rotate(Bitmap, 120);
      move(Bitmap, 100);
    end;
    for j := 1 to 2 do
    begin
      rotate(Bitmap, -120);
      move(Bitmap, 100);
    end;
    rotate(Bitmap, 120);
  end;
end;

procedure TfrmTurtle.move(Bitmap: TBGRABitmap; distance: integer);
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


