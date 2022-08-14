----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2020 11:10:36 PM
-- Design Name: 
-- Module Name: control_unit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FSM is
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
end FSM;

architecture Behavioral of FSM is

type state_type is ( homescreen , single_player , multiplayer , gameover_singleplayer,gameover_multiplayer_plyr_one,gameover_multiplayer_plyr_two);

signal present_state, next_state: state_type;
begin

sreg: process(clk,reset)
begin
    if reset='1' then
        present_state<= homescreen;
    elsif rising_edge(clk) then
        present_state<= next_state;
    end if;
 end process;
 
 C1: process ( present_state, single_signal,multi_signal, gameover1 , gameover2,gameover1_for_second_player,gameover2_for_second_player )
 
 begin
    
    case present_state is
         when homescreen => 
            if single_signal ='1' then
                 next_state <= single_player ;
            elsif multi_signal='1' then
                next_state<= multiplayer;
		else
		next_state <=homescreen ;
            end if;
         when single_player =>
              if ((gameover1='1' or gameover2='1'))  then
                    next_state<= gameover_singleplayer ;
              elsif reset='1' then
                    next_state <=homescreen ;
		else
		next_state<= single_player ;
              end if;
         when multiplayer =>
              if ((gameover1 ='1' or gameover2='1' )and (gameover1_for_second_player='0' and gameover2_for_second_player='0'))  then
                    next_state<= gameover_multiplayer_plyr_one ;
              elsif ((gameover1 ='0' and gameover2='0' )and (gameover1_for_second_player='1' or gameover2_for_second_player='1')) then
                    next_state<= gameover_multiplayer_plyr_two ;
              elsif ((gameover1 ='1'or gameover2='1' )and (gameover1_for_second_player='1' or gameover2_for_second_player='1')) then
                    next_state<= gameover_multiplayer_plyr_two ;
              elsif reset='1' then
                    next_state<=homescreen ;
		else
		next_state<= multiplayer ;
              end if;
         when gameover_singleplayer =>
               if reset='1' then
		  next_state <=homescreen ;
		  else
			next_state <= gameover_singleplayer ;
			end if;
	     
	     
	      when gameover_multiplayer_plyr_one =>
               if reset='1' then
		  next_state <=homescreen ;
		  else
			next_state <= gameover_multiplayer_plyr_one ;
			end if;
			
			
		when gameover_multiplayer_plyr_two =>
               if reset='1' then
		  next_state <=homescreen ;
		  else
			next_state <= gameover_multiplayer_plyr_two ;
			end if;
			
			
         when others=>
                null;
         end case;
      end process;
      
   C2: process(present_state)
   begin
 	homescreen_bitmap_signal <='0';
	gameover_bitmap_signal_single_plyr_signal <='0';
	gameover_bitmap_signal_multi_plyr_plyr_one_signal <='0';
	gameover_bitmap_signal_multi_plyr_plyr_two_signal <='0';
	single_player_signal <='0';
	multiplayer_signal <='0';
        case present_state is
            when homescreen =>
                homescreen_bitmap_signal<='1';
	gameover_bitmap_signal_single_plyr_signal <='0';
	gameover_bitmap_signal_multi_plyr_plyr_one_signal <='0';
	gameover_bitmap_signal_multi_plyr_plyr_two_signal <='0';
                single_player_signal <='0';
                multiplayer_signal <='0';
            when single_player =>
                   	single_player_signal<='1';
                   	homescreen_bitmap_signal <='0';
	gameover_bitmap_signal_single_plyr_signal <='0';
	gameover_bitmap_signal_multi_plyr_plyr_one_signal <='0';
	gameover_bitmap_signal_multi_plyr_plyr_two_signal <='0';
	               multiplayer_signal <='0';
            when multiplayer =>
 	multiplayer_signal<='1';
    single_player_signal<='0';
    homescreen_bitmap_signal <='0';
	gameover_bitmap_signal_single_plyr_signal <='0';
	gameover_bitmap_signal_multi_plyr_plyr_one_signal <='0';
	gameover_bitmap_signal_multi_plyr_plyr_two_signal <='0';
    
    when gameover_singleplayer =>
	gameover_bitmap_signal_single_plyr_signal <='1';
	gameover_bitmap_signal_multi_plyr_plyr_one_signal <='0';
	gameover_bitmap_signal_multi_plyr_plyr_two_signal <='0';
 	multiplayer_signal<='0';
    single_player_signal<='0';
    homescreen_bitmap_signal <='0';
    
   when gameover_multiplayer_plyr_one =>
	gameover_bitmap_signal_single_plyr_signal <='0';
	gameover_bitmap_signal_multi_plyr_plyr_one_signal <='1';
	gameover_bitmap_signal_multi_plyr_plyr_two_signal <='0';
 	multiplayer_signal<='0';
    single_player_signal<='0';
    homescreen_bitmap_signal <='0';
    
    
   when gameover_multiplayer_plyr_two =>
	gameover_bitmap_signal_single_plyr_signal <='0';
	gameover_bitmap_signal_multi_plyr_plyr_one_signal <='0';
	gameover_bitmap_signal_multi_plyr_plyr_two_signal <='1';
 	multiplayer_signal<='0';
    single_player_signal<='0';
    homescreen_bitmap_signal <='0';
            when others=>
                null;
            end case;
        end process;
        
end Behavioral;
