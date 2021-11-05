; -- Example1.iss --
; Demonstrates copying 3 files and creating an icon.

; SEE THE DOCUMENTATION FOR DETAILS ON CREATING .ISS SCRIPT FILES!

[Setup]
AppName=My Program
AppVersion=1.5
WizardStyle=modern
DefaultDirName={autopf}\My Program
DefaultGroupName=My Program
UninstallDisplayIcon={app}\MyProg.exe
Compression=lzma2
SolidCompression=yes
OutputDir=userdocs:Inno Setup Examples Output

[Files]
Source: "MyProg.exe"; DestDir: "{app}"
Source: "MyProg.chm"; DestDir: "{app}"
Source: "Readme.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\My Program"; Filename: "{app}\MyProg.exe"

[Code]
var PagePosInstall : TInputQueryWizardPage;
var caminho1 : TInputQueryWizardPage;
var caminho2 : TInputQueryWizardPage;
var PageOpcao : TInputOptionWizardPage;
var botao: TNewRadioButton;
var botao2: TNewRadioButton;
procedure InitializeWizard;
begin



PageOpcao := CreateInputOptionPage( 2, 'Custom wizard page controls', 'TButton and others', 'pagina com botoes?', True, False);
botao := TNewRadioButton.Create(PageOpcao);
botao.Caption := 'caminho1';
botao.Parent := PageOpcao.Surface;
botao.Top := 168 - 120;
botao.Left := 6;
botao.Width := 20 * 5;
botao.Checked := False;
//PageOpcao.Add('caminho1');
//PageOpcao.Add('caminho2');
//PageOpcao.value[0] := 
//PageOpcao.value[1] :=
botao2 := TNewRadioButton.Create(PageOpcao);
botao2.Caption := 'caminho2';
botao2.Parent := PageOpcao.Surface;
botao2.Top := 28;
botao2.Left := 6;
botao2.Width := 20 * 5;
botao.Checked := False;

//ta verificando quando inicia

end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
if(botao.Checked) then
begin      //só vai mostrar a página personalizada pós instalação se uma opção específica foi escolhida
   PagePosInstall := CreateInputQueryPage(wpInfoAfter, 'Custom wizard page controls', 'TButton and others', 'qualquer coisa');
    PagePosInstall.Add('campo', False);//textbox
end
//else if(botao2.Checked) then
//begin
  //PagePosInstall := CreateInputQueryPage(4 , 'Custom wizard page controls', 'TButton and others', 'caminho 2 encontrado');
//end;
end;