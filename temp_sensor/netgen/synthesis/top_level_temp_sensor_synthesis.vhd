--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.58f
--  \   \         Application: netgen
--  /   /         Filename: top_level_temp_sensor_synthesis.vhd
-- /___/   /\     Timestamp: Tue Mar 24 21:55:11 2020
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm top_level_temp_sensor -w -dir netgen/synthesis -ofmt vhdl -sim top_level_temp_sensor.ngc top_level_temp_sensor_synthesis.vhd 
-- Device	: xc3s500e-5-fg320
-- Input file	: top_level_temp_sensor.ngc
-- Output file	: D:\unmc degree\year 4\sem2\hdl\project\temp_sensor\netgen\synthesis\top_level_temp_sensor_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: top_level_temp_sensor
-- Xilinx	: C:\Xilinx\14.5\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity top_level_temp_sensor is
  port (
    Ca : out STD_LOGIC; 
    Cb : out STD_LOGIC; 
    Cc : out STD_LOGIC; 
    Cd : out STD_LOGIC; 
    Ce : out STD_LOGIC; 
    Cf : out STD_LOGIC; 
    Cg : out STD_LOGIC; 
    CS : out STD_LOGIC; 
    Reset : in STD_LOGIC := 'X'; 
    SPI_power : out STD_LOGIC; 
    Txd : out STD_LOGIC; 
    SystemClock : in STD_LOGIC := 'X'; 
    SCLK : out STD_LOGIC; 
    MISO : in STD_LOGIC := 'X'; 
    An : out STD_LOGIC_VECTOR ( 5 downto 0 ) 
  );
end top_level_temp_sensor;

architecture Structure of top_level_temp_sensor is
  signal An_0_OBUF_6 : STD_LOGIC; 
  signal An_1_OBUF_7 : STD_LOGIC; 
  signal An_2_OBUF_8 : STD_LOGIC; 
  signal An_3_OBUF_9 : STD_LOGIC; 
  signal An_4_OBUF_10 : STD_LOGIC; 
  signal An_5_OBUF_11 : STD_LOGIC; 
  signal Ca_OBUF_14 : STD_LOGIC; 
  signal Cb_OBUF_16 : STD_LOGIC; 
  signal Cc_OBUF_18 : STD_LOGIC; 
  signal Cd_OBUF_20 : STD_LOGIC; 
  signal Ce_OBUF_22 : STD_LOGIC; 
  signal Cf_OBUF_24 : STD_LOGIC; 
  signal Cg_OBUF_26 : STD_LOGIC; 
  signal MISO_IBUF_28 : STD_LOGIC; 
  signal Mcount_iCount9_cy_1_rt_31 : STD_LOGIC; 
  signal Mcount_iCount9_cy_2_rt_33 : STD_LOGIC; 
  signal Mcount_iCount9_cy_3_rt_35 : STD_LOGIC; 
  signal Mcount_iCount9_cy_4_rt_37 : STD_LOGIC; 
  signal Mcount_iCount9_cy_5_rt_39 : STD_LOGIC; 
  signal Mcount_iCount9_cy_6_rt_41 : STD_LOGIC; 
  signal Mcount_iCount9_cy_7_rt_43 : STD_LOGIC; 
  signal Mcount_iCount9_xor_8_rt_45 : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal N101 : STD_LOGIC; 
  signal N103 : STD_LOGIC; 
  signal N110 : STD_LOGIC; 
  signal N112 : STD_LOGIC; 
  signal N114 : STD_LOGIC; 
  signal N116 : STD_LOGIC; 
  signal N118 : STD_LOGIC; 
  signal N120 : STD_LOGIC; 
  signal N122 : STD_LOGIC; 
  signal N128 : STD_LOGIC; 
  signal N130 : STD_LOGIC; 
  signal N132 : STD_LOGIC; 
  signal N134 : STD_LOGIC; 
  signal N136 : STD_LOGIC; 
  signal N138 : STD_LOGIC; 
  signal N140 : STD_LOGIC; 
  signal N142 : STD_LOGIC; 
  signal N144 : STD_LOGIC; 
  signal N150 : STD_LOGIC; 
  signal N152 : STD_LOGIC; 
  signal N154 : STD_LOGIC; 
  signal N155 : STD_LOGIC; 
  signal N156 : STD_LOGIC; 
  signal N157 : STD_LOGIC; 
  signal N158 : STD_LOGIC; 
  signal N159 : STD_LOGIC; 
  signal N160 : STD_LOGIC; 
  signal N161 : STD_LOGIC; 
  signal N162 : STD_LOGIC; 
  signal N163 : STD_LOGIC; 
  signal N164 : STD_LOGIC; 
  signal N165 : STD_LOGIC; 
  signal N166 : STD_LOGIC; 
  signal N167 : STD_LOGIC; 
  signal N168 : STD_LOGIC; 
  signal N169 : STD_LOGIC; 
  signal N86 : STD_LOGIC; 
  signal N90 : STD_LOGIC; 
  signal N92 : STD_LOGIC; 
  signal N94 : STD_LOGIC; 
  signal N96 : STD_LOGIC; 
  signal Reset_IBUF_89 : STD_LOGIC; 
  signal SPI_power_OBUF_101 : STD_LOGIC; 
  signal SystemClock_BUFGP_103 : STD_LOGIC; 
  signal U1_N111 : STD_LOGIC; 
  signal U1_N12 : STD_LOGIC; 
  signal U1_N13 : STD_LOGIC; 
  signal U1_N14 : STD_LOGIC; 
  signal U1_N15 : STD_LOGIC; 
  signal U1_N16 : STD_LOGIC; 
  signal U1_N91 : STD_LOGIC; 
  signal U1_bcd_10_cmp_gt0002 : STD_LOGIC; 
  signal U1_bcd_10_cmp_gt0003 : STD_LOGIC; 
  signal U1_bcd_10_cmp_gt0004 : STD_LOGIC; 
  signal U1_bcd_10_cmp_gt0005 : STD_LOGIC; 
  signal U1_bcd_11_mux0001 : STD_LOGIC; 
  signal U1_bcd_15_mux0001_141 : STD_LOGIC; 
  signal U1_bcd_9_mux00061 : STD_LOGIC; 
  signal U1_bcd_9_mux000611_143 : STD_LOGIC; 
  signal U10_CS_144 : STD_LOGIC; 
  signal U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_0_rt_146 : STD_LOGIC; 
  signal U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_2_rt_149 : STD_LOGIC; 
  signal U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_4_rt_152 : STD_LOGIC; 
  signal U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_9_rt_157 : STD_LOGIC; 
  signal U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_1_Q_158 : STD_LOGIC; 
  signal U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_3_Q : STD_LOGIC; 
  signal U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_5_Q_160 : STD_LOGIC; 
  signal U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_6_Q_161 : STD_LOGIC; 
  signal U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_7_Q : STD_LOGIC; 
  signal U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_8_Q_163 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_10_rt_166 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_11_rt_168 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_12_rt_170 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_13_rt_172 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_14_rt_174 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_15_rt_176 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_16_rt_178 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_17_rt_180 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_18_rt_182 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_19_rt_184 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_1_rt_186 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_20_rt_188 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_21_rt_190 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_22_rt_192 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_2_rt_194 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_3_rt_196 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_4_rt_198 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_5_rt_200 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_6_rt_202 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_7_rt_204 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_8_rt_206 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_cy_9_rt_208 : STD_LOGIC; 
  signal U10_Mcount_iClockDiv_xor_23_rt_210 : STD_LOGIC; 
  signal U10_Mshreg_iShiftRegister_3_211 : STD_LOGIC; 
  signal U10_Result_0_1 : STD_LOGIC; 
  signal U10_Result_1_1 : STD_LOGIC; 
  signal U10_Result_2_1 : STD_LOGIC; 
  signal U10_Result_3_1 : STD_LOGIC; 
  signal U10_Result_3_1_bdd0 : STD_LOGIC; 
  signal U10_Result_4_1 : STD_LOGIC; 
  signal U10_Result_5_1 : STD_LOGIC; 
  signal U10_iClock1xEnable_243 : STD_LOGIC; 
  signal U10_iClock1xEnable_cmp_ge0000 : STD_LOGIC; 
  signal U10_iClock1xEnable_inv : STD_LOGIC; 
  signal U10_iClockDiv_or0000 : STD_LOGIC; 
  signal U10_iDataOut1_and0000 : STD_LOGIC; 
  signal U10_iDataOut1_and0000_bdd2 : STD_LOGIC; 
  signal U10_iEnableDataOut : STD_LOGIC; 
  signal U10_iSCLK_292 : STD_LOGIC; 
  signal U10_iSCLK1 : STD_LOGIC; 
  signal U10_iSCLK_inv : STD_LOGIC; 
  signal U10_iSend_295 : STD_LOGIC; 
  signal U10_iSend_not0001 : STD_LOGIC; 
  signal U10_iShiftRegister_and0000 : STD_LOGIC; 
  signal U10_presState_FSM_FFd1_310 : STD_LOGIC; 
  signal U10_presState_FSM_FFd2_311 : STD_LOGIC; 
  signal U10_presState_FSM_FFd2_In : STD_LOGIC; 
  signal U2_Mrom_seg2 : STD_LOGIC; 
  signal U4_Mrom_seg : STD_LOGIC; 
  signal U4_Mrom_seg1 : STD_LOGIC; 
  signal U4_Mrom_seg2 : STD_LOGIC; 
  signal U4_Mrom_seg3 : STD_LOGIC; 
  signal U4_Mrom_seg4 : STD_LOGIC; 
  signal U4_Mrom_seg5 : STD_LOGIC; 
  signal U4_Mrom_seg6 : STD_LOGIC; 
  signal U5_Mrom_seg : STD_LOGIC; 
  signal U5_Mrom_seg1 : STD_LOGIC; 
  signal U5_Mrom_seg2 : STD_LOGIC; 
  signal U5_Mrom_seg3 : STD_LOGIC; 
  signal U5_Mrom_seg4 : STD_LOGIC; 
  signal U5_Mrom_seg5 : STD_LOGIC; 
  signal U5_Mrom_seg6 : STD_LOGIC; 
  signal U6_Mrom_seg : STD_LOGIC; 
  signal U6_Mrom_seg4 : STD_LOGIC; 
  signal U6_Mrom_seg5 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_10_rt_333 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_11_rt_335 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_12_rt_337 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_13_rt_339 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_14_rt_341 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_1_rt_343 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_2_rt_345 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_3_rt_347 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_4_rt_349 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_5_rt_351 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_6_rt_353 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_7_rt_355 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_8_rt_357 : STD_LOGIC; 
  signal U8_Mcount_iCount16_cy_9_rt_359 : STD_LOGIC; 
  signal U8_Mcount_iCount16_xor_15_rt_361 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_3_f5_362 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_3_f51 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_3_f52 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_3_f53 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_3_f54 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_3_f55 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_3_f56 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_3_f5_1_369 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_3_f5_rt_370 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_4_f5_371 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_4_f51 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_4_f52 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_4_f53 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_4_f54 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_4_f55 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_4_f56 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_5_378 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_51_379 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_510_380 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_511_381 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_512_382 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_513_383 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_52_384 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_53_385 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_54_386 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_55_387 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_56_388 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_57_389 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_58_390 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_59_391 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_6_392 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_61_393 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_62_394 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_63_395 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_64_396 : STD_LOGIC; 
  signal U8_Mmux_iDigitOut_65_397 : STD_LOGIC; 
  signal U9_Mcount_iNoBitsSent : STD_LOGIC; 
  signal U9_Mcount_iNoBitsSent1 : STD_LOGIC; 
  signal U9_Mcount_iNoBitsSent2 : STD_LOGIC; 
  signal U9_Mcount_iNoBitsSent3 : STD_LOGIC; 
  signal U9_Mmux_i_DataIn_10_434 : STD_LOGIC; 
  signal U9_Mmux_i_DataIn_101 : STD_LOGIC; 
  signal U9_Mmux_i_DataIn_11_436 : STD_LOGIC; 
  signal U9_Mmux_i_DataIn_112_437 : STD_LOGIC; 
  signal U9_Mmux_i_DataIn_3_438 : STD_LOGIC; 
  signal U9_Mmux_i_DataIn_4_439 : STD_LOGIC; 
  signal U9_Mmux_i_DataIn_6_f5_440 : STD_LOGIC; 
  signal U9_Mmux_i_DataIn_7_441 : STD_LOGIC; 
  signal U9_Mmux_i_DataIn_8_442 : STD_LOGIC; 
  signal U9_Mmux_i_DataIn_9_f5_443 : STD_LOGIC; 
  signal U9_Mmux_i_DataIn_9_f51 : STD_LOGIC; 
  signal U9_Mmux_i_DataIn_9_f52 : STD_LOGIC; 
  signal U9_Mrom_i_huns2 : STD_LOGIC; 
  signal U9_Mrom_i_huns3 : STD_LOGIC; 
  signal U9_Mrom_i_ones1 : STD_LOGIC; 
  signal U9_Mrom_i_ones2 : STD_LOGIC; 
  signal U9_Mrom_i_ones4 : STD_LOGIC; 
  signal U9_Mrom_i_tens1 : STD_LOGIC; 
  signal U9_Mrom_i_tens2 : STD_LOGIC; 
  signal U9_Mrom_i_tens4 : STD_LOGIC; 
  signal U9_N0 : STD_LOGIC; 
  signal U9_N11 : STD_LOGIC; 
  signal U9_N7 : STD_LOGIC; 
  signal U9_Result_0_1 : STD_LOGIC; 
  signal U9_Result_1_1 : STD_LOGIC; 
  signal U9_Result_2_1 : STD_LOGIC; 
  signal U9_Result_3_1 : STD_LOGIC; 
  signal U9_iClock1xEnable_466 : STD_LOGIC; 
  signal U9_iClock1xEnable_and0000 : STD_LOGIC; 
  signal U9_iClock1xEnable_inv : STD_LOGIC; 
  signal U9_iClockDiv_31 : STD_LOGIC; 
  signal U9_iClockDiv_and0000 : STD_LOGIC; 
  signal U9_iEnableShift : STD_LOGIC; 
  signal U9_iEnableTxdBuffer : STD_LOGIC; 
  signal U9_iNoBitsSent_not0001 : STD_LOGIC; 
  signal U9_iSend1_487 : STD_LOGIC; 
  signal U9_iSend1_or0000 : STD_LOGIC; 
  signal U9_iSend2_489 : STD_LOGIC; 
  signal U9_iTxdBuffer_and0000 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_1_107_502 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_1_114_503 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_1_170 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_1_1701_505 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_1_178_506 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_1_23_507 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_1_34_508 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_1_52_509 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_1_86_510 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_5_11_515 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_5_38_516 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_6_47 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_6_471_519 : STD_LOGIC; 
  signal U9_iTxdBuffer_mux0000_6_472_520 : STD_LOGIC; 
  signal U9_i_DataIn_1_1 : STD_LOGIC; 
  signal U9_presState_FSM_FFd1_530 : STD_LOGIC; 
  signal U9_presState_FSM_FFd1_In : STD_LOGIC; 
  signal U9_presState_FSM_FFd1_In28_SW0 : STD_LOGIC; 
  signal U9_presState_FSM_FFd2_533 : STD_LOGIC; 
  signal U9_presState_FSM_FFd2_In : STD_LOGIC; 
  signal U9_presState_cmp_eq0002 : STD_LOGIC; 
  signal iCount9_or0000 : STD_LOGIC; 
  signal iCount9_or000010_546 : STD_LOGIC; 
  signal iCount9_or000019_547 : STD_LOGIC; 
  signal i_converted_number_10_Q : STD_LOGIC; 
  signal i_converted_number_11_Q : STD_LOGIC; 
  signal i_converted_number_12_Q : STD_LOGIC; 
  signal i_converted_number_13_Q : STD_LOGIC; 
  signal i_converted_number_14_Q : STD_LOGIC; 
  signal i_converted_number_15_Q : STD_LOGIC; 
  signal i_converted_number_16_Q : STD_LOGIC; 
  signal i_converted_number_17_Q : STD_LOGIC; 
  signal i_converted_number_20_Q : STD_LOGIC; 
  signal i_converted_number_9_Q : STD_LOGIC; 
  signal Mcount_iCount9_cy : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal Mcount_iCount9_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal Result : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal U1_Madd_bcd_11_8_add0000_cy : STD_LOGIC_VECTOR ( 2 downto 2 ); 
  signal U1_Madd_bcd_11_8_add0002_lut : STD_LOGIC_VECTOR ( 3 downto 2 ); 
  signal U1_Madd_bcd_11_8_add0003_cy : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal U1_Madd_bcd_11_8_add0003_lut : STD_LOGIC_VECTOR ( 3 downto 2 ); 
  signal U1_Madd_bcd_11_8_add0004_cy : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal U1_Madd_bcd_11_8_add0004_lut : STD_LOGIC_VECTOR ( 3 downto 2 ); 
  signal U1_Madd_bcd_11_8_add0005_cy : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal U1_Madd_bcd_11_8_add0005_lut : STD_LOGIC_VECTOR ( 3 downto 2 ); 
  signal U1_Madd_bcd_11_8_add0006_cy : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal U1_Madd_bcd_11_8_add0006_lut : STD_LOGIC_VECTOR ( 3 downto 3 ); 
  signal U1_Madd_bcd_15_12_add0000_cy : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U1_Madd_bcd_15_12_add0001_cy : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U1_Madd_bcd_15_12_add0002_cy : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U1_Madd_bcd_15_12_add0002_lut : STD_LOGIC_VECTOR ( 3 downto 2 ); 
  signal U1_Madd_bcd_15_12_add0003_cy : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U1_Madd_bcd_15_12_add0003_lut : STD_LOGIC_VECTOR ( 3 downto 3 ); 
  signal U1_Madd_bcd_19_16_add0000_lut : STD_LOGIC_VECTOR ( 2 downto 2 ); 
  signal U10_Mcompar_iClock1xEnable_cmp_ge0000_cy : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal U10_Mcount_iClockDiv_cy : STD_LOGIC_VECTOR ( 22 downto 0 ); 
  signal U10_Mcount_iClockDiv_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U10_Result : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal U10_iClockDiv : STD_LOGIC_VECTOR ( 23 downto 0 ); 
  signal U10_iDataOut1 : STD_LOGIC_VECTOR ( 14 downto 3 ); 
  signal U10_iNoBitsReceived : STD_LOGIC_VECTOR ( 5 downto 0 ); 
  signal U10_iShiftRegister : STD_LOGIC_VECTOR ( 14 downto 3 ); 
  signal U8_Mcount_iCount16_cy : STD_LOGIC_VECTOR ( 14 downto 0 ); 
  signal U8_Mcount_iCount16_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U8_Result : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal U8_iCount16 : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal U9_Result : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal U9_iClockDiv : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal U9_iClockWordCount : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal U9_iNoBitsSent : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal U9_iTxdBuffer : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal U9_iTxdBuffer_mux0000 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U9_i_data_out_sel : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal U9_i_data_out_sel_add0000 : STD_LOGIC_VECTOR ( 3 downto 1 ); 
  signal iCount9 : STD_LOGIC_VECTOR ( 8 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  XST_VCC : VCC
    port map (
      P => SPI_power_OBUF_101
    );
  iCount9_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => Result(0),
      R => iCount9_or0000,
      Q => iCount9(0)
    );
  iCount9_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => Result(1),
      R => iCount9_or0000,
      Q => iCount9(1)
    );
  iCount9_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => Result(2),
      R => iCount9_or0000,
      Q => iCount9(2)
    );
  iCount9_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => Result(3),
      R => iCount9_or0000,
      Q => iCount9(3)
    );
  iCount9_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => Result(4),
      R => iCount9_or0000,
      Q => iCount9(4)
    );
  iCount9_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => Result(5),
      R => iCount9_or0000,
      Q => iCount9(5)
    );
  iCount9_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => Result(6),
      R => iCount9_or0000,
      Q => iCount9(6)
    );
  iCount9_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => Result(7),
      R => iCount9_or0000,
      Q => iCount9(7)
    );
  iCount9_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => Result(8),
      R => iCount9_or0000,
      Q => iCount9(8)
    );
  Mcount_iCount9_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => SPI_power_OBUF_101,
      S => Mcount_iCount9_lut(0),
      O => Mcount_iCount9_cy(0)
    );
  Mcount_iCount9_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => Mcount_iCount9_lut(0),
      O => Result(0)
    );
  Mcount_iCount9_cy_1_Q : MUXCY
    port map (
      CI => Mcount_iCount9_cy(0),
      DI => N0,
      S => Mcount_iCount9_cy_1_rt_31,
      O => Mcount_iCount9_cy(1)
    );
  Mcount_iCount9_xor_1_Q : XORCY
    port map (
      CI => Mcount_iCount9_cy(0),
      LI => Mcount_iCount9_cy_1_rt_31,
      O => Result(1)
    );
  Mcount_iCount9_cy_2_Q : MUXCY
    port map (
      CI => Mcount_iCount9_cy(1),
      DI => N0,
      S => Mcount_iCount9_cy_2_rt_33,
      O => Mcount_iCount9_cy(2)
    );
  Mcount_iCount9_xor_2_Q : XORCY
    port map (
      CI => Mcount_iCount9_cy(1),
      LI => Mcount_iCount9_cy_2_rt_33,
      O => Result(2)
    );
  Mcount_iCount9_cy_3_Q : MUXCY
    port map (
      CI => Mcount_iCount9_cy(2),
      DI => N0,
      S => Mcount_iCount9_cy_3_rt_35,
      O => Mcount_iCount9_cy(3)
    );
  Mcount_iCount9_xor_3_Q : XORCY
    port map (
      CI => Mcount_iCount9_cy(2),
      LI => Mcount_iCount9_cy_3_rt_35,
      O => Result(3)
    );
  Mcount_iCount9_cy_4_Q : MUXCY
    port map (
      CI => Mcount_iCount9_cy(3),
      DI => N0,
      S => Mcount_iCount9_cy_4_rt_37,
      O => Mcount_iCount9_cy(4)
    );
  Mcount_iCount9_xor_4_Q : XORCY
    port map (
      CI => Mcount_iCount9_cy(3),
      LI => Mcount_iCount9_cy_4_rt_37,
      O => Result(4)
    );
  Mcount_iCount9_cy_5_Q : MUXCY
    port map (
      CI => Mcount_iCount9_cy(4),
      DI => N0,
      S => Mcount_iCount9_cy_5_rt_39,
      O => Mcount_iCount9_cy(5)
    );
  Mcount_iCount9_xor_5_Q : XORCY
    port map (
      CI => Mcount_iCount9_cy(4),
      LI => Mcount_iCount9_cy_5_rt_39,
      O => Result(5)
    );
  Mcount_iCount9_cy_6_Q : MUXCY
    port map (
      CI => Mcount_iCount9_cy(5),
      DI => N0,
      S => Mcount_iCount9_cy_6_rt_41,
      O => Mcount_iCount9_cy(6)
    );
  Mcount_iCount9_xor_6_Q : XORCY
    port map (
      CI => Mcount_iCount9_cy(5),
      LI => Mcount_iCount9_cy_6_rt_41,
      O => Result(6)
    );
  Mcount_iCount9_cy_7_Q : MUXCY
    port map (
      CI => Mcount_iCount9_cy(6),
      DI => N0,
      S => Mcount_iCount9_cy_7_rt_43,
      O => Mcount_iCount9_cy(7)
    );
  Mcount_iCount9_xor_7_Q : XORCY
    port map (
      CI => Mcount_iCount9_cy(6),
      LI => Mcount_iCount9_cy_7_rt_43,
      O => Result(7)
    );
  Mcount_iCount9_xor_8_Q : XORCY
    port map (
      CI => Mcount_iCount9_cy(7),
      LI => Mcount_iCount9_xor_8_rt_45,
      O => Result(8)
    );
  U8_Mcount_iCount16_xor_15_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(14),
      LI => U8_Mcount_iCount16_xor_15_rt_361,
      O => U8_Result(15)
    );
  U8_Mcount_iCount16_xor_14_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(13),
      LI => U8_Mcount_iCount16_cy_14_rt_341,
      O => U8_Result(14)
    );
  U8_Mcount_iCount16_cy_14_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(13),
      DI => N0,
      S => U8_Mcount_iCount16_cy_14_rt_341,
      O => U8_Mcount_iCount16_cy(14)
    );
  U8_Mcount_iCount16_xor_13_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(12),
      LI => U8_Mcount_iCount16_cy_13_rt_339,
      O => U8_Result(13)
    );
  U8_Mcount_iCount16_cy_13_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(12),
      DI => N0,
      S => U8_Mcount_iCount16_cy_13_rt_339,
      O => U8_Mcount_iCount16_cy(13)
    );
  U8_Mcount_iCount16_xor_12_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(11),
      LI => U8_Mcount_iCount16_cy_12_rt_337,
      O => U8_Result(12)
    );
  U8_Mcount_iCount16_cy_12_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(11),
      DI => N0,
      S => U8_Mcount_iCount16_cy_12_rt_337,
      O => U8_Mcount_iCount16_cy(12)
    );
  U8_Mcount_iCount16_xor_11_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(10),
      LI => U8_Mcount_iCount16_cy_11_rt_335,
      O => U8_Result(11)
    );
  U8_Mcount_iCount16_cy_11_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(10),
      DI => N0,
      S => U8_Mcount_iCount16_cy_11_rt_335,
      O => U8_Mcount_iCount16_cy(11)
    );
  U8_Mcount_iCount16_xor_10_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(9),
      LI => U8_Mcount_iCount16_cy_10_rt_333,
      O => U8_Result(10)
    );
  U8_Mcount_iCount16_cy_10_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(9),
      DI => N0,
      S => U8_Mcount_iCount16_cy_10_rt_333,
      O => U8_Mcount_iCount16_cy(10)
    );
  U8_Mcount_iCount16_xor_9_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(8),
      LI => U8_Mcount_iCount16_cy_9_rt_359,
      O => U8_Result(9)
    );
  U8_Mcount_iCount16_cy_9_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(8),
      DI => N0,
      S => U8_Mcount_iCount16_cy_9_rt_359,
      O => U8_Mcount_iCount16_cy(9)
    );
  U8_Mcount_iCount16_xor_8_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(7),
      LI => U8_Mcount_iCount16_cy_8_rt_357,
      O => U8_Result(8)
    );
  U8_Mcount_iCount16_cy_8_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(7),
      DI => N0,
      S => U8_Mcount_iCount16_cy_8_rt_357,
      O => U8_Mcount_iCount16_cy(8)
    );
  U8_Mcount_iCount16_xor_7_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(6),
      LI => U8_Mcount_iCount16_cy_7_rt_355,
      O => U8_Result(7)
    );
  U8_Mcount_iCount16_cy_7_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(6),
      DI => N0,
      S => U8_Mcount_iCount16_cy_7_rt_355,
      O => U8_Mcount_iCount16_cy(7)
    );
  U8_Mcount_iCount16_xor_6_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(5),
      LI => U8_Mcount_iCount16_cy_6_rt_353,
      O => U8_Result(6)
    );
  U8_Mcount_iCount16_cy_6_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(5),
      DI => N0,
      S => U8_Mcount_iCount16_cy_6_rt_353,
      O => U8_Mcount_iCount16_cy(6)
    );
  U8_Mcount_iCount16_xor_5_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(4),
      LI => U8_Mcount_iCount16_cy_5_rt_351,
      O => U8_Result(5)
    );
  U8_Mcount_iCount16_cy_5_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(4),
      DI => N0,
      S => U8_Mcount_iCount16_cy_5_rt_351,
      O => U8_Mcount_iCount16_cy(5)
    );
  U8_Mcount_iCount16_xor_4_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(3),
      LI => U8_Mcount_iCount16_cy_4_rt_349,
      O => U8_Result(4)
    );
  U8_Mcount_iCount16_cy_4_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(3),
      DI => N0,
      S => U8_Mcount_iCount16_cy_4_rt_349,
      O => U8_Mcount_iCount16_cy(4)
    );
  U8_Mcount_iCount16_xor_3_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(2),
      LI => U8_Mcount_iCount16_cy_3_rt_347,
      O => U8_Result(3)
    );
  U8_Mcount_iCount16_cy_3_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(2),
      DI => N0,
      S => U8_Mcount_iCount16_cy_3_rt_347,
      O => U8_Mcount_iCount16_cy(3)
    );
  U8_Mcount_iCount16_xor_2_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(1),
      LI => U8_Mcount_iCount16_cy_2_rt_345,
      O => U8_Result(2)
    );
  U8_Mcount_iCount16_cy_2_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(1),
      DI => N0,
      S => U8_Mcount_iCount16_cy_2_rt_345,
      O => U8_Mcount_iCount16_cy(2)
    );
  U8_Mcount_iCount16_xor_1_Q : XORCY
    port map (
      CI => U8_Mcount_iCount16_cy(0),
      LI => U8_Mcount_iCount16_cy_1_rt_343,
      O => U8_Result(1)
    );
  U8_Mcount_iCount16_cy_1_Q : MUXCY
    port map (
      CI => U8_Mcount_iCount16_cy(0),
      DI => N0,
      S => U8_Mcount_iCount16_cy_1_rt_343,
      O => U8_Mcount_iCount16_cy(1)
    );
  U8_Mcount_iCount16_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => U8_Mcount_iCount16_lut(0),
      O => U8_Result(0)
    );
  U8_Mcount_iCount16_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => SPI_power_OBUF_101,
      S => U8_Mcount_iCount16_lut(0),
      O => U8_Mcount_iCount16_cy(0)
    );
  U8_Mmux_iDigitOut_5 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U6_Mrom_seg,
      I2 => N0,
      O => U8_Mmux_iDigitOut_5_378
    );
  U8_Mmux_iDigitOut_3_f5 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_5_378,
      I1 => U8_Mmux_iDigitOut_3_f5_rt_370,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_3_f5_362
    );
  U8_Mmux_iDigitOut_51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U4_Mrom_seg,
      I2 => U5_Mrom_seg,
      O => U8_Mmux_iDigitOut_51_379
    );
  U8_Mmux_iDigitOut_4_f5 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_6_392,
      I1 => U8_Mmux_iDigitOut_51_379,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_4_f5_371
    );
  U8_Mmux_iDigitOut_2_f6 : MUXF6
    port map (
      I0 => U8_Mmux_iDigitOut_4_f5_371,
      I1 => U8_Mmux_iDigitOut_3_f5_362,
      S => U8_iCount16(15),
      O => Cg_OBUF_26
    );
  U8_Mmux_iDigitOut_3_f5_0 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_52_384,
      I1 => SPI_power_OBUF_101,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_3_f51
    );
  U8_Mmux_iDigitOut_53 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U4_Mrom_seg1,
      I2 => U5_Mrom_seg1,
      O => U8_Mmux_iDigitOut_53_385
    );
  U8_Mmux_iDigitOut_4_f5_0 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_61_393,
      I1 => U8_Mmux_iDigitOut_53_385,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_4_f51
    );
  U8_Mmux_iDigitOut_2_f6_0 : MUXF6
    port map (
      I0 => U8_Mmux_iDigitOut_4_f51,
      I1 => U8_Mmux_iDigitOut_3_f51,
      S => U8_iCount16(15),
      O => Cf_OBUF_24
    );
  U8_Mmux_iDigitOut_3_f5_1 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_54_386,
      I1 => U8_Mmux_iDigitOut_3_f5_1_369,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_3_f52
    );
  U8_Mmux_iDigitOut_55 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U4_Mrom_seg2,
      I2 => U5_Mrom_seg2,
      O => U8_Mmux_iDigitOut_55_387
    );
  U8_Mmux_iDigitOut_4_f5_1 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_62_394,
      I1 => U8_Mmux_iDigitOut_55_387,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_4_f52
    );
  U8_Mmux_iDigitOut_2_f6_1 : MUXF6
    port map (
      I0 => U8_Mmux_iDigitOut_4_f52,
      I1 => U8_Mmux_iDigitOut_3_f52,
      S => U8_iCount16(15),
      O => Ce_OBUF_22
    );
  U8_Mmux_iDigitOut_3_f5_2 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_56_388,
      I1 => SPI_power_OBUF_101,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_3_f53
    );
  U8_Mmux_iDigitOut_57 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U4_Mrom_seg3,
      I2 => U5_Mrom_seg3,
      O => U8_Mmux_iDigitOut_57_389
    );
  U8_Mmux_iDigitOut_4_f5_2 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_63_395,
      I1 => U8_Mmux_iDigitOut_57_389,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_4_f53
    );
  U8_Mmux_iDigitOut_2_f6_2 : MUXF6
    port map (
      I0 => U8_Mmux_iDigitOut_4_f53,
      I1 => U8_Mmux_iDigitOut_3_f53,
      S => U8_iCount16(15),
      O => Cd_OBUF_20
    );
  U8_Mmux_iDigitOut_58 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U6_Mrom_seg4,
      I2 => SPI_power_OBUF_101,
      O => U8_Mmux_iDigitOut_58_390
    );
  U8_Mmux_iDigitOut_3_f5_3 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_58_390,
      I1 => SPI_power_OBUF_101,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_3_f54
    );
  U8_Mmux_iDigitOut_59 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U4_Mrom_seg4,
      I2 => U5_Mrom_seg4,
      O => U8_Mmux_iDigitOut_59_391
    );
  U8_Mmux_iDigitOut_4_f5_3 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_64_396,
      I1 => U8_Mmux_iDigitOut_59_391,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_4_f54
    );
  U8_Mmux_iDigitOut_2_f6_3 : MUXF6
    port map (
      I0 => U8_Mmux_iDigitOut_4_f54,
      I1 => U8_Mmux_iDigitOut_3_f54,
      S => U8_iCount16(15),
      O => Cc_OBUF_18
    );
  U8_Mmux_iDigitOut_510 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U6_Mrom_seg5,
      I2 => SPI_power_OBUF_101,
      O => U8_Mmux_iDigitOut_510_380
    );
  U8_Mmux_iDigitOut_3_f5_4 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_510_380,
      I1 => U2_Mrom_seg2,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_3_f55
    );
  U8_Mmux_iDigitOut_511 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U4_Mrom_seg5,
      I2 => U5_Mrom_seg5,
      O => U8_Mmux_iDigitOut_511_381
    );
  U8_Mmux_iDigitOut_4_f5_4 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_65_397,
      I1 => U8_Mmux_iDigitOut_511_381,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_4_f55
    );
  U8_Mmux_iDigitOut_2_f6_4 : MUXF6
    port map (
      I0 => U8_Mmux_iDigitOut_4_f55,
      I1 => U8_Mmux_iDigitOut_3_f55,
      S => U8_iCount16(15),
      O => Cb_OBUF_16
    );
  U8_Mmux_iDigitOut_3_f5_5 : MUXF5
    port map (
      I0 => U8_Mmux_iDigitOut_512_382,
      I1 => SPI_power_OBUF_101,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_3_f56
    );
  U8_Mmux_iDigitOut_513 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U4_Mrom_seg6,
      I2 => U5_Mrom_seg6,
      O => U8_Mmux_iDigitOut_513_383
    );
  U8_Mmux_iDigitOut_4_f5_5 : MUXF5
    port map (
      I0 => SPI_power_OBUF_101,
      I1 => U8_Mmux_iDigitOut_513_383,
      S => U8_iCount16(14),
      O => U8_Mmux_iDigitOut_4_f56
    );
  U8_Mmux_iDigitOut_2_f6_5 : MUXF6
    port map (
      I0 => U8_Mmux_iDigitOut_4_f56,
      I1 => U8_Mmux_iDigitOut_3_f56,
      S => U8_iCount16(15),
      O => Ca_OBUF_14
    );
  U8_iCount16_15 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(15),
      Q => U8_iCount16(15)
    );
  U8_iCount16_14 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(14),
      Q => U8_iCount16(14)
    );
  U8_iCount16_13 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(13),
      Q => U8_iCount16(13)
    );
  U8_iCount16_12 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(12),
      Q => U8_iCount16(12)
    );
  U8_iCount16_11 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(11),
      Q => U8_iCount16(11)
    );
  U8_iCount16_10 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(10),
      Q => U8_iCount16(10)
    );
  U8_iCount16_9 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(9),
      Q => U8_iCount16(9)
    );
  U8_iCount16_8 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(8),
      Q => U8_iCount16(8)
    );
  U8_iCount16_7 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(7),
      Q => U8_iCount16(7)
    );
  U8_iCount16_6 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(6),
      Q => U8_iCount16(6)
    );
  U8_iCount16_5 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(5),
      Q => U8_iCount16(5)
    );
  U8_iCount16_4 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(4),
      Q => U8_iCount16(4)
    );
  U8_iCount16_3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(3),
      Q => U8_iCount16(3)
    );
  U8_iCount16_2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(2),
      Q => U8_iCount16(2)
    );
  U8_iCount16_1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(1),
      Q => U8_iCount16(1)
    );
  U8_iCount16_0 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U8_Result(0),
      Q => U8_iCount16(0)
    );
  U10_Mcount_iClockDiv_xor_23_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(22),
      LI => U10_Mcount_iClockDiv_xor_23_rt_210,
      O => U10_Result(23)
    );
  U10_Mcount_iClockDiv_xor_22_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(21),
      LI => U10_Mcount_iClockDiv_cy_22_rt_192,
      O => U10_Result(22)
    );
  U10_Mcount_iClockDiv_cy_22_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(21),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_22_rt_192,
      O => U10_Mcount_iClockDiv_cy(22)
    );
  U10_Mcount_iClockDiv_xor_21_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(20),
      LI => U10_Mcount_iClockDiv_cy_21_rt_190,
      O => U10_Result(21)
    );
  U10_Mcount_iClockDiv_cy_21_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(20),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_21_rt_190,
      O => U10_Mcount_iClockDiv_cy(21)
    );
  U10_Mcount_iClockDiv_xor_20_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(19),
      LI => U10_Mcount_iClockDiv_cy_20_rt_188,
      O => U10_Result(20)
    );
  U10_Mcount_iClockDiv_cy_20_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(19),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_20_rt_188,
      O => U10_Mcount_iClockDiv_cy(20)
    );
  U10_Mcount_iClockDiv_xor_19_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(18),
      LI => U10_Mcount_iClockDiv_cy_19_rt_184,
      O => U10_Result(19)
    );
  U10_Mcount_iClockDiv_cy_19_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(18),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_19_rt_184,
      O => U10_Mcount_iClockDiv_cy(19)
    );
  U10_Mcount_iClockDiv_xor_18_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(17),
      LI => U10_Mcount_iClockDiv_cy_18_rt_182,
      O => U10_Result(18)
    );
  U10_Mcount_iClockDiv_cy_18_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(17),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_18_rt_182,
      O => U10_Mcount_iClockDiv_cy(18)
    );
  U10_Mcount_iClockDiv_xor_17_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(16),
      LI => U10_Mcount_iClockDiv_cy_17_rt_180,
      O => U10_Result(17)
    );
  U10_Mcount_iClockDiv_cy_17_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(16),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_17_rt_180,
      O => U10_Mcount_iClockDiv_cy(17)
    );
  U10_Mcount_iClockDiv_xor_16_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(15),
      LI => U10_Mcount_iClockDiv_cy_16_rt_178,
      O => U10_Result(16)
    );
  U10_Mcount_iClockDiv_cy_16_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(15),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_16_rt_178,
      O => U10_Mcount_iClockDiv_cy(16)
    );
  U10_Mcount_iClockDiv_xor_15_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(14),
      LI => U10_Mcount_iClockDiv_cy_15_rt_176,
      O => U10_Result(15)
    );
  U10_Mcount_iClockDiv_cy_15_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(14),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_15_rt_176,
      O => U10_Mcount_iClockDiv_cy(15)
    );
  U10_Mcount_iClockDiv_xor_14_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(13),
      LI => U10_Mcount_iClockDiv_cy_14_rt_174,
      O => U10_Result(14)
    );
  U10_Mcount_iClockDiv_cy_14_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(13),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_14_rt_174,
      O => U10_Mcount_iClockDiv_cy(14)
    );
  U10_Mcount_iClockDiv_xor_13_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(12),
      LI => U10_Mcount_iClockDiv_cy_13_rt_172,
      O => U10_Result(13)
    );
  U10_Mcount_iClockDiv_cy_13_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(12),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_13_rt_172,
      O => U10_Mcount_iClockDiv_cy(13)
    );
  U10_Mcount_iClockDiv_xor_12_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(11),
      LI => U10_Mcount_iClockDiv_cy_12_rt_170,
      O => U10_Result(12)
    );
  U10_Mcount_iClockDiv_cy_12_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(11),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_12_rt_170,
      O => U10_Mcount_iClockDiv_cy(12)
    );
  U10_Mcount_iClockDiv_xor_11_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(10),
      LI => U10_Mcount_iClockDiv_cy_11_rt_168,
      O => U10_Result(11)
    );
  U10_Mcount_iClockDiv_cy_11_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(10),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_11_rt_168,
      O => U10_Mcount_iClockDiv_cy(11)
    );
  U10_Mcount_iClockDiv_xor_10_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(9),
      LI => U10_Mcount_iClockDiv_cy_10_rt_166,
      O => U10_Result(10)
    );
  U10_Mcount_iClockDiv_cy_10_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(9),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_10_rt_166,
      O => U10_Mcount_iClockDiv_cy(10)
    );
  U10_Mcount_iClockDiv_xor_9_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(8),
      LI => U10_Mcount_iClockDiv_cy_9_rt_208,
      O => U10_Result(9)
    );
  U10_Mcount_iClockDiv_cy_9_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(8),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_9_rt_208,
      O => U10_Mcount_iClockDiv_cy(9)
    );
  U10_Mcount_iClockDiv_xor_8_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(7),
      LI => U10_Mcount_iClockDiv_cy_8_rt_206,
      O => U10_Result(8)
    );
  U10_Mcount_iClockDiv_cy_8_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(7),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_8_rt_206,
      O => U10_Mcount_iClockDiv_cy(8)
    );
  U10_Mcount_iClockDiv_xor_7_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(6),
      LI => U10_Mcount_iClockDiv_cy_7_rt_204,
      O => U10_Result(7)
    );
  U10_Mcount_iClockDiv_cy_7_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(6),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_7_rt_204,
      O => U10_Mcount_iClockDiv_cy(7)
    );
  U10_Mcount_iClockDiv_xor_6_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(5),
      LI => U10_Mcount_iClockDiv_cy_6_rt_202,
      O => U10_Result(6)
    );
  U10_Mcount_iClockDiv_cy_6_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(5),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_6_rt_202,
      O => U10_Mcount_iClockDiv_cy(6)
    );
  U10_Mcount_iClockDiv_xor_5_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(4),
      LI => U10_Mcount_iClockDiv_cy_5_rt_200,
      O => U10_Result(5)
    );
  U10_Mcount_iClockDiv_cy_5_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(4),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_5_rt_200,
      O => U10_Mcount_iClockDiv_cy(5)
    );
  U10_Mcount_iClockDiv_xor_4_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(3),
      LI => U10_Mcount_iClockDiv_cy_4_rt_198,
      O => U10_Result(4)
    );
  U10_Mcount_iClockDiv_cy_4_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(3),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_4_rt_198,
      O => U10_Mcount_iClockDiv_cy(4)
    );
  U10_Mcount_iClockDiv_xor_3_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(2),
      LI => U10_Mcount_iClockDiv_cy_3_rt_196,
      O => U10_Result(3)
    );
  U10_Mcount_iClockDiv_cy_3_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(2),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_3_rt_196,
      O => U10_Mcount_iClockDiv_cy(3)
    );
  U10_Mcount_iClockDiv_xor_2_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(1),
      LI => U10_Mcount_iClockDiv_cy_2_rt_194,
      O => U10_Result(2)
    );
  U10_Mcount_iClockDiv_cy_2_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(1),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_2_rt_194,
      O => U10_Mcount_iClockDiv_cy(2)
    );
  U10_Mcount_iClockDiv_xor_1_Q : XORCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(0),
      LI => U10_Mcount_iClockDiv_cy_1_rt_186,
      O => U10_Result(1)
    );
  U10_Mcount_iClockDiv_cy_1_Q : MUXCY
    port map (
      CI => U10_Mcount_iClockDiv_cy(0),
      DI => N0,
      S => U10_Mcount_iClockDiv_cy_1_rt_186,
      O => U10_Mcount_iClockDiv_cy(1)
    );
  U10_Mcount_iClockDiv_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => U10_Mcount_iClockDiv_lut(0),
      O => U10_Result(0)
    );
  U10_Mcount_iClockDiv_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => SPI_power_OBUF_101,
      S => U10_Mcount_iClockDiv_lut(0),
      O => U10_Mcount_iClockDiv_cy(0)
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_9_Q : MUXCY
    port map (
      CI => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(8),
      DI => N0,
      S => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_9_rt_157,
      O => U10_iClock1xEnable_cmp_ge0000
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_8_Q : MUXCY
    port map (
      CI => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(7),
      DI => N0,
      S => U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_8_Q_163,
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(8)
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_8_Q : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U10_iClockDiv(19),
      I1 => U10_iClockDiv(20),
      I2 => U10_iClockDiv(21),
      I3 => U10_iClockDiv(22),
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_8_Q_163
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_7_Q : MUXCY
    port map (
      CI => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(6),
      DI => SPI_power_OBUF_101,
      S => U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_7_Q,
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(7)
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_6_Q : MUXCY
    port map (
      CI => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(5),
      DI => N0,
      S => U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_6_Q_161,
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(6)
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_6_Q : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U10_iClockDiv(14),
      I1 => U10_iClockDiv(15),
      I2 => U10_iClockDiv(16),
      I3 => U10_iClockDiv(17),
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_6_Q_161
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_5_Q : MUXCY
    port map (
      CI => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(4),
      DI => SPI_power_OBUF_101,
      S => U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_5_Q_160,
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(5)
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_5_Q : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => U10_iClockDiv(11),
      I1 => U10_iClockDiv(12),
      I2 => U10_iClockDiv(13),
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_5_Q_160
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_4_Q : MUXCY
    port map (
      CI => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(3),
      DI => N0,
      S => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_4_rt_152,
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(4)
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_3_Q : MUXCY
    port map (
      CI => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(2),
      DI => SPI_power_OBUF_101,
      S => U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_3_Q,
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(3)
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_2_Q : MUXCY
    port map (
      CI => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(1),
      DI => N0,
      S => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_2_rt_149,
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(2)
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_1_Q : MUXCY
    port map (
      CI => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(0),
      DI => SPI_power_OBUF_101,
      S => U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_1_Q_158,
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(1)
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_1_Q : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U10_iClockDiv(6),
      I1 => U10_iClockDiv(7),
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_1_Q_158
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_0_Q : MUXCY
    port map (
      CI => SPI_power_OBUF_101,
      DI => N0,
      S => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_0_rt_146,
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy(0)
    );
  U10_iClockDiv_23 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(23),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(23)
    );
  U10_iClockDiv_22 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(22),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(22)
    );
  U10_iClockDiv_21 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(21),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(21)
    );
  U10_iClockDiv_20 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(20),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(20)
    );
  U10_iClockDiv_19 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(19),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(19)
    );
  U10_iClockDiv_18 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(18),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(18)
    );
  U10_iClockDiv_17 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(17),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(17)
    );
  U10_iClockDiv_16 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(16),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(16)
    );
  U10_iClockDiv_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(15),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(15)
    );
  U10_iClockDiv_14 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(14),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(14)
    );
  U10_iClockDiv_13 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(13),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(13)
    );
  U10_iClockDiv_12 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(12),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(12)
    );
  U10_iClockDiv_11 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(11),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(11)
    );
  U10_iClockDiv_10 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(10),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(10)
    );
  U10_iClockDiv_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(9),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(9)
    );
  U10_iClockDiv_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(8),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(8)
    );
  U10_iClockDiv_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(7),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(7)
    );
  U10_iClockDiv_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(6),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(6)
    );
  U10_iClockDiv_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(5),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(5)
    );
  U10_iClockDiv_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(4),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(4)
    );
  U10_iClockDiv_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(3),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(3)
    );
  U10_iClockDiv_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(2),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(2)
    );
  U10_iClockDiv_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(1),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(1)
    );
  U10_iClockDiv_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      D => U10_Result(0),
      R => U10_iClockDiv_or0000,
      Q => U10_iClockDiv(0)
    );
  U10_iNoBitsReceived_5 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_inv,
      CLR => U10_iClock1xEnable_inv,
      D => U10_Result_5_1,
      Q => U10_iNoBitsReceived(5)
    );
  U10_iNoBitsReceived_4 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_inv,
      CLR => U10_iClock1xEnable_inv,
      D => U10_Result_4_1,
      Q => U10_iNoBitsReceived(4)
    );
  U10_iNoBitsReceived_3 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_inv,
      CLR => U10_iClock1xEnable_inv,
      D => U10_Result_3_1,
      Q => U10_iNoBitsReceived(3)
    );
  U10_iNoBitsReceived_2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_inv,
      CLR => U10_iClock1xEnable_inv,
      D => U10_Result_2_1,
      Q => U10_iNoBitsReceived(2)
    );
  U10_iNoBitsReceived_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_inv,
      CLR => U10_iClock1xEnable_inv,
      D => U10_Result_1_1,
      Q => U10_iNoBitsReceived(1)
    );
  U10_iNoBitsReceived_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_inv,
      CLR => U10_iClock1xEnable_inv,
      D => U10_Result_0_1,
      Q => U10_iNoBitsReceived(0)
    );
  U10_presState_FSM_FFd2 : FDC_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CLR => U10_iClock1xEnable_inv,
      D => U10_presState_FSM_FFd2_In,
      Q => U10_presState_FSM_FFd2_311
    );
  U10_presState_FSM_FFd1 : FDC_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CLR => U10_iClock1xEnable_inv,
      D => U10_iEnableDataOut,
      Q => U10_presState_FSM_FFd1_310
    );
  U10_iSend : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => U10_iEnableDataOut,
      G => U10_iSend_not0001,
      Q => U10_iSend_295
    );
  U10_iDataOut1_14 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iDataOut1_and0000,
      D => U10_iShiftRegister(14),
      Q => U10_iDataOut1(14)
    );
  U10_iDataOut1_13 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iDataOut1_and0000,
      D => U10_iShiftRegister(13),
      Q => U10_iDataOut1(13)
    );
  U10_iDataOut1_12 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iDataOut1_and0000,
      D => U10_iShiftRegister(12),
      Q => U10_iDataOut1(12)
    );
  U10_iDataOut1_11 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iDataOut1_and0000,
      D => U10_iShiftRegister(11),
      Q => U10_iDataOut1(11)
    );
  U10_iDataOut1_10 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iDataOut1_and0000,
      D => U10_iShiftRegister(10),
      Q => U10_iDataOut1(10)
    );
  U10_iDataOut1_9 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iDataOut1_and0000,
      D => U10_iShiftRegister(9),
      Q => U10_iDataOut1(9)
    );
  U10_iDataOut1_8 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iDataOut1_and0000,
      D => U10_iShiftRegister(8),
      Q => U10_iDataOut1(8)
    );
  U10_iDataOut1_7 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iDataOut1_and0000,
      D => U10_iShiftRegister(7),
      Q => U10_iDataOut1(7)
    );
  U10_iDataOut1_6 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iDataOut1_and0000,
      D => U10_iShiftRegister(6),
      Q => U10_iDataOut1(6)
    );
  U10_iDataOut1_5 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iDataOut1_and0000,
      D => U10_iShiftRegister(5),
      Q => U10_iDataOut1(5)
    );
  U10_iDataOut1_4 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iDataOut1_and0000,
      D => U10_iShiftRegister(4),
      Q => U10_iDataOut1(4)
    );
  U10_iDataOut1_3 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iDataOut1_and0000,
      D => U10_iShiftRegister(3),
      Q => U10_iDataOut1(3)
    );
  U10_iShiftRegister_14 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iShiftRegister_and0000,
      D => U10_iShiftRegister(13),
      Q => U10_iShiftRegister(14)
    );
  U10_iShiftRegister_13 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iShiftRegister_and0000,
      D => U10_iShiftRegister(12),
      Q => U10_iShiftRegister(13)
    );
  U10_iShiftRegister_12 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iShiftRegister_and0000,
      D => U10_iShiftRegister(11),
      Q => U10_iShiftRegister(12)
    );
  U10_iShiftRegister_11 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iShiftRegister_and0000,
      D => U10_iShiftRegister(10),
      Q => U10_iShiftRegister(11)
    );
  U10_iShiftRegister_10 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iShiftRegister_and0000,
      D => U10_iShiftRegister(9),
      Q => U10_iShiftRegister(10)
    );
  U10_iShiftRegister_9 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iShiftRegister_and0000,
      D => U10_iShiftRegister(8),
      Q => U10_iShiftRegister(9)
    );
  U10_iShiftRegister_8 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iShiftRegister_and0000,
      D => U10_iShiftRegister(7),
      Q => U10_iShiftRegister(8)
    );
  U10_iShiftRegister_7 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iShiftRegister_and0000,
      D => U10_iShiftRegister(6),
      Q => U10_iShiftRegister(7)
    );
  U10_iShiftRegister_6 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iShiftRegister_and0000,
      D => U10_iShiftRegister(5),
      Q => U10_iShiftRegister(6)
    );
  U10_iShiftRegister_5 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iShiftRegister_and0000,
      D => U10_iShiftRegister(4),
      Q => U10_iShiftRegister(5)
    );
  U10_iShiftRegister_4 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iShiftRegister_and0000,
      D => U10_iShiftRegister(3),
      Q => U10_iShiftRegister(4)
    );
  U10_CS : FDP_1
    port map (
      C => U10_iSCLK_292,
      D => N0,
      PRE => U10_iClock1xEnable_inv,
      Q => U10_CS_144
    );
  U10_iClock1xEnable : FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      CE => U10_iClockDiv_or0000,
      D => N0,
      S => U10_iClock1xEnable_cmp_ge0000,
      Q => U10_iClock1xEnable_243
    );
  U10_iSCLK : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => SystemClock_BUFGP_103,
      CE => U10_iClock1xEnable_cmp_ge0000,
      D => U10_iClockDiv(3),
      Q => U10_iSCLK1
    );
  U9_presState_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => U9_iClockDiv(3),
      CLR => U9_iClock1xEnable_inv,
      D => U9_presState_FSM_FFd2_In,
      Q => U9_presState_FSM_FFd2_533
    );
  U9_presState_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => U9_iClockDiv(3),
      CLR => U9_iClock1xEnable_inv,
      D => U9_presState_FSM_FFd1_In,
      Q => U9_presState_FSM_FFd1_530
    );
  U9_Mmux_i_DataIn_8 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => U9_i_data_out_sel(0),
      I1 => U9_Mrom_i_tens1,
      I2 => U9_Mrom_i_ones1,
      O => U9_Mmux_i_DataIn_8_442
    );
  U9_Mmux_i_DataIn_6_f5 : MUXF5
    port map (
      I0 => U9_Mmux_i_DataIn_8_442,
      I1 => U9_Mmux_i_DataIn_7_441,
      S => U9_i_data_out_sel(1),
      O => U9_Mmux_i_DataIn_6_f5_440
    );
  U9_Mmux_i_DataIn_2_f5 : MUXF5
    port map (
      I0 => U9_Mmux_i_DataIn_4_439,
      I1 => U9_Mmux_i_DataIn_3_438,
      S => U9_i_data_out_sel(3),
      O => U9_i_DataIn_1_1
    );
  U9_Mmux_i_DataIn_11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U9_i_data_out_sel(0),
      I1 => U9_Mrom_i_tens2,
      I2 => U9_Mrom_i_ones2,
      O => U9_Mmux_i_DataIn_11_436
    );
  U9_Mmux_i_DataIn_9_f5 : MUXF5
    port map (
      I0 => U9_Mmux_i_DataIn_11_436,
      I1 => U9_Mmux_i_DataIn_10_434,
      S => U9_i_data_out_sel(1),
      O => U9_Mmux_i_DataIn_9_f5_443
    );
  U9_Mmux_i_DataIn_112 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => U9_i_data_out_sel(0),
      I1 => U9_Mrom_i_tens4,
      I2 => U9_Mrom_i_ones4,
      O => U9_Mmux_i_DataIn_112_437
    );
  U9_Mmux_i_DataIn_9_f5_1 : MUXF5
    port map (
      I0 => U9_Mmux_i_DataIn_112_437,
      I1 => N0,
      S => U9_i_data_out_sel(1),
      O => U9_Mmux_i_DataIn_9_f52
    );
  U9_iClockWordCount_4 : FDCE
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iEnableTxdBuffer,
      CLR => U9_iClock1xEnable_inv,
      D => U9_Result(4),
      Q => U9_iClockWordCount(4)
    );
  U9_iClockWordCount_3 : FDCE
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iEnableTxdBuffer,
      CLR => U9_iClock1xEnable_inv,
      D => U9_Result_3_1,
      Q => U9_iClockWordCount(3)
    );
  U9_iClockWordCount_2 : FDCE
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iEnableTxdBuffer,
      CLR => U9_iClock1xEnable_inv,
      D => U9_Result_2_1,
      Q => U9_iClockWordCount(2)
    );
  U9_iClockWordCount_1 : FDCE
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iEnableTxdBuffer,
      CLR => U9_iClock1xEnable_inv,
      D => U9_Result_1_1,
      Q => U9_iClockWordCount(1)
    );
  U9_iClockWordCount_0 : FDCE
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iEnableTxdBuffer,
      CLR => U9_iClock1xEnable_inv,
      D => U9_Result_0_1,
      Q => U9_iClockWordCount(0)
    );
  U9_iNoBitsSent_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iNoBitsSent_not0001,
      CLR => U9_iClock1xEnable_inv,
      D => U9_Mcount_iNoBitsSent3,
      Q => U9_iNoBitsSent(3)
    );
  U9_iNoBitsSent_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iNoBitsSent_not0001,
      CLR => U9_iClock1xEnable_inv,
      D => U9_Mcount_iNoBitsSent2,
      Q => U9_iNoBitsSent(2)
    );
  U9_iNoBitsSent_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iNoBitsSent_not0001,
      CLR => U9_iClock1xEnable_inv,
      D => U9_Mcount_iNoBitsSent1,
      Q => U9_iNoBitsSent(1)
    );
  U9_iNoBitsSent_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iNoBitsSent_not0001,
      CLR => U9_iClock1xEnable_inv,
      D => U9_Mcount_iNoBitsSent,
      Q => U9_iNoBitsSent(0)
    );
  U9_iClockDiv_3 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => iCount9(8),
      CE => U9_iClock1xEnable_466,
      D => U9_Result(3),
      R => U9_iClockDiv_and0000,
      Q => U9_iClockDiv_31
    );
  U9_iClockDiv_2 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => iCount9(8),
      CE => U9_iClock1xEnable_466,
      D => U9_Result(2),
      R => U9_iClockDiv_and0000,
      Q => U9_iClockDiv(2)
    );
  U9_iClockDiv_1 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => iCount9(8),
      CE => U9_iClock1xEnable_466,
      D => U9_Result(1),
      R => U9_iClockDiv_and0000,
      Q => U9_iClockDiv(1)
    );
  U9_iClockDiv_0 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => iCount9(8),
      CE => U9_iClock1xEnable_466,
      D => U9_Result(0),
      R => U9_iClockDiv_and0000,
      Q => U9_iClockDiv(0)
    );
  U9_i_data_out_sel_3 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => U9_i_data_out_sel_add0000(3),
      G => U9_presState_cmp_eq0002,
      Q => U9_i_data_out_sel(3)
    );
  U9_i_data_out_sel_2 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => U9_i_data_out_sel_add0000(2),
      G => U9_presState_cmp_eq0002,
      Q => U9_i_data_out_sel(2)
    );
  U9_i_data_out_sel_1 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => U9_i_data_out_sel_add0000(1),
      G => U9_presState_cmp_eq0002,
      Q => U9_i_data_out_sel(1)
    );
  U9_i_data_out_sel_0 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => U9_Mmux_i_DataIn_101,
      G => U9_presState_cmp_eq0002,
      Q => U9_i_data_out_sel(0)
    );
  U9_iTxdBuffer_8 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iTxdBuffer_and0000,
      D => U9_iEnableShift,
      Q => U9_iTxdBuffer(8)
    );
  U9_iTxdBuffer_7 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iTxdBuffer_and0000,
      D => U9_iTxdBuffer_mux0000(7),
      Q => U9_iTxdBuffer(7)
    );
  U9_iTxdBuffer_6 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iTxdBuffer_and0000,
      D => U9_iTxdBuffer_mux0000(6),
      Q => U9_iTxdBuffer(6)
    );
  U9_iTxdBuffer_5 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iTxdBuffer_and0000,
      D => U9_iTxdBuffer_mux0000(5),
      Q => U9_iTxdBuffer(5)
    );
  U9_iTxdBuffer_4 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iTxdBuffer_and0000,
      D => U9_iTxdBuffer_mux0000(4),
      Q => U9_iTxdBuffer(4)
    );
  U9_iTxdBuffer_3 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iTxdBuffer_and0000,
      D => U9_iTxdBuffer_mux0000(3),
      Q => U9_iTxdBuffer(3)
    );
  U9_iTxdBuffer_2 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iTxdBuffer_and0000,
      D => U9_iTxdBuffer_mux0000(2),
      Q => U9_iTxdBuffer(2)
    );
  U9_iTxdBuffer_1 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iTxdBuffer_and0000,
      D => U9_iTxdBuffer_mux0000(1),
      Q => U9_iTxdBuffer(1)
    );
  U9_iTxdBuffer_0 : FDE
    generic map(
      INIT => '1'
    )
    port map (
      C => U9_iClockDiv(3),
      CE => U9_iTxdBuffer_and0000,
      D => U9_iTxdBuffer_mux0000(0),
      Q => U9_iTxdBuffer(0)
    );
  U9_iSend2 : FDS
    generic map(
      INIT => '0'
    )
    port map (
      C => iCount9(8),
      D => U9_iSend1_487,
      S => U9_iSend1_or0000,
      Q => U9_iSend2_489
    );
  U9_iClock1xEnable : FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => iCount9(8),
      CE => U9_iSend1_or0000,
      D => N0,
      S => U9_iClock1xEnable_and0000,
      Q => U9_iClock1xEnable_466
    );
  U9_iSend1 : FDS
    generic map(
      INIT => '0'
    )
    port map (
      C => iCount9(8),
      D => U10_iSend_295,
      S => U9_iSend1_or0000,
      Q => U9_iSend1_487
    );
  U9_presState_FSM_Out01 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U9_presState_FSM_FFd2_533,
      I1 => U9_presState_FSM_FFd1_530,
      O => U9_presState_cmp_eq0002
    );
  U9_Mrom_i_tens41 : LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      I0 => i_converted_number_13_Q,
      I1 => i_converted_number_15_Q,
      I2 => i_converted_number_14_Q,
      O => U9_Mrom_i_tens4
    );
  U9_Mrom_i_ones41 : LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      I0 => i_converted_number_9_Q,
      I1 => i_converted_number_11_Q,
      I2 => i_converted_number_10_Q,
      O => U9_Mrom_i_ones4
    );
  U9_Mrom_i_tens21 : LUT4
    generic map(
      INIT => X"08AA"
    )
    port map (
      I0 => i_converted_number_14_Q,
      I1 => i_converted_number_12_Q,
      I2 => i_converted_number_13_Q,
      I3 => i_converted_number_15_Q,
      O => U9_Mrom_i_tens2
    );
  U9_Mrom_i_tens111 : LUT4
    generic map(
      INIT => X"08AA"
    )
    port map (
      I0 => i_converted_number_13_Q,
      I1 => i_converted_number_14_Q,
      I2 => i_converted_number_12_Q,
      I3 => i_converted_number_15_Q,
      O => U9_Mrom_i_tens1
    );
  U9_Mrom_i_ones21 : LUT4
    generic map(
      INIT => X"08AA"
    )
    port map (
      I0 => i_converted_number_10_Q,
      I1 => U10_iDataOut1(5),
      I2 => i_converted_number_9_Q,
      I3 => i_converted_number_11_Q,
      O => U9_Mrom_i_ones2
    );
  U9_Mrom_i_ones111 : LUT4
    generic map(
      INIT => X"08AA"
    )
    port map (
      I0 => i_converted_number_9_Q,
      I1 => i_converted_number_10_Q,
      I2 => U10_iDataOut1(5),
      I3 => i_converted_number_11_Q,
      O => U9_Mrom_i_ones1
    );
  U10_iSend_not000111 : LUT4
    generic map(
      INIT => X"2227"
    )
    port map (
      I0 => U10_presState_FSM_FFd2_311,
      I1 => U10_iDataOut1_and0000_bdd2,
      I2 => U10_iClock1xEnable_243,
      I3 => U10_presState_FSM_FFd1_310,
      O => U10_iSend_not0001
    );
  U8_an_5_1 : LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U8_iCount16(15),
      I2 => U8_iCount16(14),
      O => An_5_OBUF_11
    );
  U8_an_4_1 : LUT3
    generic map(
      INIT => X"EF"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U8_iCount16(14),
      I2 => U8_iCount16(15),
      O => An_4_OBUF_10
    );
  U8_an_3_1 : LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U8_iCount16(14),
      I2 => U8_iCount16(15),
      O => An_3_OBUF_9
    );
  U8_an_2_1 : LUT3
    generic map(
      INIT => X"EF"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U8_iCount16(15),
      I2 => U8_iCount16(14),
      O => An_2_OBUF_8
    );
  U8_an_1_1 : LUT3
    generic map(
      INIT => X"EF"
    )
    port map (
      I0 => U8_iCount16(15),
      I1 => U8_iCount16(14),
      I2 => U8_iCount16(13),
      O => An_1_OBUF_7
    );
  U8_an_0_1 : LUT3
    generic map(
      INIT => X"5E"
    )
    port map (
      I0 => U8_iCount16(14),
      I1 => U8_iCount16(13),
      I2 => U8_iCount16(15),
      O => An_0_OBUF_6
    );
  U10_presState_FSM_FFd2_In1 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => U10_presState_FSM_FFd1_310,
      I1 => U10_presState_FSM_FFd2_311,
      O => U10_presState_FSM_FFd2_In
    );
  U9_Mcount_iClockWordCount_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => U9_iClockWordCount(1),
      I1 => U9_iClockWordCount(0),
      O => U9_Result_1_1
    );
  U9_Mcount_iClockDiv_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => U9_iClockDiv(1),
      I1 => U9_iClockDiv(0),
      O => U9_Result(1)
    );
  U10_Mcount_iNoBitsReceived_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => U10_iNoBitsReceived(1),
      I1 => U10_iNoBitsReceived(0),
      O => U10_Result_1_1
    );
  U9_Mcount_iClockWordCount_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => U9_iClockWordCount(2),
      I1 => U9_iClockWordCount(1),
      I2 => U9_iClockWordCount(0),
      O => U9_Result_2_1
    );
  U9_Mcount_iClockDiv_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => U9_iClockDiv(2),
      I1 => U9_iClockDiv(1),
      I2 => U9_iClockDiv(0),
      O => U9_Result(2)
    );
  U10_Mcount_iNoBitsReceived_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => U10_iNoBitsReceived(2),
      I1 => U10_iNoBitsReceived(1),
      I2 => U10_iNoBitsReceived(0),
      O => U10_Result_2_1
    );
  U9_Result_3_11 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => U9_iClockWordCount(3),
      I1 => U9_iClockWordCount(2),
      I2 => U9_iClockWordCount(1),
      I3 => U9_iClockWordCount(0),
      O => U9_Result_3_1
    );
  U9_Mcount_iClockDiv_xor_3_11 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => U9_iClockDiv_31,
      I1 => U9_iClockDiv(1),
      I2 => U9_iClockDiv(0),
      I3 => U9_iClockDiv(2),
      O => U9_Result(3)
    );
  U10_iClockDiv_or00001 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => Reset_IBUF_89,
      I1 => U10_presState_FSM_FFd1_310,
      O => U10_iClockDiv_or0000
    );
  U9_Madd_i_data_out_sel_add0000_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => U9_i_data_out_sel(0),
      I1 => U9_i_data_out_sel(1),
      O => U9_i_data_out_sel_add0000(1)
    );
  U9_Madd_i_data_out_sel_add0000_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => U9_i_data_out_sel(2),
      I1 => U9_i_data_out_sel(1),
      I2 => U9_i_data_out_sel(0),
      O => U9_i_data_out_sel_add0000(2)
    );
  U9_Madd_i_data_out_sel_add0000_xor_3_11 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => U9_i_data_out_sel(3),
      I1 => U9_i_data_out_sel(1),
      I2 => U9_i_data_out_sel(0),
      I3 => U9_i_data_out_sel(2),
      O => U9_i_data_out_sel_add0000(3)
    );
  U9_iClock1xEnable_and00001 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U9_iSend2_489,
      I1 => U9_iSend1_487,
      O => U9_iClock1xEnable_and0000
    );
  U9_Mcount_iNoBitsSent_xor_1_11 : LUT3
    generic map(
      INIT => X"28"
    )
    port map (
      I0 => U9_N11,
      I1 => U9_iNoBitsSent(0),
      I2 => U9_iNoBitsSent(1),
      O => U9_Mcount_iNoBitsSent1
    );
  U10_Result_4_11 : LUT3
    generic map(
      INIT => X"9A"
    )
    port map (
      I0 => U10_iNoBitsReceived(4),
      I1 => N166,
      I2 => U10_iNoBitsReceived(3),
      O => U10_Result_4_1
    );
  U9_Mcount_iNoBitsSent_xor_2_11 : LUT4
    generic map(
      INIT => X"2888"
    )
    port map (
      I0 => N167,
      I1 => U9_iNoBitsSent(2),
      I2 => U9_iNoBitsSent(0),
      I3 => U9_iNoBitsSent(1),
      O => U9_Mcount_iNoBitsSent2
    );
  U10_Result_5_11 : LUT4
    generic map(
      INIT => X"9AAA"
    )
    port map (
      I0 => U10_iNoBitsReceived(5),
      I1 => U10_Result_3_1_bdd0,
      I2 => U10_iNoBitsReceived(4),
      I3 => U10_iNoBitsReceived(3),
      O => U10_Result_5_1
    );
  U9_iSend1_or00001 : LUT3
    generic map(
      INIT => X"F4"
    )
    port map (
      I0 => U9_presState_FSM_FFd2_533,
      I1 => U9_presState_FSM_FFd1_530,
      I2 => Reset_IBUF_89,
      O => U9_iSend1_or0000
    );
  U9_iTxdBuffer_and00001 : LUT4
    generic map(
      INIT => X"3010"
    )
    port map (
      I0 => U9_presState_FSM_FFd2_533,
      I1 => U9_presState_FSM_FFd1_530,
      I2 => U9_iClock1xEnable_466,
      I3 => U9_N0,
      O => U9_iTxdBuffer_and0000
    );
  U10_iEnableDataOut11 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_presState_FSM_FFd2_311,
      I1 => U10_iDataOut1_and0000_bdd2,
      O => U10_iEnableDataOut
    );
  U9_Result_4_Q : LUT4
    generic map(
      INIT => X"9AAA"
    )
    port map (
      I0 => U9_iClockWordCount(4),
      I1 => N86,
      I2 => U9_iClockWordCount(2),
      I3 => U9_iClockWordCount(3),
      O => U9_Result(4)
    );
  U10_iShiftRegister_and000021 : LUT3
    generic map(
      INIT => X"A2"
    )
    port map (
      I0 => U10_iClock1xEnable_243,
      I1 => U10_presState_FSM_FFd2_311,
      I2 => N168,
      O => U10_iShiftRegister_and0000
    );
  U10_iDataOut1_and000011 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => U10_iClock1xEnable_243,
      I1 => U10_presState_FSM_FFd2_311,
      I2 => U10_iDataOut1_and0000_bdd2,
      O => U10_iDataOut1_and0000
    );
  U10_iDataOut1_and00003_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U10_iNoBitsReceived(5),
      I1 => U10_iNoBitsReceived(2),
      I2 => U10_iNoBitsReceived(1),
      I3 => U10_iNoBitsReceived(0),
      O => N90
    );
  U9_iTxdBuffer_mux0000_4_21 : LUT3
    generic map(
      INIT => X"DF"
    )
    port map (
      I0 => U9_presState_FSM_FFd2_533,
      I1 => U9_presState_FSM_FFd1_530,
      I2 => N169,
      O => U9_N7
    );
  U9_iTxdBuffer_mux0000_2_1 : LUT4
    generic map(
      INIT => X"DC50"
    )
    port map (
      I0 => U9_i_DataIn_1_1,
      I1 => U9_iTxdBuffer(3),
      I2 => U9_N7,
      I3 => U9_iEnableShift,
      O => U9_iTxdBuffer_mux0000(2)
    );
  U9_iTxdBuffer_mux0000_7_SW0 : LUT4
    generic map(
      INIT => X"F7AA"
    )
    port map (
      I0 => U9_i_data_out_sel(3),
      I1 => U9_i_data_out_sel(0),
      I2 => U9_i_data_out_sel(1),
      I3 => U9_i_data_out_sel(2),
      O => N92
    );
  U9_iTxdBuffer_mux0000_7_Q : LUT4
    generic map(
      INIT => X"DC50"
    )
    port map (
      I0 => N92,
      I1 => U9_iTxdBuffer(8),
      I2 => U9_N7,
      I3 => U9_iEnableShift,
      O => U9_iTxdBuffer_mux0000(7)
    );
  U9_iTxdBuffer_mux0000_5_11 : LUT4
    generic map(
      INIT => X"FFBF"
    )
    port map (
      I0 => U9_i_data_out_sel(2),
      I1 => i_converted_number_13_Q,
      I2 => i_converted_number_15_Q,
      I3 => i_converted_number_14_Q,
      O => U9_iTxdBuffer_mux0000_5_11_515
    );
  U9_iTxdBuffer_mux0000_5_38 : LUT4
    generic map(
      INIT => X"FFBF"
    )
    port map (
      I0 => U9_i_data_out_sel(1),
      I1 => i_converted_number_11_Q,
      I2 => i_converted_number_9_Q,
      I3 => i_converted_number_10_Q,
      O => U9_iTxdBuffer_mux0000_5_38_516
    );
  U9_iTxdBuffer_mux0000_1_23 : LUT4
    generic map(
      INIT => X"8082"
    )
    port map (
      I0 => U9_i_data_out_sel(0),
      I1 => U9_i_data_out_sel(2),
      I2 => U9_i_data_out_sel(3),
      I3 => U9_i_data_out_sel(1),
      O => U9_iTxdBuffer_mux0000_1_23_507
    );
  U9_iTxdBuffer_mux0000_1_86 : LUT4
    generic map(
      INIT => X"40C0"
    )
    port map (
      I0 => i_converted_number_11_Q,
      I1 => U9_i_data_out_sel(0),
      I2 => U10_iDataOut1(5),
      I3 => i_converted_number_9_Q,
      O => U9_iTxdBuffer_mux0000_1_86_510
    );
  U9_iTxdBuffer_mux0000_1_114 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => U9_iTxdBuffer_mux0000_1_86_510,
      I1 => U9_iTxdBuffer_mux0000_1_107_502,
      I2 => U10_iDataOut1(3),
      I3 => U9_i_data_out_sel(2),
      O => U9_iTxdBuffer_mux0000_1_114_503
    );
  U9_iTxdBuffer_mux0000_1_178 : LUT4
    generic map(
      INIT => X"FF20"
    )
    port map (
      I0 => U9_iTxdBuffer_mux0000_1_114_503,
      I1 => U9_i_data_out_sel(1),
      I2 => U9_i_data_out_sel(3),
      I3 => U9_iTxdBuffer_mux0000_1_170,
      O => U9_iTxdBuffer_mux0000_1_178_506
    );
  iCount9_or000010 : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => iCount9(7),
      I1 => iCount9(1),
      I2 => iCount9(6),
      I3 => iCount9(2),
      O => iCount9_or000010_546
    );
  iCount9_or000019 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => iCount9(5),
      I1 => iCount9(3),
      O => iCount9_or000019_547
    );
  U9_iTxdBuffer_mux0000_4_31 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => U9_presState_FSM_FFd2_533,
      I1 => U9_presState_FSM_FFd1_530,
      I2 => U9_N0,
      O => U9_iEnableShift
    );
  U1_bcd_19_mux00001 : LUT4
    generic map(
      INIT => X"AA82"
    )
    port map (
      I0 => U1_Madd_bcd_19_16_add0000_lut(2),
      I1 => U1_Madd_bcd_15_12_add0002_lut(3),
      I2 => U1_N14,
      I3 => U1_bcd_15_mux0001_141,
      O => i_converted_number_20_Q
    );
  U1_bcd_18_mux00001 : LUT4
    generic map(
      INIT => X"0060"
    )
    port map (
      I0 => U1_N14,
      I1 => U1_Madd_bcd_15_12_add0002_lut(3),
      I2 => U1_Madd_bcd_19_16_add0000_lut(2),
      I3 => U1_bcd_15_mux0001_141,
      O => U9_Mrom_i_huns3
    );
  U1_bcd_17_mux00001 : LUT4
    generic map(
      INIT => X"82AA"
    )
    port map (
      I0 => U1_bcd_15_mux0001_141,
      I1 => U1_N14,
      I2 => U1_Madd_bcd_15_12_add0002_lut(3),
      I3 => U1_Madd_bcd_19_16_add0000_lut(2),
      O => U9_Mrom_i_huns2
    );
  U1_bcd_16_mux00001 : LUT4
    generic map(
      INIT => X"6909"
    )
    port map (
      I0 => U1_N14,
      I1 => U1_Madd_bcd_15_12_add0002_lut(3),
      I2 => U1_Madd_bcd_19_16_add0000_lut(2),
      I3 => U1_bcd_15_mux0001_141,
      O => i_converted_number_17_Q
    );
  U1_bcd_10_mux00051 : LUT3
    generic map(
      INIT => X"62"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0005_lut(2),
      I1 => U1_Madd_bcd_11_8_add0005_cy(1),
      I2 => U1_Madd_bcd_11_8_add0005_lut(3),
      O => U1_Madd_bcd_11_8_add0006_lut(3)
    );
  U1_bcd_14_mux0002 : LUT4
    generic map(
      INIT => X"5098"
    )
    port map (
      I0 => U1_Madd_bcd_15_12_add0002_lut(2),
      I1 => N94,
      I2 => U1_Madd_bcd_15_12_add0002_lut(3),
      I3 => U1_Madd_bcd_15_12_add0002_cy(0),
      O => U1_Madd_bcd_15_12_add0003_lut(3)
    );
  U1_bcd_14_mux0001_SW0 : LUT4
    generic map(
      INIT => X"FF57"
    )
    port map (
      I0 => U10_iDataOut1(14),
      I1 => U10_iDataOut1(13),
      I2 => U10_iDataOut1(12),
      I3 => U1_Madd_bcd_15_12_add0000_cy(0),
      O => N96
    );
  U1_bcd_11_mux00022 : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0002_lut(3),
      I1 => U1_N16,
      O => U1_Madd_bcd_15_12_add0000_cy(0)
    );
  U1_bcd_11_mux00041 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0004_lut(3),
      I1 => U1_Madd_bcd_11_8_add0004_cy(1),
      I2 => U1_Madd_bcd_11_8_add0004_lut(2),
      O => U1_Madd_bcd_15_12_add0002_cy(0)
    );
  U1_bcd_15_mux00032 : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => U1_Madd_bcd_15_12_add0003_lut(3),
      I1 => U1_N15,
      O => i_converted_number_16_Q
    );
  U6_Mrom_seg41 : LUT4
    generic map(
      INIT => X"B2FF"
    )
    port map (
      I0 => i_converted_number_16_Q,
      I1 => U9_Mrom_i_huns3,
      I2 => U9_Mrom_i_huns2,
      I3 => i_converted_number_17_Q,
      O => U6_Mrom_seg4
    );
  U6_Mrom_seg51 : LUT4
    generic map(
      INIT => X"A7D7"
    )
    port map (
      I0 => i_converted_number_17_Q,
      I1 => U9_Mrom_i_huns3,
      I2 => U9_Mrom_i_huns2,
      I3 => i_converted_number_16_Q,
      O => U6_Mrom_seg5
    );
  U6_Mrom_seg11 : LUT4
    generic map(
      INIT => X"569E"
    )
    port map (
      I0 => i_converted_number_17_Q,
      I1 => U9_Mrom_i_huns2,
      I2 => U9_Mrom_i_huns3,
      I3 => i_converted_number_16_Q,
      O => U6_Mrom_seg
    );
  U1_bcd_11_mux00051 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0005_lut(3),
      I1 => U1_Madd_bcd_11_8_add0005_cy(1),
      I2 => U1_Madd_bcd_11_8_add0005_lut(2),
      O => U1_Madd_bcd_15_12_add0003_cy(0)
    );
  U1_bcd_14_mux0003 : LUT4
    generic map(
      INIT => X"6909"
    )
    port map (
      I0 => N101,
      I1 => U1_N111,
      I2 => U1_Madd_bcd_15_12_add0003_cy(1),
      I3 => U1_Madd_bcd_15_12_add0003_lut(3),
      O => i_converted_number_15_Q
    );
  U1_bcd_10_mux00041 : LUT3
    generic map(
      INIT => X"62"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0004_lut(2),
      I1 => U1_Madd_bcd_11_8_add0004_cy(1),
      I2 => U1_Madd_bcd_11_8_add0004_lut(3),
      O => U1_Madd_bcd_11_8_add0005_lut(3)
    );
  U1_bcd_10_mux00031 : LUT3
    generic map(
      INIT => X"62"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0003_lut(2),
      I1 => U1_Madd_bcd_11_8_add0003_cy(1),
      I2 => U1_Madd_bcd_11_8_add0003_lut(3),
      O => U1_Madd_bcd_11_8_add0004_lut(3)
    );
  U1_bcd_10_mux0006 : LUT4
    generic map(
      INIT => X"6909"
    )
    port map (
      I0 => N103,
      I1 => U1_N91,
      I2 => U1_Madd_bcd_11_8_add0006_cy(1),
      I3 => U1_Madd_bcd_11_8_add0006_lut(3),
      O => i_converted_number_11_Q
    );
  U1_bcd_13_mux000321 : LUT3
    generic map(
      INIT => X"F4"
    )
    port map (
      I0 => U1_Madd_bcd_15_12_add0003_lut(3),
      I1 => U1_N15,
      I2 => U1_Madd_bcd_15_12_add0003_cy(0),
      O => U1_N12
    );
  U1_bcd_13_mux000221 : LUT3
    generic map(
      INIT => X"F4"
    )
    port map (
      I0 => U1_Madd_bcd_15_12_add0002_lut(3),
      I1 => U1_N14,
      I2 => U1_Madd_bcd_15_12_add0002_cy(0),
      O => U1_N111
    );
  U1_bcd_11_mux00031 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0003_lut(3),
      I1 => U1_Madd_bcd_11_8_add0003_cy(1),
      I2 => U1_Madd_bcd_11_8_add0003_lut(2),
      O => U1_Madd_bcd_15_12_add0001_cy(0)
    );
  U5_Mrom_seg41 : LUT4
    generic map(
      INIT => X"B2FF"
    )
    port map (
      I0 => i_converted_number_12_Q,
      I1 => i_converted_number_15_Q,
      I2 => i_converted_number_14_Q,
      I3 => i_converted_number_13_Q,
      O => U5_Mrom_seg4
    );
  U1_bcd_15_mux000211 : LUT4
    generic map(
      INIT => X"41FF"
    )
    port map (
      I0 => U1_Madd_bcd_15_12_add0002_cy(0),
      I1 => U1_Madd_bcd_15_12_add0001_cy(0),
      I2 => U1_bcd_15_mux0001_141,
      I3 => U1_Madd_bcd_15_12_add0002_lut(2),
      O => U1_N14
    );
  U5_Mrom_seg21 : LUT4
    generic map(
      INIT => X"5415"
    )
    port map (
      I0 => i_converted_number_12_Q,
      I1 => i_converted_number_15_Q,
      I2 => i_converted_number_13_Q,
      I3 => i_converted_number_14_Q,
      O => U5_Mrom_seg2
    );
  U5_Mrom_seg111 : LUT4
    generic map(
      INIT => X"323B"
    )
    port map (
      I0 => i_converted_number_14_Q,
      I1 => i_converted_number_13_Q,
      I2 => i_converted_number_15_Q,
      I3 => i_converted_number_12_Q,
      O => U5_Mrom_seg1
    );
  U5_Mrom_seg61 : LUT4
    generic map(
      INIT => X"BEBD"
    )
    port map (
      I0 => i_converted_number_14_Q,
      I1 => i_converted_number_13_Q,
      I2 => i_converted_number_15_Q,
      I3 => i_converted_number_12_Q,
      O => U5_Mrom_seg6
    );
  U5_Mrom_seg51 : LUT4
    generic map(
      INIT => X"A7D7"
    )
    port map (
      I0 => i_converted_number_13_Q,
      I1 => i_converted_number_15_Q,
      I2 => i_converted_number_14_Q,
      I3 => i_converted_number_12_Q,
      O => U5_Mrom_seg5
    );
  U5_Mrom_seg11 : LUT4
    generic map(
      INIT => X"569E"
    )
    port map (
      I0 => i_converted_number_13_Q,
      I1 => i_converted_number_14_Q,
      I2 => i_converted_number_15_Q,
      I3 => i_converted_number_12_Q,
      O => U5_Mrom_seg
    );
  U1_bcd_15_mux000311 : LUT4
    generic map(
      INIT => X"96FF"
    )
    port map (
      I0 => U1_N111,
      I1 => U1_bcd_15_mux0001_141,
      I2 => U1_Madd_bcd_15_12_add0001_cy(0),
      I3 => U1_Madd_bcd_15_12_add0003_cy(1),
      O => U1_N15
    );
  U1_bcd_13_mux00031 : LUT4
    generic map(
      INIT => X"4BB4"
    )
    port map (
      I0 => U1_Madd_bcd_15_12_add0002_lut(3),
      I1 => U1_N14,
      I2 => U1_Madd_bcd_15_12_add0002_cy(0),
      I3 => U1_N12,
      O => i_converted_number_14_Q
    );
  U1_bcd_13_mux00011 : LUT4
    generic map(
      INIT => X"4BB4"
    )
    port map (
      I0 => U1_Madd_bcd_15_12_add0001_cy(0),
      I1 => U1_bcd_15_mux0001_141,
      I2 => U1_Madd_bcd_19_16_add0000_lut(2),
      I3 => U1_Madd_bcd_15_12_add0000_cy(0),
      O => U1_Madd_bcd_15_12_add0002_lut(2)
    );
  U5_Mrom_seg31 : LUT4
    generic map(
      INIT => X"5E3D"
    )
    port map (
      I0 => i_converted_number_12_Q,
      I1 => i_converted_number_15_Q,
      I2 => i_converted_number_13_Q,
      I3 => i_converted_number_14_Q,
      O => U5_Mrom_seg3
    );
  U1_bcd_10_cmp_gt00021 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => U1_N16,
      I1 => U1_Madd_bcd_11_8_add0002_lut(3),
      O => U1_bcd_10_cmp_gt0002
    );
  U1_bcd_10_cmp_gt00051 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0005_lut(3),
      I1 => U1_Madd_bcd_11_8_add0005_cy(1),
      I2 => U1_Madd_bcd_11_8_add0005_lut(2),
      O => U1_bcd_10_cmp_gt0005
    );
  U1_bcd_10_cmp_gt00041 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0004_lut(3),
      I1 => U1_Madd_bcd_11_8_add0004_cy(1),
      I2 => U1_Madd_bcd_11_8_add0004_lut(2),
      O => U1_bcd_10_cmp_gt0004
    );
  U1_bcd_10_cmp_gt00031 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0003_lut(3),
      I1 => U1_Madd_bcd_11_8_add0003_cy(1),
      I2 => U1_Madd_bcd_11_8_add0003_lut(2),
      O => U1_bcd_10_cmp_gt0003
    );
  U1_Madd_bcd_11_8_add0000_cy_2_1 : LUT3
    generic map(
      INIT => X"A8"
    )
    port map (
      I0 => U10_iDataOut1(14),
      I1 => U10_iDataOut1(13),
      I2 => U10_iDataOut1(12),
      O => U1_Madd_bcd_11_8_add0000_cy(2)
    );
  U1_Madd_bcd_11_8_add0005_cy_1_11 : LUT3
    generic map(
      INIT => X"F6"
    )
    port map (
      I0 => U10_iDataOut1(8),
      I1 => U1_bcd_10_cmp_gt0004,
      I2 => U10_iDataOut1(7),
      O => U1_Madd_bcd_11_8_add0005_cy(1)
    );
  U1_Madd_bcd_11_8_add0004_cy_1_11 : LUT3
    generic map(
      INIT => X"F6"
    )
    port map (
      I0 => U10_iDataOut1(9),
      I1 => U1_bcd_10_cmp_gt0003,
      I2 => U10_iDataOut1(8),
      O => U1_Madd_bcd_11_8_add0004_cy(1)
    );
  U4_Mrom_seg41 : LUT4
    generic map(
      INIT => X"B2FF"
    )
    port map (
      I0 => i_converted_number_10_Q,
      I1 => i_converted_number_11_Q,
      I2 => U10_iDataOut1(5),
      I3 => i_converted_number_9_Q,
      O => U4_Mrom_seg4
    );
  U1_bcd_11_mux000211 : LUT4
    generic map(
      INIT => X"41FF"
    )
    port map (
      I0 => U10_iDataOut1(10),
      I1 => U10_iDataOut1(11),
      I2 => U1_bcd_11_mux0001,
      I3 => U1_Madd_bcd_11_8_add0002_lut(2),
      O => U1_N16
    );
  U4_Mrom_seg21 : LUT4
    generic map(
      INIT => X"5415"
    )
    port map (
      I0 => U10_iDataOut1(5),
      I1 => i_converted_number_11_Q,
      I2 => i_converted_number_9_Q,
      I3 => i_converted_number_10_Q,
      O => U4_Mrom_seg2
    );
  U4_Mrom_seg111 : LUT4
    generic map(
      INIT => X"323B"
    )
    port map (
      I0 => i_converted_number_10_Q,
      I1 => i_converted_number_9_Q,
      I2 => i_converted_number_11_Q,
      I3 => U10_iDataOut1(5),
      O => U4_Mrom_seg1
    );
  U4_Mrom_seg61 : LUT4
    generic map(
      INIT => X"BEBD"
    )
    port map (
      I0 => i_converted_number_10_Q,
      I1 => i_converted_number_11_Q,
      I2 => i_converted_number_9_Q,
      I3 => U10_iDataOut1(5),
      O => U4_Mrom_seg6
    );
  U4_Mrom_seg51 : LUT4
    generic map(
      INIT => X"A7D7"
    )
    port map (
      I0 => i_converted_number_10_Q,
      I1 => U10_iDataOut1(5),
      I2 => i_converted_number_9_Q,
      I3 => i_converted_number_11_Q,
      O => U4_Mrom_seg5
    );
  U1_bcd_11_mux000611 : LUT4
    generic map(
      INIT => X"96FF"
    )
    port map (
      I0 => U1_N91,
      I1 => U1_bcd_10_cmp_gt0004,
      I2 => U10_iDataOut1(8),
      I3 => U1_Madd_bcd_11_8_add0006_cy(1),
      O => U1_N13
    );
  U4_Mrom_seg11 : LUT4
    generic map(
      INIT => X"569E"
    )
    port map (
      I0 => i_converted_number_9_Q,
      I1 => i_converted_number_10_Q,
      I2 => i_converted_number_11_Q,
      I3 => U10_iDataOut1(5),
      O => U4_Mrom_seg
    );
  U1_bcd_9_mux00041 : LUT4
    generic map(
      INIT => X"4BB4"
    )
    port map (
      I0 => U10_iDataOut1(8),
      I1 => U1_bcd_10_cmp_gt0004,
      I2 => U10_iDataOut1(9),
      I3 => U1_bcd_10_cmp_gt0003,
      O => U1_Madd_bcd_11_8_add0005_lut(2)
    );
  U1_bcd_9_mux00031 : LUT4
    generic map(
      INIT => X"4BB4"
    )
    port map (
      I0 => U10_iDataOut1(9),
      I1 => U1_bcd_10_cmp_gt0003,
      I2 => U10_iDataOut1(10),
      I3 => U1_bcd_10_cmp_gt0002,
      O => U1_Madd_bcd_11_8_add0004_lut(2)
    );
  U1_bcd_9_mux00021 : LUT4
    generic map(
      INIT => X"4BB4"
    )
    port map (
      I0 => U10_iDataOut1(10),
      I1 => U1_bcd_10_cmp_gt0002,
      I2 => U10_iDataOut1(11),
      I3 => U1_bcd_11_mux0001,
      O => U1_Madd_bcd_11_8_add0003_lut(2)
    );
  U4_Mrom_seg31 : LUT4
    generic map(
      INIT => X"5E3D"
    )
    port map (
      I0 => U10_iDataOut1(5),
      I1 => i_converted_number_11_Q,
      I2 => i_converted_number_9_Q,
      I3 => i_converted_number_10_Q,
      O => U4_Mrom_seg3
    );
  Reset_IBUF : IBUF
    port map (
      I => Reset,
      O => Reset_IBUF_89
    );
  MISO_IBUF : IBUF
    port map (
      I => MISO,
      O => MISO_IBUF_28
    );
  Ca_OBUF : OBUF
    port map (
      I => Ca_OBUF_14,
      O => Ca
    );
  Cb_OBUF : OBUF
    port map (
      I => Cb_OBUF_16,
      O => Cb
    );
  Cc_OBUF : OBUF
    port map (
      I => Cc_OBUF_18,
      O => Cc
    );
  Cd_OBUF : OBUF
    port map (
      I => Cd_OBUF_20,
      O => Cd
    );
  Ce_OBUF : OBUF
    port map (
      I => Ce_OBUF_22,
      O => Ce
    );
  Cf_OBUF : OBUF
    port map (
      I => Cf_OBUF_24,
      O => Cf
    );
  Cg_OBUF : OBUF
    port map (
      I => Cg_OBUF_26,
      O => Cg
    );
  CS_OBUF : OBUF
    port map (
      I => U10_CS_144,
      O => CS
    );
  SPI_power_OBUF : OBUF
    port map (
      I => SPI_power_OBUF_101,
      O => SPI_power
    );
  Txd_OBUF : OBUF
    port map (
      I => U9_iTxdBuffer(0),
      O => Txd
    );
  SCLK_OBUF : OBUF
    port map (
      I => U10_iSCLK1,
      O => SCLK
    );
  An_5_OBUF : OBUF
    port map (
      I => An_5_OBUF_11,
      O => An(5)
    );
  An_4_OBUF : OBUF
    port map (
      I => An_4_OBUF_10,
      O => An(4)
    );
  An_3_OBUF : OBUF
    port map (
      I => An_3_OBUF_9,
      O => An(3)
    );
  An_2_OBUF : OBUF
    port map (
      I => An_2_OBUF_8,
      O => An(2)
    );
  An_1_OBUF : OBUF
    port map (
      I => An_1_OBUF_7,
      O => An(1)
    );
  An_0_OBUF : OBUF
    port map (
      I => An_0_OBUF_6,
      O => An(0)
    );
  Mcount_iCount9_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCount9(1),
      O => Mcount_iCount9_cy_1_rt_31
    );
  Mcount_iCount9_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCount9(2),
      O => Mcount_iCount9_cy_2_rt_33
    );
  Mcount_iCount9_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCount9(3),
      O => Mcount_iCount9_cy_3_rt_35
    );
  Mcount_iCount9_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCount9(4),
      O => Mcount_iCount9_cy_4_rt_37
    );
  Mcount_iCount9_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCount9(5),
      O => Mcount_iCount9_cy_5_rt_39
    );
  Mcount_iCount9_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCount9(6),
      O => Mcount_iCount9_cy_6_rt_41
    );
  Mcount_iCount9_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCount9(7),
      O => Mcount_iCount9_cy_7_rt_43
    );
  U8_Mcount_iCount16_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(14),
      O => U8_Mcount_iCount16_cy_14_rt_341
    );
  U8_Mcount_iCount16_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(13),
      O => U8_Mcount_iCount16_cy_13_rt_339
    );
  U8_Mcount_iCount16_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(12),
      O => U8_Mcount_iCount16_cy_12_rt_337
    );
  U8_Mcount_iCount16_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(11),
      O => U8_Mcount_iCount16_cy_11_rt_335
    );
  U8_Mcount_iCount16_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(10),
      O => U8_Mcount_iCount16_cy_10_rt_333
    );
  U8_Mcount_iCount16_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(9),
      O => U8_Mcount_iCount16_cy_9_rt_359
    );
  U8_Mcount_iCount16_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(8),
      O => U8_Mcount_iCount16_cy_8_rt_357
    );
  U8_Mcount_iCount16_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(7),
      O => U8_Mcount_iCount16_cy_7_rt_355
    );
  U8_Mcount_iCount16_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(6),
      O => U8_Mcount_iCount16_cy_6_rt_353
    );
  U8_Mcount_iCount16_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(5),
      O => U8_Mcount_iCount16_cy_5_rt_351
    );
  U8_Mcount_iCount16_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(4),
      O => U8_Mcount_iCount16_cy_4_rt_349
    );
  U8_Mcount_iCount16_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(3),
      O => U8_Mcount_iCount16_cy_3_rt_347
    );
  U8_Mcount_iCount16_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(2),
      O => U8_Mcount_iCount16_cy_2_rt_345
    );
  U8_Mcount_iCount16_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(1),
      O => U8_Mcount_iCount16_cy_1_rt_343
    );
  U10_Mcount_iClockDiv_cy_22_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(22),
      O => U10_Mcount_iClockDiv_cy_22_rt_192
    );
  U10_Mcount_iClockDiv_cy_21_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(21),
      O => U10_Mcount_iClockDiv_cy_21_rt_190
    );
  U10_Mcount_iClockDiv_cy_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(20),
      O => U10_Mcount_iClockDiv_cy_20_rt_188
    );
  U10_Mcount_iClockDiv_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(19),
      O => U10_Mcount_iClockDiv_cy_19_rt_184
    );
  U10_Mcount_iClockDiv_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(18),
      O => U10_Mcount_iClockDiv_cy_18_rt_182
    );
  U10_Mcount_iClockDiv_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(17),
      O => U10_Mcount_iClockDiv_cy_17_rt_180
    );
  U10_Mcount_iClockDiv_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(16),
      O => U10_Mcount_iClockDiv_cy_16_rt_178
    );
  U10_Mcount_iClockDiv_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(15),
      O => U10_Mcount_iClockDiv_cy_15_rt_176
    );
  U10_Mcount_iClockDiv_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(14),
      O => U10_Mcount_iClockDiv_cy_14_rt_174
    );
  U10_Mcount_iClockDiv_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(13),
      O => U10_Mcount_iClockDiv_cy_13_rt_172
    );
  U10_Mcount_iClockDiv_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(12),
      O => U10_Mcount_iClockDiv_cy_12_rt_170
    );
  U10_Mcount_iClockDiv_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(11),
      O => U10_Mcount_iClockDiv_cy_11_rt_168
    );
  U10_Mcount_iClockDiv_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(10),
      O => U10_Mcount_iClockDiv_cy_10_rt_166
    );
  U10_Mcount_iClockDiv_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(9),
      O => U10_Mcount_iClockDiv_cy_9_rt_208
    );
  U10_Mcount_iClockDiv_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(8),
      O => U10_Mcount_iClockDiv_cy_8_rt_206
    );
  U10_Mcount_iClockDiv_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(7),
      O => U10_Mcount_iClockDiv_cy_7_rt_204
    );
  U10_Mcount_iClockDiv_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(6),
      O => U10_Mcount_iClockDiv_cy_6_rt_202
    );
  U10_Mcount_iClockDiv_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(5),
      O => U10_Mcount_iClockDiv_cy_5_rt_200
    );
  U10_Mcount_iClockDiv_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(4),
      O => U10_Mcount_iClockDiv_cy_4_rt_198
    );
  U10_Mcount_iClockDiv_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(3),
      O => U10_Mcount_iClockDiv_cy_3_rt_196
    );
  U10_Mcount_iClockDiv_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(2),
      O => U10_Mcount_iClockDiv_cy_2_rt_194
    );
  U10_Mcount_iClockDiv_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(1),
      O => U10_Mcount_iClockDiv_cy_1_rt_186
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(23),
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_9_rt_157
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(10),
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_4_rt_152
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(8),
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_2_rt_149
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_0_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(5),
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_cy_0_rt_146
    );
  Mcount_iCount9_xor_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCount9(8),
      O => Mcount_iCount9_xor_8_rt_45
    );
  U8_Mcount_iCount16_xor_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U8_iCount16(15),
      O => U8_Mcount_iCount16_xor_15_rt_361
    );
  U10_Mcount_iClockDiv_xor_23_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iClockDiv(23),
      O => U10_Mcount_iClockDiv_xor_23_rt_210
    );
  U8_Mmux_iDigitOut_3_f5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U10_iDataOut1(3),
      O => U8_Mmux_iDigitOut_3_f5_rt_370
    );
  U9_iTxdBuffer_mux0000_1_205_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => U9_iTxdBuffer_mux0000_1_52_509,
      I1 => U9_iTxdBuffer_mux0000_1_23_507,
      I2 => U9_iTxdBuffer_mux0000_1_178_506,
      O => N110
    );
  U9_iTxdBuffer_mux0000_1_218 : LUT4
    generic map(
      INIT => X"ECA0"
    )
    port map (
      I0 => N110,
      I1 => U9_iTxdBuffer(2),
      I2 => U9_N7,
      I3 => U9_iEnableShift,
      O => U9_iTxdBuffer_mux0000(1)
    );
  iCount9_or000039 : LUT4
    generic map(
      INIT => X"EAAA"
    )
    port map (
      I0 => Reset_IBUF_89,
      I1 => iCount9_or000010_546,
      I2 => iCount9_or000019_547,
      I3 => N112,
      O => iCount9_or0000
    );
  U9_iTxdBuffer_mux0000_4_35 : LUT4
    generic map(
      INIT => X"ECA0"
    )
    port map (
      I0 => N114,
      I1 => U9_iTxdBuffer(5),
      I2 => U9_N7,
      I3 => U9_iEnableShift,
      O => U9_iTxdBuffer_mux0000(4)
    );
  U9_iTxdBuffer_mux0000_3_73 : LUT4
    generic map(
      INIT => X"ECA0"
    )
    port map (
      I0 => N116,
      I1 => U9_iTxdBuffer(4),
      I2 => U9_N7,
      I3 => U9_iEnableShift,
      O => U9_iTxdBuffer_mux0000(3)
    );
  U9_iTxdBuffer_mux0000_5_172 : LUT4
    generic map(
      INIT => X"ECA0"
    )
    port map (
      I0 => N118,
      I1 => U9_iTxdBuffer(6),
      I2 => U9_N7,
      I3 => U9_iEnableShift,
      O => U9_iTxdBuffer_mux0000(5)
    );
  U9_iTxdBuffer_mux0000_0_1 : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => U9_N0,
      I1 => U9_presState_FSM_FFd1_530,
      I2 => U9_presState_FSM_FFd2_533,
      I3 => U9_iTxdBuffer(1),
      O => U9_iTxdBuffer_mux0000(0)
    );
  U9_presState_FSM_FFd1_In35 : LUT4
    generic map(
      INIT => X"C404"
    )
    port map (
      I0 => U9_N0,
      I1 => U9_presState_FSM_FFd2_533,
      I2 => U9_presState_FSM_FFd1_530,
      I3 => N120,
      O => U9_presState_FSM_FFd1_In
    );
  U9_iTxdBuffer_mux0000_6_75 : LUT4
    generic map(
      INIT => X"CEC4"
    )
    port map (
      I0 => U9_N0,
      I1 => U9_iTxdBuffer_mux0000_6_47,
      I2 => N122,
      I3 => U9_iTxdBuffer(7),
      O => U9_iTxdBuffer_mux0000(6)
    );
  U8_Mmux_iDigitOut_6 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => U10_iDataOut1(3),
      I1 => U8_iCount16(13),
      I2 => U10_iDataOut1(4),
      O => U8_Mmux_iDigitOut_6_392
    );
  U8_Mmux_iDigitOut_63 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U10_iDataOut1(4),
      I2 => U10_iDataOut1(3),
      O => U8_Mmux_iDigitOut_63_395
    );
  U8_Mmux_iDigitOut_64 : LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U10_iDataOut1(3),
      I2 => U10_iDataOut1(4),
      O => U8_Mmux_iDigitOut_64_396
    );
  U8_Mmux_iDigitOut_65 : LUT3
    generic map(
      INIT => X"9D"
    )
    port map (
      I0 => U10_iDataOut1(3),
      I1 => U8_iCount16(13),
      I2 => U10_iDataOut1(4),
      O => U8_Mmux_iDigitOut_65_397
    );
  U8_Mmux_iDigitOut_62 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U10_iDataOut1(3),
      I2 => U10_iDataOut1(4),
      O => U8_Mmux_iDigitOut_62_394
    );
  U9_Mmux_i_DataIn_7 : LUT3
    generic map(
      INIT => X"8A"
    )
    port map (
      I0 => U9_i_data_out_sel(0),
      I1 => U10_iDataOut1(4),
      I2 => U10_iDataOut1(3),
      O => U9_Mmux_i_DataIn_7_441
    );
  U9_Mmux_i_DataIn_3 : LUT4
    generic map(
      INIT => X"D782"
    )
    port map (
      I0 => U9_i_data_out_sel(2),
      I1 => U9_i_data_out_sel(0),
      I2 => U9_i_data_out_sel(1),
      I3 => U9_Mmux_i_DataIn_6_f5_440,
      O => U9_Mmux_i_DataIn_3_438
    );
  U9_Mmux_i_DataIn_10 : LUT3
    generic map(
      INIT => X"5D"
    )
    port map (
      I0 => U9_i_data_out_sel(0),
      I1 => U10_iDataOut1(4),
      I2 => U10_iDataOut1(3),
      O => U9_Mmux_i_DataIn_10_434
    );
  U9_Mcount_iNoBitsSent_xor_0_11 : LUT4
    generic map(
      INIT => X"3331"
    )
    port map (
      I0 => U9_iClock1xEnable_466,
      I1 => U9_iNoBitsSent(0),
      I2 => U9_presState_FSM_FFd2_533,
      I3 => U9_presState_FSM_FFd1_530,
      O => U9_Mcount_iNoBitsSent
    );
  U9_iEnableTxdBuffer1 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => U9_presState_FSM_FFd1_530,
      I1 => U9_presState_FSM_FFd2_533,
      I2 => U9_iClock1xEnable_466,
      O => U9_iEnableTxdBuffer
    );
  U10_Result_3_12 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => U10_iNoBitsReceived(3),
      I1 => U10_iNoBitsReceived(2),
      I2 => U10_iNoBitsReceived(1),
      I3 => U10_iNoBitsReceived(0),
      O => U10_Result_3_1
    );
  U9_iNoBitsSent_not00011 : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => U9_presState_FSM_FFd1_530,
      I1 => U9_presState_FSM_FFd2_533,
      I2 => U9_N0,
      I3 => U9_iClock1xEnable_466,
      O => U9_iNoBitsSent_not0001
    );
  U9_iClockDiv_and00001 : LUT4
    generic map(
      INIT => X"0F02"
    )
    port map (
      I0 => U9_presState_FSM_FFd1_530,
      I1 => U9_presState_FSM_FFd2_533,
      I2 => U9_iClock1xEnable_466,
      I3 => Reset_IBUF_89,
      O => U9_iClockDiv_and0000
    );
  U9_Mcount_iNoBitsSent_xor_3_1_SW1 : LUT4
    generic map(
      INIT => X"9555"
    )
    port map (
      I0 => U9_iNoBitsSent(3),
      I1 => U9_iNoBitsSent(0),
      I2 => U9_iNoBitsSent(1),
      I3 => U9_iNoBitsSent(2),
      O => N130
    );
  U9_Mcount_iNoBitsSent_xor_3_1 : LUT4
    generic map(
      INIT => X"3331"
    )
    port map (
      I0 => U9_iClock1xEnable_466,
      I1 => N130,
      I2 => U9_presState_FSM_FFd1_530,
      I3 => U9_presState_FSM_FFd2_533,
      O => U9_Mcount_iNoBitsSent3
    );
  U1_bcd_12_mux00031 : LUT3
    generic map(
      INIT => X"39"
    )
    port map (
      I0 => U1_N15,
      I1 => U1_Madd_bcd_15_12_add0003_cy(0),
      I2 => U1_Madd_bcd_15_12_add0003_lut(3),
      O => i_converted_number_13_Q
    );
  U1_Madd_bcd_15_12_add0003_cy_1_1_SW1 : LUT3
    generic map(
      INIT => X"39"
    )
    port map (
      I0 => U1_N14,
      I1 => U1_Madd_bcd_15_12_add0002_cy(0),
      I2 => U1_Madd_bcd_15_12_add0002_lut(3),
      O => N132
    );
  U1_Madd_bcd_15_12_add0003_cy_1_1 : LUT4
    generic map(
      INIT => X"FF6A"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0005_lut(3),
      I1 => U1_Madd_bcd_11_8_add0005_cy(1),
      I2 => U1_Madd_bcd_11_8_add0005_lut(2),
      I3 => N132,
      O => U1_Madd_bcd_15_12_add0003_cy(1)
    );
  U1_bcd_8_mux00061 : LUT3
    generic map(
      INIT => X"39"
    )
    port map (
      I0 => U1_N13,
      I1 => U10_iDataOut1(6),
      I2 => U1_Madd_bcd_11_8_add0006_lut(3),
      O => i_converted_number_9_Q
    );
  U1_Madd_bcd_11_8_add0006_cy_1_11 : LUT3
    generic map(
      INIT => X"F6"
    )
    port map (
      I0 => U10_iDataOut1(7),
      I1 => U1_bcd_10_cmp_gt0005,
      I2 => U10_iDataOut1(6),
      O => U1_Madd_bcd_11_8_add0006_cy(1)
    );
  U8_Mmux_iDigitOut_61 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => U10_iDataOut1(3),
      O => U8_Mmux_iDigitOut_61_393
    );
  U1_Madd_bcd_15_12_add0001_cy_1_11 : LUT4
    generic map(
      INIT => X"BEBA"
    )
    port map (
      I0 => U1_Madd_bcd_15_12_add0001_cy(0),
      I1 => U1_Madd_bcd_11_8_add0000_cy(2),
      I2 => U1_Madd_bcd_15_12_add0000_cy(0),
      I3 => U1_bcd_11_mux0001,
      O => U1_Madd_bcd_15_12_add0001_cy(1)
    );
  U8_Mmux_iDigitOut_52_SW0 : LUT4
    generic map(
      INIT => X"ABA2"
    )
    port map (
      I0 => i_converted_number_17_Q,
      I1 => U9_Mrom_i_huns2,
      I2 => U9_Mrom_i_huns3,
      I3 => i_converted_number_16_Q,
      O => N134
    );
  U8_Mmux_iDigitOut_52 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => N134,
      I2 => i_converted_number_20_Q,
      O => U8_Mmux_iDigitOut_52_384
    );
  U8_Mmux_iDigitOut_54 : LUT4
    generic map(
      INIT => X"2227"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => i_converted_number_20_Q,
      I2 => i_converted_number_16_Q,
      I3 => N136,
      O => U8_Mmux_iDigitOut_54_386
    );
  U8_Mmux_iDigitOut_56_SW0 : LUT4
    generic map(
      INIT => X"C918"
    )
    port map (
      I0 => U9_Mrom_i_huns3,
      I1 => i_converted_number_17_Q,
      I2 => U9_Mrom_i_huns2,
      I3 => i_converted_number_16_Q,
      O => N138
    );
  U8_Mmux_iDigitOut_56 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => N138,
      I2 => i_converted_number_20_Q,
      O => U8_Mmux_iDigitOut_56_388
    );
  U8_Mmux_iDigitOut_512_SW0 : LUT4
    generic map(
      INIT => X"2124"
    )
    port map (
      I0 => i_converted_number_17_Q,
      I1 => U9_Mrom_i_huns2,
      I2 => U9_Mrom_i_huns3,
      I3 => i_converted_number_16_Q,
      O => N140
    );
  U8_Mmux_iDigitOut_512 : LUT3
    generic map(
      INIT => X"1B"
    )
    port map (
      I0 => U8_iCount16(13),
      I1 => N140,
      I2 => i_converted_number_20_Q,
      O => U8_Mmux_iDigitOut_512_382
    );
  U9_iTxdBuffer_mux0000_1_52_SW0 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => U9_i_data_out_sel(3),
      I1 => U10_iDataOut1(4),
      I2 => U10_iDataOut1(3),
      O => N142
    );
  U9_iTxdBuffer_mux0000_1_52 : LUT4
    generic map(
      INIT => X"C080"
    )
    port map (
      I0 => U9_iTxdBuffer_mux0000_1_34_508,
      I1 => U9_i_data_out_sel(1),
      I2 => U9_i_data_out_sel(0),
      I3 => N142,
      O => U9_iTxdBuffer_mux0000_1_52_509
    );
  U9_iTxdBuffer_mux0000_1_107_SW0 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => U9_i_data_out_sel(0),
      I1 => i_converted_number_13_Q,
      I2 => i_converted_number_15_Q,
      O => N144
    );
  U9_iTxdBuffer_mux0000_1_107 : LUT4
    generic map(
      INIT => X"0009"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0006_lut(3),
      I1 => U1_N13,
      I2 => U9_i_data_out_sel(2),
      I3 => N144,
      O => U9_iTxdBuffer_mux0000_1_107_502
    );
  U1_bcd_14_mux0002_SW0 : LUT4
    generic map(
      INIT => X"6999"
    )
    port map (
      I0 => U1_bcd_15_mux0001_141,
      I1 => U1_Madd_bcd_11_8_add0003_lut(3),
      I2 => U1_Madd_bcd_11_8_add0003_cy(1),
      I3 => U1_Madd_bcd_11_8_add0003_lut(2),
      O => N94
    );
  U1_bcd_14_mux0003_SW0 : LUT4
    generic map(
      INIT => X"9666"
    )
    port map (
      I0 => U1_bcd_15_mux0001_141,
      I1 => U1_Madd_bcd_11_8_add0003_lut(3),
      I2 => U1_Madd_bcd_11_8_add0003_cy(1),
      I3 => U1_Madd_bcd_11_8_add0003_lut(2),
      O => N101
    );
  U1_bcd_10_mux0006_SW0 : LUT4
    generic map(
      INIT => X"1E5A"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0004_lut(3),
      I1 => U1_Madd_bcd_11_8_add0004_lut(2),
      I2 => U10_iDataOut1(8),
      I3 => U1_Madd_bcd_11_8_add0004_cy(1),
      O => N103
    );
  U1_Madd_bcd_11_8_add0003_cy_1_11 : LUT4
    generic map(
      INIT => X"BBEB"
    )
    port map (
      I0 => U10_iDataOut1(9),
      I1 => U10_iDataOut1(10),
      I2 => U1_N16,
      I3 => U1_Madd_bcd_11_8_add0002_lut(3),
      O => U1_Madd_bcd_11_8_add0003_cy(1)
    );
  U9_iTxdBuffer_mux0000_3_34_SW0 : LUT3
    generic map(
      INIT => X"67"
    )
    port map (
      I0 => U9_i_data_out_sel(0),
      I1 => U9_i_data_out_sel(1),
      I2 => U10_iDataOut1(3),
      O => N128
    );
  U8_Mmux_iDigitOut_54_SW0 : LUT4
    generic map(
      INIT => X"9600"
    )
    port map (
      I0 => U1_Madd_bcd_15_12_add0002_lut(3),
      I1 => U1_N14,
      I2 => U1_Madd_bcd_19_16_add0000_lut(2),
      I3 => U1_bcd_15_mux0001_141,
      O => N136
    );
  U1_bcd_10_mux00011 : LUT4
    generic map(
      INIT => X"1804"
    )
    port map (
      I0 => U10_iDataOut1(12),
      I1 => U10_iDataOut1(13),
      I2 => U10_iDataOut1(11),
      I3 => U10_iDataOut1(14),
      O => U1_Madd_bcd_11_8_add0002_lut(3)
    );
  U1_bcd_11_mux00011 : LUT4
    generic map(
      INIT => X"9C18"
    )
    port map (
      I0 => U10_iDataOut1(12),
      I1 => U10_iDataOut1(13),
      I2 => U10_iDataOut1(14),
      I3 => U10_iDataOut1(11),
      O => U1_bcd_11_mux0001
    );
  U1_Madd_bcd_19_16_add0000_lut_2_1 : LUT4
    generic map(
      INIT => X"AA82"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0000_cy(2),
      I1 => U1_Madd_bcd_11_8_add0002_lut(3),
      I2 => U1_N16,
      I3 => U1_bcd_11_mux0001,
      O => U1_Madd_bcd_19_16_add0000_lut(2)
    );
  U1_bcd_11_mux00062 : LUT4
    generic map(
      INIT => X"692D"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0005_lut(2),
      I1 => U1_Madd_bcd_11_8_add0005_cy(1),
      I2 => U1_N13,
      I3 => U1_Madd_bcd_11_8_add0005_lut(3),
      O => i_converted_number_12_Q
    );
  U1_bcd_9_mux000521 : LUT4
    generic map(
      INIT => X"F1F5"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0005_lut(3),
      I1 => U1_Madd_bcd_11_8_add0005_cy(1),
      I2 => U10_iDataOut1(7),
      I3 => U1_Madd_bcd_11_8_add0005_lut(2),
      O => U1_N91
    );
  U9_iTxdBuffer_mux0000_1_34 : LUT3
    generic map(
      INIT => X"82"
    )
    port map (
      I0 => U9_i_data_out_sel(2),
      I1 => U1_Madd_bcd_15_12_add0003_lut(3),
      I2 => U1_N15,
      O => U9_iTxdBuffer_mux0000_1_34_508
    );
  U1_bcd_9_mux00011 : LUT4
    generic map(
      INIT => X"6426"
    )
    port map (
      I0 => U10_iDataOut1(14),
      I1 => U10_iDataOut1(12),
      I2 => U10_iDataOut1(13),
      I3 => U10_iDataOut1(11),
      O => U1_Madd_bcd_11_8_add0002_lut(2)
    );
  U9_i_data_out_sel_1_1_SW0 : LUT4
    generic map(
      INIT => X"96F6"
    )
    port map (
      I0 => U1_Madd_bcd_15_12_add0002_lut(3),
      I1 => U1_N14,
      I2 => U1_Madd_bcd_19_16_add0000_lut(2),
      I3 => U1_bcd_15_mux0001_141,
      O => N150
    );
  U1_bcd_14_mux0001_SW1 : LUT4
    generic map(
      INIT => X"F11F"
    )
    port map (
      I0 => U10_iDataOut1(12),
      I1 => U10_iDataOut1(13),
      I2 => U1_Madd_bcd_11_8_add0002_lut(3),
      I3 => U1_N16,
      O => N152
    );
  U1_bcd_14_mux0001 : LUT4
    generic map(
      INIT => X"180C"
    )
    port map (
      I0 => N152,
      I1 => U1_bcd_11_mux0001,
      I2 => U1_Madd_bcd_15_12_add0001_cy(1),
      I3 => U10_iDataOut1(14),
      O => U1_Madd_bcd_15_12_add0002_lut(3)
    );
  U9_Mmux_i_DataIn_4 : LUT4
    generic map(
      INIT => X"DAFF"
    )
    port map (
      I0 => U9_i_data_out_sel(0),
      I1 => N150,
      I2 => U9_i_data_out_sel(1),
      I3 => U9_i_data_out_sel(2),
      O => U9_Mmux_i_DataIn_4_439
    );
  U9_iTxdBuffer_mux0000_3_59_SW0 : MUXF5
    port map (
      I0 => N154,
      I1 => N155,
      S => U9_i_data_out_sel(3),
      O => N116
    );
  U9_iTxdBuffer_mux0000_3_59_SW0_F : LUT4
    generic map(
      INIT => X"91BB"
    )
    port map (
      I0 => U9_i_data_out_sel(0),
      I1 => U9_i_data_out_sel(2),
      I2 => U9_Mrom_i_huns2,
      I3 => U9_i_data_out_sel(1),
      O => N154
    );
  U9_iTxdBuffer_mux0000_3_59_SW0_G : LUT3
    generic map(
      INIT => X"72"
    )
    port map (
      I0 => U9_i_data_out_sel(2),
      I1 => N128,
      I2 => U9_Mmux_i_DataIn_9_f5_443,
      O => N155
    );
  U9_iTxdBuffer_mux0000_4_26_SW0 : MUXF5
    port map (
      I0 => N156,
      I1 => N157,
      S => U9_i_data_out_sel(2),
      O => N114
    );
  U9_iTxdBuffer_mux0000_4_26_SW0_F : LUT4
    generic map(
      INIT => X"AE04"
    )
    port map (
      I0 => U9_i_data_out_sel(3),
      I1 => U9_i_data_out_sel(1),
      I2 => U9_i_data_out_sel(0),
      I3 => U9_Mmux_i_DataIn_9_f51,
      O => N156
    );
  U9_iTxdBuffer_mux0000_4_26_SW0_G : LUT4
    generic map(
      INIT => X"EA55"
    )
    port map (
      I0 => U9_i_data_out_sel(3),
      I1 => U9_Mrom_i_huns3,
      I2 => U9_i_data_out_sel(0),
      I3 => U9_i_data_out_sel(1),
      O => N157
    );
  U9_Mmux_i_DataIn_9_f5_0 : MUXF5
    port map (
      I0 => N158,
      I1 => N159,
      S => U9_i_data_out_sel(0),
      O => U9_Mmux_i_DataIn_9_f51
    );
  U9_Mmux_i_DataIn_9_f5_0_F : LUT4
    generic map(
      INIT => X"AAAE"
    )
    port map (
      I0 => U9_i_data_out_sel(1),
      I1 => i_converted_number_15_Q,
      I2 => i_converted_number_14_Q,
      I3 => i_converted_number_13_Q,
      O => N158
    );
  U9_Mmux_i_DataIn_9_f5_0_G : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => i_converted_number_11_Q,
      I1 => U9_i_data_out_sel(1),
      I2 => i_converted_number_10_Q,
      I3 => i_converted_number_9_Q,
      O => N159
    );
  U1_bcd_15_mux0001 : MUXF5
    port map (
      I0 => N160,
      I1 => N161,
      S => U1_bcd_11_mux0001,
      O => U1_bcd_15_mux0001_141
    );
  U1_bcd_15_mux0001_F : LUT3
    generic map(
      INIT => X"28"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0000_cy(2),
      I1 => U1_Madd_bcd_11_8_add0002_lut(3),
      I2 => U1_N16,
      O => N160
    );
  U1_bcd_15_mux0001_G : LUT4
    generic map(
      INIT => X"F060"
    )
    port map (
      I0 => U1_Madd_bcd_11_8_add0000_cy(2),
      I1 => U1_Madd_bcd_15_12_add0000_cy(0),
      I2 => N96,
      I3 => U1_Madd_bcd_15_12_add0001_cy(0),
      O => N161
    );
  U9_iTxdBuffer_mux0000_5_156_SW0 : MUXF5
    port map (
      I0 => N162,
      I1 => N163,
      S => U9_i_data_out_sel(0),
      O => N118
    );
  U9_iTxdBuffer_mux0000_5_156_SW0_F : LUT4
    generic map(
      INIT => X"7531"
    )
    port map (
      I0 => U9_i_data_out_sel(1),
      I1 => U9_i_data_out_sel(3),
      I2 => U9_i_data_out_sel(2),
      I3 => U9_iTxdBuffer_mux0000_5_11_515,
      O => N162
    );
  U9_iTxdBuffer_mux0000_5_156_SW0_G : LUT4
    generic map(
      INIT => X"7520"
    )
    port map (
      I0 => U9_i_data_out_sel(3),
      I1 => U9_i_data_out_sel(2),
      I2 => U9_iTxdBuffer_mux0000_5_38_516,
      I3 => U9_i_data_out_sel(1),
      O => N163
    );
  U1_bcd_10_mux0002 : MUXF5
    port map (
      I0 => N164,
      I1 => N165,
      S => U10_iDataOut1(13),
      O => U1_Madd_bcd_11_8_add0003_lut(3)
    );
  U1_bcd_10_mux0002_F : LUT4
    generic map(
      INIT => X"2004"
    )
    port map (
      I0 => U10_iDataOut1(14),
      I1 => U10_iDataOut1(12),
      I2 => U10_iDataOut1(11),
      I3 => U10_iDataOut1(10),
      O => N164
    );
  U1_bcd_10_mux0002_G : LUT4
    generic map(
      INIT => X"0942"
    )
    port map (
      I0 => U10_iDataOut1(14),
      I1 => U10_iDataOut1(12),
      I2 => U10_iDataOut1(11),
      I3 => U10_iDataOut1(10),
      O => N165
    );
  SystemClock_BUFGP : BUFGP
    port map (
      I => SystemClock,
      O => SystemClock_BUFGP_103
    );
  U10_iSCLK_BUFG : BUFG
    port map (
      I => U10_iSCLK1,
      O => U10_iSCLK_292
    );
  U9_iClockDiv_3_BUFG : BUFG
    port map (
      I => U9_iClockDiv_31,
      O => U9_iClockDiv(3)
    );
  Mcount_iCount9_lut_0_INV_0 : INV
    port map (
      I => iCount9(0),
      O => Mcount_iCount9_lut(0)
    );
  U8_Mcount_iCount16_lut_0_INV_0 : INV
    port map (
      I => U8_iCount16(0),
      O => U8_Mcount_iCount16_lut(0)
    );
  U10_Mcount_iClockDiv_lut_0_INV_0 : INV
    port map (
      I => U10_iClockDiv(0),
      O => U10_Mcount_iClockDiv_lut(0)
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_7_INV_0 : INV
    port map (
      I => U10_iClockDiv(18),
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_7_Q
    );
  U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_3_INV_0 : INV
    port map (
      I => U10_iClockDiv(9),
      O => U10_Mcompar_iClock1xEnable_cmp_ge0000_lut_3_Q
    );
  U9_iClock1xEnable_inv1_INV_0 : INV
    port map (
      I => U9_iClock1xEnable_466,
      O => U9_iClock1xEnable_inv
    );
  U10_iSCLK_inv1_INV_0 : INV
    port map (
      I => U10_iSCLK_292,
      O => U10_iSCLK_inv
    );
  U10_iClock1xEnable_inv1_INV_0 : INV
    port map (
      I => U10_iClock1xEnable_243,
      O => U10_iClock1xEnable_inv
    );
  U9_presState_FSM_FFd2_In1_INV_0 : INV
    port map (
      I => U9_presState_FSM_FFd1_530,
      O => U9_presState_FSM_FFd2_In
    );
  U9_Mcount_iClockWordCount_xor_0_11_INV_0 : INV
    port map (
      I => U9_iClockWordCount(0),
      O => U9_Result_0_1
    );
  U9_Mcount_iClockDiv_xor_0_11_INV_0 : INV
    port map (
      I => U9_iClockDiv(0),
      O => U9_Result(0)
    );
  U10_Mcount_iNoBitsReceived_xor_0_11_INV_0 : INV
    port map (
      I => U10_iNoBitsReceived(0),
      O => U10_Result_0_1
    );
  U9_Madd_i_data_out_sel_add0000_xor_0_11_INV_0 : INV
    port map (
      I => U9_i_data_out_sel(0),
      O => U9_Mmux_i_DataIn_101
    );
  U3_Mrom_seg111_INV_0 : INV
    port map (
      I => U10_iDataOut1(3),
      O => U2_Mrom_seg2
    );
  U8_Mmux_iDigitOut_3_f5_11_INV_0 : INV
    port map (
      I => U10_iDataOut1(3),
      O => U8_Mmux_iDigitOut_3_f5_1_369
    );
  U9_iTxdBuffer_mux0000_1_1701 : LUT4
    generic map(
      INIT => X"3010"
    )
    port map (
      I0 => U9_i_data_out_sel(2),
      I1 => U9_i_data_out_sel(0),
      I2 => U9_i_data_out_sel(1),
      I3 => i_converted_number_20_Q,
      O => U9_iTxdBuffer_mux0000_1_1701_505
    );
  U9_iTxdBuffer_mux0000_1_170_f5 : MUXF5
    port map (
      I0 => U9_iTxdBuffer_mux0000_1_1701_505,
      I1 => N0,
      S => U9_i_data_out_sel(3),
      O => U9_iTxdBuffer_mux0000_1_170
    );
  U1_bcd_9_mux000611 : LUT4
    generic map(
      INIT => X"6566"
    )
    port map (
      I0 => U1_bcd_10_cmp_gt0005,
      I1 => U10_iDataOut1(6),
      I2 => U1_Madd_bcd_11_8_add0006_lut(3),
      I3 => U1_N13,
      O => U1_bcd_9_mux00061
    );
  U1_bcd_9_mux000612 : LUT4
    generic map(
      INIT => X"9A99"
    )
    port map (
      I0 => U1_bcd_10_cmp_gt0005,
      I1 => U10_iDataOut1(6),
      I2 => U1_Madd_bcd_11_8_add0006_lut(3),
      I3 => U1_N13,
      O => U1_bcd_9_mux000611_143
    );
  U1_bcd_9_mux00061_f5 : MUXF5
    port map (
      I0 => U1_bcd_9_mux000611_143,
      I1 => U1_bcd_9_mux00061,
      S => U10_iDataOut1(7),
      O => i_converted_number_10_Q
    );
  U9_presState_FSM_FFd1_In28_SW01 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => U9_iClockWordCount(3),
      I1 => U9_iClockWordCount(2),
      I2 => U9_iClockWordCount(1),
      I3 => U9_iClockWordCount(0),
      O => U9_presState_FSM_FFd1_In28_SW0
    );
  U9_presState_FSM_FFd1_In28_SW0_f5 : MUXF5
    port map (
      I0 => N0,
      I1 => U9_presState_FSM_FFd1_In28_SW0,
      S => U9_iClockWordCount(4),
      O => N120
    );
  U9_iTxdBuffer_mux0000_6_471 : LUT4
    generic map(
      INIT => X"3732"
    )
    port map (
      I0 => U9_i_data_out_sel(1),
      I1 => U9_i_data_out_sel(3),
      I2 => U9_i_data_out_sel(0),
      I3 => U9_i_data_out_sel(2),
      O => U9_iTxdBuffer_mux0000_6_471_519
    );
  U9_iTxdBuffer_mux0000_6_472 : LUT4
    generic map(
      INIT => X"57FE"
    )
    port map (
      I0 => U9_i_data_out_sel(2),
      I1 => U9_i_data_out_sel(1),
      I2 => U9_i_data_out_sel(0),
      I3 => U9_i_data_out_sel(3),
      O => U9_iTxdBuffer_mux0000_6_472_520
    );
  U9_iTxdBuffer_mux0000_6_47_f5 : MUXF5
    port map (
      I0 => U9_iTxdBuffer_mux0000_6_472_520,
      I1 => U9_iTxdBuffer_mux0000_6_471_519,
      S => U9_Mmux_i_DataIn_9_f52,
      O => U9_iTxdBuffer_mux0000_6_47
    );
  U10_Result_3_111 : LUT3_D
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => U10_iNoBitsReceived(2),
      I1 => U10_iNoBitsReceived(1),
      I2 => U10_iNoBitsReceived(0),
      LO => N166,
      O => U10_Result_3_1_bdd0
    );
  U9_Mcount_iNoBitsSent_xor_3_111 : LUT3_D
    generic map(
      INIT => X"EF"
    )
    port map (
      I0 => U9_presState_FSM_FFd1_530,
      I1 => U9_presState_FSM_FFd2_533,
      I2 => U9_iClock1xEnable_466,
      LO => N167,
      O => U9_N11
    );
  U9_Result_4_SW0 : LUT2_L
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => U9_iClockWordCount(1),
      I1 => U9_iClockWordCount(0),
      LO => N86
    );
  U10_iDataOut1_and00003 : LUT4_D
    generic map(
      INIT => X"FFEF"
    )
    port map (
      I0 => U10_iNoBitsReceived(3),
      I1 => U10_presState_FSM_FFd1_310,
      I2 => U10_iNoBitsReceived(4),
      I3 => N90,
      LO => N168,
      O => U10_iDataOut1_and0000_bdd2
    );
  U9_iTxdBuffer_mux0000_4_11 : LUT4_D
    generic map(
      INIT => X"FDFF"
    )
    port map (
      I0 => U9_iNoBitsSent(3),
      I1 => U9_iNoBitsSent(2),
      I2 => U9_iNoBitsSent(1),
      I3 => U9_iNoBitsSent(0),
      LO => N169,
      O => U9_N0
    );
  iCount9_or000023_SW0 : LUT3_L
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => iCount9(4),
      I1 => iCount9(0),
      I2 => iCount9(8),
      LO => N112
    );
  U9_iTxdBuffer_mux0000_6_75_SW0 : LUT2_L
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => U9_presState_FSM_FFd2_533,
      I1 => U9_presState_FSM_FFd1_530,
      LO => N122
    );
  U10_Mshreg_iShiftRegister_3 : SRL16E_1
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => N0,
      A1 => SPI_power_OBUF_101,
      A2 => N0,
      A3 => N0,
      CE => U10_iShiftRegister_and0000,
      CLK => U10_iSCLK_292,
      D => MISO_IBUF_28,
      Q => U10_Mshreg_iShiftRegister_3_211
    );
  U10_iShiftRegister_3 : FDE_1
    generic map(
      INIT => '0'
    )
    port map (
      C => U10_iSCLK_292,
      CE => U10_iShiftRegister_and0000,
      D => U10_Mshreg_iShiftRegister_3_211,
      Q => U10_iShiftRegister(3)
    );

end Structure;

