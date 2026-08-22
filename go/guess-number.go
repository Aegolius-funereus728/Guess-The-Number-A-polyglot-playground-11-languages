package main

import (
    "fmt"
	"math/rand"
 	"time"
)

func main() {
	// 使用当前时间作为随机种子，确保每次运行数字不同
	rand.Seed(time.Now().UnixNano())
	// 生成1-100之间的随机数
	target := rand.Intn(100) + 1
	
	var guess int
	maxAttempts := 10
	attempts := 0
	
	fmt.Println("====================================")
	fmt.Println("     欢迎来到猜数字游戏！")
	fmt.Println("====================================")
	fmt.Printf("游戏规则：")
	fmt.Printf("1. 系统会随机生成一个1-100之间的数字")
	fmt.Printf("2. 你有10次机会猜中这个数字")
	fmt.Printf("3. 每次猜测后会提示'大了'或'小了'")
	fmt.Printf("你有 %d 次机会来猜中它。\n\n", maxAttempts)
	
	// 主循环，最多尝试 maxAttempts 次
	for attempts < maxAttempts {
		fmt.Printf("请输入你的猜测 (剩余 %d 次): ", maxAttempts-attempts)
		_, err := fmt.Scan(&guess)
		if err != nil {
			fmt.Println("输入无效，请输入一个整数。")
			// 清除输入缓冲区中的错误数据
			var discard string
			fmt.Scanln(&discard)
			continue
		}
		
		// 检查输入范围
		if guess < 1 || guess > 100 {
			fmt.Println("   请输入 1 到 100 之间的数字。")
			continue
		}
		
		attempts++
		
		// 比较猜测与目标值
		if guess == target {
			fmt.Printf("\n恭喜你！你猜对了！数字就是 %d。\n", target)
			fmt.Printf("你用了 %d 次机会。\n", attempts)
			return
		} else if guess < target {
			fmt.Println("太小了，再大一点。")
		} else {
			fmt.Println("太大了，再小一点。")
		}
		
		// 在最后一次机会时给出提示
		if attempts == maxAttempts {
			fmt.Printf("\n很遗憾，你的 %d 次机会已经用完。\n", maxAttempts)
			fmt.Printf("正确的数字是 %d。\n", target)
			fmt.Println("下次加油！")
		}
	}
}