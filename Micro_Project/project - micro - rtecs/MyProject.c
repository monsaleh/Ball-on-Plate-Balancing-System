#setbit(reg,pos)                  reg|=(1<<pos)
#clrbit(reg,pos)                  reg&=~(1<<pos)
#togbit(reg,pos)                  reg^=(1<<pos)
#define   period                   20
#define   pre                      16


void pwm_ini()
{
  PR2=(period/(4*pre))-1;
  setbit(T2CON,2);
  
}

void pwm_duty(unsigned char duty)
{

}