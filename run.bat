@echo off

:query_install
set /p "install=Do you want to install or uninstall or exit? (i/u/e): "

if %install% EQU i (
  echo "Installing!"
  robocopy /IS /E %~dp0GameData %~dp0..\GameData
  echo "Intalled :)"
) else if %install% EQU u (
  echo "Uninstalling!"
  robocopy /IS /E %~dp0Revert\GameData %~dp0..\GameData
  rmdir /s /q %~dp0..\GameData\vanilla\Worlds\TGJ
  echo "Uninstalled!"
  echo "Please remember to remove any saves using the custom scenario from %appdata%/SpaceEngineers2/AppData/SaveGames"
) else if %install% EQU e (
  goto quit
) else goto query_install

:quit
echo "Press any key to exit"
pause
