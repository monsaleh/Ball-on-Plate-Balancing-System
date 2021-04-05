#line 1 "E:/ITI/Mechatronics/Microcontroller/project - micro - rtecs/ver.c"
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
#line 1 "e:/iti/mechatronics/microcontroller/project - micro - rtecs/acce.h"



void mpu6050_write(int, int);
int mpu6050_read(int);
void mpu6050_init();
#line 4 "E:/ITI/Mechatronics/Microcontroller/project - micro - rtecs/ver.c"
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



 A_data[0]=mpu6050_read(0x3B);
 A_data[1]=mpu6050_read(0x3C);
 A_data[2]=mpu6050_read(0x3D);
 A_data[3]=mpu6050_read(0x3E);


 AcX = A_data[0] << 8 | A_data[1];
 AcY = A_data[2] << 8 | A_data[3];


 AcX = AcX - 1500;
 AcY = AcY + 2500;



 diffx = 0 - AcX / 100;
 diffy = 0 - AcY / 100;


 prop = 0.15;


 if ((abs(diffx) > 5) && (servox.read() <= 140) && (servox.read() >= 60))
 {
 servox.write(servox.read() + (diffx * prop));
 }

 if ((abs(diffy) > 5) && (servoy.read() <= 140) && (servox.read() >= 60))
 {
 servoy.write(servoy.read() - (diffy * prop));
 }


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




void main() {

Servo servox;
Servo servoy;

 servox.attach(5);
 servoy.attach(3);

 setplane();



 I2C_Init_Master( 1 );
 mpu6050_init();

 while(1)
 {
 balance();

 }


}
