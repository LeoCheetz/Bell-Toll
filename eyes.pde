class Eyes{
  float x,y,b,q;
  float xspeed,yspeed,bspeed,qspeed;
  int rra; int num=16;
  float rad=145; float plus;
  float noiseMultiplier = random(0.01, 0.012);
  float cc=0; float rag=130; int cr=350;
  float a=1,easing=0.04;//ease for frequency
  void kk(){
  }
  void show(){
    float level = AS.GetLevel();float f;//threshold
    if(level>0.01){
      f = PD.GetFrequency();
    }else{f=0;}
    float fA=f;
    float dA=fA-a;
    a +=dA*easing;
    
    colorMode(HSB,360, 100, 100);
    xspeed=xspeed+0.005;//xy setting
    yspeed=yspeed+0.003;
    bspeed=bspeed+0.006;
    qspeed=qspeed+0.004;
    x=noise(xspeed)*110+1070;
    y=noise(yspeed)*90+600;
    b=noise(bspeed)*110+480;
    q=noise(qspeed)*90+600;
    if(x>1300||x<850){
      x=-x;}
    if(y>700||y<570){
      y=-y;}
    if(b>700||b<300){
      b=-b;}
    if(q>700||q<570){
      q=-q;}//xy setting
    rotateX(-PI/18);
    translate(x,y);///////
    float scl=TWO_PI/num;
    for(float i=0; i<PI*2;i=i+scl){
      pushMatrix();
      plus=noise( noiseMultiplier * (i*12000+frameCount))*rag;
      rotate(i);
      float hue=335;
      float pink=map(a,0,240,0,92);
      float gray=map(a,0,240,96,89);
      stroke(hue,pink,gray);
      strokeWeight(0.8);
      float gap=47;
      float c=rad+plus+sqrt(a)/5;
      line(0,gap,0,c);
      line(gap/(c+3)*12,gap/(c+3)*(c-15),12,c-15);
          
      fill(hue,pink,gray);
      stroke(hue,pink,gray);
      ellipse(0,c+3,7+sqrt(a)/4,7+sqrt(a)/4);//bloodshot
      ellipse(12,c-15+3,7+sqrt(a)/4,7+sqrt(a)/4);
      popMatrix();
    }
    stroke(cr); strokeWeight(3); fill(0);
    ellipse(0,0,90+sqrt(a)/1.1,90+sqrt(a)/1.1);
    //////C2cccccccccccc
    cc = cc + PI/460;
    pushMatrix();
    rotate( cc ); 
    stroke(cr); strokeWeight(8);
    line(0, 0, 35, 35);
    cc = cc + PI/6000;
    rotate( cc );
    strokeWeight(5); stroke(cr);
    line(0, 0, 65, 65);
    popMatrix();//cccccccccccccccccc
    ellipse(0,0,2,2);//coreclock
    translate(-x,-y);
    translate(b,q);
    for(float i=0; i<PI*2;i=i+scl){
      plus=noise( noiseMultiplier * (i*1200+frameCount))*rag;
      pushMatrix();
          rotate(i);
          float hue=335;
          float pink=map(a,2,240,0,92);
          float gray=map(a,2,240,96,89);
          stroke(hue,pink,gray);
          strokeWeight(0.8);
          float c=rad+plus+sqrt(a/1.3);
          float gap=47;
          line(0,gap,0,c);
          line(gap/(c+3)*12,gap/(c+3)*(c-15),12,c-15);
          fill(hue,pink,gray);
          stroke(hue,pink,gray);
          ellipse(0,c+3,7+sqrt(a)/4,7+sqrt(a)/4);//bloodshot
          ellipse(12,c-15+3,7+sqrt(a)/4,7+sqrt(a)/4);
          popMatrix();
    }
    stroke(cr); strokeWeight(3); fill(0);
    ellipse(0,0,90+sqrt(a)/1.1,90+sqrt(a)/1.1);
    //////ccccccccccccc
    cc = cc + PI/460;
    pushMatrix();
    rotate( cc ); 
    stroke(cr);
    strokeWeight(8);
    line(0, 0, 35, 35);
    cc = cc + PI/6006;
    rotate( cc );
    strokeWeight(5);
    stroke(cr);
    line(0, 0,65, 65);
    popMatrix();//ccccc
    ellipse(0,0,2,2);//coreclock
    translate(-b,-q);
    rotateX(PI/18);
    
  }
}
