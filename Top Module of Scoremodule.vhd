----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2020 05:08:33 PM
-- Design Name: 
-- Module Name: Top_module - Behavioral
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

entity scoremodule is
    Port (  
           clk : in STD_LOGIC; -- clk input of the BASYS3
           reset: in std_logic;
           enable: in  STD_LOGIC; 
           display_out : out STD_LOGIC_VECTOR (6 downto 0); -- 7 segment display signal
           anode_out : out STD_LOGIC_VECTOR (3 downto 0)); -- anode choser signal
end scoremodule;

architecture Behavioral of scoremodule is
component three_to_one_MUX is
    Port ( mux_out : out STD_LOGIC_VECTOR (2 downto 0);
           two_bit_in : in STD_LOGIC_VECTOR (1 downto 0);
           in1 : in STD_LOGIC_VECTOR (2 downto 0);
           in2 : in STD_LOGIC_VECTOR (2 downto 0);
           in3 : in STD_LOGIC_VECTOR (2 downto 0);
           in4 : in STD_LOGIC_VECTOR (2 downto 0));
end component;

component Display_choser is
    Port ( choser_input : in STD_LOGIC_VECTOR (1 downto 0);
           choser_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component clock_divider_module is
    Port ( clock_input : in STD_LOGIC;
           clock_output : out STD_LOGIC_VECTOR (1 downto 0);
           reset : in STD_LOGIC);
end component;


component CL1_wrapper is
    Port ( clk: in STD_LOGIC;
           reset: in std_logic;
            enable: in STD_LOGIC;
           out_1 : out std_logic_vector(11 downto 0));
end component;

component seven_segment_decoder is
    Port ( binary_input : in STD_LOGIC_VECTOR (2 downto 0);
           octa_output : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal top_binary_in : STD_LOGIC_VECTOR(2 downto 0);
signal  top_clk: STD_LOGIC_VECTOR(1 downto 0);
signal top_reset : STD_LOGIC;
signal inner_output1 : std_logic_vector(11 downto 0);
begin

C1: three_to_one_MUX  PORT MAP(
    in1 =>inner_output1 (2 downto 0) , 
    in2 => inner_output1 (5 downto 3), 
    in3 => inner_output1(8 downto 6), 
   in4 => inner_output1(11 downto 9), 
    two_bit_in => top_clk, 
    mux_out => top_binary_in);

C2: seven_segment_decoder PORT MAP( 
    binary_input => top_binary_in,
    octa_output => display_out);

C3: Display_choser PORT MAP( 
     choser_input => top_clk, 
     choser_out => anode_out);

C4: clock_divider_module PORT MAP( 
    clock_input => clk, 
    clock_output => top_clk, 
    Reset => top_reset);
    
C5: CL1_wrapper PORT MAP( 
        clk=>CLK,
        reset=>reset,
         enable=>enable,
        out_1=>inner_output1);
        

end Behavioral;
