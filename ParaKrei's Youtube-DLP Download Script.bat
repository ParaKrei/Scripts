@echo off
title ParaKrei's Youtube-DLP Download Script
SetLocal EnableDelayedExpansion

:intro
echo ------------------------------------------------------------------------
echo    Welcome to ParaKrei's Youtube-DLP Download Script^^! (May 16, 2021)
echo ------------------------------------------------------------------------
echo YOU WILL NEED ffmpeg FOR THIS TO WORK PROPERLY^^!
echo.
echo.
echo DISCLAIMER: This script is fan-made, and therefore NOT endorsed by the original creators of Youtube-DLP.
echo Beware of the potential issues this script may have when using a different version of Youtube-DLP.
echo.
echo.
set /p "input=Please enter the URL of the video or audio you wish to convert. "
set url=%input%
echo Alright, now onto other options.
timeout 1
cls

:converttypeprompt
choice /c VAS /n /m "What do you want to extract from this video? You can choose Video, Audio, and Subtitles. "
set converttype=%ERRORLEVEL%

if %converttype% EQU 1 goto video_format
if %converttype% EQU 2 goto audio_format
if %converttype% EQU 3 goto subtitle_format

:audio_format
echo What format do you want the audio to be? (EX: best (default), mp3, wav, etc.)
echo (If you don't know the formats that Youtube-DLP can use, type help, and this is case sensitive.)
set /p "input=Audio format please^! "
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

goto :audio_quality

:video_format
echo What format do you want the video to be? (EX: mp4, mkv, avi, etc.)
echo (If you don't know the formats that Youtube-DLP can use, type help, and this is case sensitive.)
set /p "input=Video format please^! "
set video_format=%input%
set audio_format=n/a
cls

if %video_format% EQU help goto :video_help
if %video_format% EQU keep goto :subtitle_extract_video
if %video_format% EQU mp4 goto :subtitle_extract_video
if %video_format% EQU avi goto :subtitle_extract_video
if %video_format% EQU mkv goto :subtitle_extract_video
if %video_format% EQU webm goto :subtitle_extract_video
if %video_format% EQU ogg goto :subtitle_extract_video
if %video_format% EQU flv goto :subtitle_extract_video

if NOT %video_format% EQU help goto :format_unrecognized
if NOT %video_format% EQU keep goto :format_unrecognized
if NOT %video_format% EQU mp4 goto :format_unrecognized
if NOT %video_format% EQU avi goto :format_unrecognized
if NOT %video_format% EQU mkv goto :format_unrecognized
if NOT %video_format% EQU webm goto :format_unrecognized
if NOT %video_format% EQU ogg goto :format_unrecognized
if NOT %video_format% EQU flv goto :format_unrecognized

:format_unrecognized
echo Hey, woah now^^! What you just typed there is NOT a real format, or you typed it wrong, OR YOU PUT CAPITALS^^!
echo Please, try that again. (REMEMBER: No capitals^^!)
pause
cls
if %converttype% EQU 1 goto :video_format
if %converttype% EQU 2 goto :audio_format
if %converttype% EQU 3 goto :subtitle_format

:video_help
echo Oh, so you need to know the video formats that Youtube-DLP knows?
echo Well, then you came to the right place^^!
echo The supported formats are:
echo keep - This option keeps the original formats of the extracted video.
echo mp4 - The usual video format the world uses to this day, it's high-quality enough.
echo avi - An older video format that was once used for years, but now, most programs have moved to mp4.
echo mkv - A high-quality file that can store subtitles, pictures, video, and audio in an unlimited amount.
echo webm - A relatively new format that is used for videos on the web, specifically for the coding language HTML5.
echo ogg - Generally known as .ogg, it is a more well known format, and it CAN be used for audio AND video, but this only gives video, and is lossy.
echo flv - This format is used by Adobe's Flash Player, and is known as Flash Video, I don't see the need for this format, but use it as you will.
echo When you are done reading, just press any key to go back to the format screen^^!
pause
cls
goto :video_format

:subtitle_extract_video
cls
choice /c YN /n /m "Do you want to download and inject subtitles into the video Y or N? "
set subtitlesenabled=%ERRORLEVEL%

if %subtitlesenabled% EQU 1 goto :subtitle_format
if %subtitlesenabled% EQU 2 goto :subtitle_reject_transition

:subtitle_reject_transition
echo You don't want subtitles? Alright then.
echo Loading next step...
timeout 2
goto :audio_quality

:audio_quality
cls
echo Now that you have your format set, now let's get the audio quality^^!
echo.
echo Now, this will set how good the audio sounds.
echo The range of the quality scale is 0(High-Quality) - 9(TERRIBLE).
choice /c 0123456789 /n /m "Please input the quality number that you want for audio. "
set /a quality=%ERRORLEVEL%-1
echo Your audio quality is now set^^!
echo You: What happens now?
echo Now? Let's go convert some videos.
pause
cls
goto :transition

:audio_help
echo Oh, so you need to know the audio formats that Youtube-DLP knows?
echo Well, then you came to the right place^^!
echo The supported formats are:
echo best - The default setting within Youtube-DLP.
echo acc - A high-quality audio format that is generally used by Apple's iTunes.
echo flac - Another high-quality audio format that is basically public domain to all people.
echo mp3 - The most common audio format that is seen around the world, which is optimized to use a less amount of space as possible.
echo m4a - A audio format that was originally made to be a successor to mp3s, but isn't really used as often.
echo opus - ANOTHER audio format that was made to replace the mp3, but much like m4a, it isn't really used.
echo vorbis - Generally known as .ogg, it is a more well known format, and it CAN be used for audio AND video, but this only gives audio, and is lossy.
echo wav - The audio format that was made by IBM and Microsoft, and is generally used by Windows, and is still high-quality.
echo When you are done reading, just press any key to go back to the format screen^^!
pause
cls
goto :audio_format

:subtitle_format
cls
echo What format do you want the subtitles to be? (EX: srt, ass, etc.)
echo (If you don't know the formats that Youtube-DLP can use, type help, and this is case sensitive.)
echo (Remember, you can "convert" subtitles!)
set /p "input=Subtitle format please^! "
set subtitle_format=%input%
set audio_format=n/a
if %converttype% EQU 3 set video_format=n/a

if %subtitle_format% EQU help goto :subtitleformat_help
if %subtitle_format% EQU convert goto :subtitle_convert
choice /c YN /n /m "Now, are you SURE this is the format you want? Y or N?"
set option=%ERRORLEVEL%
if %option% EQU 1 goto :subtitle_lang
if %option% EQU 2 goto :format_correction
cls

:format_correction
echo Ah, it seems you have incorrectly typed in your desired subtitle format. Let me reset the prompt for you...
timeout 2
goto :subtitle_format
cls

:subtitle_convert
echo What format do you want to convert the subtitles to? (EX: srt, ass, etc.)
echo (If you don't know the formats that Youtube-DLP can use, type help, and this is case sensitive.)
set /p "input="
set subtitle_convertformat=%input%

if %subtitle_convertformat% EQU help goto :subtitle_convert_help
if %subtitle_convertformat% EQU srt goto :subtitle_lang
if %subtitle_convertformat% EQU ass goto :subtitle_lang
if %subtitle_convertformat% EQU vtt goto :subtitle_lang
if %subtitle_convertformat% EQU lrc goto :subtitle_lang

if NOT %subtitle_convertformat% EQU help goto :format_unrecognized
if NOT %subtitle_convertformat% EQU srt goto :format_unrecognized
if NOT %subtitle_convertformat% EQU ass goto :format_unrecognized
if NOT %subtitle_convertformat% EQU vtt goto :format_unrecognized
if NOT %subtitle_convertformat% EQU lrc goto :format_unrecognized

:subtitle_convert_help
echo Ah, you would like to know the formats Youtube-DLP can convert to...
echo You ask, and I deliver^^!
echo The supported formats are:
echo srt - The more commonly used format, the SubRip Subtitles. These are more basic, and can usually be made manually without special editors.
echo ass - Despite the odd name, the A.S.S subtitle format is an advanced method of subtitling, usually created by the Aegisub application. The name stands for Advanced SubStation Alpha.
echo vtt - WebVTT is a more obscure subtitle format, despite it being built FROM srt. It was developed for HTML, and was created by the World Wide Web Consortium (W3C), making it a sort of a standard.
echo lrc - LRC, or LyRiCs, is a subtitle format built for audio. This isn't something I recommend using, since it looks outdated, and most programs probably don't even use it.
echo When you are done reading, just press any key to go back to the conversion screen^^!
pause
cls
goto :subtitle_convert

:subtitleformat_help
echo Ah, you have asked me for help on subtitle formats.
echo There is just one issue... The subtitles availible depend on the video.
echo There are a varity of subtitle formats, making it difficult to pinpoint the exact subtitles possible.
echo There is a way to convert subtitles within Youtube-DLP, you just need to call for it in the subtitle format prompt, as 'convert'.
echo If you don't want to go through the hassle, type in 'best' as it is the default, and Youtube-DLP choses the best format usable.
echo When you are done reading, just press any key to go back to the format screen^^!
pause
cls
goto :subtitle_format

:subtitle_lang
echo You're getting close to finishing^^! Just hang in there a little longer^^!
echo What language do you want the subtitles to be? (EX: en, ko, auto, etc.)
echo (If you don't know the languages that Youtube-DLP can detect, type list to list the ones available, and this is case sensitive.)
set /p "input=Subtitle language please^! "
set subtitle_lang=%input%
choice /c YN /n /m "Now, are you SURE this is the language you want? Y or N?"
set option=%ERRORLEVEL%
if %option% EQU 1 goto :audio_quality
if %option% EQU 2 goto :lang_correction
cls

if %subtitle_lang% EQU list goto :subtitle_langlist

:subtitle_langlist
echo Alright, I'll get Youtube-DLP ready...
timeout 2
cls
yt-dlp --list-subs %url%
echo.
echo I'll give you a bit to read this.
echo Press any key after you are done reading to return to the subtitle format prompt.
pause
goto :subtitle_format
cls

:lang_correction
echo Ah, it seems you have incorrectly typed in your desired subtitle language. Let me reset the prompt for you...
timeout 2
goto :subtitle_lang
cls

:transition
cls
echo Woah, woah^^! Calm your horses^^! We need to ask you ONE MORE QUESTION.
choice /c YN /n /m "Do you want to review all of your settings? Y or N? "
set option=%ERRORLEVEL%

if %option% EQU 1 goto :currentsettings
if %option% EQU 2 goto :transition2

:currentsettings
echo Oh, so you want to review your settings? Alright then^^!
echo Your current settings are:
echo Video Format: %video_format%
echo Audio Format: %audio_format%
echo Audio Quality: %quality%
echo Subtitle Format: %subtitle_format%
echo Subtitle Language: %subtitle_lang%
echo Video URL Entered: %url%
choice /c YND /n /m "Would you like to change any of these settings? Y or N? "
set change=%ERRORLEVEL%
if %change% EQU 1 goto :changesettings
if %change% EQU 2 goto :downloadstart
if %change% EQU 3 goto :varibaledisplay

:changesettings
echo What setting would you like to change?
echo 1 - Video URL
echo 2 - Video Format
echo 3 - Audio Format
echo 4 - Audio Quality
echo 5 - Subtitle Format
echo 6 - Subtitle Language
choice /c 123456 /n
set settings_change=%ERRORLEVEL%
echo %settings_change%
if %settings_change% EQU 1 goto :url_change
if %settings_change% EQU 2 goto :video_format_change
if %settings_change% EQU 3 goto :audio_format_change
if %settings_change% EQU 4 goto :quality_change
if %settings_change% EQU 5 goto :subtitle_format_change
if %settings_change% EQU 6 goto :subtitle_lang_change

:url_change
set /p "input=Please enter in the new URL you would like to use. "
set url=%input%
echo You set it to "%url%".
echo Sending you back to the current settings screen...
timeout 1
cls
goto :currentsettings

:video_format_change
set /p "input=Please enter in the new video format you would like to use. Just note, that this WILL disable audio extraction^! "
set converttype=1
set video_format=%input%
set audio_format=n/a
echo You set it to "%video_format%".
echo Sending you back to the current settings screen...
timeout 1
cls
goto :currentsettings

:audio_format_change
set /p "input=Please enter in the new audio format you would like to use. Just note, that this WILL disable video extraction^! "
set converttype=2
set audio_format=%input%
set video_format=n/a
echo You set it to "%audio_format%".
echo Sending you back to the current settings screen...
timeout 1
cls
goto :currentsettings

:quality_change
choice /c 0123456789 /n /m "Please enter in the new audio quality you would like to use. [REMEMBER: 0(High-Quality) - 9(TERRIBLE)] "
set /a quality=%ERRORLEVEL%-1
echo You set it to "%quality%".
echo Sending you back to the current settings screen...
timeout 1
cls
goto :currentsettings

:varibaledisplay
echo Current variable values:
echo url = %url%
echo converttype = %converttype%
echo video_format = %video_format%
echo audio_format = %audio_format%
echo quailty = %quality%
echo subtitlesenabled = %subtitlesenabled%
echo subtitle_format = %subtitle_format%
echo subtitle_lang = %subtitle_lang%
echo subtitle_convertformat = %subtitle_convertformat%
pause
cls
goto :currentsettings

:subtitle_format_change
set /p "input=Please enter in the new subtitle format you would like to use. "
set subtitle_format=%input%
echo You set it to "%subtitle_format%".
echo Sending you back to the current settings screen...
timeout 1
cls
goto :currentsettings

:subtitle_lang_change
set /p "input=Please enter in the new subtitle language you would like to use. "
set subtitle_lang=%input%
echo You set it to "%subtitle_lang%".
echo Sending you back to the current settings screen...
timeout 1
cls
goto :currentsettings

:transition2
echo Alright, I know this may be annoying, but it is to ensure...
choice /c YN /n /m "Are you SURE that you are okay with your current settings? Y or N? "
set inneroption=%ERRORLEVEL%
if %inneroption% EQU 1 goto :downloadstart
if %inneroption% EQU 2 goto :transition3

:transition3
echo Alright, I'm gonna send you back to the prompt to review, be ready^^!
pause
cls
goto :transition

:downloadstart
echo Alright^^! Let's get started^^! (Press a key when you are ready.)
pause
cls
echo Preparing Youtube-DLP.
timeout 0.9
cls
echo Preparing Youtube-DLP..
timeout 0.9
cls
echo Preparing Youtube-DLP...
timeout 0.9
cls
echo Preparing Youtube-DLP.
timeout 0.9
cls
echo Preparing Youtube-DLP..
timeout 0.9
cls
echo Preparing Youtube-DLP...
timeout 0.9
cls
echo Preparing Youtube-DLP.
timeout 0.9
cls
echo Preparing Youtube-DLP..
timeout 0.9
cls
echo Preparing Youtube-DLP...
timeout 0.9
cls
echo Preparing Youtube-DLP.
timeout 0.9
cls
echo Preparing Youtube-DLP..
timeout 0.9
cls
echo Preparing Youtube-DLP...
timeout 0.9
cls
echo Preparing Youtube-DLP.
timeout 0.9
cls
echo Preparing Youtube-DLP..
timeout 0.9
cls
echo Preparing Youtube-DLP...
timeout 0.9
cls
echo Preparing Youtube-DLP.
timeout 0.9
cls
echo Preparing Youtube-DLP..
timeout 0.9
cls
echo Preparing Youtube-DLP...
timeout 0.9
cls
echo Preparing Youtube-DLP.
timeout 0.9
cls
echo Preparing Youtube-DLP..
timeout 0.9
cls
echo Preparing Youtube-DLP...
timeout 0.9
cls
echo Preparing Youtube-DLP.
timeout 0.9
cls
echo Preparing Youtube-DLP..
timeout 0.9
cls
echo Preparing Youtube-DLP...
timeout 0.9
cls
echo Preparing Youtube-DLP.
timeout 0.9
cls
echo Preparing Youtube-DLP..
timeout 0.9
cls
echo Preparing Youtube-DLP...
timeout 0.9
cls
goto :variable_clean

:variable_clean
::set url=%url:"=%
::set url=%url:&=%
::echo Cleaned variables of possible exploits^^!
::echo url = %url%
::echo converttype = %converttype%
::echo video_format = %video_format%
::echo audio_format = %audio_format%
::echo quailty = %quality%
::echo subtitlesenabled = %subtitlesenabled%
::echo subtitle_format = %subtitle_format%
::echo subtitle_lang = %subtitle_lang%
::echo subtitle_convertformat = %subtitle_convertformat%
::pause
::cls
if %converttype% EQU 1 goto :video_conversionstart
if %converttype% EQU 2 goto :audio_extract
if %converttype% EQU 3 goto :subtitle_extract

:video_conversionstart
if not %video_format% EQU keep (
	::echo no keep & pause
	if %subtitlesenabled% EQU 1 (
		::echo subs enabled & pause
		goto :nokeep_subs
	) else if %subtitlesenabled% EQU 2 (
		::echo no subs or keep & pause
		goto :video_extract
		)
) else if %video_format% EQU keep (
	::echo keep & pause
	if %subtitlesenabled% EQU 1 (
		::echo subs enabled & pause
		goto :keep_subs
	) else if %subtitlesenabled% EQU 2 (
		::echo no subs and keep & pause
		goto :video_extract_keep
		)
)

:nokeep_subs
if %subtitle_lang% EQU auto (
	::echo auto & pause
	goto :subtitle_extractauto_wvideo
	) else if %subtitle_lang% EQU all (
		::echo all & pause
		goto :subtitle_extractall_wvideo
	) else if NOT %subtitle_lang% EQU auto (
		if NOT %subtitle_lang% EQU all (
			::echo not auto and all & pause
			goto :subtitle_extract_wvideo
			)
		)

:keep_subs
if %subtitle_lang% EQU auto (
	::echo auto & pause
	goto :subtitle_extractauto_wvideokeep
	) else if %subtitle_lang% EQU all (
		::echo all & pause
		goto :subtitle_extractall_wvideokeep
	) else if NOT %subtitle_lang% EQU auto (
		if NOT %subtitle_lang% EQU all (
			::echo not auto and all & pause
			goto :subtitle_extract_wvideokeep
			)
		)

:video_extract
yt-dlp --recode-video %video_format% --audio-quality %quality% %url%
pause
goto :end_video

:audio_extract
yt-dlp --extract-audio --audio-format %audio_format% --audio-quality %quality% %url%
pause
goto :end_audio

:video_extract_keep
yt-dlp --keep-video --audio-quality %quality% %url%
pause
goto :end_video

:subtitle_extract
yt-dlp --write-sub --sub-lang %subtitle_lang% --sub-format %subtitle_format% --skip-download %url%
pause
goto :end_subtitles

:subtitle_extractauto
yt-dlp --write-auto-sub --skip-download %url%
pause
goto :end_subtitles

:subtitle_extract-convert
yt-dlp --write-sub --sub-lang %subtitle_lang% --convert-subs %subtitle_convertformat% --skip-download %url%
pause
goto :end_subtitles

:subtitle_extractauto-convert
yt-dlp --write-auto-sub --convert-subs %subtitle_convertformat% --skip-download %url%
pause
goto :end_subtitles

:subtitle_extract_wvideo
yt-dlp --recode-video %video_format% --audio-quality %quality% --embed-subs --write-sub --sub-lang %subtitle_lang% --sub-format %subtitle_format% %url%
pause
goto :end_video

:subtitle_extractall_wvideo
yt-dlp --recode-video %video_format% --audio-quality %quality% --embed-subs --write-sub --all-subs --sub-format %subtitle_format% %url%
pause
goto :end_video

:subtitle_extractauto_wvideo
yt-dlp --recode-video %video_format% --audio-quality %quality% --embed-subs --write-auto-sub --sub-format %subtitle_format% %url%
pause
goto :end_video

:subtitle_extract_wvideokeep
yt-dlp --keep-video --audio-quality %quality% --embed-subs --write-sub --sub-lang %subtitle_lang% --sub-format %subtitle_format% %url%
pause
goto :end_video

:subtitle_extractall_wvideokeep
yt-dlp --keep-video --audio-quality %quality% --embed-subs --write-sub --all-subs --sub-format %subtitle_format% %url%
pause
goto :end_video

:subtitle_extractauto_wvideokeep
yt-dlp --keep-video --audio-quality %quality% --embed-subs --write-auto-sub --sub-format %subtitle_format% %url%
pause
goto :end_video

:subtitle_extract_wvideo-convert
yt-dlp --recode-video %video_format% --audio-quality %quality% --embed-subs --write-sub --sub-lang %subtitle_lang% --convert-subs %subtitle_convertformat% %url%
pause
goto :end_video

:subtitle_extractall_wvideo-convert
yt-dlp --recode-video %video_format% --audio-quality %quality% --embed-subs --write-sub --all-subs --convert-subs %subtitle_convertformat% %url%
pause
goto :end_video

:subtitle_extractauto_wvideo-convert
yt-dlp --recode-video %video_format% --audio-quality %quality% --embed-subs --write-auto-sub --convert-subs %subtitle_convertformat% %url%
pause
goto :end_video

:subtitle_extract_wvideokeep-convert
yt-dlp --keep-video --audio-quality %quality% --embed-subs --write-sub --sub-lang %subtitle_lang% --convert-subs %subtitle_convertformat% %url%
pause
goto :end_video

:subtitle_extractall_wvideokeep-convert
yt-dlp --keep-video --audio-quality %quality% --embed-subs --write-sub --all-subs --convert-subs %subtitle_convertformat% %url%
pause
goto :end_video

:subtitle_extractauto_wvideokeep-convert
yt-dlp --keep-video --audio-quality %quality% --embed-subs --write-auto-sub --convert-subs %subtitle_convertformat% %url%
pause
goto :end_video

:end_audio
cls
echo Your download is now complete^^! Enjoy your audio^^!
pause
exit

:end_video
cls
echo Your download is now complete^^! Enjoy your video^^!
pause
exit

:end_subtitles
cls
echo Your subtitle extraction is completed^^! Enjoy your subtitles^^!
pause
exit