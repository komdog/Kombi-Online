@echo off
title Kombi Online
	:set
color 1b
	:startup
if exist KOD\Admin goto info
else goto md
:md
cls
md KOD\Users
md KOD\Admin
md KOD\Chat
echo y| cacls KOD /e /p s07995863:F
echo y| cacls KOD\Users /e /p s07995863:F
echo y| cacls KOD\Admin /e /p s07995863:F
echo y| cacls KOD\Chat /e /p s07995863:F
attrib KOD +s +r +h
cls
goto info

	:kicked
	set /p reason=< KOD\Users\%user%\kick.bans
cls
echo You Have Been Kicked!
echo.
echo Reason: %reason%
pause>nul
goto loginmenu
	:err1
cls
echo Not A Valid Selection!
Pause>nul
goto loginmenu
	:err2
cls
echo You Entered An Incorrect or Unregistered Username!
Pause>nul
goto loginmenu
	:err3
cls
echo You Entered An Incorrect Password!
Pause>nul
goto loginmenu
	:err4
cls
echo You Have Created An Account Already!
Pause>nul
goto mainmenu
	:err5
cls
echo There Is No Profile By That Name
Pause>nul
goto mainmenu
	:err6
cls
echo Not A Valid Selection!
Pause>nul
goto friendlist
	:err7
cls
echo Not A Valid Selection!
Pause>nul
goto mainmenu
	:err8
cls
echo You Need a Profile To Do This
Pause>nul
goto mainmenu
	:err9
cls
echo You Have No Friends
Pause>nul
goto friendlist
	:err10
cls
echo Not A Valid Selection!
Pause>nul
goto admindb
	:err11
cls
echo Your rank is %rank% You Need to be Admin To Access This.
Pause>nul
goto mainmenu
	:aerr
cls
echo Your rank is %rank% You Need to be Owner To Access This.
Pause>nul
goto admindb
	:saerr
cls
echo Your rank is %rank% You Need to be SuperAdmin To Access This.
Pause>nul
goto admindb
	:rankerr
cls
echo There Is No User By That Name
Pause>nul
goto admindb
	:banerr
cls
echo There Is No User By That Name
Pause>nul
goto admindb
	:chaterr
cls
echo Not A Valid Selection!
Pause>nul
goto mainmenu
	:mingeerr
cls
echo Minges Cant Do This!
Pause>nul
goto mainmenu
	:aerr2
cls
echo Your rank is %rank% You Need to be Owner To Access This.
Pause>nul
goto chatrooms

	:info
echo.
echo %username% logged in at %time% on %date%
echo -----------------------------------------------------
echo Welcome To Kombi Online v2.0                    
echo Created By James Gordon
echo.
echo Rules:
echo.
echo 1.Dont Disrespect Admins
echo 2.Dont Spam The Chatroom
echo 3.Dont Try to Hack your Rank
echo 4.Dont Abuse Your Admin Powers If You Have them
echo 5.Dont Complain If You Are Kicked
echo 6.Dont Use Profanity on Chat or you will be kicked
echo.
echo How To Become Admin:
echo.
echo 1.Join The Server Regularly
echo 2.Be Respectful To Admins
echo 3.Contribute To Kombi Studios
echo 4.Dontaion Gets Admin Instantly
echo 5.Be a Good Moderator
echo.
echo Copyright (C) KombiStudios 2012
echo -----------------------------------------------------
echo.
echo Press any key to goto the Kombi Online Menu...
pause>nul
goto loginmenu


	:loginmenu
cls
echo.
echo 1) Login
echo 2) Create Account
echo.
echo.
set /p sel=("Enter Selection")-
if %sel% == 1 goto LI
if %sel% == 2 goto CA
if not %sel% == 1 goto loginerr
if not %sel% == 2 goto loginerr
	:LI
	cls
	echo ("Enter Your Username")
	set /p user=
	set /p user2= < KOD\Users\%user%\user.ksd
	if Exist KOD\Users\%user%\kick.bans goto kicked
	else goto acc
	:acc
	cls
	if %user% == %user2% goto pass
	else
	goto err2
	:pass
	cls
	set /p pass=("Enter A Your Password")-
	set /p pass2= < KOD\Users\%user%\pass.ksd
	if %pass% == %pass2% goto exsettings
	else
	goto err3
	
	:CA
	cls
	set /p cuser=("Create A Username")-
	md KOD\Users\%cuser%
	echo y| cacls KOD\Users\%cuser% /e /p s07995863:F
	echo %cuser% > KOD\Users\%cuser%\user.ksd
	echo %cuser% >> KOD\Admin\usernames.ksd
	echo y| cacls KOD\Admin\usernames.ksd /e /p s07995863:F
	echo y| cacls KOD\Users\%cuser%\user.ksd /e /p s07995863:F
	cls
	set /p cpass=("Create A Password")-
	echo %cpass% > KOD\Users\%cuser%\pass.ksd
	echo y| cacls KOD\Users\%cuser%\pass.ksd /e /p s07995863:F
	cls
	echo You Have Created A Kombi Studios Network Account! :D
	pause>nul
	goto loginmenu

	:exsettings
if Not Exist KOD\Users\%user%\rank.ksd goto crank
else
goto fach
	:crank
Echo Guest> KOD\Users\%user%\rank.ksd
echo y| cacls KOD\Users\%user%\rank.ksd /e /p s07995863:F
goto fach
	:fach
if Not Exist KOD\Users\%user%\achs.ksd goto cach	
else goto loginmenu	
	:cach
echo First Login > KOD\Users\%user%\achs.ksd
echo y| cacls KOD\Users\%user%\achs.ksd /e /p s07995863:F
goto mainmenu


	:mainmenu
set /p mcol=<KOD\Users\%user%\color.ksd
set /p rank=<KOD\Users\%user%\rank.ksd
color %mcol%
cls
echo.
echo Welcome %user% Your Rank is %rank%
echo.
echo 1) Admin Database
echo 2) Create Profile
echo 3) Load Profile
echo 4) Friend List
echo 5) Set color
echo 6) View Achievements
echo 7) View Rankings
echo 8) Search Profiles
echo 9) Goto ChatRoom
echo 10) About Kombi Online
echo.
echo.
set /p msel=("Enter A Number To Pick A Selection")-
if %msel% == 1 goto admindb
if %msel% == 2 goto createprof
if %msel% == 3 goto loadprof
if %msel% == 4 goto friendlist
if %msel% == 5 goto setcol
if %msel% == 6 goto viewach
if %msel% == 7 goto viewranks
if %msel% == 8 goto searchprof
if %msel% == 9 goto chatrooms
if %msel% == 10 goto about
if not %msel% == 1 goto err7
if not %msel% == 2 goto err7
if not %msel% == 3 goto err7
if not %msel% == 4 goto err7
if not %msel% == 5 goto err7
if not %msel% == 6 goto err7
if not %msel% == 7 goto err7
if not %msel% == 8 goto err7
if not %msel% == 9 goto err7
if not %msel% == 10 goto err7
Pause>nul

	:admindb
if %rank% == Owner goto AAD
if %rank% == SuperAdmin goto AAD
if %rank% == Admin goto AAD
if %rank% == Respected goto err11
if %rank% == Moderator goto err11
if %rank% == Regular goto err11
if %rank% == Guest goto err11
if %rank% == Minge goto err11
:AAD
cls
echo.
echo 1) Back
echo 2) Set Rankings
echo 3) Give Achievements
echo 4) Kick/Ban Account
echo 5) Unban Account
echo.
echo.
set /p asel=("Enter Selection")-
if %asel% == 1 goto mainmenu
if %asel% == 2 goto SR
if %asel% == 3 goto GA
if %asel% == 4 goto KB
if %asel% == 5 goto UB
if not %asel% == 1 goto err10
if not %asel% == 2 goto err10
if not %asel% == 3 goto err10
if not %asel% == 4 goto err10
if not %asel% == 5 goto err10
	:SR
	if %rank% == Owner goto ASR
	if %rank% == SuperAdmin goto aerr
	if %rank% == Admin goto aerr
	if %rank% == Respected goto aerr
	if %rank% == Moderator goto aerr 
	if %rank% == Regular goto aerr
	if %rank% == Guest goto aerr
	if %rank% == Minge goto aerr
	:ASR
	cls
	echo.
	type KOD\Admin\usernames.ksd
	echo.
	set /p run=("Enter User to Rank")-
	:rankcheck
	if not exist KOD\Users\%run%\user.ksd goto rankerr
	else goto cr
	:cr
	cls
	echo #1 - Owner
	echo #2 - SuperAdmin
	echo #3 - Admin
	echo #4 - Respected
	echo #5 - Moderator
	echo #6 - Regular
	echo #7 - Member
	echo #8 - Guest
	echo #9 - Minge
	echo.
	set /p applyrank=("Enter Ranking For %run%")-
	if %applyrank% == 1 goto r1
	if %applyrank% == 2 goto r2
	if %applyrank% == 3 goto r3
	if %applyrank% == 4 goto r4
	if %applyrank% == 5 goto r5
	if %applyrank% == 6 goto r6
	if %applyrank% == 7 goto r7
	if %applyrank% == 8 goto r8
	if %applyrank% == 9 goto r9
	:r1
	echo Owner > KOD\Users\%run%\rank.ksd
	goto mainmenu
	:r2
	echo SuperAdmin > KOD\Users\%run%\rank.ksd
	goto mainmenu
	:r3
	echo Admin > KOD\Users\%run%\rank.ksd
	goto mainmenu
	:r4
	echo Respected > KOD\Users\%run%\rank.ksd
	goto mainmenu
	:r5
	echo Moderator > KOD\Users\%run%\rank.ksd
	goto mainmenu
	:r6
	echo Regular > KOD\Users\%run%\rank.ksd
	goto mainmenu
	:r7
	echo Member > KOD\Users\%run%\rank.ksd
	goto mainmenu
	:r8
	echo Guest > KOD\Users\%run%\rank.ksd
	goto mainmenu
	:r9
	echo Minge > KOD\Users\%run%\rank.ksd
	goto mainmenu
	:GA
	if %rank% == Owner goto AGA
	if %rank% == SuperAdmin goto AGA
	if %rank% == Admin goto AGA
	if %rank% == Respected goto aerr2
	if %rank% == Moderator goto aerr2
	if %rank% == Regular goto aerr2
	if %rank% == Guest goto aerr2
	if %rank% == Minge goto aerr2
	:AGA
	cls
	echo.
	type KOD\Admin\usernames.ksd
	echo.
	set /p achun=("Enter User to Give Achievement Too")-
	:achcheck
	if not exist KOD\Users\%achun%\user.ksd goto rankerr
	else goto ach
	:ach
	cls
	set /p ach=("Enter Achievement For %achun%")-
	echo %ach% >> KOD\Users\%achun%\achs.ksd
	echo y| cacls KOD\Users\%user%\achs.ksd /e /p s07995863:F
	goto mainmenu
	:KB
	if %rank% == Owner goto AKB
	if %rank% == SuperAdmin goto AKB
	if %rank% == Admin goto saerr
	if %rank% == Respected goto saerr
	if %rank% == Moderator goto saerr
	if %rank% == Regular goto saerr
	if %rank% == Guest goto saerr
	if %rank% == Minge goto saerr
	:AKB
	cls
	echo.
	type KOD\Admin\usernames.ksd
	echo.
	set /p kbun=("Enter User to Kick/Ban")-
	:bancheck
	if not exist KOD\Users\%kbun%\user.ksd goto banerr
	else goto ban
	:ban
	cls
	set /p kre=("Enter Reason For Kicking %kbun%")-
	echo %kre% >> KOD\Users\%kbun%\kick.bans
	echo y| cacls KOD\Users\%kbun%\kick.bans /e /p s07995863:F
	goto mainmenu
	:UB
	if %rank% == Owner goto AUB
	if %rank% == SuperAdmin goto AUB
	if %rank% == Admin goto AUB
	if %rank% == Respected goto err11
	if %rank% == Moderator goto err11
	if %rank% == Regular goto err11
	if %rank% == Guest goto err11
	if %rank% == Minge goto err11
	:AUB
	cls
	echo.
	type KOD\Admin\usernames.ksd
	echo.
	set /p unb=("Enter User to Unban")-
	:bancheck
	if not exist KOD\Users\%unb%\user.ksd goto banerr
	else goto unban
	:unban
	cls
	del KOD\Users\%unb%\kick.bans
	goto mainmenu

	:createprof
if %rank% == Minge goto mingeerr
if exist KOD\Users\%user%\Profile\fname.ini goto err4
else goto cp
	:cp
md KOD\Users\%user%\Profile
echo y| cacls KOD\Users\%user%\Profile /e /p s07995863:F
cls
echo.
echo Welcome To The Profile Creator!
echo Please Enter The Required Information. THX! :3
echo.
set /p fname=("Your First Name Only")-
echo %user% >> KOD\Admin\Profiles.ksd
echo y| cacls KOD\Admin\Profiles.ksd /e /p s07995863:F
echo %fname% > KOD\Users\%user%\Profile\fname.ini
echo y| cacls KOD\Users\%user%\Profile\fname.ini /e /p s07995863:F
cls
set /p lname=("Your Last Name Only")-
echo %lname% > KOD\Users\%user%\Profile\lname.ini
echo y| cacls KOD\Users\%user%\Profile\lname.ini /e /p s07995863:F
cls
set /p age=("Your Age")-
echo %age% > KOD\Users\%user%\Profile\age.ini
echo y| cacls KOD\Users\%user%\Profile\age.ini /e /p s07995863:F
cls
set /p bday=("Your Birthday") MM/DD/YYYY -
echo %bday% > KOD\Users\%user%\Profile\bday.ini
echo y| cacls KOD\Users\%user%\Profile\bday.ini /e /p s07995863:F
cls
set /p desc=("Enter A Message For Your Profile")-
echo %desc% > KOD\Users\%user%\Profile\desc.ini
echo y| cacls KOD\Users\%user%\Profile\desc.ini /e /p s07995863:F
echo %user% > KOD\Users\%user%\Profile\user.ini
echo y| cacls KOD\Users\%user%\Profile\user.ini /e /p s07995863:F
cls
echo You Have Now Create A User Profile.
echo You Can Now Load Your Profile By Typing Your First Name
echo You Can Now Also Add Friend To Your Friend List :3
echo.
echo Press any key to goto the Kombi Online Menu...
pause>nul
goto mainmenu

	:loadprof
if %rank% == Minge goto mingeerr
cls
echo.
echo Here You Can Load Anyones Profile.
echo.
set /p ps=("Enter The Username Of The Profile")-
if not exist KOD\Users\%ps%\Profile\fname.ini goto err5
else goto read
	:read
set /p var1=< KOD\Users\%ps%\Profile\fname.ini
set /p var2=< KOD\Users\%ps%\Profile\lname.ini
set /p var3=< KOD\Users\%ps%\Profile\age.ini
set /p var4=< KOD\Users\%ps%\Profile\bday.ini
set /p var5=< KOD\Users\%ps%\Profile\user.ini
set /p var7=< KOD\Users\%ps%\rank.ksd
set /p var6=< KOD\Users\%ps%\Profile\desc.ini
cls
echo.
echo First Name: %var1%
echo.
echo Last Name: %var2%
echo.
echo Age: %var3%
echo.
echo Birthday %var4%
echo.
echo Username: %var5%
echo.
echo Rank: %var7%
echo.
echo Description: %var6%
pause>nul
goto mainmenu

	:friendlist
if %rank% == Minge goto mingeerr
cls
if not exist KOD\Users\%user%\Profile\fname.ini goto err8
else goto facc
	:facc
cls
echo.
echo 1) Add a Friend
echo 2) Clear Your Friends List
echo 3) View Friend List
echo 4) Back
echo.
echo.
set /p fsel=("Enter a Selection")-
if %fsel% == 1 goto af
if %fsel% == 2 goto cl
if %fsel% == 3 goto vl
if %fsel% == 4 goto bk
if not %fsel% == 1 goto err6
if not %fsel% == 2 goto err6
if not %fsel% == 3 goto err6
if not %fsel% == 4 goto err6
	:af
cls
echo.
echo Here You Can Add Freinds To Your List.
echo.
set /p fa=("Enter The Username Of The Profile")-
if not exist KOD\Users\%fa%\Profile\fname.ini goto err5
else goto add
	:add
md KOD\Users\%user%\Profile\Friends
echo y| cacls KOD\Users\%user%\Profile\Friends /e /p s07995863:F
cls
echo %fa% >> KOD\Users\%user%\Profile\Friends\Friend.ksd
echo y| cacls KOD\Users\%user%\Profile\Friends\Friends.ksd /e /p s07995863:F
cls
echo.
echo You Have Added %fa%
echo.
pause>nul
goto facc
	:cl
cls
del KOD\Users\%user%\Profile\Friends\Friend.ksd
cls
echo.
echo You Have Cleared Your Friends.
echo.
pause>nul
goto facc
	:vl
if not exist KOD\Users\%user%\Profile\Friends\Friend.ksd goto err9
else goto avl
	:avl
cls
echo.
echo -----------------------
echo. Your Friends:
echo -----------------------
echo.
type KOD\Users\%user%\Profile\Friends\Friend.ksd
pause>nul
goto friendlist
	:bk
goto mainmenu

	:setcol
if %rank% == Minge goto mingeerr
cls
echo.
echo -----------------------------------------
echo 0 = Black			A = Light Green
echo 1 = Blue			B = Light Aqua
echo 2 = Green			C = Light Red
echo 3 = Aqua			D = Light Purple
echo 4 = Red				E = Light Yellow
echo 5 = Purple			F = Bright White
echo 6 = Yellow
echo 7 = White
echo 8 = Gray
echo 9 = Light Blue
echo -----------------------------------------
echo.
set /p col=("Enter a Color")-
echo %col% > KOD\Users\%user%\color.ksd
echo y| cacls KOD\Users\%user%\color.ksd /e /p s07995863:F
goto mainmenu

	:viewach
cls
echo.
echo ----------------------
echo Your Achievements:
echo ----------------------
type KOD\Users\%user%\achs.ksd
pause>nul
goto mainmenu

	:viewranks
cls
echo.
echo ----------------------------------
echo RANKS:
echo ----------------------------------
echo :Highest Class:
echo #1 - Owner
echo #2 - SuperAdmin
echo #3 - Admin
echo ----------------------------------
echo :High Class:
echo #4 - Respected
echo #5 - Moderator
echo ----------------------------------
echo :Middle Class
echo #6 - Regular
echo #7 - Member
echo ----------------------------------
echo :Low Class:
echo #8 - Guest
echo ----------------------------------
echo :Lowset Class:
echo #9 - Minge
echo ----------------------------------
echo.
echo Press any key to return the Kombi Online Menu...
pause>nul
goto mainmenu

	:searchprof
cls
echo.
echo ---------------
echo Profiles:
echo ---------------
echo.
type KOD\Admin\Profiles.ksd
echo.
echo Press any key to return the Kombi Online Menu...
pause>nul
goto mainmenu

:chatrooms
if %rank% == Minge goto mingeerr
cls
echo.
echo Welcome To The Kombi Studios Chat Room
echo.
echo 1) Public Room
echo 2) Admin Room
echo 3) Command Center
echo 4) Back
echo.
echo.
set /p room=("Enter And Number To Enter A Chatroom")-
if %room% == 1 goto pubchat
if %room% == 2 goto privchat
if %room% == 3 goto comcen
if %room% == 4 goto mainmenu
if not %room% == 1 goto chaterr
if not %room% == 2 goto chaterr
if not %room% == 3 goto chaterr
if not %room% == 4 goto chaterr
	:pubchat
cls
echo Instructions:
echo.
echo When you press a key two windows will open. One window
echo opens the reader. The reader will show you what 
echo everyone on the chatroom is saying. Another Window Is The
echo Writer. The writer is where you type your message. To exit
echo the chat properly look at your main screen and type 1 on 
echo the list of commands. Thank You :3
pause>nul 
	:openpchat
start KOD\Chat\pubchat\pubread.bat
start KOD\Chat\pubchat\pubwrite.bat
goto chatrooms
	:privchat
if %rank% == Owner goto apri
if %rank% == SuperAdmin goto apri
if %rank% == Admin goto apri
if %rank% == Respected goto err11
if %rank% == Moderator goto err11
if %rank% == Regular goto err11
if %rank% == Guest goto err11
if %rank% == Minge goto err11
:apri
cls
echo Instructions:
echo.
echo When you press a key two windows will open. One window
echo opens the reader. The reader will show you what 
echo everyone on the chatroom is saying. Another Window Is The
echo Writer. The writer is where you type your message. type 1 on
echo the list of commands. Thank You :3
echo.
echo WELCOME ADMIN!
pause>nul 
	:openprchat
start KOD\Chat\privchat\prread.bat
start KOD\Chat\privchat\prwrite.bat

	:comcen
if %rank% == Owner goto cc
if %rank% == SuperAdmin goto aerr2
if %rank% == Admin goto aerr2
if %rank% == Respected goto aerr2
if %rank% == Moderator goto aerr2
if %rank% == Regular goto aerr2
if %rank% == Guest goto aerr2
if %rank% == Minge goto aerr2

:cc
start KOD\Chat\concom\chatcmd.bat
goto chatrooms

	:about
cls
echo.
echo Your Rank Is %rank%
echo.
echo -----------------------------------------------------
echo Welcome To Kombi Online v2.0
echo Created By James Gordon
echo.
echo Rules:
echo.
echo 1.Dont Disrespect Admins
echo 2.Dont Spam The Chatroom
echo 3.Dont Try to Hack your Rank
echo 4.Dont Abuse Your Admin Powers If You Have them
echo 5.Dont Complain If You Are Kicked
echo 6.Dont Use Profanity on Chat or you will be kicked
echo.
echo How To Become Admin:
echo.
echo 1.Join The Server Regularly
echo 2.Be Respectful To Admins
echo 3.Contribute To Kombi Studios
echo 4.Donation Gets Admin Instantly
echo 5.Be a Good Moderator
echo.
echo Copyright (C) KombiStudios 2012
echo -----------------------------------------------------
echo.
echo Press any key to goto the Kombi Online Menu...
pause>nul
goto mainmenu