@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

rem 文字コードをUTF-8に設定
rem タイトル設定
title 動画からGIFへの変換ツール

rem ドラッグ＆ドロップされたファイルを確認
if "%~1"=="" (
    echo 使用方法: このbatファイルに動画ファイルをドラッグ＆ドロップしてください。
    echo 処理を終了します。
    pause
    exit /b
)

rem 入力ファイル情報の取得
set "inputFile=%~1"
set "fileName=%~n1"
set "outputFile=%~dp1%fileName%.gif"

echo 処理を開始します...
echo.
echo 入力ファイル: "%inputFile%"
echo 出力ファイル: "%outputFile%"
echo.

rem ffmpegが存在するか確認
where ffmpeg >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo エラー: ffmpegが見つかりません。
    echo ffmpegをインストールして、PATHに追加してください。
    echo https://ffmpeg.org/download.html からダウンロードできます。
    pause
    exit /b 1
)

rem 変換処理の実行
echo 変換中...
ffmpeg -i "%inputFile%" -y "%outputFile%"

if %ERRORLEVEL% neq 0 (
    echo.
    echo エラー: 変換処理に失敗しました。
    pause
    exit /b 1
)

echo.
echo 変換が完了しました！
echo 出力ファイル: "%outputFile%"
echo.

rem 確認
set /p "openFile=変換したGIFファイルを開きますか？ (Y/N): "
if /i "%openFile%"=="Y" (
    start "" "%outputFile%"
)

echo.
echo 処理を終了します。
pause
exit /b 0
