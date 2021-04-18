static float SIDE_LEN=30;
static color[] CUBE_COLORS={#ffffff,#ff0000,#0000ff,#ffff00,#ff8000,#00ff00};
static float CUBE_ROT_ANGLE=0;



Cube c;



void setup(){
	size(600,600,P3D);
	c=new Cube();
	c.scramble();
	println(c.scramble);
}



void draw(){
	background(55);
	c.update();
	c.draw();
}
