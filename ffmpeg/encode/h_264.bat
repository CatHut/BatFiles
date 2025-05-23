@echo off
rem 入力ファイル名を取得（引用符付きで）
set "input=%~1"
rem 出力ファイル名を生成（入力ファイルと同じディレクトリに保存）
set "output=%~dp1%~n1_output.mp4"
rem ffmpegを使ってh.264コーデックでエンコード（パスを引用符で囲む）
ffmpeg -i "%input%" -c:v libx264 "%output%"
rem 終了メッセージを表示
echo Done! Output file is "%output%"
pause