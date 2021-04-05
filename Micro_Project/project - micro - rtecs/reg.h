#ifndef         reg_H
#define         reg_H

#define                PORTA_M                0x0F80
#define                PORTB_M                0x0F81
#define                PORTC_M                0x0F82
#define                PORTD_M                0x0F83
#define                PORTE_M                0x0F84
#define                PORTF_M                0x0F85
#define                PORTG_M                0x0F86
#define                PORTH_M                0x0F87
#define                PORTJ_M                0x0F88

#define                LATA_M                0x0F89
#define                LATB_M                0x0F8A
#define                LATC_M                0x0F8B
#define                LATD_M                0x0F8C
#define                LATE_M                0x0F8D
#define                LATF_M                0x0F8E
#define                LATG_M                0x0F8F
#define                LATH_M                0x0F90
#define                LATJ_M                0x0F91

#define                TRISA_M                0x0F92
#define                TRISB_M                0x0F93
#define                TRISC_M                0x0F94
#define                TRISD_M                0x0F95
#define                TRISE_M                0x0F96
#define                TRISF_M                0x0F97
#define                TRISG_M                0x0F98
#define                TRISH_M                0x0F99
#define                TRISJ_M                0x0F9A

#define                ANCON0_M               0x0F25
#define                ANCON1_M               0x0F24
#define                ANCON2_M               0x0F23

#define                SSP1CON2_M        0x0FC5
#define                SSP1CON1_M        0x0FC6
#define                SSP1STAT_M        0x0FC7
#define                SSP1ADD_M        0x0FC8
#define                SSP1BUF_M        0x0FC9

#define                SSP2CON2_M        0x0F66
#define                SSP2CON1_M        0x0F67
#define                SSP2STAT_M        0x0F68
#define                SSP2ADD_M        0x0F69
#define                SSP2BUF_M        0x0F6A

#define                PIR1_M           0x0F9E
#define                PIR2_M           0x0FA1

#define                HWREG(x)        *((volatile char *const)x)

#endif