class Cube {
  /*UP, FRONT, RIGHT, DOWN, BACK, LEFT*/
  color[] COLORS={#ffffff, #ff0000, #0000ff, #ffff00, #ff8000, #00ff00};
  float CUBE_ROT_ANGLE=0;
  Cubie[][][] cubes;
  int side_len;
  ArrayList<Move> moves;
  String  scramble;
  Cube(int side_len) {
    this.side_len=side_len;
    this.scramble="";
    moves=new ArrayList<Move>();
    cubes=new Cubie[3][3][3];
    for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {
        for (int k=0; k<3; k++) {
          cubes[i][j][k]=new Cubie(i, j, k, side_len);
          if (i==3-1) {
            cubes[i][j][k].colors[2]=this.COLORS[2];
          }
          if (i==0) {
            cubes[i][j][k].colors[5]=this.COLORS[5];
          }
          if (j==3-1) {
            cubes[i][j][k].colors[3]=this.COLORS[3];
          }
          if (j==0) {
            cubes[i][j][k].colors[0]=this.COLORS[0];
          }
          if (k==3-1) {
            cubes[i][j][k].colors[1]=this.COLORS[1];
          }
          if (k==0) {
            cubes[i][j][k].colors[4]=this.COLORS[4];
          }
        }
      }
    }
  }
  void update() {
    if (this.moves.size()>0) {
      if (this.moves.get(0).DONE==true) {
        this.moves.get(0).apply_transform(this.clone_cubes(), this.cubes);
        this.moves.remove(0);
      }
      if (this.moves.size()>0) {
        this.moves.get(0).update();
      }
    }
  }
  void draw() {
    background(55);
    for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {
        for (int k=0; k<3; k++) {
          pushMatrix();
          translate(300, 300, 300);
          rotateX(-PI/5);
          rotateY(this.CUBE_ROT_ANGLE);
          if (this.moves.size()>0) {
            this.moves.get(0).rotate_cube(i, j, k);
          }
          cubes[i][j][k].draw();
          popMatrix();
        }
      }
    }
    //this.CUBE_ROT_ANGLE+=radians(0.35);
  }
  void scramble() {
    for (int i=0; i<5; i++) {
      this.make_random_move();
      this.scramble+=this.moves.get(this.moves.size()-1).toString()+" ";
    };
  }
  void make_move(String axis, int idx, int d) {
    this.moves.add(new Move(axis, idx, d));
  }
  void make_random_move() {
    this.make_move(str("XYZ".charAt(floor(random(3)))), floor(random(3)), (random(1)<0.5?-1:1));
  }
  Cubie[][][] clone_cubes() {
    Cubie[][][] copy=new Cubie[3][3][3];
    for (int i=0; i<3; i++) {
      for (int j=0; j<3; j++) {
        for (int k=0; k<3; k++) {
          copy[i][j][k]=new Cubie(i, j, k, this.side_len);
          for (int l=0; l<6; l++) {
            copy[i][j][k].colors[l]=this.cubes[i][j][k].colors[l];
          }
        }
      }
    }
    return copy;
  }
}
