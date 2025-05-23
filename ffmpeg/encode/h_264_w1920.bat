@echo off
rem 入力ファイル名を取得
set input=%~1

rem 出力ファイル名を生成
set "output=%~dp1%~n1_output_1920w.mp4"

rem ffmpegを使って動画の横幅を1920にリサイズし、h.264コーデックでエンコード
ffmpeg -i %input% ^
-vf "scale=1920:-1" ^
-c:v libx264 -preset slow -crf 22 ^
-c:a copy ^
%output%

rem 終了メッセージを表示
echo Done! Output file is %output%
pause