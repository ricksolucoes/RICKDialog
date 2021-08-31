unit RICK.Dialog;

interface

uses
  System.Classes,
  System.UITypes,
  System.SysUtils,

  FMX.Ani,
  FMX.Forms,
  FMX.Types,
  FMX.Objects,
  FMX.Layouts,
  FMX.Graphics,
  FMX.StdCtrls,
  FMX.Platform,
  FMX.VirtualKeyboard,

  RICK.Dialog.Enums,
  RICK.Dialog.Events,
  RICK.Dialog.Interfaces;

type

  TRICKDialog = class(TInterfacedObject, iRICKDialog)
  private
    // Background
    class var FBackgroundOpacity: Single;
    class var FBackgroundRectangle: TRectangle;
    class var FBackgroundColor: TAlphaColor;
    class var FBackgroundLayout: TLayout;
    class var FBackgroundAnimation: TFloatAnimation;

    // Message Rectangle
    class var FMessageRectangle: TRectangle;
    class var FMessageBackgroundColor: TAlphaColor;
    class var FMessageRectangleWidth: Single;
    class var FMessageRectangleHeight: Single;

    // Message ARC Icon
    class var FMessageArc: TArc;
    class var FMessageArcRectangle1: TRectangle;
    class var FMessageArcRectangle2: TRectangle;
    class var FMessageArcLabel: TLabel;
    class var FMessageIconColor: TAlphaColor;
    class var FMessageArcAnimation: TFloatAnimation;
    class var FIcon: TIcon;

    // Message Label Title
    class var FMessageLabelTitle: TLabel;
    class var FMessageTitleText: string;
    class var FMessageTitleFontSize: Single;
    class var FMessageTitleFontColor: TAlphaColor;

    // Message Label Message
    class var FMessageLabelInfo: TLabel;
    class var FMessageInfoText: string;
    class var FMessageInfoFontSize: Single;
    class var FMessageInfoFontColor: TAlphaColor;

    // Message Layout Button
    class var FLayoutButton: TLayout;

    // Message Label Button Primary
    class var FMessageLabelPrimaryButton: TLabel;
    class var FMessageRectanglePrimaryButton: TRectangle;
    class var FMessagePrimaryButtonColor: TAlphaColor;
    class var FMessagePrimaryButtonText: string;
    class var FMessagePrimaryButtonFontSize: Single;
    class var FMessagePrimaryButtonFontColor: TAlphaColor;

    // Message Label Button Secondary
    class var FMessageLabelSecondaryButton: TLabel;
    class var FMessageRectangleSecondaryButton: TRectangle;
    class var FMessageSecondaryButtonColor: TAlphaColor;
    class var FMessageSecondaryButtonText: string;
    class var FMessageSecondaryButtonFontSize: Single;
    class var FMessageSecondaryButtonFontColor: TAlphaColor;

    // Calls Buttons
    class var FCallBackPrimary: TCallbackProc;
    class var FCallBackSecondary: TCallbackProc;

    // Animation End
    procedure EndBackgroundAnimation(Sender: TObject);
    procedure EndArcAnimation(Sender: TObject);

    // Button Click
    procedure ButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ButtonMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ClickPrimaryButton(Sender: TObject);
    procedure ClickSecondaryButton(Sender: TObject);

    // Create Message Structure
    procedure CreateMessageBackground;
    procedure CreateMessageRectangle;
    procedure CreateMessageArc;
    procedure CreateMessageTitle;
    procedure CreateMessageInfo;
    procedure CreateMessageLayoutButton;
    procedure CreateMessagePrimaryButton;
    procedure CreateMessageSecondaryButton;
    class procedure MessageSetup;
    procedure HideVirtualKeyboard;

    // Create Messaging
    procedure CreateMessage;

    // Close Messaging
    procedure MessageClose(Sender: TObject);

    constructor Create;
  public
    destructor Destroy; override;
    class function New: iRICKDialog;

    function BackgroundOpacity(Const AValue: Single): iRICKDialog;
    function BackgroundColor(Const AValue: TAlphaColor): iRICKDialog;
    function MessageBackgroundColor(Const AValue: TAlphaColor): iRICKDialog;
    function MessageRectangleWidth(Const AValue: Single): iRICKDialog;
    function MessageRectangleHeight(Const AValue: Single): iRICKDialog;
    function MessageIconColor(Const AValue: TAlphaColor): iRICKDialog;
    function MessageTitleText(Const AValue: string): iRICKDialog;
    function MessageTitleFontSize(Const AValue: Single): iRICKDialog;
    function MessageTitleFontColor(Const AValue: TAlphaColor): iRICKDialog;
    function MessageInfoText(Const AValue: string): iRICKDialog;
    function MessageInfoFontSize(Const AValue: Single): iRICKDialog;
    function MessageInfoFontColor(Const AValue: TAlphaColor): iRICKDialog;
    function MessagePrimaryButtonColor(Const AValue: TAlphaColor): iRICKDialog;
    function MessagePrimaryButtonText(Const AValue: string): iRICKDialog;
    function MessagePrimaryButtonFontSize(Const AValue: Single): iRICKDialog;
    function MessagePrimaryButtonFontColor(Const AValue: TAlphaColor)
      : iRICKDialog;
    function MessagePrimaryButtonExecute(const AValue: TCallbackProc)
      : iRICKDialog;
    function MessageSecondaryButtonColor(Const AValue: TAlphaColor)
      : iRICKDialog;
    function MessageSecondaryButtonText(Const AValue: string): iRICKDialog;
    function MessageSecondaryButtonFontSize(Const AValue: Single): iRICKDialog;
    function MessageSecondaryButtonFontColor(Const AValue: TAlphaColor)
      : iRICKDialog;
    function MessageSecondaryButtonExecute(const AValue: TCallbackProc)
      : iRICKDialog;
    function DisplayQuestion: iRICKDialog;
    function DisplayError: iRICKDialog;
    function DisplaySuccess: iRICKDialog;
    function DisplayInfo: iRICKDialog;
    function DisplayWarnig: iRICKDialog;
  end;

implementation

{ TMensagem }

function TRICKDialog.BackgroundColor(const AValue: TAlphaColor): iRICKDialog;
begin
  Result := Self;
  FBackgroundColor := AValue;
end;

function TRICKDialog.BackgroundOpacity(const AValue: Single): iRICKDialog;
begin
  Result := Self;
  FBackgroundOpacity := AValue;
end;

procedure TRICKDialog.ButtonMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TRectangle(Sender).Opacity := 0.8;
end;

procedure TRICKDialog.ButtonMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TRectangle(Sender).Opacity := 1;
end;

procedure TRICKDialog.ClickPrimaryButton(Sender: TObject);
begin
  FMessageRectangle.Tag := 1;
  MessageClose(Sender);
end;

procedure TRICKDialog.ClickSecondaryButton(Sender: TObject);
begin
  FMessageRectangle.Tag := 2;
  MessageClose(Sender);
end;

constructor TRICKDialog.Create;
begin
  FBackgroundOpacity := 0.7;
  FBackgroundColor := TAlphaColorRec.Black;
  FMessageBackgroundColor := TAlphaColorRec.White;
  FMessageRectangleWidth := 280;
  FMessageRectangleHeight := 400;
  FMessageIconColor := TAlphaColorRec.Null;
  FMessageTitleText := EmptyStr;
  FMessageTitleFontSize := 19;
  FMessageTitleFontColor := $FF2C2C2C;
  FMessageInfoText := EmptyStr;
  FMessageInfoFontSize := 15;
  FMessageInfoFontColor := $FF848484;
  FMessagePrimaryButtonColor := $FF3085D6;
  FMessagePrimaryButtonText := EmptyStr;
  FMessagePrimaryButtonFontSize := 17;
  FMessagePrimaryButtonFontColor := $FFFFFFFF;
  FMessageSecondaryButtonColor := $FF3085D6;
  FMessageSecondaryButtonText := EmptyStr;
  FMessageSecondaryButtonFontSize := 17;
  FMessageSecondaryButtonFontColor := $FFFFFFFF;
  FCallBackPrimary := Nil;
  FCallBackSecondary := Nil;
end;

procedure TRICKDialog.CreateMessageBackground;
begin
  // Opaque background panel...
  FBackgroundRectangle := TRectangle.Create(Screen.ActiveForm);
  FBackgroundRectangle.Opacity := 0;
  FBackgroundRectangle.Parent := Screen.ActiveForm;
  FBackgroundRectangle.Align := TAlignLayout.Contents;
  FBackgroundRectangle.Fill.Color := FBackgroundColor;
  FBackgroundRectangle.Fill.Kind := TBrushKind.Solid;
  FBackgroundRectangle.Stroke.Kind := TBrushKind.None;
  FBackgroundRectangle.Visible := False;

  // Message Background Layout...
  FBackgroundLayout := TLayout.Create(Screen.ActiveForm);
  FBackgroundLayout.Opacity := 0;
  FBackgroundLayout.Parent := Screen.ActiveForm;
  FBackgroundLayout.Align := TAlignLayout.Contents;
  FBackgroundLayout.Visible := False;

  // Background Animation...
  FBackgroundAnimation := TFloatAnimation.Create(FBackgroundLayout);
  FBackgroundAnimation.Parent := FBackgroundLayout;
  FBackgroundAnimation.OnFinish := EndBackgroundAnimation;
end;

procedure TRICKDialog.CreateMessage;
begin
  CreateMessageBackground;
  CreateMessageRectangle;
  CreateMessageArc;
  CreateMessageTitle;
  CreateMessageInfo;
  CreateMessageLayoutButton;
  CreateMessagePrimaryButton;
  CreateMessageSecondaryButton;
  MessageSetup;
  HideVirtualKeyboard;
end;

procedure TRICKDialog.CreateMessageInfo;
begin
  // Label da mensagem...
  FMessageLabelInfo := TLabel.Create(Screen.ActiveForm);
  FMessageLabelInfo.Parent := FMessageRectangle;
  FMessageLabelInfo.Align := TAlignLayout.Client;
  FMessageLabelInfo.Margins.Top := 20;
  FMessageLabelInfo.Margins.Left := 20;
  FMessageLabelInfo.Margins.Right := 20;
  FMessageLabelInfo.Font.Size := FMessageInfoFontSize;
  FMessageLabelInfo.Height := 60;
  FMessageLabelInfo.Width := FMessageRectangle.Width - 4;
  FMessageLabelInfo.FontColor := FMessageInfoFontColor;
  FMessageLabelInfo.TextSettings.HorzAlign := TTextAlign.Center;
  FMessageLabelInfo.TextSettings.VertAlign := TTextAlign.Leading;
  FMessageLabelInfo.StyledSettings := [TStyledSetting.Family,
    TStyledSetting.Style];
  FMessageLabelInfo.Text := FMessageInfoText;
  FMessageLabelInfo.VertTextAlign := TTextAlign.Leading;
  FMessageLabelInfo.Trimming := TTextTrimming.None;
end;

procedure TRICKDialog.CreateMessageLayoutButton;
begin
  // Layout Button...
  FLayoutButton := TLayout.Create(Screen.ActiveForm);
  FLayoutButton.Parent := FMessageRectangle;
  FLayoutButton.Align := TAlignLayout.Bottom;
  FLayoutButton.Height := 50;
  FLayoutButton.Margins.Left := 10;
  FLayoutButton.Margins.Right := 10;
  FLayoutButton.Margins.Bottom := 25;
end;

procedure TRICKDialog.CreateMessagePrimaryButton;
begin

  // Rectangle Primary Button...
  FMessageRectanglePrimaryButton := TRectangle.Create(Screen.ActiveForm);
  FMessageRectanglePrimaryButton.Opacity := 1;
  FMessageRectanglePrimaryButton.Fill.Color := FMessagePrimaryButtonColor;
  FMessageRectanglePrimaryButton.Parent := FLayoutButton;
  FMessageRectanglePrimaryButton.Align := TAlignLayout.None;
  FMessageRectanglePrimaryButton.Width := 190;
  FMessageRectanglePrimaryButton.Height := 50;
  FMessageRectanglePrimaryButton.Stroke.Kind := TBrushKind.None;
  FMessageRectanglePrimaryButton.XRadius := 4;
  FMessageRectanglePrimaryButton.YRadius := 4;
  FMessageRectanglePrimaryButton.OnMouseDown := Self.ButtonMouseDown;
  FMessageRectanglePrimaryButton.OnMouseUp := Self.ButtonMouseUp;
  FMessageRectanglePrimaryButton.OnClick := ClickPrimaryButton;
  FMessageRectanglePrimaryButton.Visible := False;

  // Label Primary Button...
  FMessageLabelPrimaryButton := TLabel.Create(Screen.ActiveForm);
  FMessageLabelPrimaryButton.Parent := FMessageRectanglePrimaryButton;
  FMessageLabelPrimaryButton.Align := TAlignLayout.Contents;
  FMessageLabelPrimaryButton.Font.Size := FMessagePrimaryButtonFontSize;
  FMessageLabelPrimaryButton.FontColor := FMessagePrimaryButtonFontColor;
  FMessageLabelPrimaryButton.TextSettings.HorzAlign := TTextAlign.Center;
  FMessageLabelPrimaryButton.TextSettings.VertAlign := TTextAlign.Center;
  FMessageLabelPrimaryButton.StyledSettings :=
    [TStyledSetting.Family, TStyledSetting.Style];
  FMessageLabelPrimaryButton.Text := FMessagePrimaryButtonText;
  FMessageLabelPrimaryButton.VertTextAlign := TTextAlign.Center;
  FMessageLabelPrimaryButton.Trimming := TTextTrimming.None;
  FMessageLabelPrimaryButton.HitTest := False;
end;

destructor TRICKDialog.Destroy;
begin

  inherited;
end;

function TRICKDialog.DisplayError: iRICKDialog;
begin
  Result := Self;
  FIcon := TIcon.Error;

  if FMessageIconColor = TAlphaColorRec.Null then
    FMessageIconColor := $FFE64D4D;

  if FMessageTitleText.Trim.IsEmpty then
    FMessageTitleText := 'Error';

  if FMessagePrimaryButtonText.Trim.IsEmpty then
    FMessagePrimaryButtonText := 'OK';

  CreateMessage;
end;

function TRICKDialog.DisplayInfo: iRICKDialog;
begin
  Result := Self;
  FIcon := TIcon.Info;

  if FMessageIconColor = TAlphaColorRec.Null then
    FMessageIconColor := $FF3085D6;

  if FMessageTitleText.Trim.IsEmpty then
    FMessageTitleText := 'Info';

  if FMessagePrimaryButtonText.Trim.IsEmpty then
    FMessagePrimaryButtonText := 'OK';

  CreateMessage;
end;

function TRICKDialog.DisplayQuestion: iRICKDialog;
begin
  Result := Self;
  FIcon := TIcon.Question;

  if FMessageIconColor = TAlphaColorRec.Null then
    FMessageIconColor := $FFAAAAAA;

  if FMessageTitleText.Trim.IsEmpty then
    FMessageTitleText := 'Question';

  if FMessagePrimaryButtonText.Trim.IsEmpty then
    FMessagePrimaryButtonText := 'Sim';

  if FMessageSecondaryButtonText.Trim.IsEmpty then
    FMessageSecondaryButtonText := 'Não';

  CreateMessage;

end;

function TRICKDialog.DisplaySuccess: iRICKDialog;
begin
  Result := Self;
  FIcon := TIcon.Success;

  if FMessageIconColor = TAlphaColorRec.Null then
    FMessageIconColor := $FF35BD27;

  if FMessageTitleText.Trim.IsEmpty then
    FMessageTitleText := 'Success';

  if FMessagePrimaryButtonText.Trim.IsEmpty then
    FMessagePrimaryButtonText := 'OK';

  CreateMessage;
end;

function TRICKDialog.DisplayWarnig: iRICKDialog;
begin
  Result := Self;
  FIcon := TIcon.Warning;

  if FMessageIconColor = TAlphaColorRec.Null then
    FMessageIconColor := $FFF3A867;

  if FMessageTitleText.Trim.IsEmpty then
    FMessageTitleText := 'Warning';

  if FMessagePrimaryButtonText.Trim.IsEmpty then
    FMessagePrimaryButtonText := 'OK';

  CreateMessage;
end;

procedure TRICKDialog.EndArcAnimation(Sender: TObject);
begin
  case FIcon of
    TIcon.Success: // Designing the Icon Success
      begin
        FMessageArcRectangle1.Margins.Right := 38;
        FMessageArcRectangle1.Margins.Top := 21;
        FMessageArcRectangle1.RotationAngle := 45;

        FMessageArcRectangle2.Margins.Left := 20;
        FMessageArcRectangle2.RotationAngle := 135;

        TAnimator.AnimateFloat(FMessageArcRectangle1, 'Width', 30, 0.1);
        TAnimator.AnimateFloatDelay(FMessageArcRectangle2, 'Width', 60,
          0.1, 0.1);
      end;
    TIcon.Warning: // Designing the Icon Warning
      begin
        FMessageArcLabel.Margins.Bottom := 5;
        FMessageArcLabel.Text := '!';
        FMessageArcLabel.Font.Size := 70;
      end;
    TIcon.Error: // Designing the Icon Error
      begin
        FMessageArcRectangle1.Margins.Right := 0;
        FMessageArcRectangle1.Margins.Top := 0;
        FMessageArcRectangle1.RotationAngle := 45;
        FMessageArcRectangle2.RotationAngle := 135;
        FMessageArcRectangle2.Margins.Left := 0;

        TAnimator.AnimateFloat(FMessageArcRectangle1, 'Width', 60, 0.1);
        TAnimator.AnimateFloatDelay(FMessageArcRectangle2, 'Width', 60,
          0.1, 0.1);
      end;
    TIcon.Info: // Designing the Icon Info
      begin
        FMessageArcLabel.Margins.Bottom := 5;
        FMessageArcLabel.Text := 'i';
        FMessageArcLabel.Font.Size := 70;
      end;
    TIcon.Question: // Designing the Icon Question
      begin
        FMessageArcLabel.Margins.Bottom := 5;
        FMessageArcLabel.Text := '?';
        FMessageArcLabel.Font.Size := 70;
      end;
  end;
end;

procedure TRICKDialog.EndBackgroundAnimation(Sender: TObject);
begin
  FBackgroundRectangle.Visible := False;
  FBackgroundLayout.Visible := False;

  if FMessageRectangle.Tag = 1 then
    if Assigned(FCallBackPrimary) then
      FCallBackPrimary(Self);

  if FMessageRectangle.Tag = 2 then
    if Assigned(FCallBackSecondary) then
      FCallBackSecondary(Self);

end;

procedure TRICKDialog.HideVirtualKeyboard;
var
  LService: IFMXVirtualKeyboardService;
begin
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
    IInterface(LService));
  if (LService <> nil) then
  begin
    LService.HideVirtualKeyboard;
  end;
  LService := nil;
end;

function TRICKDialog.MessageBackgroundColor(const AValue: TAlphaColor)
  : iRICKDialog;
begin
  Result := Self;
  FMessageBackgroundColor := AValue;
end;

procedure TRICKDialog.MessageClose(Sender: TObject);
begin
  FBackgroundAnimation.StartValue := 1;
  FBackgroundAnimation.StopValue := 0;
  FBackgroundAnimation.Duration := 0.15;
  FBackgroundAnimation.PropertyName := 'Opacity';
  FBackgroundAnimation.AnimationType := TAnimationType.&In;
  FBackgroundAnimation.Interpolation := TInterpolationType.Circular;
  FBackgroundAnimation.Start;
end;

function TRICKDialog.MessageIconColor(const AValue: TAlphaColor): iRICKDialog;
begin
  Result := Self;
  FMessageIconColor := AValue;
end;

function TRICKDialog.MessageInfoText(const AValue: string): iRICKDialog;
begin
  Result := Self;
  FMessageInfoText := AValue;
end;

function TRICKDialog.MessageInfoFontColor(const AValue: TAlphaColor)
  : iRICKDialog;
begin
  Result := Self;
  FMessageInfoFontColor := AValue;
end;

function TRICKDialog.MessageInfoFontSize(const AValue: Single): iRICKDialog;
begin
  Result := Self;
  FMessageInfoFontSize := AValue;
end;

function TRICKDialog.MessagePrimaryButtonText(const AValue: string)
  : iRICKDialog;
begin
  Result := Self;
  FMessagePrimaryButtonText := AValue;
end;

function TRICKDialog.MessagePrimaryButtonColor(const AValue: TAlphaColor)
  : iRICKDialog;
begin
  Result := Self;
  FMessagePrimaryButtonColor := AValue;
end;

function TRICKDialog.MessagePrimaryButtonExecute(const AValue: TCallbackProc)
  : iRICKDialog;
begin
  Result := Self;
  FCallBackPrimary := AValue;
end;

function TRICKDialog.MessagePrimaryButtonFontColor(const AValue: TAlphaColor)
  : iRICKDialog;
begin
  Result := Self;
  FMessagePrimaryButtonFontColor := AValue;
end;

function TRICKDialog.MessagePrimaryButtonFontSize(const AValue: Single)
  : iRICKDialog;
begin
  Result := Self;
  FMessagePrimaryButtonFontSize := AValue;
end;

procedure TRICKDialog.CreateMessageArc;
begin
  // Animated Arc...
  FMessageArc := TArc.Create(Screen.ActiveForm);
  FMessageArc.Visible := true;
  FMessageArc.Parent := FMessageRectangle;
  FMessageArc.Align := TAlignLayout.MostTop;
  FMessageArc.Margins.Top := 40;
  FMessageArc.Margins.Right := Trunc((FMessageRectangle.Width - 110) / 2);
  FMessageArc.Margins.Left := FMessageArc.Margins.Right;
  FMessageArc.Height := 110;
  FMessageArc.EndAngle := 0;
  FMessageArc.Stroke.Color := 4281711911;
  FMessageArc.Stroke.Thickness := 3;
  FMessageArc.StartAngle := -90;

  // Rectangle 1 icon...
  FMessageArcRectangle1 := TRectangle.Create(FMessageArc);
  FMessageArcRectangle1.Opacity := 1;
  FMessageArcRectangle1.Parent := FMessageArc;
  FMessageArcRectangle1.Align := TAlignLayout.Center;
  FMessageArcRectangle1.Visible := true;
  FMessageArcRectangle1.Height := 5;
  FMessageArcRectangle1.Stroke.Kind := TBrushKind.None;
  FMessageArcRectangle1.XRadius := 3;
  FMessageArcRectangle1.YRadius := 3;

  // Rectangle 2 icon...
  FMessageArcRectangle2 := TRectangle.Create(FMessageArc);
  FMessageArcRectangle2.Opacity := 1;
  FMessageArcRectangle2.Align := TAlignLayout.Center;
  FMessageArcRectangle2.Parent := FMessageArc;
  FMessageArcRectangle2.Visible := true;
  FMessageArcRectangle2.Height := 5;
  FMessageArcRectangle2.Stroke.Kind := TBrushKind.None;
  FMessageArcRectangle2.XRadius := 3;
  FMessageArcRectangle2.YRadius := 3;

  // Label icon...
  FMessageArcLabel := TLabel.Create(FMessageArc);
  FMessageArcLabel.Parent := FMessageArc;
  FMessageArcLabel.Align := TAlignLayout.Client;
  FMessageArcLabel.Font.Size := 30;
  FMessageArcLabel.FontColor := FMessageIconColor;
  FMessageArcLabel.TextSettings.HorzAlign := TTextAlign.Center;
  FMessageArcLabel.TextSettings.VertAlign := TTextAlign.Center;
  FMessageArcLabel.StyledSettings := [TStyledSetting.Family,
    TStyledSetting.Style];
  FMessageArcLabel.Text := EmptyStr;
  FMessageArcLabel.VertTextAlign := TTextAlign.Center;
  FMessageArcLabel.Trimming := TTextTrimming.None;

  // Icon Circle Animation...
  FMessageArcAnimation := TFloatAnimation.Create(Screen.ActiveForm);
  FMessageArcAnimation.Parent := FMessageArc;
  FMessageArcAnimation.Delay := 0.1;
  FMessageArcAnimation.StartValue := 0;
  FMessageArcAnimation.StopValue := 360;
  FMessageArcAnimation.Duration := 0.4;
  FMessageArcAnimation.PropertyName := 'EndAngle';
  FMessageArcAnimation.AnimationType := TAnimationType.In;
  FMessageArcAnimation.Interpolation := TInterpolationType.Circular;
  FMessageArcAnimation.OnFinish := EndArcAnimation;

end;

function TRICKDialog.MessageRectangleHeight(const AValue: Single): iRICKDialog;
begin
  Result := Self;
  FMessageRectangleHeight := AValue;
end;

procedure TRICKDialog.CreateMessageRectangle;
begin
  // Message rectangle...
  FMessageRectangle := TRectangle.Create(Screen.ActiveForm);
  FMessageRectangle.Opacity := 1;
  FMessageRectangle.Fill.Color := FMessageBackgroundColor;
  FMessageRectangle.Parent := FBackgroundLayout;
  FMessageRectangle.Align := TAlignLayout.Center;
  FMessageRectangle.Width := FMessageRectangleWidth;
  FMessageRectangle.Height := FMessageRectangleHeight;
  FMessageRectangle.Visible := true;
  FMessageRectangle.Stroke.Kind := TBrushKind.None;
  FMessageRectangle.XRadius := 6;
  FMessageRectangle.YRadius := 6;
end;

procedure TRICKDialog.CreateMessageSecondaryButton;
begin

  // Rectangle Secondary Button...
  FMessageRectangleSecondaryButton := TRectangle.Create(Screen.ActiveForm);
  FMessageRectangleSecondaryButton.Opacity := 1;
  FMessageRectangleSecondaryButton.Fill.Color := FMessageSecondaryButtonColor;
  FMessageRectangleSecondaryButton.Parent := FLayoutButton;
  FMessageRectangleSecondaryButton.Align := TAlignLayout.None;
  FMessageRectangleSecondaryButton.Width := 190;
  FMessageRectangleSecondaryButton.Height := 50;
  FMessageRectangleSecondaryButton.Stroke.Kind := TBrushKind.None;
  FMessageRectangleSecondaryButton.XRadius := 4;
  FMessageRectangleSecondaryButton.YRadius := 4;
  FMessageRectangleSecondaryButton.OnMouseDown := Self.ButtonMouseDown;
  FMessageRectangleSecondaryButton.OnMouseUp := Self.ButtonMouseUp;
  FMessageRectangleSecondaryButton.OnClick := ClickSecondaryButton;
  FMessageRectangleSecondaryButton.Visible := False;

  // Label Secondary Button...
  FMessageLabelSecondaryButton := TLabel.Create(Screen.ActiveForm);
  FMessageLabelSecondaryButton.Parent := FMessageRectangleSecondaryButton;
  FMessageLabelSecondaryButton.Align := TAlignLayout.Contents;
  FMessageLabelSecondaryButton.Font.Size := FMessageSecondaryButtonFontSize;
  FMessageLabelSecondaryButton.FontColor := FMessageSecondaryButtonFontColor;
  FMessageLabelSecondaryButton.TextSettings.HorzAlign := TTextAlign.Center;
  FMessageLabelSecondaryButton.TextSettings.VertAlign := TTextAlign.Center;
  FMessageLabelSecondaryButton.StyledSettings :=
    [TStyledSetting.Family, TStyledSetting.Style];
  FMessageLabelSecondaryButton.Text := FMessageSecondaryButtonText;
  FMessageLabelSecondaryButton.VertTextAlign := TTextAlign.Center;
  FMessageLabelSecondaryButton.Trimming := TTextTrimming.None;
  FMessageLabelSecondaryButton.HitTest := False;

end;

procedure TRICKDialog.CreateMessageTitle;
begin
  // Label do titulo...
  FMessageLabelTitle := TLabel.Create(Screen.ActiveForm);
  FMessageLabelTitle.Parent := FMessageRectangle;
  FMessageLabelTitle.Align := TAlignLayout.Top;
  FMessageLabelTitle.Margins.Top := 30;
  FMessageLabelTitle.Margins.Left := 20;
  FMessageLabelTitle.Margins.Right := 20;
  FMessageLabelTitle.Font.Size := FMessageTitleFontSize;
  FMessageLabelTitle.Height := 25;
  FMessageLabelTitle.Width := FMessageRectangle.Width - 4;
  FMessageLabelTitle.FontColor := FMessageTitleFontColor;
  FMessageLabelTitle.TextSettings.HorzAlign := TTextAlign.Center;
  FMessageLabelTitle.TextSettings.VertAlign := TTextAlign.Leading;
  FMessageLabelTitle.Text := FMessageTitleText;
  FMessageLabelTitle.StyledSettings := [TStyledSetting.Family,
    TStyledSetting.Style];
  FMessageLabelTitle.VertTextAlign := TTextAlign.Leading;
  FMessageLabelTitle.Trimming := TTextTrimming.None;
end;

function TRICKDialog.MessageRectangleWidth(const AValue: Single): iRICKDialog;
begin
  Result := Self;
  FMessageRectangleWidth := AValue;
end;

function TRICKDialog.MessageSecondaryButtonText(const AValue: string)
  : iRICKDialog;
begin
  Result := Self;
  FMessageSecondaryButtonText := AValue;
end;

function TRICKDialog.MessageSecondaryButtonColor(const AValue: TAlphaColor)
  : iRICKDialog;
begin
  Result := Self;
  FMessageSecondaryButtonColor := AValue;
end;

function TRICKDialog.MessageSecondaryButtonExecute(const AValue: TCallbackProc)
  : iRICKDialog;
begin
  Result := Self;
  FCallBackSecondary := AValue;
end;

function TRICKDialog.MessageSecondaryButtonFontColor(const AValue: TAlphaColor)
  : iRICKDialog;
begin
  Result := Self;
  FMessageSecondaryButtonFontColor := AValue;
end;

function TRICKDialog.MessageSecondaryButtonFontSize(const AValue: Single)
  : iRICKDialog;
begin
  Result := Self;
  FMessageSecondaryButtonFontSize := AValue;
end;

class procedure TRICKDialog.MessageSetup;
begin
  // Icon Clear...
  FMessageArcRectangle1.Width := 0;
  FMessageArcRectangle2.Width := 0;
  FMessageArcLabel.Text := '';

  // Icon Color...
  FMessageArc.Stroke.Color := FMessageIconColor;
  FMessageArcRectangle1.Fill.Color := FMessageIconColor;
  FMessageArcRectangle2.Fill.Color := FMessageIconColor;
  FMessageArcLabel.FontColor := FMessageIconColor;

  // SetUp Background...
  FBackgroundRectangle.Opacity := 0;
  FBackgroundLayout.Opacity := 0;
  FBackgroundRectangle.Visible := true;
  FBackgroundLayout.Visible := true;

  // SetUp Title...
  FMessageLabelTitle.Text := FMessageTitleText;

  // SetUp Message...
  FMessageLabelInfo.Text := FMessageInfoText;

  // Display Button...
  FMessageLabelPrimaryButton.Text := FMessagePrimaryButtonText;
  FMessageLabelSecondaryButton.Text := FMessageSecondaryButtonText;

  // Position Buttons
  FMessageRectanglePrimaryButton.Visible :=
    not FMessageLabelPrimaryButton.Text.Trim.IsEmpty;
  FMessageRectangleSecondaryButton.Visible :=
    not FMessageLabelSecondaryButton.Text.Trim.IsEmpty;

  if (FMessageRectanglePrimaryButton.Visible) and
    (FMessageRectangleSecondaryButton.Visible) then
  begin
    FMessageRectanglePrimaryButton.Align := TAlignLayout.Left;
    FMessageRectangleSecondaryButton.Align := TAlignLayout.Right;

    FMessageRectanglePrimaryButton.Width := (FLayoutButton.Width / 2) - 6;
    FMessageRectangleSecondaryButton.Width :=
      FMessageRectanglePrimaryButton.Width;
  end
  else if (FMessageRectanglePrimaryButton.Visible) then
  begin
    FMessageRectanglePrimaryButton.Align := TAlignLayout.Center;
    FMessageRectanglePrimaryButton.Width := FLayoutButton.Width - 30;
  end;

  // Icon animation...
  FMessageArc.EndAngle := 0;
  FMessageArcAnimation.Start;

  // Message animation...
  TAnimator.AnimateFloat(FBackgroundRectangle, 'Opacity',
    FBackgroundOpacity, 0.15);
  TAnimator.AnimateFloatDelay(FBackgroundLayout, 'Opacity', 1, 0.3, 0.2);
  FMessageRectangle.BringToFront;

end;

function TRICKDialog.MessageTitleText(const AValue: string): iRICKDialog;
begin
  Result := Self;
  FMessageTitleText := AValue;
end;

function TRICKDialog.MessageTitleFontColor(const AValue: TAlphaColor)
  : iRICKDialog;
begin
  Result := Self;
  FMessageTitleFontColor := AValue;
end;

function TRICKDialog.MessageTitleFontSize(const AValue: Single): iRICKDialog;
begin
  Result := Self;
  FMessageTitleFontSize := AValue;
end;

class function TRICKDialog.New: iRICKDialog;
begin
  Result := Self.Create;
end;

end.
