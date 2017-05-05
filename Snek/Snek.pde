GameHandler game;

void setup() {
 frameRate(300);
 size(800, 800);
 game = new GameHandler();
 game.snake.setFadedColor(true);
}

void draw() {
 background(150);
 fill(230); 
 rect(1, 1, width - 1, height - 1);
 game.displayAll();
 game.moveSnake();
 game.collisionHandler();
 game.startGame();
 if (!game.startGame) {
   SnakeMaster.check(game.snake, game.food);
   SnakeMaster.move(game.snake);
 }
}

void keyPressed() {
 if (!game.startGame) { 
 switch (keyCode) {
  case UP:
   game.snake.setDirection('w');
   break;
  case LEFT:
   game.snake.setDirection('a');
   break;
  case DOWN:
   game.snake.setDirection('s');
   break;
  case RIGHT:
   game.snake.setDirection('d');
   break;
 }

 switch (key) {
  case 'w':
   game.snake.setDirection('w');
   break;
  case 'a':
   game.snake.setDirection('a');
   break;
  case 's':
   game.snake.setDirection('s');
   break;
  case 'd':
   game.snake.setDirection('d');
   break;
   }
   
  if (key == ' ')
  game.restartGame();
 }
  
  if (game.startGame) {
   game.startGame = false; 
  }
  
}