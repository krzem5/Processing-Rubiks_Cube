class Move {
  int axis;
  int idx;
  int d;
  float a;
  boolean DONE;
  Move(String a, int i, int d) {
    String AXIS="XYZ";
    this.axis=AXIS.indexOf(a);
    this.idx=i;
    this.a=0;
    this.d=d;
    this.DONE=false;
  }
  void update() {
    this.a+=((this.axis!=0&&this.d==-1)||(this.axis==0&&this.d==1)?1:-1)*radians(0.5);
    if (abs(this.a)>=PI/2) {
      this.DONE=true;
    }
  }
  void rotate_cube(int i, int j, int k) {
    if (this.axis==0&&k==3-1-this.idx) {
      rotateZ(this.a);
    }
    if (this.axis==1&&j==this.idx) {
      rotateY(this.a);
    }
    if (this.axis==2&&i==this.idx) {
      rotateX(this.a);
    }
  }
  void apply_transform(Cubie[][][] old, Cubie[][][] cubes) {
    if (this.axis==0) {
      int k=3-1-this.idx;
      if (this.d==1) {
        cubes=this.transform_cube(2, 0, k, old[0][0][k].colors, cubes);
        cubes=this.transform_cube(2, 2, k, old[2][0][k].colors, cubes);
        cubes=this.transform_cube(0, 2, k, old[2][2][k].colors, cubes);
        cubes=this.transform_cube(0, 0, k, old[0][2][k].colors, cubes);

        cubes=this.transform_cube(2, 1, k, old[1][0][k].colors, cubes);
        cubes=this.transform_cube(1, 2, k, old[2][1][k].colors, cubes);
        cubes=this.transform_cube(0, 1, k, old[1][2][k].colors, cubes);
        cubes=this.transform_cube(1, 0, k, old[0][1][k].colors, cubes);
      }
      if (this.d==-1) {
        cubes=this.transform_cube(0, 2, k, old[0][0][k].colors, cubes);
        cubes=this.transform_cube(2, 2, k, old[0][2][k].colors, cubes);
        cubes=this.transform_cube(2, 0, k, old[2][2][k].colors, cubes);
        cubes=this.transform_cube(0, 0, k, old[2][0][k].colors, cubes);

        cubes=this.transform_cube(1, 2, k, old[0][1][k].colors, cubes);
        cubes=this.transform_cube(2, 1, k, old[1][2][k].colors, cubes);
        cubes=this.transform_cube(1, 0, k, old[2][1][k].colors, cubes);
        cubes=this.transform_cube(0, 1, k, old[1][0][k].colors, cubes);
      }
    }
    if (this.axis==1) {
      int j=this.idx;
      if (this.d==1) {
        cubes=this.transform_cube(2, j, 0, old[0][j][0].colors, cubes);
        cubes=this.transform_cube(2, j, 2, old[2][j][0].colors, cubes);
        cubes=this.transform_cube(0, j, 2, old[2][j][2].colors, cubes);
        cubes=this.transform_cube(0, j, 0, old[0][j][2].colors, cubes);

        cubes=this.transform_cube(2, j, 1, old[1][j][0].colors, cubes);
        cubes=this.transform_cube(1, j, 2, old[2][j][1].colors, cubes);
        cubes=this.transform_cube(0, j, 1, old[1][j][2].colors, cubes);
        cubes=this.transform_cube(1, j, 0, old[0][j][1].colors, cubes);
      }
      if (this.d==-1) {
        cubes=this.transform_cube(0, j, 2, old[0][j][0].colors, cubes);
        cubes=this.transform_cube(2, j, 2, old[0][j][2].colors, cubes);
        cubes=this.transform_cube(2, j, 0, old[2][j][2].colors, cubes);
        cubes=this.transform_cube(0, j, 0, old[2][j][0].colors, cubes);

        cubes=this.transform_cube(1, j, 2, old[0][j][1].colors, cubes);
        cubes=this.transform_cube(2, j, 1, old[1][j][2].colors, cubes);
        cubes=this.transform_cube(1, j, 0, old[2][j][1].colors, cubes);
        cubes=this.transform_cube(0, j, 1, old[1][j][0].colors, cubes);
      }
    }
    if (this.axis==2) {
      int i=this.idx;
      if (this.d==1) {
        cubes=this.transform_cube(i, 0, 2, old[i][0][0].colors, cubes);
        cubes=this.transform_cube(i, 2, 2, old[i][0][2].colors, cubes);
        cubes=this.transform_cube(i, 2, 0, old[i][2][2].colors, cubes);
        cubes=this.transform_cube(i, 0, 0, old[i][2][0].colors, cubes);

        cubes=this.transform_cube(i, 1, 2, old[i][0][1].colors, cubes);
        cubes=this.transform_cube(i, 2, 1, old[i][1][2].colors, cubes);
        cubes=this.transform_cube(i, 1, 0, old[i][2][1].colors, cubes);
        cubes=this.transform_cube(i, 0, 1, old[i][1][0].colors, cubes);
      }
      if (this.d==-1) {
        cubes=this.transform_cube(i, 2, 0, old[i][0][0].colors, cubes);
        cubes=this.transform_cube(i, 2, 2, old[i][2][0].colors, cubes);
        cubes=this.transform_cube(i, 0, 2, old[i][2][2].colors, cubes);
        cubes=this.transform_cube(i, 0, 0, old[i][0][2].colors, cubes);

        cubes=this.transform_cube(i, 2, 1, old[i][1][0].colors, cubes);
        cubes=this.transform_cube(i, 1, 2, old[i][2][1].colors, cubes);
        cubes=this.transform_cube(i, 0, 1, old[i][1][2].colors, cubes);
        cubes=this.transform_cube(i, 1, 0, old[i][0][1].colors, cubes);
      }
    }
  }
  Cubie[][][] transform_cube(int i, int j, int k, color[] old, Cubie[][][] cubes) {
    for (int l=0; l<6; l++) {
      cubes[i][j][k].colors[l]=#000000;
    }
    if (this.axis==0&&this.d==1) {
      /*UP, FRONT, RIGHT, DOWN, BACK, LEFT*/
      cubes[i][j][k].colors[0]=old[5];
      cubes[i][j][k].colors[1]=old[1];
      cubes[i][j][k].colors[2]=old[0];
      cubes[i][j][k].colors[3]=old[2];
      cubes[i][j][k].colors[4]=old[4];
      cubes[i][j][k].colors[5]=old[3];
    }
    if (this.axis==0&&this.d==-1) {
      /*UP, FRONT, RIGHT, DOWN, BACK, LEFT*/
      cubes[i][j][k].colors[0]=old[2];
      cubes[i][j][k].colors[1]=old[1];
      cubes[i][j][k].colors[2]=old[3];
      cubes[i][j][k].colors[3]=old[5];
      cubes[i][j][k].colors[4]=old[4];
      cubes[i][j][k].colors[5]=old[0];
    }
    if (this.axis==1&&this.d==1) {
      /*UP, FRONT, RIGHT, DOWN, BACK, LEFT*/
      cubes[i][j][k].colors[0]=old[0];
      cubes[i][j][k].colors[1]=old[2];
      cubes[i][j][k].colors[2]=old[4];
      cubes[i][j][k].colors[3]=old[3];
      cubes[i][j][k].colors[4]=old[5];
      cubes[i][j][k].colors[5]=old[1];
    }
    if (this.axis==1&&this.d==-1) {
      /*UP, FRONT, RIGHT, DOWN, BACK, LEFT*/
      cubes[i][j][k].colors[0]=old[0];
      cubes[i][j][k].colors[1]=old[5];
      cubes[i][j][k].colors[2]=old[1];
      cubes[i][j][k].colors[3]=old[3];
      cubes[i][j][k].colors[4]=old[2];
      cubes[i][j][k].colors[5]=old[4];
    }
    if (this.axis==2&&this.d==1) {
      /*UP, FRONT, RIGHT, DOWN, BACK, LEFT*/
      cubes[i][j][k].colors[0]=old[4];
      cubes[i][j][k].colors[1]=old[0];
      cubes[i][j][k].colors[2]=old[2];
      cubes[i][j][k].colors[3]=old[1];
      cubes[i][j][k].colors[4]=old[3];
      cubes[i][j][k].colors[5]=old[5];
    }
    if (this.axis==2&&this.d==-1) {
      /*UP, FRONT, RIGHT, DOWN, BACK, LEFT*/
      cubes[i][j][k].colors[0]=old[1];
      cubes[i][j][k].colors[1]=old[3];
      cubes[i][j][k].colors[2]=old[2];
      cubes[i][j][k].colors[3]=old[4];
      cubes[i][j][k].colors[4]=old[0];
      cubes[i][j][k].colors[5]=old[5];
    }
    return cubes;
  }
  String toString() {
    boolean st=this.d==-1;
    String axs="000";
    if (this.idx==0) {
      axs="FUL";
      st=!st;
    }
    if (this.idx==1) {
      axs="SEM";
      if (this.axis==0) {
        st=!st;
      }
    }
    if (this.idx==2) {
      axs="BDR";
    }
    String s=str(axs.charAt(this.axis));
    if (st==true) {
      s+="'";
    }
    return s;
  }
}
