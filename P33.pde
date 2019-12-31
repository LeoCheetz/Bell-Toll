import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim; AudioInput in; FFT fftLin;
Eyes e;Land l; TriangleMind t;
PitchDetectorFFT PD; AudioSource AS;

void setup(){
  fullScreen(P3D);//1680*1050 840*525
  background(0);
  minim = new Minim(this);
  minim.debugOn();
  AS = new AudioSource(minim);
  AS.OpenMicrophone();
  PD = new PitchDetectorFFT();
  PD.ConfigureFFT(2048, AS.GetSampleRate());
  PD.SetSampleRate(AS.GetSampleRate());
  AS.SetListener(PD);
  e= new Eyes(); l= new Land(); t= new TriangleMind();
  l.kk(); e.kk(); t.kk();
}
void draw(){
  noCursor();
  float level = AS.GetLevel();//threshold
  if(level>0.02){
    float f = 0;
    f = PD.GetFrequency();//
    strokeWeight(1); fill(55);
    rect(200,30,f,15);
    textSize(25); fill(155);//Theremin FreqValue
    text(f, 60, 50);
  }
  e.show(); l.show();
  fill(0, 0, 0, 30);
  rect(-10, -10, width+20, height+20);//pitch tube
  t.show();
}
void stop(){
  AS.Close();
  minim.stop();
  super.stop();
}
