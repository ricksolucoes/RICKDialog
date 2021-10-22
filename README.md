[0]: https://github.com/ricksolucoes/boss "Site do BOOS"

# RickDialog

**RickDialog**  is a Delphi library designed to present a customized dialog screen. Using delphi's Fluent Interface.

![Success](https://user-images.githubusercontent.com/79030707/133642843-19ecddd9-374d-4e08-a4bb-fd9fa0b7081c.png)
![Info](https://user-images.githubusercontent.com/79030707/133642913-691d1ec0-f968-452d-8ca5-d2d9d085eafb.png) ![Warnig](https://user-images.githubusercontent.com/79030707/133643032-f063012e-f1f8-4e3c-a9a2-66a0d5951279.png) ![Error](https://user-images.githubusercontent.com/79030707/133643194-87885fe6-c61c-4283-aa89-8893b3de21d3.png) ![Question](https://user-images.githubusercontent.com/79030707/133643288-b476d9d0-d9b7-43f2-80b0-31c85df88d2a.png)


## ⚙️ Pre-requisites

1. Delphi FMX
2. If you choose to use [BOOS][0] ```https://github.com/ricksolucoes/boss or https://github.com/HashLoad/boss```  the dependency manager, you will have the facility to install all frameworks that are [Pre-requisites](#pre-requisites) for the project.

## 💻 Installation

- By using BOOS
```shell
$ boss install https://github.com/ricksolucoes/RickDialog
```
- Manual Installation
  - Download the RickDialog;
  - Add the following folders to your project, in <em>Project &gt; Options &gt; Resource Compiler &gt; Directories and Conditionals &gt; Include file search path ``` ../RickDialog/src ```

 ## ⚡️ How to use the project

  Example of using the **RickDialog**

- How to use Warning Dialog

```delphi  
  uses
    RICK.Dialog;
  begin
    TRickDialog
      .New
        .Form(Self)
          .MessageInfoText('Your message here')
          .MessagePrimaryButtonExecute('Info CallBack')
        .DisplayWarnig;
  end;
```

- How to use Info Dialog

```delphi  
  uses
    RICK.Dialog;
  begin
    TRickDialog
      .New
        .Form(Self)
          .MessageInfoText('Your message here')
          .MessagePrimaryButtonExecute('Info CallBack')
        .DisplayInfo;
  end;

```

- How to use Success Dialog

```delphi  
  uses
    RICK.Dialog;
  begin
    TRickDialog
      .New
        .Form(Self)
          .MessageInfoText('Your message here')
          .MessagePrimaryButtonExecute('Info CallBack')
        .DisplaySuccess;
  end;
```
	
- How to use Error Dialog

```delphi  
  uses
    RICK.Dialog;
  begin
    TRickDialog
      .New
        .Form(Self)
          .MessageInfoText('Your message here')
          .MessagePrimaryButtonExecute('Info CallBack')
        .DisplayError;
  end;
```

- How to use Question Dialog

```delphi  
  uses
    RICK.Dialog;
  begin
    TRickDialog
      .New
        .Form(Self)
          .MessageInfoText('Your message here')
          .MessagePrimaryButtonExecute('Info CallBack')
          .MessageSecondaryButtonExecute('Info CallBack2')
        .DisplayQuestion;
  end;

```

- Dialog Customization Options

```delphi
  uses
    RICK.Dialog;
  begin
    TRickDialog
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
          .MessagePrimaryButtonExecute('Info CallBack')
          .MessageSecondaryButtonColor(TAlphaColorRec.Red)
          .MessageSecondaryButtonText('Cancel')
          .MessageSecondaryButtonFontSize(17)
          .MessageSecondaryButtonFontColor($FFFFFFFF)
          .MessageSecondaryButtonExecute('Info CallBack')
        .DisplayQuestion;
    end;
```

- Dialog Customization Options

```delphi  
  uses
    Rick.Dialog,
    Rick.Dialog.Interfaces;
  begin
    LRICKDialog:= TRICKDialog.New;
    LRickDialog.Form(Self)
    LRickDialog.BackgroundOpacity(0.7)
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
      .MessagePrimaryButtonExecute(CarregarUsuario)
      .MessageSecondaryButtonColor(TAlphaColorRec.Aqua)
      .MessageSecondaryButtonText('Cancel')
      .MessageSecondaryButtonFontSize(17)
      .MessageSecondaryButtonFontColor($FFFFFFFF)
      .MessageSecondaryButtonExecute(CancelarCarregamento);
    LRickDialog.DisplayQuestion;
  end;
```
