[0]: https://github.com/ricksolucoes/boss "Site do BOOS"

# RickDialog

**RickDialog**  is a Delphi library designed to present a customized dialog screen. Using delphi's Fluent Interface.

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
				.MessageInfoText('Your message here')
				.MessagePrimaryButtonExecute('Info CallBack')
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
			.DisplayError;
	end;
```

- Dialog Customization Options

```delphi  
	uses
		Rick.Dialog,
		Rick.Dialog.Interfaces;
	var
		LRickDialog : iRickDialog;	
	begin
		LRickDialog:= TRickDialog.New;

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
