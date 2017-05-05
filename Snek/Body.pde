class Body {

 private PVector position;
 private PVector size;
 private color sColor;

 Body() {
  position = new PVector(Conversion.mapToScreen((int) random((width / 20) - 1)), Conversion.mapToScreen((int) random((width / 20) - 1)));
  size = new PVector(20, 20);
  sColor = color(117, 23, 188);

 }

 Body(int x_, int y_, int sizeX_, int sizeY_, color sColor_) {
  position = new PVector(x_, y_);
  size = new PVector(sizeX_, sizeY_);
  sColor = color(sColor_);
 }

 Body(PVector position_, int xSize_, int ySize_, color sColor_) {
  position = new PVector(position_.x, position_.y);
  size = new PVector(xSize_, ySize_);
  sColor = color(sColor_);
 }

 void display() {
  fill(sColor);
  rect(position.x, position.y, size.x, size.y);
 }

 PVector getPosition() {
  return position;
 }

 float getPositionX() {
  return position.x;
 }

 float getPositionY() {
  return position.y;
 }

 void setPosition(PVector position_) {
  position = new PVector(position_.x, position_.y);
 }

 void setPosition(int xPos, int yPos) {
  position = new PVector(xPos, yPos);
 }

 void movePosition(int amountX, int amountY) {
  position = new PVector(position.x + amountX, position.y + amountY);
 }


 PVector getSize() {
  return size;
 }

 void setSize(PVector size_) {
  size = new PVector(size_.x, size_.y);
 }

 void setSize(int xLength, int yHeight) {
  size = new PVector(xLength, yHeight);
 }

 color getColor() {
  return sColor;
 }

 void setColor(color sColor_) {
  sColor = color(sColor_);
 }







}