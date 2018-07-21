#include <Wiichuck.h>
#include <Wire.h>
#include <TMRpcm.h>

Wiichuck wii;
TMRpcm tmrpcm;

void setup() {
  wii.init();
  wii.calibrate();
  Serial.begin(9600);
}

void loop() {
  if (wii.poll()) {
    if(wii.buttonC){
      tmrpcm.play("Bass-Drum-1.wav");
    }
    Serial.print("joy:");
    Serial.print(wii.joyX());
    Serial.print(", ");
    Serial.print(wii.joyY());
    Serial.print("  \t");
    
    Serial.print("accle:");
    Serial.print(wii.accelX());
    Serial.print(", ");
    Serial.print(wii.accelY());
    Serial.print(", ");
    Serial.print(wii.accelZ());
    Serial.print("  \t");
    
    Serial.print("button:");
    Serial.print(wii.buttonC());
    Serial.print(", ");
    Serial.print(wii.buttonZ());
    Serial.println("");
  }
  
delay(100);
}

