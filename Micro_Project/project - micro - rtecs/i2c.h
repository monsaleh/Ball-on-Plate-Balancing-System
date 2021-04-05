#ifndef         i2c_h
#define         i2c_h

#define         I2C1       1
#define         I2C2       2

#define         I2C_MASTER      1
#define         I2C_SLAVE       2

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

#endif