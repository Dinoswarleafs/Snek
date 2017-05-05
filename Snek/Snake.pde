class Snake { //<>//
 ArrayList < Body > snakeBody = new ArrayList < Body > ();
 private PVector headPos;
 private boolean isAlive = true;
 private char direction;
 private boolean fadedColor = false;

 Snake() {
  headPos = new PVector(Conversion.mapToScreen((int) random((width / 20) - 1)), Conversion.mapToScreen((int) random((width / 20) - 1)));
  snakeBody.add(new Body(headPos, 20, 20, color(100, 0, 100)));
 }

 Snake(int xPos, int yPos) {
  headPos = new PVector(xPos, yPos);
  snakeBody.add(new Body(xPos, yPos, 20, 20, color(100, 0, 100)));
 }

 void display() {
  for (int i = 0; i < snakeBody.size(); i++) {
   stroke(179, 140, 198); 
   if (fadedColor)
     snakeBody.get(i).setColor(color(100, 0, 100, map(i, 0, snakeBody.size(), 250, 50)));
   snakeBody.get(i).display();
  }
 }

 void move() {
  if (isAlive) {
   switch (direction) {
    case 'w':
     for (int i = snakeBody.size() - 1; i > 0; i--)
      snakeBody.set(i, snakeBody.get(i - 1));
     headPos = new PVector(headPos.x, headPos.y - 20);
     moveHead();
     break;
    case 'a':
     for (int i = snakeBody.size() - 1; i > 0; i--)
      snakeBody.set(i, snakeBody.get(i - 1));
     headPos = new PVector(headPos.x - 20, headPos.y);
     moveHead();
     break;
    case 's':
     for (int i = snakeBody.size() - 1; i > 0; i--)
      snakeBody.set(i, snakeBody.get(i - 1));
     headPos = new PVector(headPos.x, headPos.y + 20);
     moveHead();
     break;
    case 'd':
     for (int i = snakeBody.size() - 1; i > 0; i--)
      snakeBody.set(i, snakeBody.get(i - 1));
     headPos = new PVector(headPos.x + 20, headPos.y);
     moveHead();
     break;
   }
  }
 }

 void addBody() {
  PVector location = new PVector(snakeBody.get(snakeBody.size() - 1).getPositionX(), snakeBody.get(snakeBody.size() - 1).getPositionY());
  snakeBody.add(new Body(location, 20, 20, color(100, 0, 100)));
 }

 void moveHead() {
  snakeBody.set(0, new Body(headPos, 20, 20, color(100, 0, 100)));
 }

 char getDirection() {
  return direction;
 }

 void setDirection(char direction_) {
  char requestDirection = direction_;
  if (snakeBody.size() > 2) {
   switch (requestDirection) {
    case 'w' :
     if (direction != 's')
     direction = requestDirection;
     break;
    case 'a' :
     if (direction != 'd')
     direction = requestDirection;
     break;
    case 's' :
     if (direction != 'w')
     direction = requestDirection;
     break;
    case 'd' : 
     if (direction != 'a')
     direction = requestDirection;
     break;
   }
  }
  else direction = requestDirection;
 }

 void restart() {
  snakeBody.clear();
  headPos = new PVector(Conversion.mapToScreen((int) random((width / 20) - 1)), Conversion.mapToScreen((int) random((width / 20) - 1)));
  
  snakeBody.add(new Body(headPos, 20, 20, color(100, 0, 100)));
 }
 
 void setFadedColor(boolean fadedColor_) {
  fadedColor = fadedColor_; 
 }

}