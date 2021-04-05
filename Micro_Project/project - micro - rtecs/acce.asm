
_mpu6050_write:

;acce.c,27 :: 		void mpu6050_write(unsigned int add, unsigned char _data)
;acce.c,29 :: 		I2C_Start(I2C1);
	MOVLW       1
	MOVWF       FARG_I2C_Start_I2C_num+0 
	MOVLW       0
	MOVWF       FARG_I2C_Start_I2C_num+1 
	CALL        _I2C_Start+0, 0
;acce.c,30 :: 		I2C_Write(I2C1,W_DATA);
	MOVLW       1
	MOVWF       FARG_I2C_Write_I2C_num+0 
	MOVLW       0
	MOVWF       FARG_I2C_Write_I2C_num+1 
	MOVLW       208
	MOVWF       FARG_I2C_Write__data+0 
	CALL        _I2C_Write+0, 0
;acce.c,31 :: 		I2C_Write(I2C1,add);
	MOVLW       1
	MOVWF       FARG_I2C_Write_I2C_num+0 
	MOVLW       0
	MOVWF       FARG_I2C_Write_I2C_num+1 
	MOVF        FARG_mpu6050_write_add+0, 0 
	MOVWF       FARG_I2C_Write__data+0 
	CALL        _I2C_Write+0, 0
;acce.c,32 :: 		I2C_Write(I2C1,_data);
	MOVLW       1
	MOVWF       FARG_I2C_Write_I2C_num+0 
	MOVLW       0
	MOVWF       FARG_I2C_Write_I2C_num+1 
	MOVF        FARG_mpu6050_write__data+0, 0 
	MOVWF       FARG_I2C_Write__data+0 
	CALL        _I2C_Write+0, 0
;acce.c,33 :: 		I2C_Stop(I2C1);
	MOVLW       1
	MOVWF       FARG_I2C_Stop_I2C_num+0 
	MOVLW       0
	MOVWF       FARG_I2C_Stop_I2C_num+1 
	CALL        _I2C_Stop+0, 0
;acce.c,34 :: 		return;
;acce.c,36 :: 		}
L_end_mpu6050_write:
	RETURN      0
; end of _mpu6050_write

_mpu6050_read:

;acce.c,38 :: 		int mpu6050_read(unsigned char add){
;acce.c,40 :: 		I2C_Start(I2C1);
	MOVLW       1
	MOVWF       FARG_I2C_Start_I2C_num+0 
	MOVLW       0
	MOVWF       FARG_I2C_Start_I2C_num+1 
	CALL        _I2C_Start+0, 0
;acce.c,41 :: 		I2C_Write(I2C1,W_DATA);
	MOVLW       1
	MOVWF       FARG_I2C_Write_I2C_num+0 
	MOVLW       0
	MOVWF       FARG_I2C_Write_I2C_num+1 
	MOVLW       208
	MOVWF       FARG_I2C_Write__data+0 
	CALL        _I2C_Write+0, 0
;acce.c,42 :: 		I2C_Write(I2C1,add);
	MOVLW       1
	MOVWF       FARG_I2C_Write_I2C_num+0 
	MOVLW       0
	MOVWF       FARG_I2C_Write_I2C_num+1 
	MOVF        FARG_mpu6050_read_add+0, 0 
	MOVWF       FARG_I2C_Write__data+0 
	CALL        _I2C_Write+0, 0
;acce.c,43 :: 		I2C_Start(I2C1);
	MOVLW       1
	MOVWF       FARG_I2C_Start_I2C_num+0 
	MOVLW       0
	MOVWF       FARG_I2C_Start_I2C_num+1 
	CALL        _I2C_Start+0, 0
;acce.c,44 :: 		I2C_Write(I2C1,R_DATA);
	MOVLW       1
	MOVWF       FARG_I2C_Write_I2C_num+0 
	MOVLW       0
	MOVWF       FARG_I2C_Write_I2C_num+1 
	MOVLW       209
	MOVWF       FARG_I2C_Write__data+0 
	CALL        _I2C_Write+0, 0
;acce.c,45 :: 		retval=I2C_MasterReceive(I2C1);
	MOVLW       1
	MOVWF       FARG_I2C_MasterReceive_I2C_num+0 
	MOVLW       0
	MOVWF       FARG_I2C_MasterReceive_I2C_num+1 
	CALL        _I2C_MasterReceive+0, 0
	MOVF        R0, 0 
	MOVWF       mpu6050_read_retval_L0+0 
	MOVLW       0
	MOVWF       mpu6050_read_retval_L0+1 
;acce.c,46 :: 		I2C_Stop(I2C1);
	MOVLW       1
	MOVWF       FARG_I2C_Stop_I2C_num+0 
	MOVLW       0
	MOVWF       FARG_I2C_Stop_I2C_num+1 
	CALL        _I2C_Stop+0, 0
;acce.c,47 :: 		return retval;
	MOVF        mpu6050_read_retval_L0+0, 0 
	MOVWF       R0 
	MOVF        mpu6050_read_retval_L0+1, 0 
	MOVWF       R1 
;acce.c,48 :: 		}
L_end_mpu6050_read:
	RETURN      0
; end of _mpu6050_read

_mpu6050_init:

;acce.c,50 :: 		void mpu6050_init(){
;acce.c,51 :: 		mpu6050_write(PWR_MGMT_1,  0x80);
	MOVLW       107
	MOVWF       FARG_mpu6050_write_add+0 
	MOVLW       0
	MOVWF       FARG_mpu6050_write_add+1 
	MOVLW       128
	MOVWF       FARG_mpu6050_write__data+0 
	CALL        _mpu6050_write+0, 0
;acce.c,52 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_mpu6050_init0:
	DECFSZ      R13, 1, 1
	BRA         L_mpu6050_init0
	DECFSZ      R12, 1, 1
	BRA         L_mpu6050_init0
	DECFSZ      R11, 1, 1
	BRA         L_mpu6050_init0
	NOP
;acce.c,53 :: 		mpu6050_write(PWR_MGMT_1,  0x00);
	MOVLW       107
	MOVWF       FARG_mpu6050_write_add+0 
	MOVLW       0
	MOVWF       FARG_mpu6050_write_add+1 
	CLRF        FARG_mpu6050_write__data+0 
	CALL        _mpu6050_write+0, 0
;acce.c,54 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_mpu6050_init1:
	DECFSZ      R13, 1, 1
	BRA         L_mpu6050_init1
	DECFSZ      R12, 1, 1
	BRA         L_mpu6050_init1
	DECFSZ      R11, 1, 1
	BRA         L_mpu6050_init1
	NOP
;acce.c,55 :: 		mpu6050_write(CONFIG_R,    0x01);
	MOVLW       26
	MOVWF       FARG_mpu6050_write_add+0 
	MOVLW       0
	MOVWF       FARG_mpu6050_write_add+1 
	MOVLW       1
	MOVWF       FARG_mpu6050_write__data+0 
	CALL        _mpu6050_write+0, 0
;acce.c,56 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_mpu6050_init2:
	DECFSZ      R13, 1, 1
	BRA         L_mpu6050_init2
	DECFSZ      R12, 1, 1
	BRA         L_mpu6050_init2
	NOP
;acce.c,57 :: 		mpu6050_write(GYRO_CONFIG, 0x00);
	MOVLW       27
	MOVWF       FARG_mpu6050_write_add+0 
	MOVLW       0
	MOVWF       FARG_mpu6050_write_add+1 
	CLRF        FARG_mpu6050_write__data+0 
	CALL        _mpu6050_write+0, 0
;acce.c,58 :: 		}
L_end_mpu6050_init:
	RETURN      0
; end of _mpu6050_init
