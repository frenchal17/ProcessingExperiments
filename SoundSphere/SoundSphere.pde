import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import peasy.*;

FFT fft;
AudioPlayer player;
Minim minim;
AudioInput in;
PeasyCam cam;

int bands = 512;
float[] spectrum = new float[bands];
float turn = 0;

void setup() {
  size(750, 750, P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
  background(0);
  minim = new Minim(this);
  // Create an Input stream which is routed into the Amplitude analyzer
  in = minim.getLineIn(Minim.MONO, 128);
  fft = new FFT(in.bufferSize(), in.sampleRate());
}

void draw() {
  stroke(255);
  background(0);
  //translate(width/2,height/2);
  fft.forward(in.mix);
  for (float i = 0; i < in.bufferSize(); i += 1) {
    //pushMatrix();
      rotateY(i);
      for (int j = 0; j < in.bufferSize(); j += 1) {
          //pushMatrix();
            rotateX(j);
            //line(0, 20, 0, min(max(200 * fft.getBand(j), 21), 50));
            line(0, 20, 0, min(max(2000 * in.left.get(floor(j)), 21), 50));
          //popMatrix();
      }
    //popMatrix();
  }
}
