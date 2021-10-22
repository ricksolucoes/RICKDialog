unit RICK.Dialog.Demo.View.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.TabControl;

type
  TfrmDemo = class(TForm)
    Layout2: TLayout;
    btnSuccessS: TRectangle;
    Label6: TLabel;
    btnWarnigS: TRectangle;
    Label7: TLabel;
    btnInfoS: TRectangle;
    Label8: TLabel;
    btnErrorS: TRectangle;
    Label9: TLabel;
    btnQuestionS: TRectangle;
    Label10: TLabel;
    btnCustom: TRectangle;
    Label11: TLabel;
    btnInterface: TRectangle;
    Label1: TLabel;
    Layout1: TLayout;
    Layout3: TLayout;
    btnWarningQuestion: TRectangle;
    Label2: TLabel;
    btnInfoQuestion: TRectangle;
    Label3: TLabel;
    btnSuccessQuestion: TRectangle;
    Label4: TLabel;
    btnErrorQuestion: TRectangle;
    Label5: TLabel;
    Image1: TImage;
    procedure btnQuestionSClick(Sender: TObject);
    procedure btnCustomClick(Sender: TObject);
    procedure btnInterfaceClick(Sender: TObject);
    procedure btnErrorSClick(Sender: TObject);
    procedure btnSuccessSClick(Sender: TObject);
    procedure btnInfoSClick(Sender: TObject);
    procedure btnWarnigSClick(Sender: TObject);
    procedure btnWarningQuestionClick(Sender: TObject);
    procedure btnInfoQuestionClick(Sender: TObject);
    procedure btnSuccessQuestionClick(Sender: TObject);
    procedure btnErrorQuestionClick(Sender: TObject);
  private
    { Private declarations }
    procedure CallBack1(Sender: TObject);
    procedure CallBack2(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmDemo: TfrmDemo;

implementation
{$R *.fmx}
uses
  RICK.Dialog.Interfaces,
  RICK.Dialog;

procedure TfrmDemo.btnCustomClick(Sender: TObject);
begin
  TRICKDialog
    .New
      .Form(Self)
        .BackgroundOpacity(0.7)
        .BackgroundColor(TAlphaColorRec.Black)
        .MessageBackgroundColor($FFFFFFFF)
        .MessageRectangleWidth(480)
        .MessageRectangleHeight(450)
        .MessageIconColor($FFAAAAAA)
        .MessageTitleText('Question')
        .MessageTitleFontSize(19)
        .MessageTitleFontColor($FF2C2C2C)
        .MessageInfoText('Fluent Interface')
        .MessageInfoFontSize(15)
        .MessageInfoFontColor($FF848484)
        .MessagePrimaryButtonColor($FF3085D6)
        .MessagePrimaryButtonText('OK')
        .MessagePrimaryButtonFontSize(17)
        .MessagePrimaryButtonFontColor($FF2C2C2C)
        .MessagePrimaryButtonExecute(CallBack1)
        .MessageSecondaryButtonColor(TAlphaColorRec.Red)
        .MessageSecondaryButtonText('Cancel')
        .MessageSecondaryButtonFontSize(17)
        .MessageSecondaryButtonFontColor($FFFFFFFF)
        .MessageSecondaryButtonExecute(CallBack2)
      .DisplayQuestion
end;

procedure TfrmDemo.btnErrorSClick(Sender: TObject);
begin
  TRICKDialog
    .New
      .Form(Self)
        .MessageInfoText('Your message here')
      .DisplayError;
end;

procedure TfrmDemo.btnInfoQuestionClick(Sender: TObject);
begin
  TRICKDialog
    .New
      .Form(Self)
        .MessageInfoText('Your message here')
        .MessagePrimaryButtonText('Yes')
        .MessagePrimaryButtonExecute(CallBack2)
        .MessageSecondaryButtonText('No')
        .MessageSecondaryButtonExecute(CallBack1)
      .DisplayInfo;

end;

procedure TfrmDemo.btnInfoSClick(Sender: TObject);
begin
  TRICKDialog
    .New
      .Form(Self)
        .MessageInfoText('Your message here')
      .DisplayInfo;
end;

procedure TfrmDemo.btnInterfaceClick(Sender: TObject);
var
  LRICKDialog : iRICKDialog;
begin
  LRICKDialog:= TRICKDialog.New;
  LRICKDialog.Form(Self);
  LRICKDialog.BackgroundOpacity(0.7)
    .BackgroundColor(TAlphaColorRec.Black)
    .MessageBackgroundColor($FFFFFFFF)
    .MessageRectangleWidth(480)
    .MessageRectangleHeight(350)
    .MessageIconColor($FFAAAAAA)
    .MessageTitleText('Question')
    .MessageTitleFontSize(19)
    .MessageTitleFontColor($FF2C2C2C)
    .MessageInfoText('Use Interface')
    .MessageInfoFontSize(15)
    .MessageInfoFontColor($FF848484)
    .MessagePrimaryButtonColor(TAlphaColorRec.Blueviolet)
    .MessagePrimaryButtonText('OK')
    .MessagePrimaryButtonFontSize(17)
    .MessagePrimaryButtonFontColor($FF2C2C2C)
    .MessagePrimaryButtonExecute(CallBack1)
    .MessageSecondaryButtonColor(TAlphaColorRec.Aqua)
    .MessageSecondaryButtonText('Cancel')
    .MessageSecondaryButtonFontSize(17)
    .MessageSecondaryButtonFontColor($FFFFFFFF)
    .MessageSecondaryButtonExecute(CallBack2);
  LRICKDialog.DisplayQuestion;
end;

procedure TfrmDemo.btnQuestionSClick(Sender: TObject);
begin
  TRICKDialog
    .New
      .Form(Self)
        .MessageInfoText('Your message here')
        .MessagePrimaryButtonExecute(CallBack1)
        .MessageSecondaryButtonExecute(CallBack2)
      .DisplayQuestion;

end;

procedure TfrmDemo.CallBack2(Sender: TObject);
begin
  ShowMessage('Call Back 2');
end;

procedure TfrmDemo.CallBack1(Sender: TObject);
begin
  ShowMessage('Call Back 1');
end;

procedure TfrmDemo.btnErrorQuestionClick(Sender: TObject);
begin
  TRICKDialog
    .New
      .Form(Self)
        .MessageInfoText('Your message here')
        .MessagePrimaryButtonText('Yes')
        .MessagePrimaryButtonExecute(CallBack2)
        .MessageSecondaryButtonText('No')
        .MessageSecondaryButtonExecute(CallBack1)
      .DisplayError;

end;

procedure TfrmDemo.btnSuccessQuestionClick(Sender: TObject);
begin
  TRICKDialog
    .New
      .Form(Self)
        .MessageInfoText('Your message here')
        .MessagePrimaryButtonText('Yes')
        .MessagePrimaryButtonExecute(CallBack2)
        .MessageSecondaryButtonText('No')
        .MessageSecondaryButtonExecute(CallBack1)
      .DisplaySuccess;

end;

procedure TfrmDemo.btnWarnigSClick(Sender: TObject);
begin
  TRICKDialog
    .New
      .Form(Self)
        .MessageInfoText('Your message here')
        .MessagePrimaryButtonExecute(CallBack2)
      .DisplayWarnig;

end;

procedure TfrmDemo.btnWarningQuestionClick(Sender: TObject);
begin
  TRICKDialog
    .New
      .Form(Self)
        .MessageInfoText('Your message here')
        .MessagePrimaryButtonText('Yes')
        .MessagePrimaryButtonExecute(CallBack2)
        .MessageSecondaryButtonText('No')
        .MessageSecondaryButtonExecute(CallBack1)
      .DisplayWarnig;
end;

procedure TfrmDemo.btnSuccessSClick(Sender: TObject);
begin
  TRICKDialog
    .New
      .Form(Self)
        .MessageInfoText('Your message here')
      .DisplaySuccess;
end;

end.
