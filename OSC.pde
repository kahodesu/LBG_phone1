///////////VARIABLES TO SET////////////
String laptopIP = "10.0.1.5";
//String phone2IP = "10.0.1.4";
String everyoneIP = "10.0.1.255";
String phoneName = "/PHONE1";  //"/PHONE1";**with Slash
String phoneName2 = "/PHONE2";  //"/PHONE1";**with Slash

///////////////LIBRARIES////////////////
import oscP5.*;
import netP5.*;

///////////OTHER VARIABLES/////////////
public OscP5 oscP5;
NetAddress laptop;
//NetAddress phone2;
NetAddress everyone;
int phoneVal2;

//////////////FUNCTIONS////////////////
void setupOSC(){
 oscP5 = new OscP5(this,11000);
 // laptop = new NetAddress(laptopIP,11000);
 // phone2 = new NetAddress(phone2IP,11000);
  //laptop = new NetAddress(laptopIP,11000);
  everyone = new NetAddress(everyoneIP,11000);
}

void sendOSC(int Msg){
  OscMessage msg = new OscMessage(phoneName);
   msg.add(Msg); 
 //  oscP5.send(msg, laptop);  
  // oscP5.send(msg, phone2);  
    oscP5.send(msg, everyone);
 
  println("sent");
}


void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern(phoneName2) == true) {
   if(theOscMessage.checkTypetag("i")) {
      phoneVal2 = theOscMessage.get(0).intValue();  
  }
 }
}

