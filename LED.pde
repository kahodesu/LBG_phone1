///Haven't testing this one out yet!!

///////////////LIBRARIES////////////////
import ioio.lib.api.*;
import ioio.lib.api.exception.*;
import com.pinkhatproductions.pioio.*;

private DigitalOutput led;

void ioioSetup(IOIO ioio) throws ConnectionLostException {
  led = ioio.openDigitalOutput(IOIO.LED_PIN, true);
}

void ioioLoop(IOIO ioio) throws ConnectionLostException {
  led.write(false); // status LED is active LOW
  try {
    Thread.sleep(1000);
  }
  catch (InterruptedException e) {
  }

  led.write(true);
  try {
    Thread.sleep(1000);
  }
  catch (InterruptedException e) {
  }
}

