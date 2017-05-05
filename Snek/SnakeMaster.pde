static class SnakeMaster {
  
  static String direction;
  static String closeBody;
 
  static void check(Snake snake, Body food) {
    if (snake.headPos.x == food.getPositionX() && snake.headPos.y > food.getPositionY())
       direction = "N";
    else if (snake.headPos.x < food.getPositionX() && snake.headPos.y == food.getPositionY())
       direction = "E";
    else if (snake.headPos.x == food.getPositionX() && snake.headPos.y < food.getPositionY())
       direction = "S";   
    else if (snake.headPos.x > food.getPositionX() && snake.headPos.y == food.getPositionY())
       direction = "W";   
    else if (snake.headPos.x > food.getPositionX() && snake.headPos.y > food.getPositionY())
       direction = "NW";     
    else if (snake.headPos.x < food.getPositionX() && snake.headPos.y > food.getPositionY())
       direction = "NE";
    else if (snake.headPos.x > food.getPositionX() && snake.headPos.y < food.getPositionY())
       direction = "SW";  
    else if (snake.headPos.x < food.getPositionX() && snake.headPos.y < food.getPositionY())
       direction = "SE";     
  }
  
  static void move(Snake snake) {
    switch (direction) {
      case "N":
      case "NE":
      case "NW":
       snake.setDirection('w');
       break;
      case "S":
      case "SW":
      case "SE":
       snake.setDirection('s');
       break;
      case "E":
       snake.setDirection('d');
       break;
      case "W":
       snake.setDirection('a');
       break;
    }
  }
  
}