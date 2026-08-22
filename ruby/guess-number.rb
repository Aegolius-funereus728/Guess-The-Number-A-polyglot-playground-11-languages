secret = rand(1..100)
max_attempts = 10
attempts = 0

puts "  欢迎来到猜数字游戏！"
puts "我已经想好了一个 1 到 100 之间的数字。"
puts "你有 #{max_attempts} 次机会，猜猜看吧！"

loop do
  remaining = max_attempts - attempts
  print "还剩 #{remaining} 次机会，请输入你的猜测: "
  input = gets.chomp
  
  # 校验输入是否为有效整数
  unless input.match?(/^-?\d+$/)
    puts "   请输入有效的整数！"
    next
  end
  
  guess = input.to_i
  
  unless (1..100).cover?(guess)
    puts "   数字必须在 1 到 100 之间！"
    next
  end
  
  attempts += 1
  
  if guess == secret
    puts "恭喜你！猜对了！就是 #{secret}！"
    puts "你用了 #{attempts} 次机会。"
    break
  elsif guess < secret
    puts "太小了，再大一点。"
  else
    puts "太大了，再小一点。"
  end
  
  if attempts == max_attempts
    puts "很遗憾，你已经用完了所有机会。"
    puts "正确答案是 #{secret}。"
    break
  end
end