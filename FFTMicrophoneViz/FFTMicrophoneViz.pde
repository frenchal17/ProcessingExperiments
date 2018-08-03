import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

FFT fft;
AudioPlayer player;
Minim minim;
AudioInput in;

int bands = 512;
float[] spectrum = new float[bands];
float turn = 0;

void setup() {
  size(512, 512);
  background(255);
  minim = new Minim(this);
  // Create an Input stream which is routed into the Amplitude analyzer
  in = minim.getLineIn();
  fft = new FFT(in.bufferSize(), in.sampleRate());
}      

void draw() { 
  translate(width/2, height/2);
  background(255);
  fft.forward(in.mix);
  for(int i = 0; i < (3 * fft.specSize() / 4); i++)
  {
    pushMatrix();
      rotate(turn);
      line(35, 0, 35 + min(fft.getBand(i)*400, 150), 0);
      pushMatrix();
        translate(i/2, 0);
        ellipse(0,0,30 * fft.getBand(i),30 * fft.getBand(i));
      popMatrix();
      pushMatrix();
        rotate(PI/2);
        translate(i/2, 0);
        ellipse(0,0,30 * fft.getBand(i),30 * fft.getBand(i));
      popMatrix();
      pushMatrix();
        rotate(3*PI/2);
        translate(i/2, 0);
        ellipse(0,0,30 * fft.getBand(i),30 * fft.getBand(i));
      popMatrix();
      pushMatrix();
        rotate(PI);
        translate(i/2, 0);
        ellipse(0,0,30 * fft.getBand(i),30 * fft.getBand(i));
      popMatrix();
    popMatrix();
    turn += PI/(bands/4);
  }
  turn = 0;
}
