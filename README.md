# RickDialog
<p align="center">
  <b>RickDialog</b> is a Delphi library designed to present a customized dialog screen. Using delphi's Fluent Interface.<br> 
</p>

<h2>⚙️ Install</h2>
<p>*Pre-requisites Delphi FMX</p>
<li><strong>Installation with BOSS</strong>: <br>
<pre>$ boss install https://github.com/ricksolucoes/rickdialog</pre>

<li><strong>Manual Installation</strong>: <br>
Add the following folders to your project, in <em>Project &gt; Options &gt; Resource Compiler &gt; Directories and Conditionals &gt; Include file search path</em></li>
<pre><code>../rickdialog/src</code></pre>

<h2>⚡️ How to use the project</h2>
<pre><code>../rickdialog/src</code></pre>

<li><strong>How to use Warning Dialog</strong>: <br>

<pre><span class="pl-k">uses</span>
  Rick.Dialog;

<span class="pl-k">implementation</span>

begin
  TRickDialog
    .New
      .MessageInfoText('Your message here')
      .MessagePrimaryButtonExecute('Info CallBack')
    .DisplayWarnig;
end;</span></pre>

<li><strong>How to use Info Dialog</strong>: <br>

<pre><span class="pl-k">uses</span>
  Rick.Dialog;

<span class="pl-k">implementation</span>

begin
  TRickDialog
    .New
      .MessageInfoText('Your message here')
      .MessagePrimaryButtonExecute('Info CallBack')
    .DisplayInfo;
end;</span></pre>

<li><strong>How to use Success Dialog</strong>: <br>

<pre><span class="pl-k">uses</span>
  Rick.Dialog;

<span class="pl-k">implementation</span>

begin
  TRickDialog
    .New
      .MessageInfoText('Your message here')
      .MessagePrimaryButtonExecute('Info CallBack')
    .DisplaySuccess;
end;</span></pre>

<li><strong>How to use Error Dialog</strong>: <br>

<pre><span class="pl-k">uses</span>
  Rick.Dialog;

<span class="pl-k">implementation</span>

begin
  TRickDialog
    .New
      .MessageInfoText('Your message here')
      .MessagePrimaryButtonExecute('Info CallBack')
    .DisplayError;
end;</span></pre>

<li><strong>How to use Question Dialog</strong>: <br>

<pre><span class="pl-k">uses</span>
  Rick.Dialog;

<span class="pl-k">implementation</span>

begin
  TRickDialog
    .New
      .MessageInfoText('Your message here')
      .MessagePrimaryButtonExecute('Info CallBack')
    .DisplayQuestion;
end;</span></pre>

<li><strong>Dialog Customization Options</strong>: <br>

<pre><span class="pl-k">uses</span>
  Rick.Dialog;

<span class="pl-k">implementation</span>

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
end;</span></pre>

<li><strong>Dialog Customization Options with Interface</strong>: <br>

<pre><span class="pl-k">uses</span>
  Rick.Dialog,
  Rick.Dialog.Interfaces;

<span class="pl-k">implementation</span>

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
</span></pre>
	  