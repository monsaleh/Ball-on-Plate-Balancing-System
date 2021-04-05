#define  setbit(reg,pos)          reg|=(1<<pos)
#define  clrbit(reg,pos)          reg&=~(1<<pos)
#define  togbit(reg,pos)          reg^=(1<<pos)
#define  period                   20
#define  pre                      16


void pwm_ini()
{
  PR2=(period/(4*pre))-1;
  T2CON = 0b00000111;
  CCP1CON = 0b00001100;

}

void pwm_duty(unsigned char duty)
{
