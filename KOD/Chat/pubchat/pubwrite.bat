@echo off
title Public Writer
:setup
cls
set /p user=<KOD\Users\%user%\user.ksd
set /p rank=<KOD\Users\%user%\rank.ksd
echo (%rank%)%user% Has Entered The Chat >> KOD\Chat\pubchat\pubroom.ksd
:chat
cls
echo.
echo Enter a Message...
echo.
set /p msg=
echo (%rank%)%user%- %msg% >> KOD\Chat\pubchat\pubroom.ksd
cacls KOD\Chat\pubchat\pubroom.ksd /g s07995863:F
goto chat



