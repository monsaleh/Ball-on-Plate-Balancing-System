#include        "reg.h"
#include        "i2c.h"

void I2C_Init_Master(unsigned int I2C_num)
{
     if(I2c_num == I2C1)
     {
        HWREG(SSP1STAT_M) = 0x00;
        HWREG(SSP1ADD_M)  = 0x09;
        HWREG(SSP1CON1_M) = 0x28;
     }
     else if(I2c_num == I2C2)
     {
        HWREG(SSP2STAT_M) = 0x00;
        HWREG(SSP2ADD_M)  = 0x09;
        HWREG(SSP2CON1_M) = 0x28;
     }
     else
         return;
}

void I2C_Init_Slave(unsigned int I2C_num, unsigned char addr)
{
    if(I2c_num == I2C1)
    {
      HWREG(TRISC_M)   |= 0x18;
      HWREG(SSP1CON1_M) = 0x29;
      HWREG(SSP1ADD_M)  = 0xFE;
      HWREG(SSP1CON1_M) = 0x00;
      HWREG(SSP1STAT_M) = 0x00;
      HWREG(SSP1ADD_M)  = addr;    //address least significant bit should be 0
      HWREG(SSP1CON1_M) = 0x26;
    }
    else if(I2c_num == I2C2)
    {

      HWREG(TRISD_M)   |= 0x60;
      HWREG(SSP2CON1_M) = 0x29;
      HWREG(SSP2ADD_M)  = 0xFE;
      HWREG(SSP2CON1_M) = 0x00;
      HWREG(SSP2STAT_M) = 0x00;
      HWREG(SSP2ADD_M)  = addr;    //address least significant bit should be 0
      HWREG(SSP2CON1_M) = 0x26;
    }
    else
        return;
}

void I2C_Start(unsigned int I2C_num)
{
    if(I2c_num == I2C1)
    {
         HWREG(SSP1CON2_M) |= 0x01;
         while(!(HWREG(PIR1_M) & 0x08));
         HWREG(PIR1_M) &= ~0x08;
    }
    else if(I2c_num == I2C2)
    {
         HWREG(SSP2CON2_M) |= 0x01;
         while(!(HWREG(PIR2_M) & 0x20));
         HWREG(PIR2_M) &= ~0x20;
    }
    else
     return;
}

void I2C_Stop(unsigned int I2C_num)
{
    unsigned short timeOut = 0;

    if(I2c_num == I2C1)
    {
        HWREG(SSP1CON2_M) |= 0x04;
        while(!(HWREG(PIR1_M) & 0x08) && (timeout < 200))
                     timeOut++;
        HWREG(PIR1_M) &= ~0x08;
    }
    else if(I2c_num == I2C2)
    {
        HWREG(SSP2CON2_M) |= 0x04;
        while(!(HWREG(PIR2_M) & 0x20) && (timeout < 200))
                     timeOut++;
        HWREG(PIR2_M) &= ~0x20;
    }
    else
     return;

}



void I2C_Write(unsigned int I2C_num,unsigned char _data)
{
    if(I2c_num == I2C1)
    {
         HWREG(SSP1BUF_M) = _data;
         while(!(HWREG(PIR1_M) & 0x08));
         HWREG(PIR1_M) &= ~0x08;
    }
    else if(I2c_num == I2C2)
    {
         HWREG(SSP2BUF_M) = _data;
         while(!(HWREG(PIR2_M) & 0x20));
         HWREG(PIR2_M) &= ~0x20;
    }
    else
     return;

}

char I2C_MasterReceive(unsigned int I2C_num)
{
    if(I2c_num == I2C1)
    {
         HWREG(SSP1CON2_M) |= 0x08;
         while(!(HWREG(PIR1_M) & 0x08));
         HWREG(PIR1_M) &= ~0x08;

         return HWREG(SSP1BUF_M);
    }
    else if(I2c_num == I2C2)
    {
         HWREG(SSP2CON2_M) |= 0x08;
         while(!(HWREG(PIR2_M) & 0x20));
         HWREG(PIR2_M) &= ~0x20;

         return HWREG(SSP2BUF_M);
    }
    else
     return;
}

unsigned char I2C_SlaveReceive(unsigned int I2C_num)
{
    if(I2c_num == I2C1)
         return HWREG(SSP1BUF_M);
    else if(I2c_num == I2C2)
         return HWREG(SSP2BUF_M);
    else
     return;
}

void I2C_WaitEvent(unsigned int I2C_num)
{
    if(I2c_num == I2C1)
    {
      while(!(HWREG(PIR1_M) & 0x08));
      HWREG(PIR1_M) &= ~0x08;
    }
    else if(I2c_num == I2C2)
    {
      while(!(HWREG(PIR2_M) & 0x20));
      HWREG(PIR2_M) &= ~0x20;
    }
    else
     return;
}

unsigned char I2C_SlaveTransmit(unsigned int I2C_num,unsigned char _data)
{
  unsigned char ret;

  if(I2c_num == I2C1)
  {
    while(!(HWREG(PIR1_M) & 0x08));
    ret = HWREG(SSP1BUF_M);
    HWREG(SSP1BUF_M) = _data;
    HWREG(SSP1CON1_M) |= 0x10;
    HWREG(PIR1_M) &= ~0x08;
    return ret;
  }
  else if(I2c_num == I2C2)
  {
    while(!(HWREG(PIR2_M) & 0x20));
    ret = HWREG(SSP2BUF_M);
    HWREG(SSP2BUF_M) = _data;
    HWREG(SSP2CON1_M) |= 0x10;
    HWREG(PIR2_M) &= ~0x20;
    return ret;
  }
  else
   return;
}