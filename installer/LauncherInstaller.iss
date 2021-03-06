; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "TERA Private"
#define MyAppVersion "1.0.1.52"
#define MyAppExeName "Launcher.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{93FC3EA8-A163-473C-BBE7-A9AD9CB6A64E}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
DefaultDirName={code:GetDefaultDirName}
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=.\out
OutputBaseFilename=LauncherInstaller_{#MyAppVersion}
SetupIconFile=.\data\TERA.ico
Compression=lzma
SolidCompression=yes
DisableReadyPage=yes
;WizardStyle=modern

[Code]
function GetDefaultDirName(Param: string): string;
begin
  if (FileExists(ExpandConstant('{src}\version.ini'))) then begin
    Result := ExpandConstant('{src}');
  end
  else begin
    Result := 'C:\Games\' + ExpandConstant('{#MyAppName}')
  end;
end;
function ShouldSkipPage(PageID: Integer): Boolean;
begin
   Result := FileExists(ExpandConstant('{src}\version.ini'));
end;
function ShouldRun: Boolean;
begin
  Result := FileExists(ExpandConstant('{src}\version.ini'));
end;
function ShouldDesktopIcon: Boolean;
begin
  Result := not FileExists(ExpandConstant('{src}\version.ini'));
end;

[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Check: ShouldDesktopIcon

[Files]
Source: ".\data\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
;Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: {app}\Launcher.exe; Flags: shellexec skipifsilent nowait; Check: ShouldRun

[UninstallDelete]
Type: filesandordirs; Name: "{app}"
