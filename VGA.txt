----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2020 02:35:08 PM
-- Design Name: 
-- Module Name: VGA - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--      	TRIG_left: out std_logic;
--	ECHO_left: in std_logic;

entity VGA is
     Port ( 
     CLOCK_main: IN std_logic;
     VGA_HS, VGA_VS: Out std_logic;
      TRIG: out std_logic;
      ECHO: in std_logic;  
     VGA_R, VGA_G, VGA_B: Out std_logic_vector( 3 downto 0);
      KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      reset: in std_logic;
      TRIG_left: out std_logic;
	  ECHO_left: in std_logic;
	  TRIG_left_plyr_one: out std_logic;
	  ECHO_left_plyr_one: in std_logic;
	  TRIG_right:out std_logic;
	  ECHO_right: in std_logic;
      led_reward: out std_logic_vector(2 downto 0);
      single_signal : in std_logic;
	  multi_signal : in std_logic;
	  seven_segment_display_out : out STD_LOGIC_VECTOR (6 downto 0);
	  seven_segment_anode_out : out STD_LOGIC_VECTOR (3 downto 0);
      led: out STD_LOGIC_VECTOR(2 downto 0)
     );
end VGA;

architecture Behavioral of VGA is


SIGNAL VGACLK: STD_LOGIC;
SIGNAL OutClock_slow: STD_LOGIC;

SIGNAL random_number:  STD_LOGIC_VECTOR (7 downto 0);
SIGNAL random_number_adder: STD_LOGIC_VECTOR (6 downto 0);

SIGNAL gameover_bitmap_signal_internal: STD_LOGIC;
SIGNAL homescreen_bitmap_signal_internal: STD_LOGIC;

SIGNAL gameover1_internal: STD_LOGIC;
SIGNAL gameover2_internal: STD_LOGIC;
 SIGNAL gameover_bitmap_signal_single_plyr_signal_internal:  std_logic;
SIGNAL	gameover_bitmap_signal_multi_plyr_plyr_one_signal_internal: std_logic;
SIGNAL	gameover_bitmap_signal_multi_plyr_plyr_two_signal_internal: std_logic;
SIGNAL single_player_signal_internal: STD_LOGIC;
SIGNAL multiplayer_signal_internal: STD_LOGIC;

signal right_movement :STD_LOGIC;
signal left_movement :STD_LOGIC;
signal ultrasonic_right_hand_for_plyr_one_signal:std_logic;
signal ultrasonic_left_hand_for_plyr_one_signal:std_logic;

signal random_clk: STD_LOGIC;

signal enable: std_logic;

 signal gameover1_for_second_player_inner: STD_LOGIC;
signal gameover2_for_second_player_inner:  STD_LOGIC;
                
                
signal color_shifter_signal: STD_LOGIC_VECTOR ( 11 DOWNTO 0);

COMPONENT ClockDivider is 
    Port (InClock: in std_logic;
          OutClock_25: out std_logic;
           OutClock_slow: out std_logic;
           clr: in std_logic);
 end COMPONENT;
--------------------------------------- game
component SYNC is
        Port ( CLK: in std_logic;
               reset: in std_logic;
               HSYNC, VSYNC: OUT STD_LOGIC;
                R, G, B: OUT STD_LOGIC_VECTOR ( 3 DOWNTO 0);
                led: out STD_LOGIC_VECTOR(2 downto 0);
                random_number: in STD_LOGIC_VECTOR (7 downto 0);
                OutClock_slow:in STD_LOGIC;
                color:in STD_LOGIC_VECTOR ( 11 DOWNTO 0);
                reward_counter_led:out STD_LOGIC_VECTOR(2 downto 0);
                right_movement_for_plyr_one:in std_logic;
                left_movement_for_plyr_one:in std_logic;
                gameover1_for_second_player: out STD_LOGIC;
                gameover2_for_second_player: out STD_LOGIC;
                homescreen_bitmap_signal : in std_logic;
	gameover_bitmap_signal_single_plyr_signal: in std_logic;
	gameover_bitmap_signal_multi_plyr_plyr_one_signal:in std_logic;
	gameover_bitmap_signal_multi_plyr_plyr_two_signal:in std_logic;
                gameover1 : out std_logic;
                random_clk:out STD_LOGIC;
                left_movement :in STD_LOGIC;
                right_movement :in STD_LOGIC;
                gameover2 : out std_logic;
                single_player_signal : in std_logic;
	            multiplayer_signal : in std_logic;
                random_number_adder: in STD_LOGIC_VECTOR (6 downto 0);
                KEYS: IN STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
end component;
----------------------------------------------------------------- random generator
component RandomGenerator is
Port ( clock : in STD_LOGIC;
	reset : in STD_LOGIC;
	en : in STD_LOGIC;
	Q : out STD_LOGIC_VECTOR (7 downto 0);
	check: out STD_LOGIC;
	Q2: out STD_LOGIC_VECTOR (6 downto 0));
end component;
------------------------------------------------------- finite state machine
component FSM is
Port (  clk: in std_logic;
        reset: in std_logic;
        single_signal : in std_logic;
	multi_signal : in std_logic;
        gameover1 : in std_logic;
        gameover2 : in std_logic;
         gameover1_for_second_player: in STD_LOGIC;
         gameover2_for_second_player: in STD_LOGIC;
        homescreen_bitmap_signal : out std_logic;
	gameover_bitmap_signal_single_plyr_signal: out std_logic;
	gameover_bitmap_signal_multi_plyr_plyr_one_signal:out std_logic;
	gameover_bitmap_signal_multi_plyr_plyr_two_signal:out std_logic;
	single_player_signal : out std_logic;
	multiplayer_signal : out std_logic
         );
end component;
---------------------------------------------------------- ultrasonic_control_right_plyr_two
component ultrasonic is
	port(
	CLOCK: in std_logic;
	led: out std_logic;
	TRIG: out std_logic;
	ECHO: in std_logic
	);
end component;
--------------------------------------------------------------ultrasonic_control_left_plyr_two
component ultrasonic_for_left_hand is
	port(
	CLOCK: in std_logic;
	out_left: out std_logic;
	TRIG_left: out std_logic;
	ECHO_left: in std_logic
	);
end component;
--------------------------------------------------------------ultrasonic_control_right_plyr_one
component ultrasonic_right_hand_for_plyr_one is
	port(
	CLOCK: in std_logic;
	out_right: out std_logic;
	TRIG_right: out std_logic;
	ECHO_right: in std_logic
	);
end  component;
--------------------------------------------------------------ultrasonic_control_left_plyr_one
component ultrasonic_left_hand_for_plyr_one is
	port(
	CLOCK: in std_logic;
	out_left_plyr_one: out std_logic;
	TRIG_left_plyr_one: out std_logic;
	ECHO_left_plyr_one: in std_logic
	);
end  component;
---------------------------------------------------------- score with 7 segment display
component scoremodule is
    Port ( clk : in STD_LOGIC; -- clk input of the BASYS3
           enable: in std_logic;
           reset: in std_logic;
           display_out : out STD_LOGIC_VECTOR (6 downto 0); -- 7 segment display signal
           anode_out : out STD_LOGIC_VECTOR (3 downto 0)); -- anode choser signal
end component;
-----------------------------------------------------------------------------------color shifter counter
component color_shifter_counter is
Port ( clk : in STD_LOGIC;
color : out STD_LOGIC_vector (11 downto 0));
end component;
------------------------------------------------

BEGIN
C1: SYNC PORT MAP(CLK=>VGACLK,
                   HSYNC=> VGA_HS,
                   VSYNC=> VGA_VS,
                   R => VGA_R,
                   G => VGA_G,
                   B => VGA_B,
                   random_clk=>random_clk,
                   left_movement =>left_movement,
                   color=>color_shifter_signal,
                   right_movement=>right_movement,
                   right_movement_for_plyr_one=>ultrasonic_right_hand_for_plyr_one_signal,
                left_movement_for_plyr_one=>ultrasonic_left_hand_for_plyr_one_signal,
                   reset=>reset,
                  KEYS => KEY,
                  reward_counter_led=>led_reward,
                  OutClock_slow=>OutClock_slow,
                  led=> led,
                  gameover1_for_second_player=>gameover1_for_second_player_inner,
                  gameover2_for_second_player=>gameover2_for_second_player_inner,
                 homescreen_bitmap_signal =>homescreen_bitmap_signal_internal,
         	gameover_bitmap_signal_single_plyr_signal=>gameover_bitmap_signal_single_plyr_signal_internal,
	gameover_bitmap_signal_multi_plyr_plyr_one_signal=>gameover_bitmap_signal_multi_plyr_plyr_one_signal_internal,
	gameover_bitmap_signal_multi_plyr_plyr_two_signal=>gameover_bitmap_signal_multi_plyr_plyr_two_signal_internal,
                gameover1 =>gameover1_internal,
                gameover2 =>gameover2_internal,
                single_player_signal =>single_player_signal_internal,
	            multiplayer_signal =>multiplayer_signal_internal,
                  random_number_adder=>random_number_adder,
                  random_number=>random_number
                  );
 C2:ClockDivider PORT MAP (
                            InClock=>CLOCK_main,
                            OutClock_25=>VGACLK,
                            OutClock_slow=>OutClock_slow,
                            clr=>reset
                           );
                           
  c3:RandomGenerator PORT MAP (clock=>random_clk,
                                reset=>reset,
                                en=>'1',
                                Q=>random_number,
                                Q2=>random_number_adder);
                                
                                
                                
 C4:  FSM  PORT MAP (
                        clk=>VGACLK,
                        reset=>reset ,
       single_signal => single_signal,
	multi_signal => multi_signal,
        gameover1 => gameover1_internal,
        gameover2 =>gameover2_internal,
         gameover1_for_second_player=>gameover1_for_second_player_inner,
         gameover2_for_second_player=>gameover2_for_second_player_inner,
        homescreen_bitmap_signal => homescreen_bitmap_signal_internal,
         	gameover_bitmap_signal_single_plyr_signal=>gameover_bitmap_signal_single_plyr_signal_internal,
	gameover_bitmap_signal_multi_plyr_plyr_one_signal=>gameover_bitmap_signal_multi_plyr_plyr_one_signal_internal,
	gameover_bitmap_signal_multi_plyr_plyr_two_signal=>gameover_bitmap_signal_multi_plyr_plyr_two_signal_internal,
	single_player_signal => single_player_signal_internal,
	multiplayer_signal => multiplayer_signal_internal
         );  
         
         
         
  c5: ultrasonic PORT MAP (
                    CLOCK=>CLOCK_main,
                    led=>right_movement,
                    TRIG=>TRIG,
                    ECHO=>ECHO  );  
           
  c6: ultrasonic_for_left_hand  PORT MAP (  
                      CLOCK=>CLOCK_main,
                    out_left=>left_movement,
                    TRIG_left=>TRIG_left,
                    ECHO_left=>ECHO_left );   
           
c7:   scoremodule  Port Map (
        clk=> CLOCK_main,
        enable=> enable,
        reset=>reset,
        display_out=>seven_segment_display_out,
        anode_out=>   seven_segment_anode_out);
         
c8:  color_shifter_counter  PORT MAP  
                  (clk =>CLOCK_main,
                  color   =>color_shifter_signal);
                  
c9: ultrasonic_left_hand_for_plyr_one Port map (
	CLOCK=>CLOCK_main,
	out_left_plyr_one=>ultrasonic_left_hand_for_plyr_one_signal,
	TRIG_left_plyr_one=>TRIG_left_plyr_one,
	ECHO_left_plyr_one=>ECHO_left_plyr_one
	);                 
c10:   ultrasonic_right_hand_for_plyr_one port map(
	CLOCK=>CLOCK_main,
	out_right=>ultrasonic_right_hand_for_plyr_one_signal,
	TRIG_right=>TRIG_right,
	ECHO_right=>ECHO_right
	); 
                       
enable<= multiplayer_signal_internal or single_player_signal_internal;
end Behavioral;




