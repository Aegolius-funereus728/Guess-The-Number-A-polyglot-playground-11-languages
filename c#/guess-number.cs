using System;

namespace GuessNumberGame
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("=====================================");
            Console.WriteLine("     欢迎来到猜数字游戏！");
            Console.WriteLine("=====================================");
            Console.WriteLine("游戏规则：");
            Console.WriteLine("1. 系统会随机生成一个1-100之间的数字");
            Console.WriteLine("2. 你有10次机会猜中这个数字");
            Console.WriteLine("3. 每次猜测后会提示'大了'或'小了'");
            Console.WriteLine("=====================================\n");
            
            bool playAgain = true;
            while (playAgain)
            {
                PlayGame();
                
                Console.Write("\n是否再来一局？(y/n): ");
                string input = Console.ReadLine();
                playAgain = input.ToLower() == "y" || input.ToLower() == "yes";
                Console.WriteLine();
            }
            Console.WriteLine("感谢游玩，再见！");
        }
        
        static void PlayGame()
        {
            Random random = new Random();
            int targetNumber = random.Next(1, 101); // 生成1-100之间的随机数
            int maxAttempts = 10;
            int attempts = 0;
            bool isGuessed = false;
            
            Console.WriteLine($"新游戏开始！你有{maxAttempts}次机会。\n");
            
            while (attempts < maxAttempts)
            {
                int remaining = maxAttempts - attempts;
                Console.Write($"请输入你的猜测 (剩余{remaining}次机会): ");
                
                // 获取用户输入并验证
                string input = Console.ReadLine();
                if (!int.TryParse(input, out int guess))
                {
                    Console.WriteLine("请输入有效的数字！\n");
                    continue;
                }
                
                // 验证输入范围
                if (guess < 1 || guess > 100)
                {
                    Console.WriteLine("请输入1-100之间的数字！\n");
                    continue;
                }
                
                attempts++;
                
                // 判断猜测结果
                if (guess == targetNumber)
                {
                    Console.WriteLine($"\n恭喜你猜对了！就是 {targetNumber}！");
                    Console.WriteLine($"你用了 {attempts} 次机会。");
                    isGuessed = true;
                    break;
                }
                else if (guess < targetNumber)
                {
                    Console.WriteLine("太小了！再大一点。\n");
                }
                else
                {
                    Console.WriteLine("太大了！再小一点。\n");
                }
            }
            
            // 如果10次都没猜中
            if (!isGuessed)
            {
                Console.WriteLine($"\n很遗憾，10次机会用完了！");
                Console.WriteLine($"正确答案是：{targetNumber}");
            }
            
            // 显示统计信息
            Console.WriteLine($"\n本局使用了 {attempts} 次机会。");
        }
    }
}