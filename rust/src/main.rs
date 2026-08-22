use rand::Rng;
use std::cmp::Ordering;
use std::io;

fn main() {
    println!("欢迎来到猜数字游戏！");
    println!("我已经生成了一个 1 到 100 之间的整数。");
    println!("你有 10 次机会来猜中它。");
    
    // 生成随机数
    let secret_number = rand::thread_rng().gen_range(1..=100);
    let mut remaining_attempts = 10;
    
    while remaining_attempts > 0 {
        println!("\n剩余机会: {}", remaining_attempts);
        println!("请输入你的猜测: ");
        
        // 读取用户输入
        let mut guess = String::new();
        io::stdin()
            .read_line(&mut guess)
            .expect("读取输入失败");
        
            // 将输入转换为数字
        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                println!("无效输入，请输入一个数字！");
                continue;
            }
        };
        
        // 检查范围
        if guess < 1 || guess > 100 {
            println!("请输入 1 到 100 之间的数字！");
            continue;
        }
        
        // 比较猜测与秘密数字
        match guess.cmp(&secret_number) {
            Ordering::Less => println!("太小了！"),
            Ordering::Greater => println!("太大了！"),
            Ordering::Equal => {
                println!("恭喜你，猜对了！数字就是 {}。", secret_number);
                return;
            }
        }
        remaining_attempts -= 1;
    }
    
    // 机会用尽
    println!("\n很遗憾，10 次机会已用完。正确的数字是: {}", secret_number);
}