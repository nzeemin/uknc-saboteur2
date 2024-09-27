@echo off
set rt11dsk=C:\bin\rt11dsk

del x-ukncbtl\sabot2.dsk
@if exist "x-ukncbtl\sabot2.dsk" (
  echo.
  echo ####### FAILED to delete old disk image file #######
  exit /b
)
copy x-ukncbtl\sys1002ex.dsk sabot2.dsk
copy S2CORE.SAV SABOT2.SAV
%rt11dsk% a sabot2.dsk SABOT2.SAV
move sabot2.dsk x-ukncbtl\sabot2.dsk

@if not exist "x-ukncbtl\sabot2.dsk" (
  echo ####### ERROR disk image file not found #######
  exit /b
)

start x-ukncbtl\UKNCBTL.exe /boot
