class Cubie{
	PVector p;
	color[] colors={#000000,#000000,#000000,#000000,#000000,#000000};



	Cubie(int x,int y,int z){
		this.p=new PVector(x,y,z);
	}



	void draw(){
		pushMatrix();
		translate(-((3-1)*SIDE_LEN/2),-((3-1)*SIDE_LEN/2),-((3-1)*SIDE_LEN/2));
		translate(this.p.x*SIDE_LEN,this.p.y*SIDE_LEN,this.p.z*SIDE_LEN);
		float r=SIDE_LEN/2;
		stroke(0);
		beginShape();
		fill(this.colors[0]);
		vertex(-r,-r,-r);
		vertex(-r,-r,r);
		vertex(r,-r,r);
		vertex(r,-r,-r);
		endShape();
		beginShape();
		fill(this.colors[1]);
		vertex(-r,-r,r);
		vertex(-r,r,r);
		vertex(r,r,r);
		vertex(r,-r,r);
		endShape();
		beginShape();
		fill(this.colors[2]);
		vertex(r,-r,-r);
		vertex(r,-r,r);
		vertex(r,r,r);
		vertex(r,r,-r);
		endShape();
		beginShape();
		fill(this.colors[3]);
		vertex(-r,r,-r);
		vertex(-r,r,r);
		vertex(r,r,r);
		vertex(r,r,-r);
		endShape();
		beginShape();
		fill(this.colors[4]);
		vertex(-r,-r,-r);
		vertex(-r,r,-r);
		vertex(r,r,-r);
		vertex(r,-r,-r);
		endShape();
		beginShape();
		fill(this.colors[5]);
		vertex(-r,-r,-r);
		vertex(-r,-r,r);
		vertex(-r,r,r);
		vertex(-r,r,-r);
		endShape();
		popMatrix();
	}
}
