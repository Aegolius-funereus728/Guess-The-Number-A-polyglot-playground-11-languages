import Foundation

struct GameStats {
    var gamesPlayed: Int = 0
    var gamesWon: Int = 0
    var totalAttempts: Int = 0
    var bestScore: Int = Int.max
    
    mutating func recordGame(won: Bool, attempts: Int) {
        gamesPlayed += 1
        if won {
            gamesWon += 1
            totalAttempts += attempts
            if attempts < bestScore {
                bestScore = attempts
            }
        }
    }
    
    func display() {
        let winRate = gamesPlayed > 0 ? Double(gamesWon) / Double(gamesPlayed) * 100 : 0
        let avgAttempts = gamesWon > 0 ? Double(totalAttempts) / Double(gamesWon) : 0
        
        print("\n  游戏统计")
        print("━".padding(toLength: 30, withPad: "━", startingAt: 0))
        print("总游戏数：\(gamesPlayed)")
        print("胜利次数：\(gamesWon)")
        print("胜率：\(String(format: "%.1f", winRate))%")
        if gamesWon > 0 {
            print("平均猜中次数：\(String(format: "%.1f", avgAttempts))")
            print("最佳成绩：\(bestScore)次猜中")
        }
        print("━".padding(toLength: 30, withPad: "━", startingAt: 0))
    }
}

class AdvancedGuessGame {
    private let maxAttempts = 10
    private let range = 1...100
    private var targetNumber: Int = 0
    private var attempts: Int = 0
    private var isGameOver: Bool = false
    private var history: [Int] = []
    private var stats = GameStats()
    
    init() {
        resetGame()
    }
    
    func resetGame() {
        targetNumber = Int.random(in: range)
        attempts = 0
        isGameOver = false
        history.removeAll()
        print("\n  新游戏开始！")
        print("范围：\(range.lowerBound)-\(range.upperBound)")
        print("机会：\(maxAttempts)次\n")
    }
    
    func guess(_ number: Int) -> String {
        guard !isGameOver else {
            return "游戏已结束，请开始新游戏 (输入 'new' 开始)"
        }
        
        guard range.contains(number) else {
            return "  数字必须在\(range.lowerBound)-\(range.upperBound)之间！"
        }
        
        attempts += 1
        history.append(number)
        let remaining = maxAttempts - attempts
        
        if number == targetNumber {
            isGameOver = true
            stats.recordGame(won: true, attempts: attempts)
            return """
                  恭喜你！猜对了！就是\(targetNumber)
            用了\(attempts)次机会
            历史猜测：\(history.map(String.init).joined(separator: " → "))
            """
        }
        
        let hint = number < targetNumber ? "  太小了，往大猜" : "  太大了，往小猜"
        
        if attempts >= maxAttempts {
            isGameOver = true
            stats.recordGame(won: false, attempts: attempts)
            return """
            \(hint)
              机会用完了！正确答案是：\(targetNumber)
            历史猜测：\(history.map(String.init).joined(separator: " → "))
            """
        }
        
        return "\(hint) (剩余\(remaining)次)"
    }
    
    func getHint() -> String? {
        guard !isGameOver && attempts > 0 else { return nil }
        
        // 根据已有猜测给出智能提示
        let sortedHistory = history.sorted()
        var lowerBound = range.lowerBound
        var upperBound = range.upperBound
        
        for guess in sortedHistory {
            if guess < targetNumber && guess > lowerBound {
                lowerBound = guess
            } else if guess > targetNumber && guess < upperBound {
                upperBound = guess
            }
        }
        
        if lowerBound == range.lowerBound && upperBound == range.upperBound {
            return nil
        }
        
        return "  提示：数字在 \(lowerBound) 到 \(upperBound) 之间"
    }
    
    func showStats() {
        stats.display()
    }
    
    func getStatus() -> String {
        if isGameOver {
            return "游戏已结束"
        }
        var status = "已猜\(attempts)次，剩余\(maxAttempts - attempts)次"
        if let hint = getHint() {
            status += "\n" + hint
        }
        return status
    }
}

// 主游戏循环
func playAdvancedGame() {
    let game = AdvancedGuessGame()
    
    while true {
        print("\n" + game.getStatus())
        print("  输入数字 (1-100) | 'stats'查看统计 | 'new'新游戏 | 'quit'退出")
        print("  你的选择：", terminator: " ")
        
        guard let input = readLine()?.lowercased() else { continue }
        
        switch input {
        case "quit", "q":
            print("  感谢游玩！")
            game.showStats()
            return
            
        case "new", "n":
            game.resetGame()
            continue
            
        case "stats", "s":
            game.showStats()
            continue
            
        default:
            guard let number = Int(input) else {
                print("  无效输入，请输入数字或命令")
                continue
            }
            
            let result = game.guess(number)
            print(result)
            
            if result.contains("恭喜") || result.contains("机会用完了") {
                game.showStats()
                print("\n输入 'new' 开始新游戏，或 'quit' 退出")
            }
        }
    }
}

// 启动游戏
print("  欢迎来到猜数字游戏！")
print("━".padding(toLength: 40, withPad: "━", startingAt: 0))
playAdvancedGame()