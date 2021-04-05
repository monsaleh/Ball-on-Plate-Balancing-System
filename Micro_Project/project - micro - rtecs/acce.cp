#line 1 "E:/ITI/Mechatronics/Microcontroller/project - micro - rtecs/acce.c"
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
#line 27 "E:/ITI/Mechatronics/Microcontroller/project - micro - rtecs/acce.c"
void mpu6050_write(unsigned int add, unsigned char _data)
{
 I2C_Start( 1 );
 I2C_Write( 1 , 0xD0 );
 I2C_Write( 1 ,add);
 I2C_Write( 1 ,_data);
 I2C_Stop( 1 );
 return;

}

int mpu6050_read(unsigned char add){
 int retval;
 I2C_Start( 1 );
 I2C_Write( 1 , 0xD0 );
 I2C_Write( 1 ,add);
 I2C_Start( 1 );
 I2C_Write( 1 , 0xD1 );
 retval=I2C_MasterReceive( 1 );
 I2C_Stop( 1 );
 return retval;
}

void mpu6050_init(){
 mpu6050_write( 0x6B , 0x80);
 delay_ms(100);
 mpu6050_write( 0x6B , 0x00);
 delay_ms(100);
 mpu6050_write( 0x1A , 0x01);
 delay_ms(10);
 mpu6050_write( 0x1B , 0x00);
 }
