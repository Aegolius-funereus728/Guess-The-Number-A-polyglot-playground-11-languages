#include <iostream>
#include <cstdlib>
#include <ctime>
#include <limits>

using namespace std;

void printWelcome() {
    cout << "========================================" << endl;
    cout << "     欢迎来到猜数字游戏！" << endl;
    cout << "========================================" << endl;
    cout << "规则说明：" << endl;
    cout << "1. 系统会随机生成一个1-100之间的整数" << endl;
    cout << "2. 你有10次机会猜出这个数字" << endl;
    cout << "3. 每次猜测后，系统会提示猜大或猜小" << endl;
    cout << "========================================" << endl << endl;
}

void printResult(int guess, int target, int remaining) {
    if (guess > target) {
        cout << "猜大了！再小一点。" << endl;
    } else if (guess < target) {
        cout << "猜小了！再大一点。" << endl;
    }
    cout << "剩余机会: " << remaining << " 次" << endl << endl;
}

int getPlayerGuess() {
    int guess;
    while (true) {
        cout << "请输入你的猜测 (1-100): ";
        cin >> guess;
        
        // 检查输入是否有效
        if (cin.fail()) {
            cin.clear(); // 清除错误状态
            cin.ignore(numeric_limits<streamsize>::max(), '\n'); // 忽略错误输入
            cout << "输入无效！请输入一个整数。" << endl;
            continue;
        }
        
        // 检查范围
        if (guess < 1 || guess > 100) {
            cout << "数字必须在 1-100 之间！" << endl;
            continue;
        }
        
        break;
    }
    return guess;
}

bool playAgain() {
    char choice;
    while (true) {
        cout << "是否再来一局？(y/n): ";
        cin >> choice;
        if (choice == 'y' || choice == 'Y') {
            return true;
        } else if (choice == 'n' || choice == 'N') {
            return false;
        } else {
            cout << "请输入 y 或 n" << endl;
        }
    }
}

int main() {
    srand(static_cast<unsigned int>(time(nullptr))); // 初始化随机种子
    
    do {
        printWelcome();
        
        int target = rand() % 100 + 1; // 生成1-100的随机数
        int maxAttempts = 10;
        int attempts = 0;
        bool guessed = false;
        
        cout << "游戏开始！我已选好了一个1-100之间的数字。" << endl;
        cout << "你有 " << maxAttempts << " 次机会，祝你好运！" << endl << endl;
        
        while (attempts < maxAttempts) {
            int remaining = maxAttempts - attempts;
            cout << "--- 第 " << (attempts + 1) << " 次猜测 ---" << endl;
            
            int guess = getPlayerGuess();
            attempts++;
            remaining--;
            
            if (guess == target) {
                cout << "恭喜你猜对了！就是 " << target << " ！" << endl;
                cout << "你用了 " << attempts << " 次机会。" << endl;
                guessed = true;
                break;
            } else {
                printResult(guess, target, remaining);
            }
        }
        
        if (!guessed) {
            cout << "很遗憾，10次机会用完了！" << endl;
            cout << "正确答案是: " << target << endl;
        }
        
        cout << endl;
        
    } while (playAgain());
    
    cout << "感谢游玩！" << endl;
    return 0;
}