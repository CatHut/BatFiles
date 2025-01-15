@echo off
chcp 65001

rem ドラッグ＆ドロップされた動画ファイルのパスを変数に代入
set "input=%~1"

rem 動画ファイルの拡張子を除いたファイル名を変数に代入
set "output=%~n1"

rem ffmpegコマンドで音声ファイルを抽出
ffmpeg -i "%input%" -vn "%output%.wav"

rem 終了メッセージを表示
echo Done!
pause