## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
set_property PACKAGE_PIN W5 [get_ports CLOCK_main]							
	set_property IOSTANDARD LVCMOS33 [get_ports CLOCK_main]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLOCK_main]
 
## Switches
#set_property PACKAGE_PIN V17 [get_ports {sw[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
#set_property PACKAGE_PIN V16 [get_ports {sw[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
#set_property PACKAGE_PIN W16 [get_ports {sw[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
#set_property PACKAGE_PIN W17 [get_ports {sw[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
#set_property PACKAGE_PIN W15 [get_ports {sw[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
#set_property PACKAGE_PIN V15 [get_ports {sw[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
#set_property PACKAGE_PIN W14 [get_ports {sw[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
#set_property PACKAGE_PIN W13 [get_ports {sw[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
#set_property PACKAGE_PIN V2 [get_ports {sw[8]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
#set_property PACKAGE_PIN T3 [get_ports {sw[9]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
#set_property PACKAGE_PIN T2 [get_ports {sw[10]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
#set_property PACKAGE_PIN R3 [get_ports {multi_signal}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {multi_signal}]
##set_property PACKAGE_PIN W2 [get_ports {sw[12]}]					
#	#set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property PACKAGE_PIN U1 [get_ports {single_signal}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {single_signal}]
##set_property PACKAGE_PIN T1 [get_ports {SW[0]}]					
##	set_property IOSTANDARD LVCMOS33 [get_ports {SW[0]}]
#set_property PACKAGE_PIN R2 [get_ports {reset}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]
 

## LEDs
set_property PACKAGE_PIN U16 [get_ports {led[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
#set_property PACKAGE_PIN E19 [get_ports {led[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
#set_property PACKAGE_PIN U19 [get_ports {led[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
#set_property PACKAGE_PIN V19 [get_ports {led[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
#set_property PACKAGE_PIN W18 [get_ports {led[4]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
#set_property PACKAGE_PIN U15 [get_ports {led[5]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
#set_property PACKAGE_PIN U14 [get_ports {led[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
#set_property PACKAGE_PIN V14 [get_ports {led[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property PACKAGE_PIN V13 [get_ports {led_reward[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led_reward[0]}]
set_property PACKAGE_PIN V3 [get_ports {led_reward[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led_reward[1]}]
set_property PACKAGE_PIN W3 [get_ports {led_reward[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led_reward[2]}]
#set_property PACKAGE_PIN U3 [get_ports {led[11]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
#set_property PACKAGE_PIN P3 [get_ports {led[12]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
#set_property PACKAGE_PIN N3 [get_ports {led[0]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN P1 [get_ports {led[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN L1 [get_ports {led[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
	
	
#7-segment output
set_property PACKAGE_PIN W7 [get_ports {seven_segment_display_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment_display_out[0]}]
set_property PACKAGE_PIN W6 [get_ports {seven_segment_display_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment_display_out[1]}]
set_property PACKAGE_PIN U8 [get_ports {seven_segment_display_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment_display_out[2]}]
set_property PACKAGE_PIN V8 [get_ports {seven_segment_display_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment_display_out[3]}]
set_property PACKAGE_PIN U5 [get_ports {seven_segment_display_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment_display_out[4]}]
set_property PACKAGE_PIN V5 [get_ports {seven_segment_display_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment_display_out[5]}]
set_property PACKAGE_PIN U7 [get_ports {seven_segment_display_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment_display_out[6]}]
#Anode Output
set_property PACKAGE_PIN U2 [get_ports {seven_segment_anode_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment_anode_out[0]}]
set_property PACKAGE_PIN U4 [get_ports {seven_segment_anode_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment_anode_out[1]}]
set_property PACKAGE_PIN V4 [get_ports {seven_segment_anode_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment_anode_out[2]}]
set_property PACKAGE_PIN W4 [get_ports {seven_segment_anode_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {seven_segment_anode_out[3]}]


##Buttons
set_property PACKAGE_PIN U18 [get_ports reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports reset]
set_property PACKAGE_PIN T18 [get_ports single_signal]						
	set_property IOSTANDARD LVCMOS33 [get_ports single_signal]
set_property PACKAGE_PIN W19 [get_ports KEY[1]]						
	set_property IOSTANDARD LVCMOS33 [get_ports KEY[1]]
set_property PACKAGE_PIN T17 [get_ports KEY[0]]						
	set_property IOSTANDARD LVCMOS33 [get_ports KEY[0]]
set_property PACKAGE_PIN U17 [get_ports multi_signal]						
	set_property IOSTANDARD LVCMOS33 [get_ports multi_signal]
 


##Pmod Header JA
##Sch name = JA1
#set_property PACKAGE_PIN J1 [get_ports {JA[0]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[0]}]
##Sch name = JA2
#set_property PACKAGE_PIN L2 [get_ports {JA[1]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[1]}]
##Sch name = JA3
#set_property PACKAGE_PIN J2 [get_ports {JA[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[2]}]
##Sch name = JA4
#set_property PACKAGE_PIN G2 [get_ports {JA[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[3]}]
##Sch name = JA7
set_property PACKAGE_PIN H1 [get_ports {TRIG_left}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {TRIG_left}]
#Sch name = JA8
set_property PACKAGE_PIN K2 [get_ports {ECHO_left}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ECHO_left}]
#Sch name = JA9
#set_property PACKAGE_PIN H2 [get_ports {JA[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[6]}]
##Sch name = JA10
#set_property PACKAGE_PIN G3 [get_ports {JA[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JA[7]}]



##Pmod Header JB
#Sch name = JB1
set_property PACKAGE_PIN A14 [get_ports {TRIG_left_plyr_one}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {TRIG_left_plyr_one}]
#Sch name = JB2
set_property PACKAGE_PIN A16 [get_ports {ECHO_left_plyr_one}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ECHO_left_plyr_one}]
##Sch name = JB3
#set_property PACKAGE_PIN B15 [get_ports {JB[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[2]}]
##Sch name = JB4
#set_property PACKAGE_PIN B16 [get_ports {JB[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[3]}]
##Sch name = JB7
set_property PACKAGE_PIN A15 [get_ports {TRIG_right}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {TRIG_right}]
#Sch name = JB8
set_property PACKAGE_PIN A17 [get_ports {ECHO_right}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ECHO_right}]
##Sch name = JB9
#set_property PACKAGE_PIN C15 [get_ports {JB[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[6]}]
##Sch name = JB10 
#set_property PACKAGE_PIN C16 [get_ports {JB[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JB[7]}]
	
#TRIG_left_plyr_one
#ECHO_left_plyr_one
#TRIG_right
#ECHO_right
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ECHO_left_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ECHO_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ECHO_left_plyr_one_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets ECHO_right]

##Pmod Header JC
##Sch name = JC1
#set_property PACKAGE_PIN K17 [get_ports {ECHO_left}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {ECHO_left}]
##Sch name = JC2
#set_property PACKAGE_PIN M18 [get_ports {TRIG_left}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {TRIG_left}]
##Sch name = JC3
#set_property PACKAGE_PIN N17 [get_ports {JC[2]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[2]}]
##Sch name = JC4
#set_property PACKAGE_PIN P18 [get_ports {JC[3]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[3]}]
##Sch name = JC7
set_property PACKAGE_PIN L17 [get_ports {ECHO}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {ECHO}]
#Sch name = JC8
set_property PACKAGE_PIN M19 [get_ports {TRIG}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {TRIG}]
##Sch name = JC9
#set_property PACKAGE_PIN P17 [get_ports {JC[6]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[6]}]
##Sch name = JC10
#set_property PACKAGE_PIN R18 [get_ports {JC[7]}]					
	#set_property IOSTANDARD LVCMOS33 [get_ports {JC[7]}]


##Pmod Header JXADC
##Sch name = XA1_P
#set_property PACKAGE_PIN J3 [get_ports {JXADC[0]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[0]}]
##Sch name = XA2_P
#set_property PACKAGE_PIN L3 [get_ports {JXADC[1]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[1]}]
##Sch name = XA3_P
#set_property PACKAGE_PIN M2 [get_ports {JXADC[2]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[2]}]
##Sch name = XA4_P
#set_property PACKAGE_PIN N2 [get_ports {JXADC[3]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[3]}]
##Sch name = XA1_N
#set_property PACKAGE_PIN K3 [get_ports {JXADC[4]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[4]}]
##Sch name = XA2_N
#set_property PACKAGE_PIN M3 [get_ports {JXADC[5]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[5]}]
##Sch name = XA3_N
#set_property PACKAGE_PIN M1 [get_ports {JXADC[6]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[6]}]
##Sch name = XA4_N
#set_property PACKAGE_PIN N1 [get_ports {JXADC[7]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {JXADC[7]}]



##VGA Connector
set_property PACKAGE_PIN G19 [get_ports {VGA_R[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[0]}]
set_property PACKAGE_PIN H19 [get_ports {VGA_R[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[1]}]
set_property PACKAGE_PIN J19 [get_ports {VGA_R[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[2]}]
set_property PACKAGE_PIN N19 [get_ports {VGA_R[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_R[3]}]
set_property PACKAGE_PIN N18 [get_ports {VGA_B[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[0]}]
set_property PACKAGE_PIN L18 [get_ports {VGA_B[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[1]}]
set_property PACKAGE_PIN K18 [get_ports {VGA_B[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[2]}]
set_property PACKAGE_PIN J18 [get_ports {VGA_B[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_B[3]}]
set_property PACKAGE_PIN J17 [get_ports {VGA_G[0]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[0]}]
set_property PACKAGE_PIN H17 [get_ports {VGA_G[1]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[1]}]
set_property PACKAGE_PIN G17 [get_ports {VGA_G[2]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[2]}]
set_property PACKAGE_PIN D17 [get_ports {VGA_G[3]}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {VGA_G[3]}]
set_property PACKAGE_PIN P19 [get_ports VGA_HS]						
	set_property IOSTANDARD LVCMOS33 [get_ports VGA_HS]
set_property PACKAGE_PIN R19 [get_ports VGA_VS]						
	set_property IOSTANDARD LVCMOS33 [get_ports VGA_VS]


##USB-RS232 Interface
#set_property PACKAGE_PIN B18 [get_ports RsRx]						
	#set_property IOSTANDARD LVCMOS33 [get_ports RsRx]
#set_property PACKAGE_PIN A18 [get_ports RsTx]						
	#set_property IOSTANDARD LVCMOS33 [get_ports RsTx]


##USB HID (PS/2)
#set_property PACKAGE_PIN C17 [get_ports PS2Clk]						
	#set_property IOSTANDARD LVCMOS33 [get_ports PS2Clk]
	#set_property PULLUP true [get_ports PS2Clk]
#set_property PACKAGE_PIN B17 [get_ports PS2Data]					
	#set_property IOSTANDARD LVCMOS33 [get_ports PS2Data]	
	#set_property PULLUP true [get_ports PS2Data]


##Quad SPI Flash
##Note that CCLK_0 cannot be placed in 7 series devices. You can access it using the
##STARTUPE2 primitive.
#set_property PACKAGE_PIN D18 [get_ports {QspiDB[0]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[0]}]
#set_property PACKAGE_PIN D19 [get_ports {QspiDB[1]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[1]}]
#set_property PACKAGE_PIN G18 [get_ports {QspiDB[2]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[2]}]
#set_property PACKAGE_PIN F18 [get_ports {QspiDB[3]}]				
	#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[3]}]
#set_property PACKAGE_PIN K19 [get_ports QspiCSn]					
	#set_property IOSTANDARD LVCMOS33 [get_ports QspiCSn]
