import java.util.Random;
import java.util.Scanner;

public class GuessNumberGame {
    
    public static void main(String[] args) {
        // 创建随机数生成器和扫描器
        Random random = new Random();
        Scanner scanner = new Scanner(System.in);
        
        // 生成1-100的随机数
        int targetNumber = random.nextInt(100) + 1;
        int maxAttempts = 10;
        int attempts = 0;
        boolean hasGuessedCorrectly = false;
        
        System.out.println("========================================");
        System.out.println("        欢迎来到猜数字游戏！");
        System.out.println("========================================");
        System.out.println("游戏规则：");
        System.out.println("1. 系统已随机生成一个 1-100 之间的整数");
        System.out.println("2. 您共有 " + maxAttempts + " 次猜测机会");
        System.out.println("3. 每次猜测后，系统会提示您猜大或猜小");
        System.out.println("========================================\n");
        
        // 游戏主循环
        while (attempts < maxAttempts) {
            int remainingAttempts = maxAttempts - attempts;
            System.out.print("请输入您的猜测（剩余 " + remainingAttempts + " 次机会）: ");
            
            // 获取玩家输入并验证
            int guess;
            try {
                guess = scanner.nextInt();
            } catch (Exception e) {
                System.out.println("请输入有效的整数！");
                scanner.next(); // 清除无效输入
                continue;
            }
            
            // 验证输入范围
            if (guess < 1 || guess > 100) {
                System.out.println("请输入 1-100 之间的数字！");
                continue;
            }
            
            attempts++;
            
            // 比较猜测值与目标值
            if (guess == targetNumber) {
                hasGuessedCorrectly = true;
                System.out.println("\n恭喜您！猜对了！");
                System.out.println("目标数字就是 " + targetNumber);
                System.out.println("您用了 " + attempts + " 次机会猜中！");
                break;
            } else if (guess < targetNumber) {
                System.out.println("猜小了！再大一点");
            } else {
                System.out.println("猜大了！再小一点");
            }
            
            // 提示剩余机会
            if (attempts < maxAttempts) {
                System.out.println("----------------------------------------\n");
            }
        }
        
        // 游戏结束处理
        if (!hasGuessedCorrectly) {
            System.out.println("\n========================================");
            System.out.println("很遗憾，您用完了所有机会！");
            System.out.println("正确的数字是： " + targetNumber);
            System.out.println("========================================");
        } else {
            System.out.println("========================================");
            System.out.println("          游戏结束，感谢参与！");
            System.out.println("========================================");
        }
        
        scanner.close();
    }
}