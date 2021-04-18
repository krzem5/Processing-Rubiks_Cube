class Cube{
	Cubie[][][] cubes;
	ArrayList<Move> ml;
	String scramble;



	Cube(){
		this.scramble="";
		this.ml=new ArrayList<Move>();
		this.cubes=new Cubie[3][3][3];
		for (int i=0;i<3;i++){
			for (int j=0;j<3;j++){
				for (int k=0;k<3;k++){
					this.cubes[i][j][k]=new Cubie(i,j,k);
					if (i==3-1){
						this.cubes[i][j][k].colors[2]=CUBE_COLORS[2];
					}
					if (i==0){
						this.cubes[i][j][k].colors[5]=CUBE_COLORS[5];
					}
					if (j==3-1){
						this.cubes[i][j][k].colors[3]=CUBE_COLORS[3];
					}
					if (j==0){
						this.cubes[i][j][k].colors[0]=CUBE_COLORS[0];
					}
					if (k==3-1){
						this.cubes[i][j][k].colors[1]=CUBE_COLORS[1];
					}
					if (k==0){
						this.cubes[i][j][k].colors[4]=CUBE_COLORS[4];
					}
				}
			}
		}
	}



	void update(){
		if (this.ml.size()>0){
			if (this.ml.get(0).done==true){
				this.ml.get(0).apply_transform(this.clone_cubes(),this.cubes);
				this.ml.remove(0);
			}
			if (this.ml.size()>0){
				this.ml.get(0).update();
			}
		}
	}



	void draw(){
		background(55);
		for (int i=0;i<3;i++){
			for (int j=0;j<3;j++){
				for (int k=0;k<3;k++){
					pushMatrix();
					translate(300,300,300);
					rotateX(-PI/5);
					rotateY(CUBE_ROT_ANGLE);
					if (this.ml.size()>0){
						this.ml.get(0).rotate_cube(i,j,k);
					}
					this.cubes[i][j][k].draw();
					popMatrix();
				}
			}
		}
	}



	void scramble(){
		for (int i=0;i<5;i++){
			this.make_random_move();
			this.scramble+=this.ml.get(this.ml.size()-1).toString()+" ";
		}
	}



	void make_move(String axis,int idx,int d){
		this.ml.add(new Move(axis,idx,d));
	}



	void make_random_move(){
		this.make_move(str("XYZ".charAt(floor(random(3)))),floor(random(3)),(random(1)<0.5?-1:1));
	}



	Cubie[][][] clone_cubes(){
		Cubie[][][] o=new Cubie[3][3][3];
		for (int i=0;i<3;i++){
			for (int j=0;j<3;j++){
				for (int k=0;k<3;k++){
					o[i][j][k]=new Cubie(i,j,k);
					for (int l=0;l<6;l++){
						o[i][j][k].colors[l]=this.cubes[i][j][k].colors[l];
					}
				}
			}
		}
		return o;
	}
}
