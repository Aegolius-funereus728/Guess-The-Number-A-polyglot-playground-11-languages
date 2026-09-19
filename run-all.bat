REM Windows 批处理脚本：运行所有语言版本的猜数字游戏
REM ⚠️ 注意事项
REM 1. 编码问题
REM 如果菜单显示乱码，把第一行的 chcp 65001 改成 chcp 936（简体中文）或 chcp 437（英文）
REM 2. 环境变量
REM 确保以下命令在命令行中可用：
REM python - Python
REM gcc - C 编译器
REM g++ - C++ 编译器
REM csc - C# 编译器
REM javac/java - Java
REM go - Go
REM cargo - Rust
REM ruby - Ruby
REM Rscript - R
REM swift - Swift

@echo off
chcp 65001 >nul
title   猜数字游戏 - 多语言版
color 0A

:menu
cls
echo ========================================
echo      猜数字游戏 - 多语言版
echo ========================================
echo.
echo  请选择要运行的语言：
echo.
echo   [1] Python
echo   [2] C
echo   [3] C++
echo   [4] C# 
echo   [5] Java
echo   [6] Go
echo   [7] Rust
echo   [8] Ruby
echo   [9] R
echo  [10] Swift
echo  [11] 前端网页版 (React)
echo  [12] 运行所有语言 (依次演示)
echo  [0] 退出
echo.
echo ========================================
set /p choice="请输入数字选择 (0-12): "

if "%choice%"=="1" goto python
if "%choice%"=="2" goto c
if "%choice%"=="3" goto cpp
if "%choice%"=="4" goto csharp
if "%choice%"=="5" goto java
if "%choice%"=="6" goto go
if "%choice%"=="7" goto rust
if "%choice%"=="8" goto ruby
if "%choice%"=="9" goto r
if "%choice%"=="10" goto swift
if "%choice%"=="11" goto frontend
if "%choice%"=="12" goto all
if "%choice%"=="0" goto exit
echo.
echo   无效选择，请重新输入！
timeout /t 2 >nul
goto menu

:python
cls
echo 🐍 运行 Python 版本...
echo.
cd python
python guess-number.py
echo.
echo ========================================
echo 按任意键返回菜单...
pause >nul
cd ..
goto menu

:c
cls
echo ⚙️ 运行 C 版本...
echo.
cd c
echo 正在编译...
gcc guess-number.c -o guess-number.exe
if errorlevel 1 (
    echo   编译失败！请确认已安装 GCC
    pause >nul
    cd ..
    goto menu
)
guess-number.exe
echo.
echo ========================================
echo 按任意键返回菜单...
pause >nul
cd ..
goto menu

:cpp
cls
echo ⚙️ 运行 C++ 版本...
echo.
cd c++
echo 正在编译...
g++ guess-number.cpp -o guess-number.exe
if errorlevel 1 (
    echo   编译失败！请确认已安装 G++
    pause >nul
    cd ..
    goto menu
)
guess-number.exe
echo.
echo ========================================
echo 按任意键返回菜单...
pause >nul
cd ..
goto menu

:csharp
cls
echo 🎯 运行 C# 版本...
echo.
cd c#
echo 正在编译...
csc guess-number.cs
if errorlevel 1 (
    echo   编译失败！请确认已安装 .NET Framework SDK
    pause >nul
    cd ..
    goto menu
)
guess-number.exe
echo.
echo ========================================
echo 按任意键返回菜单...
pause >nul
cd ..
goto menu

:java
cls
echo ☕ 运行 Java 版本...
echo.
cd java
echo 正在编译...
javac GuessNumberGame.java
if errorlevel 1 (
    echo   编译失败！请确认已安装 JDK
    pause >nul
    cd ..
    goto menu
)
java GuessNumberGame
echo.
echo ========================================
echo 按任意键返回菜单...
pause >nul
cd ..
goto menu

:go
cls
echo 🐹 运行 Go 版本...
echo.
cd go
go run guess-number.go
echo.
echo ========================================
echo 按任意键返回菜单...
pause >nul
cd ..
goto menu

:rust
cls
echo 🦀 运行 Rust 版本...
echo.
cd rust
echo 正在构建...
cargo run
if errorlevel 1 (
    echo   运行失败！请确认已安装 Rust
    pause >nul
    cd ..
    goto menu
)
echo.
echo ========================================
echo 按任意键返回菜单...
pause >nul
cd ..
goto menu

:ruby
cls
echo 💎 运行 Ruby 版本...
echo.
cd ruby
ruby guess-number.rb
echo.
echo ========================================
echo 按任意键返回菜单...
pause >nul
cd ..
goto menu

:r
cls
echo 📊 运行 R 版本...
echo.
cd r
Rscript guess-number.r
echo.
echo ========================================
echo 按任意键返回菜单...
pause >nul
cd ..
goto menu

:swift
cls
echo 🚀 运行 Swift 版本...
echo.
cd swift
swift guess-number.swift
echo.
echo ========================================
echo 按任意键返回菜单...
pause >nul
cd ..
goto menu

:frontend
cls
echo 🌐 运行前端网页版...
echo.
cd frontend
echo 正在检查依赖...
if not exist "node_modules" (
    echo 首次运行，正在安装依赖...
    call npm install
)
echo 启动 React 开发服务器...
start http://localhost:3000
call npm start
echo.
echo ========================================
echo 按任意键返回菜单...
pause >nul
cd ..
goto menu

:all
cls
echo   运行所有语言版本...
echo.
echo ========================================
echo [1/11] Python
echo ========================================
cd python && python guess-number.py
cd ..
echo.
echo ========================================
echo [2/11] C
echo ========================================
cd c && gcc guess-number.c -o guess-number.exe && guess-number.exe
cd ..
echo.
echo ========================================
echo [3/11] C++
echo ========================================
cd c++ && g++ guess-number.cpp -o guess-number.exe && guess-number.exe
cd ..
echo.
echo ========================================
echo [4/11] C#
echo ========================================
cd c# && csc guess-number.cs && guess-number.exe
cd ..
echo.
echo ========================================
echo [5/11] Java
echo ========================================
cd java && javac GuessNumberGame.java && java GuessNumberGame
cd ..
echo.
echo ========================================
echo [6/11] Go
echo ========================================
cd go && go run guess-number.go
cd ..
echo.
echo ========================================
echo [7/11] Rust
echo ========================================
cd rust && cargo run
cd ..
echo.
echo ========================================
echo [8/11] Ruby
echo ========================================
cd ruby && ruby guess-number.rb
cd ..
echo.
echo ========================================
echo [9/11] R
echo ========================================
cd r && Rscript guess-number.r
cd ..
echo.
echo ========================================
echo [10/11] Swift
echo ========================================
cd swift && swift guess-number.swift
cd ..
echo.
echo ========================================
echo [11/11] 前端 React
echo ========================================
cd frontend
if not exist "node_modules" call npm install
start http://localhost:3000
call npm start
cd ..
echo.
echo ========================================
echo   所有语言运行完成！
echo ========================================
pause
goto menu

:exit
echo.
echo   再见！
timeout /t 2 >nul
exit