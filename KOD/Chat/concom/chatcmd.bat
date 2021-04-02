@echo off 
title Chatcmd

:mm
cls
echo.
echo 1) Public Chat CMD
echo 2) Private Chat CMD
echo.
echo.
echo Enter a Selection
echo.
set /p sel=
if %sel% == 1 goto puc
if %sel% == 2 goto prc
if not %sel% == 1 goto err
if not %sel% == 2 goto err

:puc
cls
echo.
echo Pick A Command
echo.
echo 1) Back
echo 2) Enter Console message
echo 3) Clear The Chat
echo 4) Kick a User
echo.
set /p pusel=
if %pusel% == 1 goto mm
if %pusel% == 2 goto puecm
if %pusel% == 3 goto pucl
if %pusel% == 4 goto ku
if not %pusel% == 1 goto puerr
if not %pusel% == 2 goto puerr
if not %pusel% == 3 goto puerr
if not %pusel% == 3 goto puerr

:puecm
cls
echo.
echo Enter Console Message
set /p cm=
echo [CONSOLE] - %cm% >> KOD\Chat\pubchat\pubroom.ksd
goto puc

:pucl
cls
echo The CONSLE has cleared the chat! %cm% > KOD\Chat\pubchat\pubroom.ksd
cls
echo The Chat Has Been Cleared
pause>nul
goto puc





:prc
cls
echo.
echo Pick A Command
echo.
echo 1) Back
echo 2) Enter Console message
echo 3) Clear The Chat
echo 4) Kick a User
echo.
set /p prsel=
if %prsel% == 1 goto mm
if %prsel% == 2 goto precm
if %prsel% == 3 goto prcl
if %prsel% == 4 goto ku
if not %prsel% == 1 goto puerr
if not %prsel% == 2 goto puerr
if not %prsel% == 3 goto puerr
if not %prsel% == 4 goto puerr

:precm
cls
echo.
echo Enter Console Message
set /p cm=
echo [CONSOLE] - %cm% >> KOD\Chat\privchat\prroom.ksd
goto prc

:prcl
cls
echo The CONSLE has cleared the chat! %cm% > KOD\Chat\privchat\prroom.ksd
cls
echo The Chat Has Been Cleared
pause>nul
goto prc

:err 
cls
echo. 
echo That Is Not A Valid Selection!
pause>nul
goto mm

:puerr 
cls
echo.
echo That Is Not A Valid Selection!
pause>nul
goto puc

:ku
cls
echo.
type KOD\Admin\usernames.ksd
echo.
set /p ku=("Enter user to kick from chat")-
:kucheck
if not exist KOD\Users\%ku%\user.ksd goto kuerr
else goto accku
:accku
echo You Have Been Banned By The Admin! > KOD\Users\%ku%\bfc.ksd
cacls KOD\Users\%ku%\bfc.ksd /g s07995863:F
goto puc 

:kuerr
cls
echo There Is No User By That Name
Pause>nul
goto puc