// MPU6050 required Registers
#include "i2c.h"
#define W_DATA         0xD0
#define R_DATA         0xD1
#define PWR_MGMT_1     0x6B
#define PWR_MGMT_2     0x6C
#define SMPRT_DIV      0x19
#define CONFIG_R       0x1A
#define GYRO_CONFIG    0x1B
#define ACCEL_CONFIG   0x1C
#define ACCEL_XOUT_H   0x3B
#define ACCEL_XOUT_L   0x3C
#define ACCEL_YOUT_H   0x3D
#define ACCEL_YOUT_L   0x3E
#define ACCEL_ZOUT_H   0x3F
#define ACCEL_ZOUT_L   0x40
#define TEMP_OUT_H     0x41
#define TEMP_OUT_L     0x42
#define GYRO_XOUT_H    0x43
#define GYRO_XOUT_L    0x44
#define GYRO_YOUT_H    0x45
#define GYRO_YOUT_L    0x46
#define GYRO_ZOUT_H    0x47
#define GYRO_ZOUT_L    0x48


void mpu6050_write(unsigned int add, unsigned char _data)
{
         I2C_Start(I2C1);
         I2C_Write(I2C1,W_DATA);
         I2C_Write(I2C1,add);
         I2C_Write(I2C1,_data);
         I2C_Stop(I2C1);
         return;

}

int mpu6050_read(unsigned char add){
         int retval;
         I2C_Start(I2C1);
         I2C_Write(I2C1,W_DATA);
         I2C_Write(I2C1,add);
         I2C_Start(I2C1);
         I2C_Write(I2C1,R_DATA);
         retval=I2C_MasterReceive(I2C1);
         I2C_Stop(I2C1);
         return retval;
}

void mpu6050_init(){
         mpu6050_write(PWR_MGMT_1,  0x80);
         delay_ms(100);
         mpu6050_write(PWR_MGMT_1,  0x00);
         delay_ms(100);
         mpu6050_write(CONFIG_R,    0x01);
         delay_ms(10);
         mpu6050_write(GYRO_CONFIG, 0x00);
         }