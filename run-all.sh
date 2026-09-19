# Mac / Linux 批处理脚本：运行所有语言版本的猜数字游戏
# ⚠️ 注意事项
# 1. 赋予执行权限
# bash:
# chmod +x run-all.sh
# 2. 运行
# bash:
# ./run-all.sh
# 3. 环境变量
# 确保以下命令在命令行中可用：
# python - Python
# gcc - C 编译器
# g++ - C++ 编译器
# csc - C# 编译器
# javac/java - Java
# go - Go
# cargo - Rust
# ruby - Ruby
# Rscript - R
# swift - Swift

#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

clear

echo -e "${CYAN}"
echo "╔═══════════════════════════════════════════════╗"
echo "║                                           ║"
echo "║       猜数字游戏 - 多语言版              ║"
echo "║                                           ║"
echo "║     支持 11 种编程语言！                  ║"
echo "║                                           ║"
echo "╚═══════════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${YELLOW}请选择要运行的语言：${NC}"
echo ""
echo -e "${GREEN} 1)  Python 🐍${NC}"
echo -e "${BLUE} 2)  C 🔧${NC}"
echo -e "${BLUE} 3)  C++ 🔧${NC}"
echo -e "${PURPLE} 4)  C# 🎯${NC}"
echo -e "${RED} 5)  Java ☕${NC}"
echo -e "${CYAN} 6)  Go 🚀${NC}"
echo -e "${YELLOW} 7)  Rust 🦀${NC}"
echo -e "${PURPLE} 8)  Ruby 💎${NC}"
echo -e "${GREEN} 9)  R 📊${NC}"
echo -e "${BLUE} 10) Swift 🖥️${NC}"
echo -e "${CYAN} 11) 前端网页版 🌐${NC}"
echo ""
echo -e "${RED} 0)  退出${NC}"
echo ""
echo -n "请输入数字选择 [0-11]: "
read choice

if [[ -z "$choice" ]]; then
    echo -e "${RED}  无效输入，请重新运行脚本${NC}"
    exit 1
fi

case $choice in
    1)
        echo -e "${GREEN}▶ 运行 Python 版本...${NC}"
        cd python && python3 guess-number.py
        ;;
    2)
        echo -e "${GREEN}▶ 编译并运行 C 版本...${NC}"
        cd c
        gcc guess-number.c -o guess-number
        if [ $? -eq 0 ]; then
            ./guess-number
        else
            echo -e "${RED}  编译失败！请检查是否安装了 gcc${NC}"
        fi
        ;;
    3)
        echo -e "${GREEN}▶ 编译并运行 C++ 版本...${NC}"
        cd c++
        g++ guess-number.cpp -o guess-number
        if [ $? -eq 0 ]; then
            ./guess-number
        else
            echo -e "${RED}  编译失败！请检查是否安装了 g++${NC}"
        fi
        ;;
    4)
        echo -e "${GREEN}▶ 编译并运行 C# 版本...${NC}"
        cd c#
        if command -v mcs &> /dev/null; then
            mcs guess-number.cs
            mono guess-number.exe
        elif command -v csc &> /dev/null; then
            csc guess-number.cs
            ./guess-number.exe
        else
            echo -e "${RED}  未找到 C# 编译器！请安装 Mono 或 .NET SDK${NC}"
        fi
        ;;
    5)
        echo -e "${GREEN}▶ 编译并运行 Java 版本...${NC}"
        cd java
        javac GuessNumberGame.java
        if [ $? -eq 0 ]; then
            java GuessNumberGame
        else
            echo -e "${RED}  编译失败！请检查是否安装了 JDK${NC}"
        fi
        ;;
    6)
        echo -e "${GREEN}▶ 运行 Go 版本...${NC}"
        cd go
        go run guess-number.go
        ;;
    7)
        echo -e "${GREEN}▶ 运行 Rust 版本...${NC}"
        cd rust
        cargo run
        ;;
    8)
        echo -e "${GREEN}▶ 运行 Ruby 版本...${NC}"
        cd ruby
        ruby guess-number.rb
        ;;
    9)
        echo -e "${GREEN}▶ 运行 R 版本...${NC}"
        cd r
        Rscript guess-number.r
        ;;
    10)
        echo -e "${GREEN}▶ 运行 Swift 版本...${NC}"
        cd swift
        swift guess-number.swift
        ;;
    11)
        echo -e "${GREEN}▶ 启动前端网页版...${NC}"
        cd frontend
        if [ ! -d "node_modules" ]; then
            echo -e "${YELLOW}  首次运行，正在安装依赖...${NC}"
            npm install
        fi
        echo -e "${GREEN}🌐 启动开发服务器...${NC}"
        echo -e "${YELLOW}浏览器将打开 http://localhost:3000${NC}"
        npm start
        ;;
    0)
        echo -e "${GREEN}  再见！${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}  无效选择！请输入 0-11 之间的数字${NC}"
        echo ""
        echo -e "${YELLOW}按回车键重新启动脚本...${NC}"
        read
        exec "$0"
        ;;
esac

echo ""
echo -e "${YELLOW}按回车键返回主菜单...${NC}"
read
exec "$0"