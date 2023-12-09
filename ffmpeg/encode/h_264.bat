@echo off
rem 入力ファイル名を取得
set input=%~1
rem 出力ファイル名を生成
set output=%~n1_output.mp4
rem ffmpegを使ってh.264コーデックでエンコード
ffmpeg -i %input% -c:v libx264 %output%
rem 終了メッセージを表示
echo Done! Output file is %output%
pause