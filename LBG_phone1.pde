////////////////////////////////////
//Lightning Bug Game - Phone1 Code// 
//Kaho Abe                        //
////////////////////////////////////
//Goes on Android Phone Nexus1    //
//This is the Shooter             //
////////////////////////////////////
import ketai.net.*;
import ketai.ui.*;
import ketai.sensors.*;
import oscP5.*;
import netP5.*;
 
KetaiGesture gesture;
KetaiSensor sensor;
public OscP5 oscP5;
NetAddress iMacAddress;
 

float lightValue;
ArrayList<Float> AValue = new ArrayList<Float>();
ArrayList<Float> GValue = new ArrayList<Float>();
ArrayList<Float> OValue = new ArrayList<Float>();
 
void setup(){
  size(displayWidth, displayHeight);
  orientation(LANDSCAPE);
   
  oscP5 = new OscP5(this,12001);
  iMacAddress = new NetAddress("192.168.1.235",12000);
   
  lightValue = 0;
  for(int i = 0; i < 3; i++){
    AValue.add(new Float(0));
    GValue.add(new Float(0));
    OValue.add(new Float(0));
  }
   
  gesture = new KetaiGesture(this);
  sensor = new KetaiSensor(this);
  sensor.enableLight();
  sensor.enableAccelerometer();
  sensor.enableGyroscope();
  sensor.enableOrientation();
  sensor.start();
   
}
 
public boolean surfaceTouchEvent(android.view.MotionEvent event) {
   
  super.surfaceTouchEvent(event);
  return gesture.surfaceTouchEvent(event);
   
}
 
void draw(){
   

   
  String info = "";
  info += "AccelerometerX:"+AValue.get(0)+"\n";
  info += "AccelerometerY:"+AValue.get(1)+"\n";
  info += "AccelerometerZ:"+AValue.get(2)+"\n";
 
  info += "OrientationX:"+OValue.get(0)+"\n";
  info += "OrientationY:"+OValue.get(1)+"\n";
  info += "OrientationZ:"+OValue.get(2)+"\n";
   
  OscMessage sendValue = new OscMessage("/AndroidOSC");
  sendValue.add(lightValue);
  sendValue.add(AValue.get(0));
  sendValue.add(AValue.get(1));
  sendValue.add(AValue.get(2));
  sendValue.add(OValue.get(0));
  sendValue.add(OValue.get(1));
  sendValue.add(OValue.get(2));
  oscP5.send(sendValue, iMacAddress);
   
  background(0);
  textSize(20);
  fill(255);
  text(info,50,50);
   
}
 
void onAccelerometerEvent(float x, float y, float z){
   
  float AX = 0.9*GValue.get(0)+0.1*x;
  float AY = 0.9*GValue.get(1)+0.1*y;
  float AZ = 0.9*GValue.get(2)+0.1*z;
   
  AValue.set(0,AX);
  AValue.set(1,AY);
  AValue.set(2,AZ);
   
}
 
 
 /*
void onGyroscopeEvent(float x, float y, float z){
   
  float GX = 0.9*GValue.get(0)+0.1*x;
  float GY = 0.9*GValue.get(1)+0.1*y;
  float GZ = 0.9*GValue.get(2)+0.1*z;
   
  GValue.set(0,GX);
  GValue.set(1,GY);
  GValue.set(2,GZ);
   
}
 
 */
 
void onOrientationEvent(float x, float y, float z){
   
  float OX = 0.9*OValue.get(0)+0.1*x;
  float OY = 0.9*OValue.get(1)+0.1*y;
  float OZ = 0.9*OValue.get(2)+0.1*z;
   
  OValue.set(0,OX);
  OValue.set(1,OY);
  OValue.set(2,OZ);
   
}
 
void onLightEvent(float v){
   
//  lightValue = v;
lightValue = 5;
   
}
 

/*
void onPinch(float x, float y, float d){
   
  pinchValue = d;
   
}
*/
