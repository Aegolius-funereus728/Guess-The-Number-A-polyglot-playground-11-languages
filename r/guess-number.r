target <- sample(1:100, 1)
max_attempts <- 10
attempts <- 0
guessed_correctly <- FALSE

cat("\n=====================================\n")
cat("       欢迎来到猜数字游戏！\n")
cat("=====================================\n")
cat("我已经想好了一个 1 到 100 之间的整数。\n")
cat("你有", max_attempts, "次机会来猜中它。\n")
cat("每次猜测后，我会提示你‘大了’、‘小了’或‘猜中了’。\n")
cat("祝你好运！\n")
cat("=====================================\n\n")

# 主游戏循环
while (attempts < max_attempts && !guessed_correctly) {
  # 计算剩余机会
  remaining <- max_attempts - attempts
  
  # 提示用户输入，并处理非数字输入
  repeat {
    # 显示当前尝试次数和剩余机会
    cat("第", attempts + 1, "次尝试 (剩余", remaining, "次机会): ")
    
    # 读取用户输入
    input <- readline(prompt = "请输入你猜的数字: ")
    
    # 将输入转换为数字，并检查是否为有效整数
    guess <- suppressWarnings(as.numeric(input))
    
    if (is.na(guess)) {
      cat("无效输入！请输入一个整数。\n")
    } else if (guess < 1 || guess > 100) {
      cat("数字超出范围！请输入 1 到 100 之间的整数。\n")
    } else {
      # 输入有效，跳出重复输入循环
      break
    }
  }
  
  # 增加尝试次数
  attempts <- attempts + 1
  
  # 比较猜测值与目标值
  if (guess == target) {
    guessed_correctly <- TRUE
    cat("\n恭喜你！猜中了!\n")
    cat("数字就是", target, "！\n")
    cat("你用了", attempts, "次机会猜中了答案。\n")
  } else if (guess < target) {
    cat("太小了！再大一点。\n\n")
  } else { # guess > target
    cat("太大了！再小一点。\n\n")
  }
}
# 如果机会用尽且未猜中，显示正确答案
if (!guessed_correctly) {
  cat("\n很遗憾，你已经用完了所有", max_attempts, "次机会。\n")
  cat("正确答案是:", target, "\n")
  cat("下次加油！\n")
}

# 游戏结束
cat("\n游戏结束。感谢参与！\n")
cat("=====================================\n")