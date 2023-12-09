@echo off
set input=%1
set output=%~n1_output.webm
rem libvpx-vp9(VP9)でyuva420pフォーマットでエンコード
ffmpeg -i "%input%" -c:v libvpx-vp9 -pix_fmt yuva420p "%output%"
pause

