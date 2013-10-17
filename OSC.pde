///////////VARIABLES TO SET////////////
String laptopIP = "10.0.1.2";
String phoneName = "/PHONE1";  //"/PHONE1";**with Slash

///////////////LIBRARIES////////////////
import ketai.net.*;
import oscP5.*;
import netP5.*;

///////////OTHER VARIABLES/////////////
public OscP5 oscP5;
NetAddress laptop;

//////////////FUNCTIONS////////////////
void setupOSC(){
  oscP5 = new OscP5(this,12001);
  laptop = new NetAddress(laptopIP,12000);
}

void sendOSC(){
  //uses OSC to send values to Laptop
  OscMessage sendValue = new OscMessage(phoneName);
  sendValue.add(lightValue);
  sendValue.add(accelerometerX);
  sendValue.add(accelerometerY);
  sendValue.add(accelerometerZ);
  oscP5.send(sendValue, laptop);  
}

