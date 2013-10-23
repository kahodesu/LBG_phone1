///////////VARIABLES TO SET////////////
String laptopIP = "10.0.1.3";
String phoneName = "/PHONE1";  //"/PHONE1";**with Slash
int phoneVal;
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
  laptop = new NetAddress(laptopIP,11000);
}

void sendOSC(int Msg){
  OscMessage msg = new OscMessage(phoneName);
  
   msg.add(Msg); 
   oscP5.send(msg, laptop);  

  // msg = null;
  // info +=msg;

}


//If Phone were receiving messages too
//void oscEvent(OscMessage theOscMessage) {
//  if(theOscMessage.checkAddrPattern("/MAIN") == true) {
//   if(theOscMessage.checkTypetag("i")) {
//      phoneVal = theOscMessage.get(0).intValue();  
//  }
// }
//}

