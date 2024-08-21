@echo off

echo Appending ~/.vimrc to load config.vim

echo.if has("win32") >> %USERPROFILE%\.vimrc
echo.    so %~dp0config.vim >> %USERPROFILE%\.vimrc
echo.endif >> %USERPROFILE%\.vimrc
