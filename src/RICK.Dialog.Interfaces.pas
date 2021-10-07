unit RICK.Dialog.Interfaces;

interface

uses
  FMX.Forms,

  System.UITypes,

  RICK.Dialog.Events;

type
  iRICKDialog = interface
    ['{4CDCD48A-B16D-4A71-AC27-B3692A120EDB}']
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

    function Form(AValue: TForm): iRICKDialog;
  end;

implementation

end.
