#   猜数字游戏 - 多语言实现
![Python](https://img.shields.io/badge/Python-3.x-blue)
![Java](https://img.shields.io/badge/Java-11-orange)
![C++](https://img.shields.io/badge/C++-11-green)
![Rust](https://img.shields.io/badge/Rust-stable-red)
![React](https://img.shields.io/badge/React-18-cyan)
![License](https://img.shields.io/badge/license-MIT-yellow)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)

一个用11种编程语言实现的经典猜数字游戏。

##   游戏规则
- 系统随机生成1-100之间的数字
- 玩家输入猜测的数字
- 系统提示"太大了"或"太小了"
- 猜中后显示尝试次数

##   如何运行
### C
```bash
gcc guess-number.c -o guess-number
./guess-number
```
### C#
```bash
cd c#
csc guess-number.cs
mono guess-number.exe  # 或者在Windows下直接运行
```
### C++
```bash
g++ guess-number.cpp -o guess-number
./guess-number
```
### React(fronted)
```bash
cd frontend
npm install
npm start
# 浏览器打开 http://localhost:3000
```
### Go
```bash
cd go
go run guess-number.go
```
### Java
```bash
javac guess-number.java
java guess-number
```
### Python
```bash
cd python
python guess-number.py
```
### R
```bash
cd r
Rscript guess-number.r
```
### Ruby
```bash
cd ruby
ruby guess-number.rb
```
### Rust
```bash
cd rust
cargo run
```
### Swift
```bash
cd swift
swift guess-number.swift
```

## 语言对比
| 语言 | 运行方式 | 特点 |
|------|----------|------|
| **C** | 编译型 | 最底层，手动内存管理，高效 |
| **C++** | 编译型 | 支持面向对象与泛型，高性能 |
| **C#** | 编译型 | 微软生态，垃圾回收，类型安全 |
| **Rust** | 编译型 | 最安全（内存安全无GC），无数据竞争 |
| **Go** | 编译型 | 并发简单（goroutine），部署便捷 |
| **Java** | 编译型 | 跨平台，成熟生态，自动内存管理 |
| **Python** | 解释型 | 最简洁，动态类型，库丰富 |
| **Ruby** | 解释型 | 优雅语法，Rails框架敏捷开发 |
| **R** | 解释型 | 统计分析，数据可视化强大 |
| **JavaScript** | 解释型（JIT） | 浏览器原生，事件驱动，非阻塞I/O |
| **Swift** | 编译型 | 现代语法，安全，Apple生态官方 |

## 项目结构
```text
guess-the-number-game/
├── c/              # C语言版
├── c++/            # C++版
├── c#/             # C#版
├── frontend/       # React网页版
├── go/             # Go语言版
├── java/           # Java版
├── python/         # Python版
├── r/              # R语言版
├── ruby/           # Ruby版
├── rust/           # Rust版
├── swift/          # Swift版
├── LICENSE         # MIT许可证
├── README.md       # 项目说明
├── run-all.bat      # Windows：运行所有语言版本的猜数字游戏
└── run-all.sh       # Mac/Linux ：运行所有语言版本的猜数字游戏
```

## 为什么做这个？
- 学习不同编程语言的语法差异
- 给想学新语言的朋友提供参考
- 纯粹觉得好玩！(=^･ω･^=)

## 发现Bug？
欢迎提 Issue 或者直接 Pull Request！

## 贡献指南
欢迎添加新的语言实现:
- TypeScript
- Kotlin
- Zig
- PHP
- 或者优化现有代码！

## 许可证
MIT