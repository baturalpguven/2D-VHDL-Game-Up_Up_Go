----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2020 02:29:30 PM
-- Design Name: 
-- Module Name: Clock_Divider - Behavioral
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
use IEEE.std_logic_unsigned.all;
entity ClockDivider is 
    Port (InClock: in std_logic;
          OutClock_25: out std_logic;
           OutClock_slow: out std_logic;
           clr: in std_logic);
 end ClockDivider;
architecture Behavioral of ClockDivider is 
signal Divide_1, Divide_2: std_logic:= '0';
signal clock: std_logic_vector(32 downto 0); 
begin 
process(Inclock, Divide_1) 
begin if rising_edge(Inclock) then --T-flip flop 1 
Divide_1 <= not Divide_1; end if; 
if rising_edge(Divide_1) then --T flip flop 2 
Divide_2 <= not Divide_2; 
end if; 
end process;

process(InClock,clr)

begin

    if clr='1' then
        clock <= (others => '0');
    elsif rising_edge(InClock) then
        clock <= clock + 1;
    end if;
    end process; 
    
OutClock_slow<=clock(32); ---  
OutClock_25 <= Divide_2; 
end Behavioral; 
