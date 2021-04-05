
_I2C_Init_Master:

;i2c.c,4 :: 		void I2C_Init_Master(unsigned int I2C_num)
;i2c.c,6 :: 		if(I2c_num == I2C1)
	MOVLW       0
	XORWF       FARG_I2C_Init_Master_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_Init_Master67
	MOVLW       1
	XORWF       FARG_I2C_Init_Master_I2C_num+0, 0 
L__I2C_Init_Master67:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_Init_Master0
;i2c.c,8 :: 		HWREG(SSP1STAT_M) = 0x00;
	CLRF        4039 
;i2c.c,9 :: 		HWREG(SSP1ADD_M)  = 0x09;
	MOVLW       9
	MOVWF       4040 
;i2c.c,10 :: 		HWREG(SSP1CON1_M) = 0x28;
	MOVLW       40
	MOVWF       4038 
;i2c.c,11 :: 		}
	GOTO        L_I2C_Init_Master1
L_I2C_Init_Master0:
;i2c.c,12 :: 		else if(I2c_num == I2C2)
	MOVLW       0
	XORWF       FARG_I2C_Init_Master_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_Init_Master68
	MOVLW       2
	XORWF       FARG_I2C_Init_Master_I2C_num+0, 0 
L__I2C_Init_Master68:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_Init_Master2
;i2c.c,14 :: 		HWREG(SSP2STAT_M) = 0x00;
	CLRF        3944 
;i2c.c,15 :: 		HWREG(SSP2ADD_M)  = 0x09;
	MOVLW       9
	MOVWF       3945 
;i2c.c,16 :: 		HWREG(SSP2CON1_M) = 0x28;
	MOVLW       40
	MOVWF       3943 
;i2c.c,17 :: 		}
	GOTO        L_I2C_Init_Master3
L_I2C_Init_Master2:
;i2c.c,19 :: 		return;
	GOTO        L_end_I2C_Init_Master
L_I2C_Init_Master3:
L_I2C_Init_Master1:
;i2c.c,20 :: 		}
L_end_I2C_Init_Master:
	RETURN      0
; end of _I2C_Init_Master

_I2C_Init_Slave:

;i2c.c,22 :: 		void I2C_Init_Slave(unsigned int I2C_num, unsigned char addr)
;i2c.c,24 :: 		if(I2c_num == I2C1)
	MOVLW       0
	XORWF       FARG_I2C_Init_Slave_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_Init_Slave70
	MOVLW       1
	XORWF       FARG_I2C_Init_Slave_I2C_num+0, 0 
L__I2C_Init_Slave70:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_Init_Slave4
;i2c.c,26 :: 		HWREG(TRISC_M)   |= 0x18;
	MOVLW       24
	IORWF       3988, 1 
;i2c.c,27 :: 		HWREG(SSP1CON1_M) = 0x29;
	MOVLW       41
	MOVWF       4038 
;i2c.c,28 :: 		HWREG(SSP1ADD_M)  = 0xFE;
	MOVLW       254
	MOVWF       4040 
;i2c.c,29 :: 		HWREG(SSP1CON1_M) = 0x00;
	CLRF        4038 
;i2c.c,30 :: 		HWREG(SSP1STAT_M) = 0x00;
	CLRF        4039 
;i2c.c,31 :: 		HWREG(SSP1ADD_M)  = addr;    //address least significant bit should be 0
	MOVF        FARG_I2C_Init_Slave_addr+0, 0 
	MOVWF       4040 
;i2c.c,32 :: 		HWREG(SSP1CON1_M) = 0x26;
	MOVLW       38
	MOVWF       4038 
;i2c.c,33 :: 		}
	GOTO        L_I2C_Init_Slave5
L_I2C_Init_Slave4:
;i2c.c,34 :: 		else if(I2c_num == I2C2)
	MOVLW       0
	XORWF       FARG_I2C_Init_Slave_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_Init_Slave71
	MOVLW       2
	XORWF       FARG_I2C_Init_Slave_I2C_num+0, 0 
L__I2C_Init_Slave71:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_Init_Slave6
;i2c.c,37 :: 		HWREG(TRISD_M)   |= 0x60;
	MOVLW       96
	IORWF       3989, 1 
;i2c.c,38 :: 		HWREG(SSP2CON1_M) = 0x29;
	MOVLW       41
	MOVWF       3943 
;i2c.c,39 :: 		HWREG(SSP2ADD_M)  = 0xFE;
	MOVLW       254
	MOVWF       3945 
;i2c.c,40 :: 		HWREG(SSP2CON1_M) = 0x00;
	CLRF        3943 
;i2c.c,41 :: 		HWREG(SSP2STAT_M) = 0x00;
	CLRF        3944 
;i2c.c,42 :: 		HWREG(SSP2ADD_M)  = addr;    //address least significant bit should be 0
	MOVF        FARG_I2C_Init_Slave_addr+0, 0 
	MOVWF       3945 
;i2c.c,43 :: 		HWREG(SSP2CON1_M) = 0x26;
	MOVLW       38
	MOVWF       3943 
;i2c.c,44 :: 		}
	GOTO        L_I2C_Init_Slave7
L_I2C_Init_Slave6:
;i2c.c,46 :: 		return;
	GOTO        L_end_I2C_Init_Slave
L_I2C_Init_Slave7:
L_I2C_Init_Slave5:
;i2c.c,47 :: 		}
L_end_I2C_Init_Slave:
	RETURN      0
; end of _I2C_Init_Slave

_I2C_Start:

;i2c.c,49 :: 		void I2C_Start(unsigned int I2C_num)
;i2c.c,51 :: 		if(I2c_num == I2C1)
	MOVLW       0
	XORWF       FARG_I2C_Start_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_Start73
	MOVLW       1
	XORWF       FARG_I2C_Start_I2C_num+0, 0 
L__I2C_Start73:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_Start8
;i2c.c,53 :: 		HWREG(SSP1CON2_M) |= 0x01;
	BSF         4037, 0 
;i2c.c,54 :: 		while(!(HWREG(PIR1_M) & 0x08));
L_I2C_Start9:
	BTFSC       3998, 3 
	GOTO        L_I2C_Start10
	GOTO        L_I2C_Start9
L_I2C_Start10:
;i2c.c,55 :: 		HWREG(PIR1_M) &= ~0x08;
	BCF         3998, 3 
;i2c.c,56 :: 		}
	GOTO        L_I2C_Start11
L_I2C_Start8:
;i2c.c,57 :: 		else if(I2c_num == I2C2)
	MOVLW       0
	XORWF       FARG_I2C_Start_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_Start74
	MOVLW       2
	XORWF       FARG_I2C_Start_I2C_num+0, 0 
L__I2C_Start74:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_Start12
;i2c.c,59 :: 		HWREG(SSP2CON2_M) |= 0x01;
	BSF         3942, 0 
;i2c.c,60 :: 		while(!(HWREG(PIR2_M) & 0x20));
L_I2C_Start13:
	BTFSC       4001, 5 
	GOTO        L_I2C_Start14
	GOTO        L_I2C_Start13
L_I2C_Start14:
;i2c.c,61 :: 		HWREG(PIR2_M) &= ~0x20;
	BCF         4001, 5 
;i2c.c,62 :: 		}
	GOTO        L_I2C_Start15
L_I2C_Start12:
;i2c.c,64 :: 		return;
	GOTO        L_end_I2C_Start
L_I2C_Start15:
L_I2C_Start11:
;i2c.c,65 :: 		}
L_end_I2C_Start:
	RETURN      0
; end of _I2C_Start

_I2C_Stop:

;i2c.c,67 :: 		void I2C_Stop(unsigned int I2C_num)
;i2c.c,69 :: 		unsigned short timeOut = 0;
	CLRF        I2C_Stop_timeOut_L0+0 
;i2c.c,71 :: 		if(I2c_num == I2C1)
	MOVLW       0
	XORWF       FARG_I2C_Stop_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_Stop76
	MOVLW       1
	XORWF       FARG_I2C_Stop_I2C_num+0, 0 
L__I2C_Stop76:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_Stop16
;i2c.c,73 :: 		HWREG(SSP1CON2_M) |= 0x04;
	BSF         4037, 2 
;i2c.c,74 :: 		while(!(HWREG(PIR1_M) & 0x08) && (timeout < 200))
L_I2C_Stop17:
	BTFSC       3998, 3 
	GOTO        L_I2C_Stop18
	MOVLW       200
	SUBWF       I2C_Stop_timeOut_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_I2C_Stop18
L__I2C_Stop65:
;i2c.c,75 :: 		timeOut++;
	INCF        I2C_Stop_timeOut_L0+0, 1 
	GOTO        L_I2C_Stop17
L_I2C_Stop18:
;i2c.c,76 :: 		HWREG(PIR1_M) &= ~0x08;
	BCF         3998, 3 
;i2c.c,77 :: 		}
	GOTO        L_I2C_Stop21
L_I2C_Stop16:
;i2c.c,78 :: 		else if(I2c_num == I2C2)
	MOVLW       0
	XORWF       FARG_I2C_Stop_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_Stop77
	MOVLW       2
	XORWF       FARG_I2C_Stop_I2C_num+0, 0 
L__I2C_Stop77:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_Stop22
;i2c.c,80 :: 		HWREG(SSP2CON2_M) |= 0x04;
	BSF         3942, 2 
;i2c.c,81 :: 		while(!(HWREG(PIR2_M) & 0x20) && (timeout < 200))
L_I2C_Stop23:
	BTFSC       4001, 5 
	GOTO        L_I2C_Stop24
	MOVLW       200
	SUBWF       I2C_Stop_timeOut_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_I2C_Stop24
L__I2C_Stop64:
;i2c.c,82 :: 		timeOut++;
	INCF        I2C_Stop_timeOut_L0+0, 1 
	GOTO        L_I2C_Stop23
L_I2C_Stop24:
;i2c.c,83 :: 		HWREG(PIR2_M) &= ~0x20;
	BCF         4001, 5 
;i2c.c,84 :: 		}
	GOTO        L_I2C_Stop27
L_I2C_Stop22:
;i2c.c,86 :: 		return;
	GOTO        L_end_I2C_Stop
L_I2C_Stop27:
L_I2C_Stop21:
;i2c.c,88 :: 		}
L_end_I2C_Stop:
	RETURN      0
; end of _I2C_Stop

_I2C_Write:

;i2c.c,92 :: 		void I2C_Write(unsigned int I2C_num,unsigned char _data)
;i2c.c,94 :: 		if(I2c_num == I2C1)
	MOVLW       0
	XORWF       FARG_I2C_Write_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_Write79
	MOVLW       1
	XORWF       FARG_I2C_Write_I2C_num+0, 0 
L__I2C_Write79:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_Write28
;i2c.c,96 :: 		HWREG(SSP1BUF_M) = _data;
	MOVF        FARG_I2C_Write__data+0, 0 
	MOVWF       4041 
;i2c.c,97 :: 		while(!(HWREG(PIR1_M) & 0x08));
L_I2C_Write29:
	BTFSC       3998, 3 
	GOTO        L_I2C_Write30
	GOTO        L_I2C_Write29
L_I2C_Write30:
;i2c.c,98 :: 		HWREG(PIR1_M) &= ~0x08;
	BCF         3998, 3 
;i2c.c,99 :: 		}
	GOTO        L_I2C_Write31
L_I2C_Write28:
;i2c.c,100 :: 		else if(I2c_num == I2C2)
	MOVLW       0
	XORWF       FARG_I2C_Write_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_Write80
	MOVLW       2
	XORWF       FARG_I2C_Write_I2C_num+0, 0 
L__I2C_Write80:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_Write32
;i2c.c,102 :: 		HWREG(SSP2BUF_M) = _data;
	MOVF        FARG_I2C_Write__data+0, 0 
	MOVWF       3946 
;i2c.c,103 :: 		while(!(HWREG(PIR2_M) & 0x20));
L_I2C_Write33:
	BTFSC       4001, 5 
	GOTO        L_I2C_Write34
	GOTO        L_I2C_Write33
L_I2C_Write34:
;i2c.c,104 :: 		HWREG(PIR2_M) &= ~0x20;
	BCF         4001, 5 
;i2c.c,105 :: 		}
	GOTO        L_I2C_Write35
L_I2C_Write32:
;i2c.c,107 :: 		return;
	GOTO        L_end_I2C_Write
L_I2C_Write35:
L_I2C_Write31:
;i2c.c,109 :: 		}
L_end_I2C_Write:
	RETURN      0
; end of _I2C_Write

_I2C_MasterReceive:

;i2c.c,111 :: 		char I2C_MasterReceive(unsigned int I2C_num)
;i2c.c,113 :: 		if(I2c_num == I2C1)
	MOVLW       0
	XORWF       FARG_I2C_MasterReceive_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_MasterReceive82
	MOVLW       1
	XORWF       FARG_I2C_MasterReceive_I2C_num+0, 0 
L__I2C_MasterReceive82:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_MasterReceive36
;i2c.c,115 :: 		HWREG(SSP1CON2_M) |= 0x08;
	BSF         4037, 3 
;i2c.c,116 :: 		while(!(HWREG(PIR1_M) & 0x08));
L_I2C_MasterReceive37:
	BTFSC       3998, 3 
	GOTO        L_I2C_MasterReceive38
	GOTO        L_I2C_MasterReceive37
L_I2C_MasterReceive38:
;i2c.c,117 :: 		HWREG(PIR1_M) &= ~0x08;
	BCF         3998, 3 
;i2c.c,119 :: 		return HWREG(SSP1BUF_M);
	MOVF        4041, 0 
	MOVWF       R0 
	GOTO        L_end_I2C_MasterReceive
;i2c.c,120 :: 		}
L_I2C_MasterReceive36:
;i2c.c,121 :: 		else if(I2c_num == I2C2)
	MOVLW       0
	XORWF       FARG_I2C_MasterReceive_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_MasterReceive83
	MOVLW       2
	XORWF       FARG_I2C_MasterReceive_I2C_num+0, 0 
L__I2C_MasterReceive83:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_MasterReceive40
;i2c.c,123 :: 		HWREG(SSP2CON2_M) |= 0x08;
	BSF         3942, 3 
;i2c.c,124 :: 		while(!(HWREG(PIR2_M) & 0x20));
L_I2C_MasterReceive41:
	BTFSC       4001, 5 
	GOTO        L_I2C_MasterReceive42
	GOTO        L_I2C_MasterReceive41
L_I2C_MasterReceive42:
;i2c.c,125 :: 		HWREG(PIR2_M) &= ~0x20;
	BCF         4001, 5 
;i2c.c,127 :: 		return HWREG(SSP2BUF_M);
	MOVF        3946, 0 
	MOVWF       R0 
	GOTO        L_end_I2C_MasterReceive
;i2c.c,128 :: 		}
L_I2C_MasterReceive40:
;i2c.c,130 :: 		return;
;i2c.c,131 :: 		}
L_end_I2C_MasterReceive:
	RETURN      0
; end of _I2C_MasterReceive

_I2C_SlaveReceive:

;i2c.c,133 :: 		unsigned char I2C_SlaveReceive(unsigned int I2C_num)
;i2c.c,135 :: 		if(I2c_num == I2C1)
	MOVLW       0
	XORWF       FARG_I2C_SlaveReceive_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_SlaveReceive85
	MOVLW       1
	XORWF       FARG_I2C_SlaveReceive_I2C_num+0, 0 
L__I2C_SlaveReceive85:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_SlaveReceive44
;i2c.c,136 :: 		return HWREG(SSP1BUF_M);
	MOVF        4041, 0 
	MOVWF       R0 
	GOTO        L_end_I2C_SlaveReceive
L_I2C_SlaveReceive44:
;i2c.c,137 :: 		else if(I2c_num == I2C2)
	MOVLW       0
	XORWF       FARG_I2C_SlaveReceive_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_SlaveReceive86
	MOVLW       2
	XORWF       FARG_I2C_SlaveReceive_I2C_num+0, 0 
L__I2C_SlaveReceive86:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_SlaveReceive46
;i2c.c,138 :: 		return HWREG(SSP2BUF_M);
	MOVF        3946, 0 
	MOVWF       R0 
	GOTO        L_end_I2C_SlaveReceive
L_I2C_SlaveReceive46:
;i2c.c,140 :: 		return;
;i2c.c,141 :: 		}
L_end_I2C_SlaveReceive:
	RETURN      0
; end of _I2C_SlaveReceive

_I2C_WaitEvent:

;i2c.c,143 :: 		void I2C_WaitEvent(unsigned int I2C_num)
;i2c.c,145 :: 		if(I2c_num == I2C1)
	MOVLW       0
	XORWF       FARG_I2C_WaitEvent_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_WaitEvent88
	MOVLW       1
	XORWF       FARG_I2C_WaitEvent_I2C_num+0, 0 
L__I2C_WaitEvent88:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_WaitEvent48
;i2c.c,147 :: 		while(!(HWREG(PIR1_M) & 0x08));
L_I2C_WaitEvent49:
	BTFSC       3998, 3 
	GOTO        L_I2C_WaitEvent50
	GOTO        L_I2C_WaitEvent49
L_I2C_WaitEvent50:
;i2c.c,148 :: 		HWREG(PIR1_M) &= ~0x08;
	BCF         3998, 3 
;i2c.c,149 :: 		}
	GOTO        L_I2C_WaitEvent51
L_I2C_WaitEvent48:
;i2c.c,150 :: 		else if(I2c_num == I2C2)
	MOVLW       0
	XORWF       FARG_I2C_WaitEvent_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_WaitEvent89
	MOVLW       2
	XORWF       FARG_I2C_WaitEvent_I2C_num+0, 0 
L__I2C_WaitEvent89:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_WaitEvent52
;i2c.c,152 :: 		while(!(HWREG(PIR2_M) & 0x20));
L_I2C_WaitEvent53:
	BTFSC       4001, 5 
	GOTO        L_I2C_WaitEvent54
	GOTO        L_I2C_WaitEvent53
L_I2C_WaitEvent54:
;i2c.c,153 :: 		HWREG(PIR2_M) &= ~0x20;
	BCF         4001, 5 
;i2c.c,154 :: 		}
	GOTO        L_I2C_WaitEvent55
L_I2C_WaitEvent52:
;i2c.c,156 :: 		return;
	GOTO        L_end_I2C_WaitEvent
L_I2C_WaitEvent55:
L_I2C_WaitEvent51:
;i2c.c,157 :: 		}
L_end_I2C_WaitEvent:
	RETURN      0
; end of _I2C_WaitEvent

_I2C_SlaveTransmit:

;i2c.c,159 :: 		unsigned char I2C_SlaveTransmit(unsigned int I2C_num,unsigned char _data)
;i2c.c,163 :: 		if(I2c_num == I2C1)
	MOVLW       0
	XORWF       FARG_I2C_SlaveTransmit_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_SlaveTransmit91
	MOVLW       1
	XORWF       FARG_I2C_SlaveTransmit_I2C_num+0, 0 
L__I2C_SlaveTransmit91:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_SlaveTransmit56
;i2c.c,165 :: 		while(!(HWREG(PIR1_M) & 0x08));
L_I2C_SlaveTransmit57:
	BTFSC       3998, 3 
	GOTO        L_I2C_SlaveTransmit58
	GOTO        L_I2C_SlaveTransmit57
L_I2C_SlaveTransmit58:
;i2c.c,166 :: 		ret = HWREG(SSP1BUF_M);
	MOVF        4041, 0 
	MOVWF       R1 
;i2c.c,167 :: 		HWREG(SSP1BUF_M) = _data;
	MOVF        FARG_I2C_SlaveTransmit__data+0, 0 
	MOVWF       4041 
;i2c.c,168 :: 		HWREG(SSP1CON1_M) |= 0x10;
	BSF         4038, 4 
;i2c.c,169 :: 		HWREG(PIR1_M) &= ~0x08;
	BCF         3998, 3 
;i2c.c,170 :: 		return ret;
	MOVF        R1, 0 
	MOVWF       R0 
	GOTO        L_end_I2C_SlaveTransmit
;i2c.c,171 :: 		}
L_I2C_SlaveTransmit56:
;i2c.c,172 :: 		else if(I2c_num == I2C2)
	MOVLW       0
	XORWF       FARG_I2C_SlaveTransmit_I2C_num+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__I2C_SlaveTransmit92
	MOVLW       2
	XORWF       FARG_I2C_SlaveTransmit_I2C_num+0, 0 
L__I2C_SlaveTransmit92:
	BTFSS       STATUS+0, 2 
	GOTO        L_I2C_SlaveTransmit60
;i2c.c,174 :: 		while(!(HWREG(PIR2_M) & 0x20));
L_I2C_SlaveTransmit61:
	BTFSC       4001, 5 
	GOTO        L_I2C_SlaveTransmit62
	GOTO        L_I2C_SlaveTransmit61
L_I2C_SlaveTransmit62:
;i2c.c,175 :: 		ret = HWREG(SSP2BUF_M);
	MOVF        3946, 0 
	MOVWF       R1 
;i2c.c,176 :: 		HWREG(SSP2BUF_M) = _data;
	MOVF        FARG_I2C_SlaveTransmit__data+0, 0 
	MOVWF       3946 
;i2c.c,177 :: 		HWREG(SSP2CON1_M) |= 0x10;
	BSF         3943, 4 
;i2c.c,178 :: 		HWREG(PIR2_M) &= ~0x20;
	BCF         4001, 5 
;i2c.c,179 :: 		return ret;
	MOVF        R1, 0 
	MOVWF       R0 
	GOTO        L_end_I2C_SlaveTransmit
;i2c.c,180 :: 		}
L_I2C_SlaveTransmit60:
;i2c.c,182 :: 		return;
;i2c.c,183 :: 		}
L_end_I2C_SlaveTransmit:
	RETURN      0
; end of _I2C_SlaveTransmit
