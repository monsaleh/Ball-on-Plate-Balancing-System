////////////////////////////////////////////////////////////////////////////*********** beggining of code***********/////////////////////////////////////////////////////////
#include <Servo.h>
#include<Wire.h>

int initial_photo1;   //defining integers
int initial_photo2;
int initial_photo;
int desired1;
int desired2;
int button;

Servo servox;         // defining objects
Servo servoy;

const int MPU = 0x68; // I2C address of the MPU-6050
int16_t AcX, AcY;


void setup() {

  initial_photo1 = analogRead(A0);   // setting initial values for automatic calibration
  desired1 = initial_photo1 +100;
  initial_photo2 = analogRead(A1);
  desired2 = initial_photo2 +100;
  initial_photo = max(initial_photo1, initial_photo2);  // comparing values and storing the maximum
  button = checkbuttons();  // check which mode are in

  servox.attach(5);  // attaching servos
  servoy.attach(3);
  setplane();   // initial setting plane to horizontal
  Serial.begin(9600);  // initiating serial communication

  Wire.begin();  // begin I2C communication
  Wire.beginTransmission(MPU); //begin transmission of bytes
  Wire.write(0x6B);  // PWR_MGMT_1 register
  Wire.write(0);     // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true); // end transmission of bytes


}

void loop() {
  checkbuttons();  // check for mode

  switch (button) {
    case 1:

      while ((analogRead(A0) > initial_photo + 5) && (analogRead(A1) > initial_photo + 5))  // stay in this loop until the light goes back to initial
      {
        followlight(); // follow light program
      }

      break;

    case 2:
      while ((analogRead(A2) / 8 != 63)  || (analogRead(A3) / 8 != 63))  // while joystick is not in zero position
      {
        followjoystick();  // follow the joystick program
      }
      break;

    default:

      balance(); // Keep balancing the plate as a default mode

      break;

  }
}

