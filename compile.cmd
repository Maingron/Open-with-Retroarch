setlocal
set tempdir=%temp%\open_with_retroarch_compiler_%random%%random%
set tempdirsub=%tempdir%\compile
set sourcefile="%cd%\Open with Retroarch.cmd"
set sourceiconfile="%cd%\icon.ico"
set bat2execmd=bat2exe
set targetdir="%cd%"

mkdir %tempdir%
mkdir %tempdirsub%
copy %sourcefile% %tempdirsub%
copy %sourceiconfile% %tempdirsub%
@REM copy %bat2exe% %tempdir%

cd %tempdir%

call %bat2execmd% /source:"%tempdirsub%" /target:"%targetdir%" /y
cd %temp%
rmdir /S /q %tempdir%
