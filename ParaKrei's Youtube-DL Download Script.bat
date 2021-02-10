@echo off
title ParaKrei's Youtube-DL Download Script


:intro
echo ------------------------------------------------------------------------
echo    Welcome to ParaKrei's Youtube-DL Download Script! (Sept. 9, 2020)
echo ------------------------------------------------------------------------
echo YOU WILL NEED ffmpeg FOR THIS TO WORK PROPERLY!
echo.
echo.
echo DISCLAIMER: This script is fan-made, and therefore NOT endorsed by the original creators of Youtube-DL.
echo Beware of the potential issues this script may have when using a different version of Youtube-DL.
echo.
echo.
set /p "input=Please enter the URL of the video or audio you wish to convert. "
set url=%input%
echo Alright, now onto other options.
timeout 1
cls

:converttypeprompt
choice /c VA /n /m "What do you want to extract from this video? "
set converttype=%ERRORLEVEL%

if %converttype% EQU 1 goto video_format
if %converttype% EQU 2 goto audio_format

:audio_format
echo What format do you want the audio to be? (EX: best (default), mp3, wav, etc.)
echo (If you don't know the formats that Youtube-DL can use, type help, and this is case sensitive.)
set /p "input=Audio format please! "
set audio_format=%input%
set video_format=n/a
cls

if %audio_format% EQU help goto audio_help
if %audio_format% EQU best goto audio_quality
if %audio_format% EQU aac goto audio_quality
if %audio_format% EQU flac goto audio_quality
if %audio_format% EQU mp3 goto audio_quality
if %audio_format% EQU m4a goto audio_quality
if %audio_format% EQU opus goto audio_quality
if %audio_format% EQU vorbis goto audio_quality
if %audio_format% EQU wav goto audio_quality

if NOT %audio_format% EQU help goto format_unrecognized
if NOT %audio_format% EQU best goto format_unrecognized
if NOT %audio_format% EQU aac goto format_unrecognized
if NOT %audio_format% EQU flac goto format_unrecognized
if NOT %audio_format% EQU mp3 goto format_unrecognized
if NOT %audio_format% EQU m4a goto format_unrecognized
if NOT %audio_format% EQU opus goto format_unrecognized
if NOT %audio_format% EQU vorbis goto format_unrecognized
if NOT %audio_format% EQU wav goto format_unrecognized

goto audio_quality

:video_format
echo What format do you want the video to be? (EX: mp4, mkv, avi, etc.)
echo (If you don't know the formats that Youtube-DL can use, type help, and this is case sensitive.)
set /p "input=Video format please! "
set video_format=%input%
set audio_format=n/a
cls

if %video_format% EQU help goto video_help
if %video_format% EQU keep goto audio_quality
if %video_format% EQU mp4 goto audio_quality
if %video_format% EQU avi goto audio_quality
if %video_format% EQU mkv goto audio_quality
if %video_format% EQU webm goto audio_quality
if %video_format% EQU ogg goto audio_quality
if %video_format% EQU flv goto audio_quality

if NOT %video_format% EQU help goto format_unrecognized
if NOT %video_format% EQU keep goto format_unrecognized
if NOT %video_format% EQU mp4 goto format_unrecognized
if NOT %video_format% EQU avi goto format_unrecognized
if NOT %video_format% EQU mkv goto format_unrecognized
if NOT %video_format% EQU webm goto format_unrecognized
if NOT %video_format% EQU ogg goto format_unrecognized
if NOT %video_format% EQU flv goto format_unrecognized

goto audio_quality

:format_unrecognized
echo Hey, woah now! What you just typed there is NOT a real format, or you typed it wrong, OR YOU PUT CAPITALS!
echo Please, try that again. (REMEMBER: No capitals!)
pause
cls
if %converttype% EQU 1 goto video_format
if %converttype% EQU 2 goto audio_format

:video_help
echo Oh, so you need to know the video formats that Youtube-DL knows?
echo Well, then you came to the right place!
echo The supported formats are:
echo keep - This option keeps the original formats of the extracted video.
echo mp4 - The usual video format the world uses to this day, it's high-quality enough.
echo avi - An older video format that was once used for years, but now, most programs have moved to mp4.
echo mkv - A high-quality file that can store subtitles, pictures, video, and audio in an unlimited amount.
echo webm - A relatively new format that is used for videos on the web, specifically for the coding language HTML5.
echo ogg - Generally known as .ogg, it is a more well known format, and it CAN be used for audio AND video, but this only gives video, and is lossy.
echo flv - This format is used by Adobe's Flash Player, and is known as Flash Video, I don't see the need for this format, but use it as you will.
echo When you are done reading, just press any key to go back to the format screen!
pause
cls
goto video_format

:audio_help
echo Oh, so you need to know the audio formats that Youtube-DL knows?
echo Well, then you came to the right place!
echo The supported formats are:
echo best - The default setting within Youtube-DL.
echo acc - A high-quality audio format that is generally used by Apple's iTunes.
echo flac - Another high-quality audio format that is basically public domain to all people.
echo mp3 - The most common audio format that is seen around the world, which is optimized to use a less amount of space as possible.
echo m4a - A audio format that was originally made to be a successor to mp3s, but isn't really used as often.
echo opus - ANOTHER audio format that was made to replace the mp3, but much like m4a, it isn't really used.
echo vorbis - Generally known as .ogg, it is a more well known format, and it CAN be used for audio AND video, but this only gives audio, and is lossy.
echo wav - The audio format that was made by IBM and Microsoft, and is generally used by Windows, and is still high-quality.
echo When you are done reading, just press any key to go back to the format screen!
pause
cls
goto audio_format

:audio_quality
echo Now that you have your format set, now let's get the audio quality!
echo.
echo Now, this will set how good the audio sounds.
echo The range of the quality scale is 0(best) - 9(worse).
choice /c 0123456789 /n /m "Please input the quality number that you want for audio. "
set /a quality=%ERRORLEVEL%-1
echo Your audio quality is now set!
echo You: What happens now?
echo Now? Let's go convert some videos.
pause
cls
goto transition

:transition
echo Woah, woah! Calm your horses! We need to ask you ONE MORE QUESTION.
choice /c YN /n /m "Do you want to review all of your settings? Y or N? "
set option=%ERRORLEVEL%

if %option% EQU 1 goto :currentsettings
if %option% EQU 2 goto :transition2

:currentsettings
echo Oh, so you want to review your settings? Alright then!
echo Your current settings are:
echo Video Format: %video_format%
echo Audio Format: %audio_format%
echo Audio Quality: %quality%
echo Video URL Entered: %url%
choice /c YN /n /m "Would you like to change any of these settings? Y or N? "
set change=%ERRORLEVEL%
if %change% EQU 1 goto changesettings
if %change% EQU 2 goto downloadstart

:changesettings
echo What setting would you like to change?
echo 1 - Video URL
echo 2 - Video Format
echo 3 - Audio Format
echo 4 - Audio Quality
choice /c 1234 /n
set settings_change=%ERRORLEVEL%
echo %settings_change%
if %settings_change% EQU 1 goto url_change
if %settings_change% EQU 2 goto video_format_change
if %settings_change% EQU 3 goto audio_format_change
if %settings_change% EQU 4 goto quality_change

:url_change
set /p "input=Please enter in the new URL you would like to use. "
set url=%input%
echo You set it to %url%
echo Sending you back to the current settings screen...
timeout 1
cls
goto currentsettings

:video_format_change
set /p "input=Please enter in the new video format you would like to use. Just note, that this WILL disable audio extraction! "
set converttype=1
set video_format=%input%
set audio_format=n/a
echo You set it to %video_format%
echo Sending you back to the current settings screen...
timeout 1
cls
goto currentsettings

:audio_format_change
set /p "input=Please enter in the new audio format you would like to use. Just note, that this WILL disable video extraction! "
set converttype=2
set audio_format=%input%
set video_format=n/a
echo You set it to %audio_format%
echo Sending you back to the current settings screen...
timeout 1
cls
goto currentsettings

:quality_change
choice /c 0123456789 /n /m "Please enter in the new audio quality you would like to use. "
set /a quality=%ERRORLEVEL%-1
echo You set it to %quality%
echo Sending you back to the current settings screen...
timeout 1
cls
goto currentsettings

:transition2
echo Alright, I know this may be annoying, but it is to ensure...
choice /c YN /n /m "Are you SURE that you are okay with your current settings? Y or N? "
set inneroption=%ERRORLEVEL%
if %inneroption% EQU 1 goto downloadstart
if %inneroption% EQU 2 goto transition3

:transition3
echo Alright, I'm gonna send you back to the prompt to review, be ready!
pause
cls
goto transition

:downloadstart
echo Alright! Let's get started! (Press a key when you are ready.)
pause
cls
echo Preparing Youtube-DL.
timeout 0.9
cls
echo Preparing Youtube-DL..
timeout 0.9
cls
echo Preparing Youtube-DL...
timeout 0.9
cls
echo Preparing Youtube-DL.
timeout 0.9
cls
echo Preparing Youtube-DL..
timeout 0.9
cls
echo Preparing Youtube-DL...
timeout 0.9
cls
echo Preparing Youtube-DL.
timeout 0.9
cls
echo Preparing Youtube-DL..
timeout 0.9
cls
echo Preparing Youtube-DL...
timeout 0.9
cls
echo Preparing Youtube-DL.
timeout 0.9
cls
echo Preparing Youtube-DL..
timeout 0.9
cls
echo Preparing Youtube-DL...
timeout 0.9
cls
echo Preparing Youtube-DL.
timeout 0.9
cls
echo Preparing Youtube-DL..
timeout 0.9
cls
echo Preparing Youtube-DL...
timeout 0.9
cls
echo Preparing Youtube-DL.
timeout 0.9
cls
echo Preparing Youtube-DL..
timeout 0.9
cls
echo Preparing Youtube-DL...
timeout 0.9
cls
echo Preparing Youtube-DL.
timeout 0.9
cls
echo Preparing Youtube-DL..
timeout 0.9
cls
echo Preparing Youtube-DL...
timeout 0.9
cls
echo Preparing Youtube-DL.
timeout 0.9
cls
echo Preparing Youtube-DL..
timeout 0.9
cls
echo Preparing Youtube-DL...
timeout 0.9
cls
echo Preparing Youtube-DL.
timeout 0.9
cls
echo Preparing Youtube-DL..
timeout 0.9
cls
echo Preparing Youtube-DL...
timeout 0.9
cls
if %video_format% EQU keep goto video_extract_keep
if %converttype% EQU 1 goto video_extract
if %converttype% EQU 2 goto audio_extract

:video_extract
youtube-dl --recode-video %video_format% --audio-quality %quality% %url%
pause
goto end_video

:audio_extract
youtube-dl --extract-audio --audio-format %audio_format% --audio-quality %quality% %url%
pause
goto end_audio

:video_extract_keep
youtube-dl --keep-video --audio-quality %quality% %url%
pause
goto end_video

:end_audio
cls
echo Your conversion is now done! Enjoy your audio!
pause
exit

:end_video
cls
echo Your conversion is now done! Enjoy your video!
pause
exit