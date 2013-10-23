 //The phone prints out this status on its screen. :D
 
 void status() {
   String info = "";
  info += "PHONE ONE";
  info += "=======================\n";
  info += "holdingHands:"+holdingHands + "\n";
  info += "lastHoldingHands:"+lastHoldingHands +"\n";
  info += mode+ "\n"; //whatever variable I want to send to laptop
  //Phone screen crap
  
  textSize(20);
  fill(255);
  text(info,50,50);
 }
