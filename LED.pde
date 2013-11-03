///////////////LIBRARIES////////////////
import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

///////////////VARIABLES////////////////
PwmOutput[] pinArray = new PwmOutput[8];
DigitalOutput[] digPinArray = new DigitalOutput[8];
int mode = 0;

int[] row= {
  29, 30, 31, 32, 34, 35, 36, 37
};
int[] rowMixed= {
  34, 37, 30, 36, 31, 35, 32, 29
};

static final int BLACKOUT = 0;
static final int POWER = 1;
static final int PAUSE = 2;
static final int SHOOT = 3;
static final int SHIMMER = 4;

///////////////////////////////////////////////

void ioioSetup(IOIO ioio) throws ConnectionLostException {
  pushButton = ioio.openDigitalInput(9, DigitalInput.Spec.Mode.PULL_DOWN);
  laser = ioio.openDigitalOutput(46, true);
  for (int i=0;i<digPinArray.length;i++) {
    digPinArray[i]= ioio.openDigitalOutput(row[i], false);
  }
}

synchronized void ioioLoop(IOIO ioio) throws ConnectionLostException {
//  laser.write(true);
  background(0);
  holdingHands = readGlove();


  if (tankEmpty == 1) {
    mode = BLACKOUT; //goto black out
  }
  else {
  ////BLACKOUT-----------------------------  
  if (mode == BLACKOUT) {
      laser.write(false);
      background(0);
  
    for (int i=0;i<digPinArray.length;i++) {
      digPinArray[i].write(false);
    }
   
    if (holdingHands == true && lastHoldingHands == true && tankEmpty == 0) {
      mode = POWER;
      sendOSC(POWER);
    }
  }
  ////POWER------------------------------------   
  else if (mode == POWER && tankEmpty == 0) {
     laser.write(true);
     background (120, 0, 0);
    for (int i=0;i<digPinArray.length;i++) {
      if (!readGlove()) {
        holdingHands = false;
        mode = BLACKOUT;
        sendOSC(BLACKOUT);
          laser.write(false);
        break;
      }
      else {
        if (lastHoldingHands == true) {
          digPinArray[i].write(true); // status LED is active low, hence the "1.0 -" 
          delay(500);
        }
        else break;
      }
    }
    mode = PAUSE;
  }
  ////PAUSE------------------------------------     
  else if (mode == PAUSE && tankEmpty == 0) {
       laser.write(true);
       background (0, 0, 255);
    if (holdingHands == true && lastHoldingHands == true) {
      for (int i=0;i<digPinArray.length;i++) {
        digPinArray[i].write(false);
      }
      delay(500);
      mode = SHOOT; //goes to shoot!!p
      sendOSC(SHOOT);
    }
    else {
      mode =BLACKOUT;
      sendOSC(BLACKOUT);
        laser.write(false);
    }
  }
  ////SHOOT------------------------------------   
  else if (mode == SHOOT && tankEmpty == 0) {
    background(255, 0, 0);
      laser.write(true);
 
    if (holdingHands == true && lastHoldingHands == true) {
      for (int i=0;i<digPinArray.length;i++) {
        digPinArray[i].write(true);
      }
      delay(1000);
    }
    for (int i=0;i<digPinArray.length;i++) {
      digPinArray[i].write(false);
    }
    holdingHands = false;
    mode = BLACKOUT; //goto black out
    sendOSC(BLACKOUT);
       laser.write(false);
    background(0);
  }
  }
  
  
  //--------------------------------------------
  status();
  //println(mode);
  lastHoldingHands = holdingHands;
}

boolean readGlove () { 
  try {
    pushButtonState = pushButton.read(); 
    Thread.sleep(20);
  } 
  catch(Exception ex) {
    println("button not working");
  }
  return pushButtonState;
}

///On the back burner for now. :( SHIMMERING WOULD BE SO COOL. 
//The whole thing freaked the fuck out when assigning pins over and over again. 

////SHIMMER---------------------------   
//  else if (mode == 1) {
//    for (int i=0;i<pinArray.length;i++) {
//      pinArray[i] = ioio.openPwmOutput(rowMixed[i], 1000);
//      for (int j = 0; j < 10; j++) {
//        pinArray[i].setDutyCycle(0.5-(sin(j/5.0))/2); // status LED is active low, hence the "1.0 -" 
//        delay(200);
//      } 
//      pinArray[i].close();
//    }
//    mode = 2;
//    sendOSC(1);
//    background(255, 0, 0);
//    holdingHands = false;
//    lastHoldingHands = false;
//  }

