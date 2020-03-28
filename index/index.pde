static int SIDE_LEN=30;

Cube CUBE;
ArrayList<Move> scramble_moves;

void setup() {
  size(600, 600, P3D);
  CUBE=new Cube(SIDE_LEN);
  CUBE.scramble();
  println(CUBE.scramble);
}
void draw() {
  background(55);
  CUBE.update();
  CUBE.draw();
}
