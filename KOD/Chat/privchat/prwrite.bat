@echo off
title Private Writer
:setup
cls
set /p user=<KOD\Users\%user%\user.ksd
set /p rank=<KOD\Users\%user%\rank.ksd
echo (%rank%)%user% Has Entered The Chat >> KOD\Chat\privchat\prroom.ksd
:chat
cls
echo.
echo Enter a Message...
echo.
set /p msg=
echo (%rank%)%user%- %msg% >> KOD\Chat\privchat\prroom.ksd
cacls KOD\Chat\privchat\prroom.ksd /g s07995863:F
goto chat


