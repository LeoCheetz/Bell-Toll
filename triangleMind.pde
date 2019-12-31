class TriangleMind{
  float a=305; float b=270;
  float t=0;
  float c=1,easing=0.03;//ease for frequency
  void kk() {
  }
  void show(){
    float level = AS.GetLevel();
    float f ;
    if(level>0.01){
      f = PD.GetFrequency();
    }else{f=0;
  }
  float fA=f;
  float dA=sqrt(fA)/250-c;
  c +=dA*easing;
    
    t=t+0.01;
    float plus=noise(t)/9-c*1.1;
    if(plus>1||plus<-1){
      plus=-plus;}
    translate(width/2-10,height/4);
    noStroke(); fill(255,90);
    //central one
    triangle(-a/2,sqrt(a*a*3/4),0,0,a/2,sqrt(a*a*3/4));
    rotateX(PI/2.4-plus);//bottom
    translate(0,50,-230);
    fill(255,40);
    triangle(-b/2,sqrt(b*b*3/4),0,0,b/2,sqrt(b*b*3/4));
    translate(0,-50,230);
    //Left
    rotateY(PI/1.5);
    translate(120,0,25);
    rotateX(-PI/12-plus);
    triangle(-b/2,sqrt(b*b*3/4),0,0,b/2,sqrt(b*b*3/4));
    rotateX(PI/12+plus);
    translate(-120,0,-25);
    rotateY(-PI/1.5);//Left end
    //Right one
    rotateY(-PI/1.5);
    translate(-120,0,25);
    rotateX(-PI/12-plus);
    triangle(-b/2,sqrt(b*b*3/4),0,0,b/2,sqrt(b*b*3/4));
    rotateX(PI/12+plus);
    translate(120,0,-25);
    rotateY(PI/1.5);//Right end
    //end
    rotateX(-PI/2.4+plus);
    translate(-width/2,-height/4);
  }
}
