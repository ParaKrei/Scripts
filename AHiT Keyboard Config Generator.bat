@echo off
title ParaKrei's AHiT Keyboard Config Generator
SetLocal EnableDelayedExpansion
set keyAmount=0
set i=0
set actionPlaced=0
set "lastAction=blank"
set "lastKey=blank"
set b-f=0
set f-b=0
set r-l=0
set l-r=0

:intro
echo -------------------------------------------------------------------------
echo  Welcome to ParaKrei's AHiT Keyboard Config Generator^^! (July 24, 2022)
echo -------------------------------------------------------------------------
echo.
echo This script was designed to provide a quicker way of creating a custom configuration for keyboard controls in A Hat in Time.
echo.
echo.
echo Moving on over to the bind setup now...
goto appendKeyCodes

:selectingAction
cls
echo Here we are^^!
echo First, before you map any keys, you need to select the action you want to map the key(s) to.
echo If you need to see the list of actions...
echo type in help to get a list. (Type the actions in as lower-case.)
set /p "input=I want to map keys to: "
set chosenAction=%input%

if %chosenAction% EQU help goto actionHelp
goto actionCheck

:actionHelp
cls
echo I see that you would like the list of actions.
echo As promised, I shall fetch the list. Ahem...
echo.
echo --MOVEMENT--
echo forwards = Moves the player forwards.
echo backwards = Moves the player backwards.
echo left = Moves the player left.
echo right = Moves the player right.
echo --ACTIONS--
echo jump = Makes the player jump. Duh.
echo attack = Makes the player attack, usually swinging the weapon Hat Kid is carrying, or firing a gun.
echo interact = The button used to interact with objects like doors, switches, NPCs, etc.
echo emote = Brings up the Emote Wheel.
echo share = Activates photo mode/the Camera Badge.
echo crouch = The crouch/dive button.
echo camerasnap = Resets the camera to the behind of Hat Kid. Effectively a camera reset button.
echo zoomin = Zooms the camera in.
echo zoomout = Zooms the camera out.
echo ability = The hat ability button.
echo abilityswap = Pulls up the menu to change hats. (Also known as the Hat Wheel.)
echo --MENU NAVIGATION--
echo confirm = Confirms/accepts an option, like the A button. (Originally mapped to lmb.)
echo cancel = Cancels/denies an option, like the B button. (Originally mapped to rmb.)
echo start = Pulls up the menu, like the START button. (I would recommend mapping this to escape.)
echo pgleft = Goes back a page.
echo pgright = Goes forwards a page.
echo --OTHER--
echo hotleft = Quick hat swap going left, essentially the left direction on the D-PAD.
echo hotright = Quick hat swap going right, essentially the right direction on the D-PAD.
echo hotup = Hat Kid's "Bleh" expression, essentially the up direction on the D-PAD.
echo hotdown = Hat Kid's kissing expression, essentially the down direction on the D-PAD.
pause
goto selectingAction

:actionCheck
if %chosenAction% EQU forwards goto bindingKeys
if %chosenAction% EQU backwards goto bindingKeys
if %chosenAction% EQU left goto bindingKeys
if %chosenAction% EQU right goto bindingKeys
if %chosenAction% EQU jump goto bindingKeys
if %chosenAction% EQU attack goto bindingKeys
if %chosenAction% EQU interact goto bindingKeys
if %chosenAction% EQU emote goto bindingKeys
if %chosenAction% EQU crouch goto bindingKeys
if %chosenAction% EQU share goto bindingKeys
if %chosenAction% EQU camerasnap goto bindingKeys
if %chosenAction% EQU zoomin goto bindingKeys
if %chosenAction% EQU zoomout goto bindingKeys
if %chosenAction% EQU confirm goto bindingKeys
if %chosenAction% EQU cancel goto bindingKeys
if %chosenAction% EQU start goto bindingKeys
if %chosenAction% EQU pgright goto bindingKeys
if %chosenAction% EQU pgleft goto bindingKeys
if %chosenAction% EQU ability goto bindingKeys
if %chosenAction% EQU abilityswap goto bindingKeys
if %chosenAction% EQU hotup goto bindingKeys
if %chosenAction% EQU hotdown goto bindingKeys
if %chosenAction% EQU hotleft goto bindingKeys
if %chosenAction% EQU hotright goto bindingKeys
echo That isn't an action. Please try again...
echo Remember, if you don't know the actions, type in help.
timeout 2
goto selectingAction

:bindingKeys
cls
echo Now that you've selected the action, we will now be setting keys to execute said action.
echo Down below, you will need to enter the key you want to start mapping the action to.
echo [The mouse buttons are: LMB (Left Mouse Button/Left Click), RMB (Right Mouse Button/Right Click), MMB (Middle Mouse Button/Scroll Wheel Button), MB4 (4th Mouse Button), MB5 (5th Mouse Button)]
echo [The mouse wheel directions are: wheelup (Mouse Wheel Up), wheeldown (Mouse Wheel Down)]
echo [To enter the arrow keys, type in the direction name.]
echo [Caps Lock = capslk, Print Screen = prtsc, Scroll Lock = scrlk, Page Up = pgup, Page Down = pgdn, Num Lock = numlk, Control = ctrl, Space Bar = space. Otherwise, you spell out the whole name.]
echo [For any key with a left and right variant, put either a l or r before the original name, for example: Left Ctrl = lctrl.]
echo [The numpad numbers have the prefix "num", so, for example, Numpad 0 would look like num0.]
echo [Minus (-), and Divide (/), are duplicates of Hyphen (-) and Slash (/), so they have the "num" prefix as well.]
set /p "input=Input key here, please enter the key in lowercase: "
set chosenKey=%input%

goto getKeyCode

:getKeyCode
set chosenKey_Code=-1
if %chosenKey% EQU lmb set chosenKey_Code=1
if %chosenKey% EQU rmb set chosenKey_Code=2
if %chosenKey% EQU mmb set chosenKey_Code=4
if %chosenKey% EQU mb4 set chosenKey_Code=5
if %chosenKey% EQU mb5 set chosenKey_Code=6
if %chosenKey% EQU backspace set chosenKey_Code=8
if %chosenKey% EQU tab set chosenKey_Code=9
if %chosenKey% EQU enter set chosenKey_Code=13
if %chosenKey% EQU capslk set chosenKey_Code=20
if %chosenKey% EQU escape set chosenKey_Code=27
if %chosenKey% EQU space set chosenKey_Code=32
if %chosenKey% EQU pgup set chosenKey_Code=33
if %chosenKey% EQU pgdn set chosenKey_Code=34
if %chosenKey% EQU end set chosenKey_Code=35
if %chosenKey% EQU home set chosenKey_Code=36
if %chosenKey% EQU left set chosenKey_Code=37
if %chosenKey% EQU up set chosenKey_Code=38
if %chosenKey% EQU right set chosenKey_Code=39
if %chosenKey% EQU down set chosenKey_Code=40
if %chosenKey% EQU insert set chosenKey_Code=45
if %chosenKey% EQU delete set chosenKey_Code=46
if %chosenKey% EQU 0 set chosenKey_Code=48
if %chosenKey% EQU 1 set chosenKey_Code=49
if %chosenKey% EQU 2 set chosenKey_Code=50
if %chosenKey% EQU 3 set chosenKey_Code=51
if %chosenKey% EQU 4 set chosenKey_Code=52
if %chosenKey% EQU 5 set chosenKey_Code=53
if %chosenKey% EQU 6 set chosenKey_Code=54
if %chosenKey% EQU 7 set chosenKey_Code=55
if %chosenKey% EQU 8 set chosenKey_Code=56
if %chosenKey% EQU 9 set chosenKey_Code=59
if %chosenKey% EQU a set chosenKey_Code=65
if %chosenKey% EQU b set chosenKey_Code=66
if %chosenKey% EQU c set chosenKey_Code=67
if %chosenKey% EQU d set chosenKey_Code=68
if %chosenKey% EQU e set chosenKey_Code=69
if %chosenKey% EQU f set chosenKey_Code=70
if %chosenKey% EQU g set chosenKey_Code=71
if %chosenKey% EQU h set chosenKey_Code=72
if %chosenKey% EQU i set chosenKey_Code=73
if %chosenKey% EQU j set chosenKey_Code=74
if %chosenKey% EQU k set chosenKey_Code=75
if %chosenKey% EQU l set chosenKey_Code=76
if %chosenKey% EQU m set chosenKey_Code=77
if %chosenKey% EQU n set chosenKey_Code=78
if %chosenKey% EQU o set chosenKey_Code=79
if %chosenKey% EQU p set chosenKey_Code=80
if %chosenKey% EQU q set chosenKey_Code=81
if %chosenKey% EQU r set chosenKey_Code=82
if %chosenKey% EQU s set chosenKey_Code=83
if %chosenKey% EQU t set chosenKey_Code=84
if %chosenKey% EQU u set chosenKey_Code=85
if %chosenKey% EQU v set chosenKey_Code=86
if %chosenKey% EQU w set chosenKey_Code=87
if %chosenKey% EQU x set chosenKey_Code=88
if %chosenKey% EQU y set chosenKey_Code=89
if %chosenKey% EQU z set chosenKey_Code=90
if %chosenKey% EQU num0 set chosenKey_Code=96
if %chosenKey% EQU num1 set chosenKey_Code=97
if %chosenKey% EQU num2 set chosenKey_Code=98
if %chosenKey% EQU num3 set chosenKey_Code=99
if %chosenKey% EQU num4 set chosenKey_Code=100
if %chosenKey% EQU num5 set chosenKey_Code=101
if %chosenKey% EQU num6 set chosenKey_Code=102
if %chosenKey% EQU num7 set chosenKey_Code=103
if %chosenKey% EQU num8 set chosenKey_Code=104
if %chosenKey% EQU num9 set chosenKey_Code=105
if %chosenKey% EQU * set chosenKey_Code=106
if %chosenKey% EQU + set chosenKey_Code=107
if %chosenKey% EQU num- set chosenKey_Code=109
if %chosenKey% EQU num. set chosenKey_Code=110
if %chosenKey% EQU num/ set chosenKey_Code=111
if %chosenKey% EQU f1 set chosenKey_Code=112
if %chosenKey% EQU f2 set chosenKey_Code=113
if %chosenKey% EQU f3 set chosenKey_Code=114
if %chosenKey% EQU f4 set chosenKey_Code=115
if %chosenKey% EQU f5 set chosenKey_Code=116
if %chosenKey% EQU f6 set chosenKey_Code=117
if %chosenKey% EQU f7 set chosenKey_Code=118
if %chosenKey% EQU f8 set chosenKey_Code=119
if %chosenKey% EQU f9 set chosenKey_Code=120
if %chosenKey% EQU f10 set chosenKey_Code=121
if %chosenKey% EQU f11 set chosenKey_Code=122
if %chosenKey% EQU f12 set chosenKey_Code=123
if %chosenKey% EQU numlk set chosenKey_Code=144
if %chosenKey% EQU scrlk set chosenKey_Code=145
if %chosenKey% EQU lshift set chosenKey_Code=160
if %chosenKey% EQU rshift set chosenKey_Code=161
if %chosenKey% EQU lctrl set chosenKey_Code=162
if %chosenKey% EQU rctrl set chosenKey_Code=163
if %chosenKey% EQU lalt set chosenKey_Code=164
if %chosenKey% EQU ralt set chosenKey_Code=167
if %chosenKey% EQU ; set chosenKey_Code=186
if %chosenKey% EQU = set chosenKey_Code=187
if %chosenKey% EQU , set chosenKey_Code=188
if %chosenKey% EQU - set chosenKey_Code=189
if %chosenKey% EQU . set chosenKey_Code=190
if %chosenKey% EQU / set chosenKey_Code=191
if %chosenKey% EQU ~ set chosenKey_Code=192
if %chosenKey% EQU [ set chosenKey_Code=219
if %chosenKey% EQU \ set chosenKey_Code=220
if %chosenKey% EQU ] set chosenKey_Code=221
if %chosenKey% EQU ' set chosenKey_Code=222
if %chosenKey% EQU wheelup set chosenKey_Code=256
if %chosenKey% EQU wheeldown set chosenKey_Code=257

if %chosenKey_Code% EQU -1 (
	echo Whatever you just put in, is NOT a key. Please try again.
	timeout 2
	goto bindingKeys
) ELSE ( goto getActionCode )

:getActionCode
if %chosenAction% EQU forwards set "chosenAction_Code=Hat_Player_MoveY"
if %chosenAction% EQU backwards set "chosenAction_Code=Hat_Player_MoveY"
if %chosenAction% EQU left set "chosenAction_Code=Hat_Player_MoveX"
if %chosenAction% EQU right set "chosenAction_Code=Hat_Player_MoveX"
if %chosenAction% EQU jump set "chosenAction_Code=Hat_Player_Jump"
if %chosenAction% EQU attack set "chosenAction_Code=Hat_Player_Attack"
if %chosenAction% EQU interact set "chosenAction_Code=Hat_Player_Interact"
if %chosenAction% EQU emote set "chosenAction_Code=Hat_Player_Emote"
if %chosenAction% EQU crouch set "chosenAction_Code=Hat_Player_Crouch"
if %chosenAction% EQU share set "chosenAction_Code=Hat_Player_Share"
if %chosenAction% EQU camerasnap set "chosenAction_Code=Hat_Player_CameraSnap"
if %chosenAction% EQU zoomin set "chosenAction_Code=Hat_Player_ZoomIn"
if %chosenAction% EQU zoomout set "chosenAction_Code=Hat_Player_ZoomOut"
if %chosenAction% EQU confirm set "chosenAction_Code=Hat_Menu_Confirm"
if %chosenAction% EQU cancel set "chosenAction_Code=Hat_Menu_Cancel"
if %chosenAction% EQU start set "chosenAction_Code=Hat_Menu_Start"
if %chosenAction% EQU pgright set "chosenAction_Code=Hat_Menu_PageRight"
if %chosenAction% EQU pgleft set "chosenAction_Code=Hat_Menu_PageLeft"
if %chosenAction% EQU ability set "chosenAction_Code=Hat_Player_Ability"
if %chosenAction% EQU abilityswap set "chosenAction_Code=Hat_Player_AbilitySwap"
if %chosenAction% EQU hotup set "chosenAction_Code=Hat_Hotkey_Up"
if %chosenAction% EQU hotdown set "chosenAction_Code=Hat_Hotkey_Down"
if %chosenAction% EQU hotleft set "chosenAction_Code=Hat_Hotkey_Left"
if %chosenAction% EQU hotright set "chosenAction_Code=Hat_Hotkey_Right"

if %chosenAction_Code% EQU Hat_Player_MoveX goto placeMovement
if %chosenAction_Code% EQU Hat_Player_MoveY goto placeMovement

if NOT %chosenAction_Code% EQU Hat_Player_MoveX goto placeAction
if NOT %chosenAction_Code% EQU Hat_Player_MoveY goto placeAction

:placeAction
if %actionPlaced% EQU 1 goto setKeyNormal
echo. >> Keyboard.ini
echo +Bind = %chosenAction_Code% >> Keyboard.ini
set actionPlaced=1
goto setKeyNormal

:placeMovement
if %lastAction% EQU blank (
	if %actionPlaced% EQU 1 goto setKeyMovement
	echo. >> Keyboard.ini
	echo +Bind = %chosenAction_Code% >> Keyboard.ini
	set actionPlaced=1
	goto setKeyMovement
) ELSE (
	goto comboCheck
)

:comboCheck
set b-f=0
set f-b=0
set r-l=0
set l-r=0
if %chosenAction% == backwards (
	if %lastAction% == forwards (
		set b-f=1
	) ELSE ( set b-f=0 )
)
if %chosenAction% == forwards (
	if %lastAction% == backwards (
		set f-b=1
	) ELSE ( set f-b=0 )
)
if %chosenAction% == right (
	if %lastAction% == left (
		set r-l=1
	) ELSE ( set r-l=0 )
)
if %chosenAction% == left (
	if %lastAction% == right (
		set l-r=1
	) ELSE ( set l-r=0 )
)
goto checkActions

:checkActions
if %b-f% EQU 0 (
	if %f-b% EQU 0 (
		if %r-l% EQU 0 (
			if %l-r% EQU 0 (
				if %actionPlaced% EQU 1 goto setKeyMovement
				echo. >> Keyboard.ini
				echo +Bind = %chosenAction_Code% >> Keyboard.ini
				set actionPlaced=1
				goto setKeyMovement
			) ELSE ( goto setKeyMovement )
		) ELSE ( goto setKeyMovement )
	) ELSE ( goto setKeyMovement )
) ELSE ( goto setKeyMovement )

:setKeyNormal
echo ButtonID = %chosenKey_Code% >> Keyboard.ini
set lastKey=%chosenKey%
goto selectingKeysLoop

:setKeyMovement
if %chosenAction% EQU forwards echo ButtonID = %chosenKey_Code% >> Keyboard.ini
if %chosenAction% EQU backwards echo -ButtonID = %chosenKey_Code% >> Keyboard.ini
if %chosenAction% EQU left echo -ButtonID = %chosenKey_Code% >> Keyboard.ini
if %chosenAction% EQU right echo ButtonID = %chosenKey_Code% >> Keyboard.ini
set lastKey=%chosenKey%
goto selectingKeysLoop

:selectingKeysLoop
cls
set lastAction=%chosenAction%
echo You have set %lastKey% to %chosenAction%.
echo You can map multiple keys to one action, so I will give you the option to map again.
echo Do what you did last time... enter in the key you want to map to %chosenAction%.
echo Type in end if you are finished, or type in action to select a new action.
set /p "input=Input key here: "
set chosenKey=%input%

if %chosenKey% EQU end (
	goto stopKeyBind
) ELSE (
	if %chosenKey% EQU action (
		goto newAction
	) ELSE ( goto checkKey )
)

:newAction
echo You have more actions to go, huh?
echo Alright then, get ready to select another action...
timeout 1
set actionPlaced=0
goto selectingAction

:stopKeyBind
echo You're finished? Alright then...
timeout 1
goto finish

:finish
echo Enjoy your new keybinds^^!
pause
exit

:checkKey
set chosenKey_Code=-1
if %chosenKey% EQU lmb set chosenKey_Code=1
if %chosenKey% EQU rmb set chosenKey_Code=2
if %chosenKey% EQU mmb set chosenKey_Code=4
if %chosenKey% EQU mb4 set chosenKey_Code=5
if %chosenKey% EQU mb5 set chosenKey_Code=6
if %chosenKey% EQU backspace set chosenKey_Code=8
if %chosenKey% EQU tab set chosenKey_Code=9
if %chosenKey% EQU enter set chosenKey_Code=13
if %chosenKey% EQU capslk set chosenKey_Code=20
if %chosenKey% EQU escape set chosenKey_Code=27
if %chosenKey% EQU space set chosenKey_Code=32
if %chosenKey% EQU pgup set chosenKey_Code=33
if %chosenKey% EQU pgdn set chosenKey_Code=34
if %chosenKey% EQU end set chosenKey_Code=35
if %chosenKey% EQU home set chosenKey_Code=36
if %chosenKey% EQU left set chosenKey_Code=37
if %chosenKey% EQU up set chosenKey_Code=38
if %chosenKey% EQU right set chosenKey_Code=39
if %chosenKey% EQU down set chosenKey_Code=40
if %chosenKey% EQU insert set chosenKey_Code=45
if %chosenKey% EQU delete set chosenKey_Code=46
if %chosenKey% EQU 0 set chosenKey_Code=48
if %chosenKey% EQU 1 set chosenKey_Code=49
if %chosenKey% EQU 2 set chosenKey_Code=50
if %chosenKey% EQU 3 set chosenKey_Code=51
if %chosenKey% EQU 4 set chosenKey_Code=52
if %chosenKey% EQU 5 set chosenKey_Code=53
if %chosenKey% EQU 6 set chosenKey_Code=54
if %chosenKey% EQU 7 set chosenKey_Code=55
if %chosenKey% EQU 8 set chosenKey_Code=56
if %chosenKey% EQU 9 set chosenKey_Code=59
if %chosenKey% EQU a set chosenKey_Code=65
if %chosenKey% EQU b set chosenKey_Code=66
if %chosenKey% EQU c set chosenKey_Code=67
if %chosenKey% EQU d set chosenKey_Code=68
if %chosenKey% EQU e set chosenKey_Code=69
if %chosenKey% EQU f set chosenKey_Code=70
if %chosenKey% EQU g set chosenKey_Code=71
if %chosenKey% EQU h set chosenKey_Code=72
if %chosenKey% EQU i set chosenKey_Code=73
if %chosenKey% EQU j set chosenKey_Code=74
if %chosenKey% EQU k set chosenKey_Code=75
if %chosenKey% EQU l set chosenKey_Code=76
if %chosenKey% EQU m set chosenKey_Code=77
if %chosenKey% EQU n set chosenKey_Code=78
if %chosenKey% EQU o set chosenKey_Code=79
if %chosenKey% EQU p set chosenKey_Code=80
if %chosenKey% EQU q set chosenKey_Code=81
if %chosenKey% EQU r set chosenKey_Code=82
if %chosenKey% EQU s set chosenKey_Code=83
if %chosenKey% EQU t set chosenKey_Code=84
if %chosenKey% EQU u set chosenKey_Code=85
if %chosenKey% EQU v set chosenKey_Code=86
if %chosenKey% EQU w set chosenKey_Code=87
if %chosenKey% EQU x set chosenKey_Code=88
if %chosenKey% EQU y set chosenKey_Code=89
if %chosenKey% EQU z set chosenKey_Code=90
if %chosenKey% EQU num0 set chosenKey_Code=96
if %chosenKey% EQU num1 set chosenKey_Code=97
if %chosenKey% EQU num2 set chosenKey_Code=98
if %chosenKey% EQU num3 set chosenKey_Code=99
if %chosenKey% EQU num4 set chosenKey_Code=100
if %chosenKey% EQU num5 set chosenKey_Code=101
if %chosenKey% EQU num6 set chosenKey_Code=102
if %chosenKey% EQU num7 set chosenKey_Code=103
if %chosenKey% EQU num8 set chosenKey_Code=104
if %chosenKey% EQU num9 set chosenKey_Code=105
if %chosenKey% EQU * set chosenKey_Code=106
if %chosenKey% EQU + set chosenKey_Code=107
if %chosenKey% EQU num- set chosenKey_Code=109
if %chosenKey% EQU num. set chosenKey_Code=110
if %chosenKey% EQU num/ set chosenKey_Code=111
if %chosenKey% EQU f1 set chosenKey_Code=112
if %chosenKey% EQU f2 set chosenKey_Code=113
if %chosenKey% EQU f3 set chosenKey_Code=114
if %chosenKey% EQU f4 set chosenKey_Code=115
if %chosenKey% EQU f5 set chosenKey_Code=116
if %chosenKey% EQU f6 set chosenKey_Code=117
if %chosenKey% EQU f7 set chosenKey_Code=118
if %chosenKey% EQU f8 set chosenKey_Code=119
if %chosenKey% EQU f9 set chosenKey_Code=120
if %chosenKey% EQU f10 set chosenKey_Code=121
if %chosenKey% EQU f11 set chosenKey_Code=122
if %chosenKey% EQU f12 set chosenKey_Code=123
if %chosenKey% EQU numlk set chosenKey_Code=144
if %chosenKey% EQU scrlk set chosenKey_Code=145
if %chosenKey% EQU lshift set chosenKey_Code=160
if %chosenKey% EQU rshift set chosenKey_Code=161
if %chosenKey% EQU lctrl set chosenKey_Code=162
if %chosenKey% EQU rctrl set chosenKey_Code=163
if %chosenKey% EQU lalt set chosenKey_Code=164
if %chosenKey% EQU ralt set chosenKey_Code=167
if %chosenKey% EQU ; set chosenKey_Code=186
if %chosenKey% EQU = set chosenKey_Code=187
if %chosenKey% EQU , set chosenKey_Code=188
if %chosenKey% EQU - set chosenKey_Code=189
if %chosenKey% EQU . set chosenKey_Code=190
if %chosenKey% EQU / set chosenKey_Code=191
if %chosenKey% EQU ~ set chosenKey_Code=192
if %chosenKey% EQU [ set chosenKey_Code=219
if %chosenKey% EQU \ set chosenKey_Code=220
if %chosenKey% EQU ] set chosenKey_Code=221
if %chosenKey% EQU ' set chosenKey_Code=222
if %chosenKey% EQU wheelup set chosenKey_Code=256
if %chosenKey% EQU wheeldown set chosenKey_Code=257

if %chosenKey_Code% EQU -1 (
	echo Whatever you just put in, is NOT a key. Please try again.
	timeout 2
	goto selectingKeysLoop
) ELSE ( goto bindingKeys )

:appendKeyCodes
echo ; Generated with ParaKrei AHiT Keyboard Config Generator! > Keyboard.ini
echo [Identification] >> Keyboard.ini
echo ControllerName="Keyboard" >> Keyboard.ini
echo UniqueID = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo [Buttons] >> Keyboard.ini
echo +Button = 1 >> Keyboard.ini
echo Name = "LMB" >> Keyboard.ini
echo FullName = "Left Mouse Button" >> Keyboard.ini
echo Color = "Red" >> Keyboard.ini
echo Icon = "Mouse_Left" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 2 >> Keyboard.ini
echo Name = "RMB" >> Keyboard.ini
echo FullName = "Right Mouse Button" >> Keyboard.ini
echo Color = "Red" >> Keyboard.ini
echo Icon = "Mouse_Right" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 4 >> Keyboard.ini
echo Name = "MOUSE3" >> Keyboard.ini
echo FullName = "Middle Mouse Button" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Mouse_Wheel_Up" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 5 >> Keyboard.ini
echo Name = "X1" >> Keyboard.ini
echo FullName = "X1 Mouse Button" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 6 >> Keyboard.ini
echo Name = "X2" >> Keyboard.ini
echo FullName = "X2 Mouse Button" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 8 >> Keyboard.ini
echo Name = "Backspace" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard_Wide" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 9 >> Keyboard.ini
echo Name = "Tab" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 13 >> Keyboard.ini
echo Name = "Enter" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 19 >> Keyboard.ini
echo Name = "Pause" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 20 >> Keyboard.ini
echo Name = "Caps" >> Keyboard.ini
echo FullName = "Caps Lock" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 27 >> Keyboard.ini
echo Name = "Esc" >> Keyboard.ini
echo FullName = "Escape" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 32 >> Keyboard.ini
echo Name = "Space" >> Keyboard.ini
echo FullName = "Space Bar" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard_Wide" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 33 >> Keyboard.ini
echo Name = "Page Up" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 34 >> Keyboard.ini
echo Name = "Page Down" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 35 >> Keyboard.ini
echo Name = "End" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 36 >> Keyboard.ini
echo Name = "Home" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 37 >> Keyboard.ini
echo Name = "Left" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 38 >> Keyboard.ini
echo Name = "Up" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 39 >> Keyboard.ini
echo Name = "Right" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 40 >> Keyboard.ini
echo Name = "Down" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 45 >> Keyboard.ini
echo Name = "Ins" >> Keyboard.ini
echo FullName = "Insert" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 46 >> Keyboard.ini
echo Name = "Del" >> Keyboard.ini
echo FullName = "Delete" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 48 >> Keyboard.ini
echo Name = "0" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 49 >> Keyboard.ini
echo Name = "1" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 50 >> Keyboard.ini
echo Name = "2" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 51 >> Keyboard.ini
echo Name = "3" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 52 >> Keyboard.ini
echo Name = "4" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 53 >> Keyboard.ini
echo Name = "5" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 54 >> Keyboard.ini
echo Name = "6" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 55 >> Keyboard.ini
echo Name = "7" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 56 >> Keyboard.ini
echo Name = "8" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 59 >> Keyboard.ini
echo Name = "9" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 65 >> Keyboard.ini
echo Name = "A" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 66 >> Keyboard.ini
echo Name = "B" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 67 >> Keyboard.ini
echo Name = "C" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 68 >> Keyboard.ini
echo Name = "D" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 69 >> Keyboard.ini
echo Name = "E" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 70 >> Keyboard.ini
echo Name = "F" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 71 >> Keyboard.ini
echo Name = "G" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 72 >> Keyboard.ini
echo Name = "H" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 73 >> Keyboard.ini
echo Name = "I" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 74 >> Keyboard.ini
echo Name = "J" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 75 >> Keyboard.ini
echo Name = "K" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 76 >> Keyboard.ini
echo Name = "L" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 77 >> Keyboard.ini
echo Name = "M" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 78 >> Keyboard.ini
echo Name = "N" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 79 >> Keyboard.ini
echo Name = "O" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 80 >> Keyboard.ini
echo Name = "P" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 81 >> Keyboard.ini
echo Name = "Q" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 82 >> Keyboard.ini
echo Name = "R" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 83 >> Keyboard.ini
echo Name = "S" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 84 >> Keyboard.ini
echo Name = "T" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 85 >> Keyboard.ini
echo Name = "U" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 86 >> Keyboard.ini
echo Name = "V" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 87 >> Keyboard.ini
echo Name = "W" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 88 >> Keyboard.ini
echo Name = "X" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 89 >> Keyboard.ini
echo Name = "Y" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 90 >> Keyboard.ini
echo Name = "Z" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 96 >> Keyboard.ini
echo Name = "0" >> Keyboard.ini
echo FullName = "Numpad 0" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 97 >> Keyboard.ini
echo Name = "1" >> Keyboard.ini
echo FullName = "Numpad 1" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 98 >> Keyboard.ini
echo Name = "2" >> Keyboard.ini
echo FullName = "Numpad 2" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 99 >> Keyboard.ini
echo Name = "3" >> Keyboard.ini
echo FullName = "Numpad 3" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 100 >> Keyboard.ini
echo Name = "4" >> Keyboard.ini
echo FullName = "Numpad 4" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 101 >> Keyboard.ini
echo Name = "5" >> Keyboard.ini
echo FullName = "Numpad 5" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 102 >> Keyboard.ini
echo Name = "6" >> Keyboard.ini
echo FullName = "Numpad 6" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 103 >> Keyboard.ini
echo Name = "7" >> Keyboard.ini
echo FullName = "Numpad 7" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 104 >> Keyboard.ini
echo Name = "8" >> Keyboard.ini
echo FullName = "Numpad 8" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 105 >> Keyboard.ini
echo Name = "9" >> Keyboard.ini
echo FullName = "Numpad 9" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 106 >> Keyboard.ini
echo Name = "*" >> Keyboard.ini
echo FullName = "Multiply" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 107 >> Keyboard.ini
echo Name = "+" >> Keyboard.ini
echo FullName = "Add" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 109 >> Keyboard.ini
echo Name = "-" >> Keyboard.ini
echo FullName = "Subtract" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 110 >> Keyboard.ini
echo Name = "." >> Keyboard.ini
echo FullName = "Decimal" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 111 >> Keyboard.ini
echo Name = "/" >> Keyboard.ini
echo FullName = "Divide" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 112 >> Keyboard.ini
echo Name = "F1" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 113 >> Keyboard.ini
echo Name = "F2" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 114 >> Keyboard.ini
echo Name = "F3" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 115 >> Keyboard.ini
echo Name = "F4" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 116 >> Keyboard.ini
echo Name = "F5" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 117 >> Keyboard.ini
echo Name = "F6" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 118 >> Keyboard.ini
echo Name = "F7" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 119 >> Keyboard.ini
echo Name = "F8" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 120 >> Keyboard.ini
echo Name = "F9" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 121 >> Keyboard.ini
echo Name = "F10" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 122 >> Keyboard.ini
echo Name = "F11" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 123 >> Keyboard.ini
echo Name = "F12" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 144 >> Keyboard.ini
echo Name = "Num" >> Keyboard.ini
echo FullName = "Num Lock" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 145 >> Keyboard.ini
echo Name = "Scroll" >> Keyboard.ini
echo FullName = "Scroll Lock" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 160 >> Keyboard.ini
echo Name = "Shift" >> Keyboard.ini
echo FullName = "Left Shift" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard_Wide" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 161 >> Keyboard.ini
echo Name = "Shift" >> Keyboard.ini
echo FullName = "Right Shift" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard_Wide" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 162 >> Keyboard.ini
echo Name = "Ctrl" >> Keyboard.ini
echo FullName = "Left Control" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard_Wide" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 163 >> Keyboard.ini
echo Name = "Ctrl" >> Keyboard.ini
echo FullName = "Right Control" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard_Wide" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 164 >> Keyboard.ini
echo Name = "Alt" >> Keyboard.ini
echo FullName = "Left Alt" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard_Wide" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 167 >> Keyboard.ini
echo Name = "Alt" >> Keyboard.ini
echo FullName = "Right Alt" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard_Wide" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 186 >> Keyboard.ini
echo Name = ";" >> Keyboard.ini
echo FullName = "Semicolon" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 187 >> Keyboard.ini
echo Name = "=" >> Keyboard.ini
echo FullName = "Equals" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 188 >> Keyboard.ini
echo Name = "," >> Keyboard.ini
echo FullName = "Comma" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 189 >> Keyboard.ini
echo Name = "-" >> Keyboard.ini
echo FullName = "Minus" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 190 >> Keyboard.ini
echo Name = "." >> Keyboard.ini
echo FullName = "Period" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 191 >> Keyboard.ini
echo Name = "/" >> Keyboard.ini
echo FullName = "Slash" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 192 >> Keyboard.ini
echo Name = "~" >> Keyboard.ini
echo FullName = "Tilde" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 219 >> Keyboard.ini
echo Name = "[" >> Keyboard.ini
echo FullName = "Left Bracket" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 220 >> Keyboard.ini
echo Name = "\\" >> Keyboard.ini
echo FullName = "Backslash" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 221 >> Keyboard.ini
echo Name = "]" >> Keyboard.ini
echo FullName = "Right Bracket" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 222 >> Keyboard.ini
echo Name = "'" >> Keyboard.ini
echo FullName = "Quote" >> Keyboard.ini
echo Color = "Grey" >> Keyboard.ini
echo Icon = "Keyboard" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 256 >> Keyboard.ini
echo Name = "Mouse Wheel Up" >> Keyboard.ini
echo Icon = "Mouse_Wheel_Up" >> Keyboard.ini
echo. >> Keyboard.ini
echo +Button = 257 >> Keyboard.ini
echo Name = "Mouse Wheel Down" >> Keyboard.ini
echo Icon = "Mouse_Wheel_Down" >> Keyboard.ini
echo. >> Keyboard.ini
echo [Binds] >> Keyboard.ini
goto selectingAction