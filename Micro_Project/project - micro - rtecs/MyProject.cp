#line 1 "D:/Inter/project-micro-rtecs/project - micro - rtecs/MyProject.c"







void pwm_ini()
{
 PR2=( 20 /(4* 16 ))-1;
 setbit(T2CON,2);

}

void pwm_duty(unsigned char duty)
{

}
