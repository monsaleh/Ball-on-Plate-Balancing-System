#include "i2c.h"
#include "acce.h"

void setplane()
{
  servox.write(100);
  servoy.write(100);

}

void balance()
{
   int A_data[4];
   int AcX, AcY;
   double diffx;
   double diffy;
   double prop;
   
   
   
   A_data[0]=mpu6050_read(0x3B); //Read X axis(LSB)
   A_data[1]=mpu6050_read(0x3C); //Read X axis(MSB)
   A_data[2]=mpu6050_read(0x3D); //Read Y axis(LSB)
   A_data[3]=mpu6050_read(0x3E); //Read Y axis(MSB)
   
   
  AcX = A_data[0] << 8 | A_data[1]; // 0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)
  AcY = A_data[2] << 8 | A_data[3]; // 0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
  
  
  AcX = AcX - 1500; // setting accelerometer value horizontal at 0
  AcY = AcY + 2500; // setting accelerometer value horizontal at 0



   diffx = 0 - AcX / 100; // error in x direction
   diffy = 0 - AcY / 100; // error in y direction
  
  
   prop = 0.15; // proportional control factor
  
  
  if ((abs(diffx) > 5) && (servox.read() <= 140) && (servox.read() >= 60))
  {
    servox.write(servox.read() + (diffx * prop)); // move servo on x direction by proportional value

  }

  if ((abs(diffy) > 5) && (servoy.read() <= 140) && (servox.read() >= 60))
  {
    servoy.write(servoy.read() - (diffy * prop)); // move servo on y direction by proportional value
  }

  // keep servos within the range
  if (servox.read() > 140) {
    servox.write(140);
  }
  if (servox.read() < 60) {
    servox.write(60);
  }
  if (servoy.read() > 140) {
    servoy.write(140);
  }
  if (servoy.read() < 60) {
    servoy.write(60);
  }

delay(25);
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////*********** beggining of code***********/////////////////////////////////////////////////////////


void main() {

Servo servox;         // defining objects
Servo servoy;

  servox.attach(5);  // attaching servos
  servoy.attach(3);
  
  setplane();   // initial setting plane to horizontal
  
  //Serial.begin(9600);  // initiating serial communication

  I2C_Init_Master(I2C1);  // begin I2C communication
  mpu6050_init();
  
     while(1)
     {
             balance(); // Keep balancing the plate

     }


}