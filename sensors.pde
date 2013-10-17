///////////////LIBRARIES////////////////
import ketai.sensors.*;

////////////////VARIABLES//////////////// 
KetaiGesture gesture;
KetaiSensor sensor;
 
float accelerometerX, accelerometerY, accelerometerZ;
float lightValue;

//////////////FUNCTIONS////////////////
void setupSensors(){
 lightValue = 0;
  
  gesture = new KetaiGesture(this);
  sensor = new KetaiSensor(this);
  sensor.enableLight();
  sensor.enableAccelerometer();
  sensor.start();
}

//upon reading Accelerometer
void onAccelerometerEvent(float x, float y, float z)
{
  accelerometerX = x;
  accelerometerY = y;
  accelerometerZ = z;
}

//Saving this for something else? 
void onLightEvent(float v){
   
  lightValue = v;
   
}
 

