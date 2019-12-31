class Land{
  int cols, rows, cols2 ;int scl = 15; int w = 450; int h = 800;
  float yspeed=8; float y=0;
  float a=1,easing=0.04;//ease for frequency
  void kk() {
    cols = w / scl;
    rows = h/ scl;
  }
  void show(){
    float level = AS.GetLevel();
    float f ;
    if(level>0.01){
      f = PD.GetFrequency();
    }else{f=0;
  }
  float fA=f;
  float dA=fA-a;
  a +=dA*easing;
  
    y=y+yspeed;
    translate(width/2-w/2,height/2);
    rotateX(PI/2.5);
    for(int x=0; x<cols;x++){
     for(int i = 0; i < 50; i++){
       float z= pow((x-14.5)*scl,2)/4000*sqrt(a);
       float y = pow(((i+frameCount/15.0f)%30), 1.5);
       float q = pow(((i+frameCount/15.0f)%30), 1.5)*sqrt(a)/80;
          pushMatrix();
          translate(0,y*scl/2,-q);
          stroke(215);
          strokeWeight(2);
          line(x*scl,y,z-sqrt(a)*4,x*scl,y+4,z-sqrt(a)*4);
          popMatrix();
     }
    }
    for(int x=0; x<cols*7.5-7.5;x++){
     for(int i = 0; i < 50; i++){
       float z= pow((x-108)*scl,2)/200000*sqrt(a);
       float y = pow(((i+frameCount/30.0f)%50), 2);
          pushMatrix();/////////
          translate(0,-y*scl/12);
          stroke(235);
          strokeWeight(1.8);
          line(x*scl/7.5,y+h/1.05,z-sqrt(a)*4.5,x*scl/7.5,y+1.1+h/1.05,z-sqrt(a)*4.5);
          popMatrix();//////////
     }
    }
    rotateX(-PI/2.5);
    translate(-width/2+w/2,-height/2);
  }
}
