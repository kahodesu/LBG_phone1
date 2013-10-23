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

boolean holdingHands = false;
boolean lastHoldingHands = false;

boolean pushButtonState = false;
DigitalInput pushButton;
boolean buttonread = false;
      
 String info;
///////////MAIN CODE/////////////
void setup(){
  size(displayWidth, displayHeight);
  orientation(LANDSCAPE);
  setupOSC();
   new PIOIOManager(this).start();

}
 
void draw(){
  // status();
}


