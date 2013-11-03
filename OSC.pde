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
int tankEmpty = 0;

//////////////FUNCTIONS////////////////
void setupOSC() {
  oscP5 = new OscP5(this, 11000);//I listen here
  // laptop = new NetAddress(laptopIP,11000);
  // phone2 = new NetAddress(phone2IP,11000);
  everyone = new NetAddress(everyoneIP, 11000); //i send shit out here
}

void sendOSC(int Msg) {
  OscMessage msg = new OscMessage(phoneName);//putting my ID on it yo
  msg.add(Msg); 
  //oscP5.send(msg, laptop);  
  // oscP5.send(msg, phone2);  
  oscP5.send(msg, everyone);//i am sending this data to everyone!
  return;
}

synchronized void oscEvent(OscMessage theOscMessage) {
  if(theOscMessage.checkAddrPattern(phoneName2) == true) {
  if(theOscMessage.checkTypetag("i")) {
      tankEmpty = theOscMessage.get(0).intValue();  
      println("tank:"+tankEmpty);
  }
 }
}

