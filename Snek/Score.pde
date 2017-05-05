class Score {
  int score;
  int highScore;
  PFont font;
  color sColor;
  color fColor;
  
  
  Score() {
   noStroke();
   score = 0;
   highScore = score; 
   font = createFont("Arial", 16, true);
   sColor = color(180, 30);
   fColor = color(189);
  }
  
  void display() {
   noStroke();
   fill(sColor);
   rect(1, 1, 150, 60);
   textFont(font);
   fill(fColor);
   textAlign(LEFT);
   text("Current Score : " + score, 5, 25);
   text("Highest Score : " + highScore, 5, 45);
  }
  
  void addScore() {
   score++;
   if (score > highScore)
    highScore = score;
  }
  
  void restart() {
   score = 0; 
  }
  
  
  
}