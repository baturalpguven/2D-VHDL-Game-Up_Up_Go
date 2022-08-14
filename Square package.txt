----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2020 04:18:34 PM
-- Design Name: 
-- Module Name: PACKAGE - Behavioral
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

PACKAGE MY is

PROCEDURE SQ( SIGNAL Xcur,Ycur,Xpos,Ypos: IN INTEGER; 
SIGNAL RGB:OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
SIGNAL DRAW: OUT STD_LOGIC);
END MY;

PACKAGE BODY MY IS
PROCEDURE SQ (  SIGNAL Xcur,Ycur,Xpos,Ypos: IN INTEGER; 
SIGNAL RGB:OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
SIGNAL DRAW: OUT STD_LOGIC) IS 

BEGIN 

IF ((Xcur>Xpos AND Xcur< Xpos+100) AND (Ycur>Ypos AND Ycur< Ypos+50)) THEN
    RGB <= "1111";
    DRAW <= '1';
ELSE
    DRAW <= '0';
END IF;
END SQ;
END MY;
