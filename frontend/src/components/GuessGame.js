import React, { useState } from 'react';
import './GuessGame.css';

const GuessGame = () => {
  const [target, setTarget] = useState(() => Math.floor(Math.random() * 100) + 1);
  const [guess, setGuess] = useState('');
  const [message, setMessage] = useState('猜一个 1-100 之间的数字');
  const [attempts, setAttempts] = useState(10);
  const [gameOver, setGameOver] = useState(false);
  const handleGuess = () => {
    if (gameOver) return;
    const num = Number(guess);
    if (num < 1 || num > 100 || isNaN(num)) {
      setMessage('  请输入 1-100 的有效数字');
      return;
    }
    const newAttempts = attempts - 1;
    if (num === target) {
      setMessage(`  恭喜！就是 ${target}！你赢了！`);
      setGameOver(true);
    } else if (newAttempts === 0) {
      setMessage(`  机会用完了，数字是 ${target}`);
      setGameOver(true);
    } else {
      const hint = num < target ? '  太小了' : '  太大了';
      setMessage(`  ${hint}，还剩 ${newAttempts} 次机会`);
      setAttempts(newAttempts);
    }
    setGuess('');
  };
  
  const resetGame = () => {
    setTarget(Math.floor(Math.random() * 100) + 1);
    setGuess('');
    setMessage('  新游戏！猜一个 1-100 之间的数字');
    setAttempts(10);
    setGameOver(false);
  };
  
  const handleKeyPress = (e) => {
    if (e.key === 'Enter') {
      handleGuess();
    }
  };
  
  return (
    <div className="game-container">
      <h1>  猜数字</h1>
      <p className="subtitle">范围 1-100 · 你有 10 次机会</p>
      
      <div className="attempts-bar">
        <span>剩余次数</span>
        <span className="attempts-number">{attempts}</span>
      </div>
      
      <div className="message-box">
        <p>{message}</p>
      </div>
      
      <div className="input-group">
        <input
          type="number"
          min="1"
          max="100"
          value={guess}
          onChange={(e) => setGuess(e.target.value)}
          onKeyPress={handleKeyPress}
          disabled={gameOver}
          placeholder="输入数字"
        />
        <button onClick={handleGuess} disabled={gameOver}>
          猜
        </button>
      </div>
      
      <button className="reset-btn" onClick={resetGame}>
          重新开始
      </button>
    </div>
  );
};

export default GuessGame;