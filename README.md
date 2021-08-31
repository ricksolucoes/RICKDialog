# RickDialog
<p align="center">
<img src=https://user-images.githubusercontent.com/79030707/131565040-ac370118-7342-4d6c-9406-0f4fe4c57c15.png height= 16% width=16%>	
<img src=https://user-images.githubusercontent.com/79030707/131565122-098f064d-4585-46be-85e9-9de43fff45fe.png height= 15.5% width=15.5%>
<img src=https://user-images.githubusercontent.com/79030707/131565786-94ad673b-8957-4584-9e4c-6a5cff4895cb.png height= 15.5% width=15.5%>	
<img src=https://user-images.githubusercontent.com/79030707/131565884-29c5c4d8-7224-4cb8-8ce9-5276ea8cd97b.png height= 15.5% width=15.5%>
<img src=https://user-images.githubusercontent.com/79030707/131565991-6794bb2c-3b26-4c39-97ff-dac9726c6a8d.png height= 17% width=15.5%>	
	
</p>
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
	  
