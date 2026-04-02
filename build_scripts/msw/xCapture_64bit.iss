; -- xCapture_64bit.iss --
; Installer for xCapture standalone

#include "xCapture_common.iss"

#define Bits 64

[Setup]
ChangesEnvironment=yes
DisableDirPage=no
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible

AppName={#MyTitleName}
AppVersion={#Year}.{#Version}{#Other}
DefaultDirName={commonpf64}\{#MyTitleName}{#Other}
DefaultGroupName={#MyTitleName}{#Other}
SetupIconFile=..\..\include\xcapture64.ico
UninstallDisplayIcon={app}\{#MyTitleName}.exe
Compression=lzma2
SolidCompression=yes
OutputDir=output
OutputBaseFilename={#MyTitleName}{#Bits}_{#Year}_{#Version}{#Other}

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "Do you want to create desktop icon?"; Flags: checkablealone

[Files]
; xCapture
Source: "../../xCapture/x64/Release/xCapture.exe"; DestDir: "{app}"
Source: "../../include\xcapture64.ico"; DestDir: "{app}"; Flags: "ignoreversion"

; libcurl
Source: "../../bin/libcurl-x64.dll"; DestDir: "{app}"; Flags: "ignoreversion"

; readmes and licenses
Source: "../../LICENSE"; DestDir: "{app}";

; VC++ Redistributable
Source: "vcredist/vc_redist.x64.exe"; DestDir: {tmp}; Flags: deleteafterinstall

[Icons]
Name: "{group}\xCapture"; Filename: "{app}\xCapture.EXE"; WorkingDir: "{app}"
Name: "{commondesktop}\xCapture"; Filename: "{app}\xCapture.EXE"; WorkingDir: "{app}"; Tasks: desktopicon; IconFilename: "{app}\xcapture64.ico";

[Run]
Filename: {tmp}\vc_redist.x64.exe; \
    Parameters: "/q /passive /norestart /Q:a /c:""msiexec /q /i vcredist.msi"""; \
    StatusMsg: "Installing VC++ Redistributables..."

Filename: "{app}\xCapture.exe"; Description: "Launch application"; Flags: postinstall nowait skipifsilent

[Registry]
Root: HKCU; Subkey: "Software\xCapture"; Flags: uninsdeletekey
