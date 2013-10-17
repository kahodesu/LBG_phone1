/////////////////////////////////////////////////
//      Lightning Bug Game - Phone1 Code       // 
//                  Kaho Abe                   //
/////////////////////////////////////////////////
//  *Goes on Android Phone Nexus1 (SHOOTER)    //
//  *See README in LAPTOP code for references! //
//  *Make sure to checkINTERNETon SKETCH PERMS //
/////////////////////////////////////////////////

///////////LIBRARIES/////////////
import ketai.ui.*;

///////////MAIN CODE/////////////
void setup(){
  size(displayWidth, displayHeight);
  orientation(LANDSCAPE);
   
  setupOSC();
  setupSensors();
}
 
void draw(){
  //to display Accelerometer readings on phone screen
  String info = "";
  info += "PHONE TWO\n";
  info += "=======================\n"; 
  info += "x: " + nfp(accelerometerX, 1, 3) + "\n";
  info += "y: " + nfp(accelerometerY, 1, 3) + "\n";
  info += "z: " + nfp(accelerometerZ, 1, 3)+ "\n";
  info += "\n";
  info += lightValue+ "\n";  //whatever variable I want to send to laptop
  
  //Phone screen crap
  background(0);
  textSize(20);
  fill(255);
  text(info,50,50); 
  
  //Ideally want to end up sending simple data after phone processes things.
  sendOSC();
 
}


