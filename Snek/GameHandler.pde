class GameHandler {
 Snake snake;
 Score score;
 Body food;
 boolean startGame = true;
 boolean gameOver;
 PFont font;
 PFont tinyFont;

 GameHandler() {
  snake = new Snake();
  score = new Score();
  food = new Body();
  font = createFont("Arial", 28, true);
  tinyFont = createFont("Arial", 14, true);
 }

 void displayAll() {
  snake.display();
  food.display();
  score.display();
 }

 void displaySnake() {
  snake.display();
 }
 
 void displayFood() {
  food.display(); 
 }
 
 void displayScore() {
  score.display(); 
 }

 void moveSnake() {
  snake.move();
 }

 boolean foodCollide() {
  if (snake.headPos.x == food.getPositionX() &&
   snake.headPos.y == food.getPositionY())
   return true;
  else return false;
 }

 boolean selfCollide() {
  for (int i = 1; i < snake.snakeBody.size(); i++) {
   if (snake.headPos.x == snake.snakeBody.get(i).getPositionX() &&
    snake.headPos.y == snake.snakeBody.get(i).getPositionY())
    return true;
  }
  return false;
 }

 boolean wallCollide() {
  if ((snake.headPos.x >= width || snake.headPos.x < 0) ||
   (snake.headPos.y >= height || snake.headPos.y < 0))
   return true;
  else return false;
 }

 void collisionHandler() {
  if (wallCollide() || selfCollide())
   endGame();
  if (foodCollide()) {
   snake.addBody();
   foodGen();  
   score.addScore();
  }
 }

 void endGame() {
  snake.isAlive = false;
  gameOver = true;
  fill(50, 50);
  rect(0, 0, width, height);
  fill(80);
  textAlign(CENTER);
  textFont(font);
  text("You Died.\n Press Space to Restart",width/2,height/2);
 }

 void startGame() {
   if (startGame) {
     fill(50, 50);
     rect(0, 0, width, height);
     textAlign(CENTER);
     textFont(font);
     fill(80);
     text("Welcome to Snake", width/2, height/5);
     textFont(tinyFont);
     text("Move with WASD or Arrow Keys\n Adjust difficulty using frameRate(x)\n 10 = Easy | 20 = Medium | 30 = Hard | 60 = Nuts\n", width/2, height/2.5);
     text("Change game.snake.setFadedColor to false at the top of the code\n to remove the fade and change the snake to a solid color", width/2, height/1.8);
     text("Press any key to start", width/2, height / 1.1);
   }
 }

 void restartGame() {
  if (gameOver) {
   snake.restart();
   score.restart();
   foodGen();
   snake.isAlive = true;
   gameOver = false;
   snake.setDirection(' ');
  }
 }


 void foodGen() {
  food.setPosition(new PVector(Conversion.mapToScreen((int) random((width / 20) - 1)), Conversion.mapToScreen((int) random((width / 20) - 1))));

  for (int i = 0; i < snake.snakeBody.size(); i++) {
   if (food.getPositionX() == snake.snakeBody.get(i).getPositionX() &&
    food.getPositionY() == snake.snakeBody.get(i).getPositionY())
    foodGen(); 
  }
 }
}