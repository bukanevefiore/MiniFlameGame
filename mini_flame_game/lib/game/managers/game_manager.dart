class GameManager {
  int score = 0;

  int bestScore = 0;

  bool isGameOver = false;

  void reset() {
    score = 0;
    isGameOver = false;
  }

  void addScore() {
    score++;

    if (score > bestScore) {
      bestScore = score;
    }
  }

  void gameOver() {
    isGameOver = true;
  }
}