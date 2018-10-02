import processing.sound.*;

import processing.serial.*;

import cc.arduino.*;
import org.firmata.*;

Serial myPort;
String val;

SoundFile bassWav;
SoundFile snareWav;
SoundFile borderSnareWav;
SoundFile hihatWav;

String sound;




void setup() {
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  bassWav = new SoundFile(this, "bass.wav");
  snareWav = new SoundFile(this, "snare.wav");
  borderSnareWav = new SoundFile(this, "aro.wav");
  hihatWav = new SoundFile(this, "hihat.wav");
  size(640, 360);
  background(255);
}


void draw(){
 

  int inBuffer;
  int bass = 1;
  int snare = 2;
  

  while (myPort.available() > 0) {
    inBuffer = myPort.read();
    if (inBuffer == 1){
      println("suena el hihat");
      hihatWav.play();
      delay(1);
    }else if(inBuffer == 2) {
      println("suena el bombo");
      bassWav.play();
      delay(1);
    }
  }
}


  
