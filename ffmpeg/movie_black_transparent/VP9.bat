@echo off
rem 入力ファイル名を取得
set input=%~1
rem 出力ファイル名を生成
set output=%~n1_output.webm
rem ffmpegを使って黒を透過
ffmpeg -i %input% -vf "colorkey=0x000000:0.01:1" -codec:v libvpx-vp9 -pix_fmt yuva420p %output%
rem 終了メッセージを表示
echo Done! Output file is %output%
pause

