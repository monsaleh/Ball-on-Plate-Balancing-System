void setplane()
{
  servox.write(100);
  servoy.write(100);

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int checkbuttons()
{

  if ((analogRead(A0) > desired1)  && (analogRead(A1) > desired2))       // if lights are detected
  {
    button = 1; // go to mode 1
    
  }
  else if ((analogRead(A2) / 8 != 63)  || (analogRead(A3) / 8 != 63))  // if joystick is detected
  {
    button = 2;// go to mode 2
  }
  else button = 0; // otherwise keep balancing the plate
  
  return button; // return mode 
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void followlight()  //might need more effiency
{

  double diffx = (desired2) - (analogRead(A1));  // error in x direction
  double diffy = (desired1) - (analogRead(A0));  // error in y direction
  double prop = 0.1;  // proportional control factor
  if ((abs(diffx) > 20) && (servox.read() >= 60 ) && (servox.read() <= 140)) 
  {
    servox.write(servox.read() + (diffx * prop)); // move servo on x direction by proportional value
  }

  if ((abs(diffy) > 20) && (servoy.read() >= 60 ) && (servoy.read() <= 140))
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
delay(10);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void balance()
{

  Wire.beginTransmission(MPU);
  Wire.write(0x3B);  // starting with register 0x3B (ACCEL_XOUT_H)
  Wire.endTransmission(false);
  Wire.requestFrom(MPU, 14, true); // request a total of 14 registers
  AcX = Wire.read() << 8 | Wire.read(); // 0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)
  AcY = Wire.read() << 8 | Wire.read(); // 0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
  AcX = AcX - 1500; // setting accelerometer value horizontal at 0
  AcY = AcY + 2500; // setting accelerometer value horizontal at 0
  
  
  
  double diffx = 0 - AcX / 100; // error in x direction
  double diffy = 0 - AcY / 100; // error in y direction
  double prop = 0.15; // proportional control factor
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
void followjoystick()
{
  int  joystickx = map(analogRead(A3), 0, 1023, 140, 60); // map joystick x values
  int  joysticky = map(analogRead(A2), 0, 1023, 60, 140); // map joystick y values
  servox.write(joystickx);// move servo x
  servoy.write(joysticky);// move servo y

}

////////////////////////////////////////////////////////////////////////////*********** end of code***********/////////////////////////////////////////////////////////

