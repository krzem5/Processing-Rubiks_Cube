class Cubie {
  PVector pos;
  color[] colors={#000000, #000000, #000000, #000000, #000000, #000000};
  int side_len;
  Cubie(int x, int y, int z, int side_len) {
    this.pos=new PVector(x, y, z);
    this.side_len=side_len;
  }
  void draw() {
    pushMatrix();
    translate(-((3-1)*this.side_len/2), -((3-1)*this.side_len/2), -((3-1)*this.side_len/2));
    translate(this.pos.x*this.side_len, this.pos.y*this.side_len, this.pos.z*this.side_len);
    float r=SIDE_LEN/2;
    stroke(0);    
    //UP
    beginShape();
    fill(this.colors[0]);
    vertex(-r, -r, -r);
    vertex(-r, -r, r);
    vertex(r, -r, r);
    vertex(r, -r, -r);
    endShape();
    //FRONT
    beginShape();
    fill(this.colors[1]);
    vertex(-r, -r, r);
    vertex(-r, r, r);
    vertex(r, r, r);
    vertex(r, -r, r);
    endShape();
    //RIGHT
    beginShape();
    fill(this.colors[2]);
    vertex(r, -r, -r);
    vertex(r, -r, r);
    vertex(r, r, r);
    vertex(r, r, -r);
    endShape();
    //DOWN
    beginShape();
    fill(this.colors[3]);
    vertex(-r, r, -r);
    vertex(-r, r, r);
    vertex(r, r, r);
    vertex(r, r, -r);
    endShape();
    //FRONT
    beginShape();
    fill(this.colors[4]);
    vertex(-r, -r, -r);
    vertex(-r, r, -r);
    vertex(r, r, -r);
    vertex(r, -r, -r);
    endShape();
    //RIGHT
    beginShape();
    fill(this.colors[5]);
    vertex(-r, -r, -r);
    vertex(-r, -r, r);
    vertex(-r, r, r);
    vertex(-r, r, -r);
    endShape();
    popMatrix();
  }
}
