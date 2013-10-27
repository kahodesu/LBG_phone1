/////////////////////////////////////////////////
//      Lightning Bug Game - Phone1 Code       // 
//                  Kaho Abe                   //
/////////////////////////////////////////////////
//  *Goes on Android Phone Nexus1 (SHOOTER)    //
//  *See README in LAPTOP code for references! //
//  *Make sure to checkINTERNETon SKETCH PERMS //
/////////////////////////////////////////////////

///////////LIBRARIES/////////////
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
 
  new PIOIOManager(this).start();
  setupOSC();
  setupBT();

}
 
void draw(){

}


