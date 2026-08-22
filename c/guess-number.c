#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int number, guess, attempts = 0;
    int max_attempts = 10;  // 最多尝试次数
    char play_again;

    // 用当前时间作为随机种子
    srand((unsigned int)time(NULL));
    
    printf("====================================\n");
    printf("     欢迎来到猜数字游戏！\n");
    printf("====================================\n");
    
    do {
        // 生成 1-100 之间的随机数
        number = rand() % 100 + 1;
        attempts = 0;
        
        printf("\n我已经想好了一个 1 到 100 之间的数字。\n");
        printf("你有 %d 次机会猜中它。\n", max_attempts);
        printf("------------------------------------\n");
        
        // 猜数字循环
        while (attempts < max_attempts) {
            printf("第 %d 次尝试，请输入你猜的数字：", attempts + 1);
            scanf("%d", &guess);
            
            // 输入合法性检查
            if (guess < 1 || guess > 100) {
                printf("请输入 1 到 100 之间的数字！\n");
                continue;
            }
            
            attempts++;
            
            if (guess == number) {
                printf("恭喜你猜对了！就是 %d！\n", number);
                printf("你一共用了 %d 次尝试。\n", attempts);
                break;
            } else if (guess < number) {
                printf("太小了，再大一点！\n");
            } else {
                printf("太大了，再小一点！\n");
            }
            
            // 提示剩余次数
            if (attempts < max_attempts) {
                printf("还剩 %d 次机会。\n", max_attempts - attempts);
            }
        }
        
        // 如果超过最大尝试次数还没猜中
        if (attempts == max_attempts && guess != number) {
            printf("很遗憾，机会用完了。正确的数字是 %d。\n", number);
        }
        
        // 询问是否继续
        printf("\n是否再来一局？(y/n): ");
        scanf(" %c", &play_again);
    
    } while (play_again == 'y' || play_again == 'Y');
    
    printf("\n感谢游玩，再见！\n");
    return 0;
}