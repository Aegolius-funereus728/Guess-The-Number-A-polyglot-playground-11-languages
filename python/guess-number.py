import random

def guess_number_game():
    # 游戏设置
    lower_bound = 1
    upper_bound = 100
    max_attempts = 10
    
    # 生成随机目标数字
    target_number = random.randint(lower_bound, upper_bound)
    
    print("=" * 40)
    print("     欢迎来到猜数字游戏！")
    print("=" * 40)
    print(f"我已想好了一个 {lower_bound} 到 {upper_bound} 之间的数字。")
    print(f"你有 {max_attempts} 次机会来猜中它。")
    print("=" * 40)
    
    for attempt in range(1, max_attempts + 1):
        # 获取玩家输入并验证
        while True:
            try:
                guess = int(input(f"\n第 {attempt} 次猜测，请输入数字: "))
                if lower_bound <= guess <= upper_bound:
                    break
                else:
                    print(f"请输入 {lower_bound} 到 {upper_bound} 之间的整数！")
            except ValueError:
                print("无效输入！请输入一个整数。")
        
        # 检查猜测结果
        if guess == target_number:
            print(f"\n恭喜你！猜对了！就是 {target_number}！")
            print(f"你用了 {attempt} 次机会。")
            break
        elif guess < target_number:
            print("太小了！再大一点。")
        else:
            print("太大了！再小一点。")
        
        # 提示剩余机会
        remaining = max_attempts - attempt
        if remaining > 0:
            print(f"剩余机会: {remaining} 次")
        else:
            print("\n很遗憾，机会用完了。")
            print(f"正确的数字是 {target_number}。")
    
    # 询问是否重新开始
    play_again = input("\n是否再来一局？(y/n): ").strip().lower()
    if play_again == 'y':
        guess_number_game()
    else:
        print("感谢游戏！再见！")

if __name__ == "__main__":
    guess_number_game()