@ECHO OFF

:choice
set /P c=Are you sure you want to continue[Y/N]?
if /I "%c%" EQU "Y" goto :somewhere
if /I "%c%" EQU "N" goto :somewhere_else
goto :choice


:somewhere

echo "Please partition your hard disk using Diskpart. Starting DiskPart..."
D:\DiskPart.exe
echo "Please enter the drive letter followed by a colon and a forward slash from the drive where from there this program running."
echo "Please enter the drive letter followed by a colon and a forward slash from the drive where you want to install Windows."
set /p Drive=
echo "Please enter the number of the edition of windows you want to install."
dism.exe /Get-WimInfo /WimFile:D:\install.esd
set /p Edition=
echo "Installing Windows..."
D:\dism.exe /Apply-Image /ImageFile:D:\install.esd /index:%Edition% /ApplyDir:%Drive%
bcdboot %Drive%Windows
pause
echo "Please reboot your PC"
exit

:somewhere_else

echo "Please reboot your PC"
pause
exit