#line 1 "E:/ITI/Mechatronics/Microcontroller/project - micro - rtecs/i2c.c"
#line 1 "e:/iti/mechatronics/microcontroller/project - micro - rtecs/reg.h"
#line 1 "e:/iti/mechatronics/microcontroller/project - micro - rtecs/i2c.h"









void I2C_Init_Master(unsigned int I2C_num);
void I2C_Init_Slave(unsigned int I2C_num, unsigned char addr);
void I2C_Start(unsigned int I2C_num);
void I2C_Stop(unsigned int I2C_num);
void I2C_RepeatedStart(unsigned int I2C_num);
void I2C_Write(unsigned int I2C_num,unsigned char _data);
unsigned char I2C_MasterReceive(unsigned int I2C_num);
unsigned char I2C_SlaveTransmit(unsigned int I2C_num,unsigned char _data);
void I2C_WaitEvent(unsigned int I2C_num);
unsigned char I2C_SlaveReceive(unsigned int I2C_num);
#line 4 "E:/ITI/Mechatronics/Microcontroller/project - micro - rtecs/i2c.c"
void I2C_Init_Master(unsigned int I2C_num)
{
 if(I2c_num ==  1 )
 {
  *((volatile char *const) 0x0FC7 )  = 0x00;
  *((volatile char *const) 0x0FC8 )  = 0x09;
  *((volatile char *const) 0x0FC6 )  = 0x28;
 }
 else if(I2c_num ==  2 )
 {
  *((volatile char *const) 0x0F68 )  = 0x00;
  *((volatile char *const) 0x0F69 )  = 0x09;
  *((volatile char *const) 0x0F67 )  = 0x28;
 }
 else
 return;
}

void I2C_Init_Slave(unsigned int I2C_num, unsigned char addr)
{
 if(I2c_num ==  1 )
 {
  *((volatile char *const) 0x0F94 )  |= 0x18;
  *((volatile char *const) 0x0FC6 )  = 0x29;
  *((volatile char *const) 0x0FC8 )  = 0xFE;
  *((volatile char *const) 0x0FC6 )  = 0x00;
  *((volatile char *const) 0x0FC7 )  = 0x00;
  *((volatile char *const) 0x0FC8 )  = addr;
  *((volatile char *const) 0x0FC6 )  = 0x26;
 }
 else if(I2c_num ==  2 )
 {

  *((volatile char *const) 0x0F95 )  |= 0x60;
  *((volatile char *const) 0x0F67 )  = 0x29;
  *((volatile char *const) 0x0F69 )  = 0xFE;
  *((volatile char *const) 0x0F67 )  = 0x00;
  *((volatile char *const) 0x0F68 )  = 0x00;
  *((volatile char *const) 0x0F69 )  = addr;
  *((volatile char *const) 0x0F67 )  = 0x26;
 }
 else
 return;
}

void I2C_Start(unsigned int I2C_num)
{
 if(I2c_num ==  1 )
 {
  *((volatile char *const) 0x0FC5 )  |= 0x01;
 while(!( *((volatile char *const) 0x0F9E )  & 0x08));
  *((volatile char *const) 0x0F9E )  &= ~0x08;
 }
 else if(I2c_num ==  2 )
 {
  *((volatile char *const) 0x0F66 )  |= 0x01;
 while(!( *((volatile char *const) 0x0FA1 )  & 0x20));
  *((volatile char *const) 0x0FA1 )  &= ~0x20;
 }
 else
 return;
}

void I2C_Stop(unsigned int I2C_num)
{
 unsigned short timeOut = 0;

 if(I2c_num ==  1 )
 {
  *((volatile char *const) 0x0FC5 )  |= 0x04;
 while(!( *((volatile char *const) 0x0F9E )  & 0x08) && (timeout < 200))
 timeOut++;
  *((volatile char *const) 0x0F9E )  &= ~0x08;
 }
 else if(I2c_num ==  2 )
 {
  *((volatile char *const) 0x0F66 )  |= 0x04;
 while(!( *((volatile char *const) 0x0FA1 )  & 0x20) && (timeout < 200))
 timeOut++;
  *((volatile char *const) 0x0FA1 )  &= ~0x20;
 }
 else
 return;

}



void I2C_Write(unsigned int I2C_num,unsigned char _data)
{
 if(I2c_num ==  1 )
 {
  *((volatile char *const) 0x0FC9 )  = _data;
 while(!( *((volatile char *const) 0x0F9E )  & 0x08));
  *((volatile char *const) 0x0F9E )  &= ~0x08;
 }
 else if(I2c_num ==  2 )
 {
  *((volatile char *const) 0x0F6A )  = _data;
 while(!( *((volatile char *const) 0x0FA1 )  & 0x20));
  *((volatile char *const) 0x0FA1 )  &= ~0x20;
 }
 else
 return;

}

char I2C_MasterReceive(unsigned int I2C_num)
{
 if(I2c_num ==  1 )
 {
  *((volatile char *const) 0x0FC5 )  |= 0x08;
 while(!( *((volatile char *const) 0x0F9E )  & 0x08));
  *((volatile char *const) 0x0F9E )  &= ~0x08;

 return  *((volatile char *const) 0x0FC9 ) ;
 }
 else if(I2c_num ==  2 )
 {
  *((volatile char *const) 0x0F66 )  |= 0x08;
 while(!( *((volatile char *const) 0x0FA1 )  & 0x20));
  *((volatile char *const) 0x0FA1 )  &= ~0x20;

 return  *((volatile char *const) 0x0F6A ) ;
 }
 else
 return;
}

unsigned char I2C_SlaveReceive(unsigned int I2C_num)
{
 if(I2c_num ==  1 )
 return  *((volatile char *const) 0x0FC9 ) ;
 else if(I2c_num ==  2 )
 return  *((volatile char *const) 0x0F6A ) ;
 else
 return;
}

void I2C_WaitEvent(unsigned int I2C_num)
{
 if(I2c_num ==  1 )
 {
 while(!( *((volatile char *const) 0x0F9E )  & 0x08));
  *((volatile char *const) 0x0F9E )  &= ~0x08;
 }
 else if(I2c_num ==  2 )
 {
 while(!( *((volatile char *const) 0x0FA1 )  & 0x20));
  *((volatile char *const) 0x0FA1 )  &= ~0x20;
 }
 else
 return;
}

unsigned char I2C_SlaveTransmit(unsigned int I2C_num,unsigned char _data)
{
 unsigned char ret;

 if(I2c_num ==  1 )
 {
 while(!( *((volatile char *const) 0x0F9E )  & 0x08));
 ret =  *((volatile char *const) 0x0FC9 ) ;
  *((volatile char *const) 0x0FC9 )  = _data;
  *((volatile char *const) 0x0FC6 )  |= 0x10;
  *((volatile char *const) 0x0F9E )  &= ~0x08;
 return ret;
 }
 else if(I2c_num ==  2 )
 {
 while(!( *((volatile char *const) 0x0FA1 )  & 0x20));
 ret =  *((volatile char *const) 0x0F6A ) ;
  *((volatile char *const) 0x0F6A )  = _data;
  *((volatile char *const) 0x0F67 )  |= 0x10;
  *((volatile char *const) 0x0FA1 )  &= ~0x20;
 return ret;
 }
 else
 return;
}
