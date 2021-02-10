@echo off
title ParaKrei's FFMPEG Mass Converter

:intro
echo ------------------------------------------------------------------------
echo    Welcome to ParaKrei's FFMPEG Mass Converter! (Feb. 10, 2021)
echo ------------------------------------------------------------------------
echo YOU WILL NEED ffmpeg FOR THIS TO WORK PROPERLY!
echo.
echo.
echo DISCLAIMER: This script is fan-made, and therefore NOT endorsed by the original creators of ffmpeg.
echo Beware of the potential issues this script may have when using a different version of ffmpeg.
echo Also, the MAIN conversion script was adapted from the user Baldrick, on the VideoHelp forums.
echo.
echo.
set /p "input=Where is your copy of ffmpeg.exe located? "
set ffmpegdir=%input%
set /p "input=Please enter the directory you wish to bulk convert. "
set indir=%input%
set /p "input=Where do you want to place the converted files in? "
set outdir=%input%
echo Alright, now onto other options.
timeout 1
cls

:informatset
cls
echo What file format do you want to convert?
set /p "input="
set informat=%input%
if %informat% EQU all echo Ah, you want to convert ALL formats, alright...
choice /c YN /n /m "Now, are you SURE this is the format you want? Y or N?"
set option=%ERRORLEVEL%
if %option% EQU 1 goto tooutformatset
if %option% EQU 2 goto correction_in

:correction_in
echo Oh, it seems you have incorrectly input your format, let me just reset the prompt for you, then.
timeout 2
goto informatset

:tooutformatset
echo Alright. Walking on over to the output site...
timeout 2
goto outformatset

:outformatset
cls
echo What format do you want the export to be? (EX: mp3, wav, ogg, mp4, avi, etc.)
echo (If you don't know the formats that FFMPEG can use, type help, and this is case sensitive.)
set /p "input=Export format please! "
set outformat=%input%

if %outformat% EQU help goto format_help
choice /c YN /n /m "Now, are you SURE this is the format you want? Y or N?"
set option=%ERRORLEVEL%
if %option% EQU 1 goto totransition
if %option% EQU 2 goto correction_out

:correction_out
echo Oh, it seems you have incorrectly input your format, let me just reset the prompt for you, then.
timeout 2
goto outformatset

:totransition
echo Alright. Transporting you to the conversion site now...
timeout 2
goto transition

:format_help
cls
echo Oh, so you need to know the COMMON audio formats that FFMPEG knows?
echo Well, then you came to the right place!
echo The common formats are:
echo -----------------
echo      AUDIO:
echo -----------------
echo acc - A high-quality audio format that is generally used by Apple's iTunes.
echo flac - Another high-quality audio format that is basically public domain to all people.
echo mp3 - The most common audio format that is seen around the world, which is optimized to use a less amount of space as possible.
echo m4a - A audio format that was originally made to be a successor to mp3s, but isn't really used as often.
echo opus - ANOTHER audio format that was made to replace the mp3, but much like m4a, it isn't really used.
echo vorbis - Generally known as .ogg, it is a more well known format, and it CAN be used for audio AND video, but this only gives audio, and is lossy.
echo wav - The audio format that was made by IBM and Microsoft, and is generally used by Windows, and is still high-quality.
pause
echo -----------------
echo      VIDEO:
echo -----------------
echo mp4 - The usual video format the world uses to this day, it's high-quality enough.
echo avi - An older video format that was once used for years, but now, most programs have moved to mp4.
echo mkv - A high-quality file that can store subtitles, pictures, video, and audio in an unlimited amount.
echo webm - A relatively new format that is used for videos on the web, specifically for the coding language HTML5.
echo ogg - Generally known as .ogg, it is a more well known format, and it CAN be used for audio AND video, but this only gives video, and is lossy.
echo flv - This format is used by Adobe's Flash Player, and is known as Flash Video, I don't see the need for this format, but use it as you will.
echo Beware that this isn't ALL of the supported formats in FFMPEG. There are WAY too many for me to list here.
echo When you are done reading, just press any key to go back to the format screen!
pause
cls
goto outformatset

:transition
echo Woah, woah! Calm your horses! We need to ask you ONE MORE QUESTION.
choice /c YN /n /m "Do you want to review all of your settings? Y or N? "
set option=%ERRORLEVEL%

if %option% EQU 1 goto :currentsettings
if %option% EQU 2 goto :transition2

:currentsettings
echo Oh, so you want to review your settings? Alright then!
echo Your current settings are:
echo FFMPEG Directory: %ffmpegdir%
echo Input Directory: %indir%
echo Input Format: %informat%
echo Output Format: %outformat%
echo Output Directory: %outdir%
choice /c YN /n /m "Would you like to change any of these settings? Y or N? "
set change=%ERRORLEVEL%
if %change% EQU 1 goto changesettings
if %change% EQU 2 goto conversionstart

:changesettings
echo What setting would you like to change?
echo 1 - FFMPEG Directory
echo 2 - Input Directory
echo 3 - Input Format
echo 4 - Output Format
echo 5 - Output Directory
choice /c 12345 /n
set settings_change=%ERRORLEVEL%
echo %settings_change%
if %settings_change% EQU 1 goto ffmpegdir_change
if %settings_change% EQU 2 goto indir_change
if %settings_change% EQU 3 goto informat_change
if %settings_change% EQU 4 goto outformat_change
if %settings_change% EQU 5 goto outdir_change

:ffmpegdir_change
set /p "input=Please enter in the new directory of FFMPEG you would like to use. "
set ffmpegdir=%input%
echo You set it to %ffmpegdir%
echo Sending you back to the current settings screen...
timeout 1
cls
goto currentsettings

:indir_change
set /p "input=Please enter in the new directory you would like to convert. "
set indir=%input%
echo You set it to %indir%
echo Sending you back to the current settings screen...
timeout 1
cls
goto currentsettings

:informat_change
set /p "input=Please enter in the new format you would like to convert. "
set informat=%input%
echo You set it to %informat%
echo Sending you back to the current settings screen...
timeout 1
cls
goto currentsettings

:outformat_change
set /p "input=Please enter in the new format you would like to export to. "
set outformat=%input%
echo You set it to %outformat%
echo Sending you back to the current settings screen...
timeout 1
cls
goto currentsettings

:outdir_change
set /p "input=Please enter in the new directory you would like to export to. "
set outdir=%input%
echo You set it to %outdir%
echo Sending you back to the current settings screen...
timeout 1
cls
goto currentsettings

:transition2
echo Alright, I know this may be annoying, but it is to ensure...
choice /c YN /n /m "Are you SURE that you are okay with your current settings? Y or N? "
set inneroption=%ERRORLEVEL%
if %inneroption% EQU 1 goto conversionstart
if %inneroption% EQU 2 goto transition3

:transition3
echo Alright, I'm gonna send you back to the prompt to review, be ready!
pause
cls
goto transition

:conversionstart
echo Alright! Let's get started! (Press a key when you are ready.)
pause
cls
echo Preparing FFMPEG.
timeout 0.9
cls
echo Preparing FFMPEG..
timeout 0.9
cls
echo Preparing FFMPEG...
timeout 0.9
cls
echo Preparing FFMPEG.
timeout 0.9
cls
echo Preparing FFMPEG..
timeout 0.9
cls
echo Preparing FFMPEG...
timeout 0.9
cls
echo Preparing FFMPEG.
timeout 0.9
cls
echo Preparing FFMPEG..
timeout 0.9
cls
echo Preparing FFMPEG...
timeout 0.9
cls
echo Preparing FFMPEG.
timeout 0.9
cls
echo Preparing FFMPEG..
timeout 0.9
cls
echo Preparing FFMPEG...
timeout 0.9
cls
echo Preparing FFMPEG.
timeout 0.9
cls
echo Preparing FFMPEG..
timeout 0.9
cls
echo Preparing FFMPEG...
timeout 0.9
cls
echo Preparing FFMPEG.
timeout 0.9
cls
echo Preparing FFMPEG..
timeout 0.9
cls
echo Preparing FFMPEG...
timeout 0.9
cls
echo Preparing FFMPEG.
timeout 0.9
cls
echo Preparing FFMPEG..
timeout 0.9
cls
echo Preparing FFMPEG...
timeout 0.9
cls
echo Preparing FFMPEG.
timeout 0.9
cls
echo Preparing FFMPEG..
timeout 0.9
cls
echo Preparing FFMPEG...
timeout 0.9
cls
echo Preparing FFMPEG.
timeout 0.9
cls
echo Preparing FFMPEG..
timeout 0.9
cls
echo Preparing FFMPEG...
timeout 0.9
cls
if %informat% EQU all goto conversion_alltypes
if NOT %informat% EQU all goto conversion_norm

:conversion_norm
cd %indir%
for %%a in ("*.%informat%") do "%ffmpegdir%\ffmpeg.exe" -i "%%a" "%outdir%\%%~na.%outformat%"
pause
exit

:conversion_alltypes
cd %indir%
for %%a in ("*.*") do "%ffmpegdir%\ffmpeg.exe" -i "%%a" "%outdir%\%%~na.%outformat%"
pause
exit