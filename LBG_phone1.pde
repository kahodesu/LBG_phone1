////////////////////////////////////
//Lightning Bug Game - Phone1 Code// 
//Kaho Abe                        //
////////////////////////////////////
//Goes on Android Phone Nexus1    //
//This is the Shooter             //
//                                //
//**remember to check INTERNET    //
//on SKETCH PERMISSIONS!!!!!!     //
////////////////////////////////////

///////////VARIABLES TO SET////////////
String laptopIP = "10.0.1.2";
String phoneName = "/PHONE1";//"/PHONE1";**with Slash


///////////OTHER VARIABLES/////////////
import ketai.net.*;
import ketai.ui.*;
import ketai.sensors.*;
import oscP5.*;
import netP5.*;
 
KetaiGesture gesture;
KetaiSensor sensor;
public OscP5 oscP5;
NetAddress laptop;
 
float accelerometerX, accelerometerY, accelerometerZ;
float lightValue;

///////////MAIN CODE/////////////
void setup(){
  size(displayWidth, displayHeight);
  orientation(LANDSCAPE);
   
  oscP5 = new OscP5(this,12001);
  laptop = new NetAddress(laptopIP,12000);
   
 
  lightValue = 0;

   
  gesture = new KetaiGesture(this);
  sensor = new KetaiSensor(this);
  sensor.enableLight();
  sensor.enableAccelerometer();
  //sensor.enableGyroscope();
  //sensor.enableOrientation();
  sensor.start();

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
  
  //uses OSC to send values to Laptop
  OscMessage sendValue = new OscMessage(phoneName);
  sendValue.add(lightValue);
  sendValue.add(accelerometerX);
  sendValue.add(accelerometerY);
  sendValue.add(accelerometerZ);
  oscP5.send(sendValue, laptop);
}

//upon reading Accelerometer
void onAccelerometerEvent(float x, float y, float z)
{
  accelerometerX = x;
  accelerometerY = y;
  accelerometerZ = z;
}

//Saving this for something else? 
void onLightEvent(float v){
   
  lightValue = v;
   
}
 

