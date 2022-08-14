----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/28/2020 02:38:39 PM
-- Design Name: 
-- Module Name: SYNC - Behavioral
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
use work.my.all;
use work.Defined_Values.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--                reward_signal: OUT STD_LOGIC;

entity SYNC is
        Port ( CLK: in std_logic;
               reset: in std_logic;
               HSYNC, VSYNC: OUT STD_LOGIC;
                R, G, B: OUT STD_LOGIC_VECTOR ( 3 DOWNTO 0);
                led: out STD_LOGIC_VECTOR(2 downto 0);
                random_number: in STD_LOGIC_VECTOR (7 downto 0);
                OutClock_slow:in STD_LOGIC;
                right_movement_for_plyr_one:in std_logic;
                left_movement_for_plyr_one:in std_logic;
                color:in STD_LOGIC_VECTOR ( 11 DOWNTO 0);
                reward_counter_led:out STD_LOGIC_VECTOR(2 downto 0);
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
end SYNC;

architecture MAIN of SYNC is

SIGNAL RGB: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DRAW1: STD_LOGIC;
SIGNAL DRAW2: STD_LOGIC;-- SQ2
SIGNAL SQ_X1: INTEGER RANGE 0 TO 800:=320;
SIGNAL SQ_Y1: INTEGER RANGE 0 TO 484:=484;
SIGNAL SQ_X2: INTEGER RANGE 0 TO 800:=320;--SQ2
SIGNAL SQ_Y2_2: INTEGER RANGE 0 TO 484:=484;--sq2
SIGNAL SQ_Y2: INTEGER ;--reward_y
SIGNAL HPOS: INTEGER RANGE 0 TO 800:=0;
SIGNAL VPOS: INTEGER RANGE 0 TO 525:=0;
SIGNAL Left_Wall_up_y_boundry:INTEGER ;
SIGNAL Right_Wall_up_y_boundry:INTEGER ;
SIGNAL HIT_REWARD:STD_LOGIC:='0';
SIGNAL close_reward:STD_LOGIC;
SIGNAL random_adder: integer;

SIGNAL random_adder_for_obs_two: integer;

signal count: integer range 0 to 3:=0;
signal count_for_player_two: integer range 0 to 3:=0;
signal counter:integer:=0;
signal counter_for_player_two:integer:=0;


signal gameover1_inner: std_logic;
signal gameover2_inner: std_logic;
signal reward_inner: std_logic;

signal gameover1_inner_for_second_plyr: std_logic;
signal gameover2_inner_for_second_plyr: std_logic;
signal reward_inner_for_second_plyr: std_logic;

signal reset_gameover:std_logic;

signal speed_counter:integer:=2;

signal speed_counter_for_plyr_two:integer:=2;

begin
SQ(HPOS,VPOS,SQ_X1,SQ_Y1,RGB,DRAW1);
SQ(HPOS,VPOS,SQ_X2,SQ_Y2_2,RGB,DRAW2);

Left_Wall_up_y_boundry<=to_integer(unsigned(random_number));
Right_Wall_up_y_boundry<=to_integer(unsigned(random_number))+120;

random_adder<=to_integer(unsigned(random_number_adder));

random_adder_for_obs_two<=to_integer(unsigned(random_number_adder(0 downto 0)))*250;

SQ_Y2<=to_integer(unsigned(random_number));
        
    PROCESS(CLK)
     
     BEGIN    
     IF (CLK'EVENT AND CLK='1') THEN
if  gameover_bitmap_signal_single_plyr_signal='1' then-------------------------------------------------------------------------------------------------------------------------- gameover screen
     if Hpos>=144 and Hpos<784 and Vpos>=33 and Vpos<(119+33) then
               if gameover_writing(Vpos-33)(639-(Hpos-144))='0' then-----------------single player bitmap
                    R <=COLOR(3 DOWNTO 0);
                    G <= COLOR(7 DOWNTO 4);
                    B <= COLOR(11 DOWNTO 8);
                else
                    R <= (OTHERS =>'0');
                     G <= (OTHERS =>'0');
                     B <= (OTHERS =>'0');
               end if;
     elsif Hpos>=144 and Hpos<784 and Vpos>=(119+33) and Vpos<513 then
             if gameover_single_player(Vpos-(119+33))(639-(Hpos-144))='0' then--------------- single player bitmap
                R <= (OTHERS =>'1');
                 G <= (OTHERS =>'1');
                 B <= (OTHERS =>'1');
            else
                R <= (OTHERS =>'1');
                 G <= (OTHERS =>'0');
                 B <= (OTHERS =>'0');
           end if;
     end if;
elsif  gameover_bitmap_signal_multi_plyr_plyr_two_signal='1' then
       if Hpos>=144 and Hpos<784 and Vpos>=33 and Vpos<(119+33) then
                if gameover_writing(Vpos-33)(639-(Hpos-144))='0' then-----------------multi player
                    R <=COLOR(3 DOWNTO 0);
                    G <= COLOR(7 DOWNTO 4);
                    B <= COLOR(11 DOWNTO 8);
                else
                    R <= (OTHERS =>'0');
                     G <= (OTHERS =>'0');
                     B <= (OTHERS =>'0');
               end if;
       elsif Hpos>=144 and Hpos<784 and Vpos>=(119+33) and Vpos<513 then
             if gameover_multi_player_player_two_hit(Vpos-(119+33))(639-(Hpos-144))='0' then--------------- multi player player two hit
                R <= (OTHERS =>'1');
                 G <= (OTHERS =>'1');
                 B <= (OTHERS =>'1');
            else
                R <= (OTHERS =>'1');
                 G <= (OTHERS =>'0');
                 B <= (OTHERS =>'0');
           end if;
            end if;
elsif  gameover_bitmap_signal_multi_plyr_plyr_one_signal='1' then     
               if Hpos>=144 and Hpos<784 and Vpos>=33 and Vpos<(119+33) then
                    if gameover_writing(Vpos-33)(639-(Hpos-144))='0' then-----------------multi player bitmap
                    R <=COLOR(3 DOWNTO 0);
                    G <= COLOR(7 DOWNTO 4);
                    B <= COLOR(11 DOWNTO 8);
                else
                    R <= (OTHERS =>'0');
                     G <= (OTHERS =>'0');
                     B <= (OTHERS =>'0');
               end if; 
            elsif Hpos>=144 and Hpos<784 and Vpos>=(119+33) and Vpos<513 then   
              if gameover_multi_player_player_one_hit(Vpos-(119+33))(639-(Hpos-144))='0' then-------------------------------- multi player one hit
                R <= (OTHERS =>'1');
                 G <= (OTHERS =>'1');
                 B <= (OTHERS =>'1');
            else
                R <= (OTHERS =>'1');
                 G <= (OTHERS =>'0');
                 B <= (OTHERS =>'0');
           end if;
           end if;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------          
        elsif homescreen_bitmap_signal='1' then------------------------------------------------------------------------------------------------- homescreen
         if Hpos>=144 and Hpos<784 and Vpos>=33 and Vpos<(176+32) then----------------------------------heads
            if homescreen_face(Vpos-33)(639-(Hpos-144))='0' then
                R <=COLOR(7 DOWNTO 4);
                G <= COLOR(3 DOWNTO 0);
                B <= COLOR(11 DOWNTO 8);
            else
                 R <= (OTHERS =>'0');
                 G <= (OTHERS =>'0');
                 B <= (OTHERS =>'0');
                 end if;
                 
          elsif Hpos>=144 and Hpos<784 and Vpos>=(176+33) and Vpos<285+33 then----------------------------------------------------------------------------writings
            if homescreen_writings(Vpos-(176+33))(639-(Hpos-144))='0' then
                 R <= (OTHERS =>'1');
                 G <= (OTHERS =>'1');
                 B <= (OTHERS =>'1');
            else
                 R <= (OTHERS =>'0');
                 G <= (OTHERS =>'0');
                 B <= (OTHERS =>'0');
                 end if;
        elsif Hpos>=144 and Hpos<784 and Vpos>=(286+33) and Vpos<513 then--------------------------------------------------------- game model
            if homescreen_up_up_go(Vpos-(286+33))(639-(Hpos-144))='0' then
                R <=COLOR(3 DOWNTO 0);
                G <= COLOR(7 DOWNTO 4);
                B <= COLOR(11 DOWNTO 8);
            else
                 R <= (OTHERS =>'0');
                 G <= (OTHERS =>'0');
                 B <= (OTHERS =>'0');
                 end if;
          end if;
---------------------------------------------------------------------------------------------------------------------------------------------------------------
     elsif (single_player_signal='1' or multiplayer_signal='1') then        
        if Hpos>=154 and Hpos<320 and Vpos>=33 and Vpos<525 then-------------------------------------------------------------------------------------left wall 
            if left_wall(Vpos-33)(175-(Hpos-154))='0' then
                 R <= (OTHERS =>'0');
                 G <= (OTHERS =>'1');
                 B <= (OTHERS =>'0');
            else
                R <=COLOR(3 DOWNTO 0);
                G <= COLOR(7 DOWNTO 4);
                B <= COLOR(11 DOWNTO 8);
           end if;
---------------------------------------------------------------------------------------------------------------------------------------------------------------        
        elsif Hpos>=620 and Hpos<800 and Vpos>=33 and Vpos<525 then----------------------------------------------------------------------------------------right wall
            if right_wall(Vpos-33)(175-(Hpos-620))='0' then
                 R <= (OTHERS =>'0');
                 G <= (OTHERS =>'1');
                 B <= (OTHERS =>'0');
            else
                R <=COLOR(3 DOWNTO 0);
                G <= COLOR(7 DOWNTO 4);
                B <= COLOR(11 DOWNTO 8);
           end if;
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------   
       ELSIF ((HPOS>=320 AND HPOS< 440) AND (VPOS>=(Left_Wall_up_y_boundry +45+60) AND VPOS<(Left_Wall_up_y_boundry+45+60+6)))  THEN-- OBSTICLE 1
            R <= (OTHERS =>'0');
            G <= (OTHERS =>'1');
            B <= (OTHERS =>'0');
       ELSIF ((HPOS>500 AND HPOS <=620) AND (VPOS>=(Right_Wall_up_y_boundry +45+60 - random_adder_for_obs_two) AND VPOS<(Right_Wall_up_y_boundry +45+6 +60 - random_adder_for_obs_two)))THEN-- OBSTICLE 2
            R <= (OTHERS =>'0');
            G <= (OTHERS =>'1');
            B <= (OTHERS =>'0');
        ELSIF (DRAW1='1' and (single_player_signal='1' or multiplayer_signal='1') ) THEN---square1
            if ninja(Vpos-SQ_Y1)(99-(Hpos-SQ_X1))='0' then--------------ninja bitmap
                 R <= (OTHERS =>'0');
                 G <= (OTHERS =>'0');
                 B <= (OTHERS =>'0');
            else
                 R <= (OTHERS =>'1');
                 G <= (OTHERS =>'1');
                 B <= (OTHERS =>'1');
           end if; 
        ELSIF (DRAW2='1' and multiplayer_signal='1') THEN---square2
            if ninja(Vpos-SQ_Y2_2)(99-(Hpos-SQ_X2))='0' then--------------ninja bitmap
                 R <= (OTHERS =>'0');
                 G <= (OTHERS =>'0');
                 B <= (OTHERS =>'0');
            else
                 R <= (OTHERS =>'1');
                 G <= (OTHERS =>'0');
                 B <= (OTHERS =>'1');
           end if;
        ELSIF ((HPOS>465 AND HPOS<465+25)AND(VPOS>SQ_Y2+random_adder+45 AND VPOS< SQ_Y2+25+random_adder+45)and close_reward='0')THEN-- REWARD
            R<= (OTHERS=> '1');
            G<= (OTHERS=> '0');
            B<= (OTHERS=> '0');  
       ELSE
             R<= (OTHERS=> '0');
             G<= (OTHERS=> '0');
             B<= (OTHERS=> '0');
       END IF; 
            
 end if;     
 
       
                   
     IF (HPOS<800)THEN
        HPOS <= HPOS +1;
        ELSE
        HPOS <= 0;
            IF(VPOS<525) THEN
            VPOS<= VPOS+ 1;
            ELSE 
            ----------------------------------------------------------- square one movement
                IF ((KEYS(0)='1' or right_movement_for_plyr_one='1') and (SQ_X1<520-5)) THEN
                    SQ_X1<= SQ_X1+5;
                    
                ELSIF ( (KEYS(1)='1' or left_movement_for_plyr_one='1')AND (SQ_X1> 320+5)) THEN
                    SQ_X1<= SQ_X1-5;
                ELSE
                     SQ_X1<= SQ_X1;
                END IF;
                ------------------------------------------------------------
                ------------------------------------------------------------- square two movement
                IF  (  multiplayer_signal='1' and right_movement='1' AND  (SQ_X2<520-5)) THEN
                    SQ_X2<= SQ_X2+5;
                    
                ELSIF ( multiplayer_signal='1' and left_movement='1' AND (SQ_X2> 320+5)) THEN
                    SQ_X2<= SQ_X2-5;
                ELSE
                     SQ_X2<= SQ_X2;
                END IF; 
               ---------------------------------------------------------------- 
  ------------------------------------------------------------------------------------------ reward system for player one 
           if reset='1' then
              count<=0;
           else
             if count/=3 then
             counter<=0;
            gameover1<=gameover1_inner;
            gameover2<=gameover2_inner;
                if reward_inner='1' then
                        count<=count+1;
                    end if;
         
            else    
                  if counter<=600 then
                    counter<=counter+1;
                    gameover1<='0';
                    gameover2<='0';
                 else
                    gameover1<=gameover1_inner;
                    gameover2<=gameover2_inner;
--                      count<=0;
                 end if;
                if reward_inner='1' then
                        count<=count+1;
                    end if;
        end if;
         end if; 
 --------------------------------------------------------------------------------------------------------         
              
------------------------------------------------------------------------------------------------------ reward system for player two 
           if reset='1' then
              count_for_player_two<=0;
           else
             if count_for_player_two/=3 then
             counter_for_player_two<=0;
            gameover1_for_second_player<=gameover1_inner_for_second_plyr;
            gameover2_for_second_player<=gameover2_inner_for_second_plyr;
                if reward_inner='1' then
                        count_for_player_two<=count_for_player_two+1;
                    end if;
         
            else    
                  if counter_for_player_two<=600 then
                     counter_for_player_two<=counter_for_player_two+1;
                    gameover1_for_second_player<='0';
                    gameover2_for_second_player<='0';
                 else
                    gameover1_for_second_player<=gameover1_inner_for_second_plyr;
                    gameover2_for_second_player<=gameover2_inner_for_second_plyr;
--                      count<=0;
                 end if;
                if reward_inner_for_second_plyr='1' then
                        count_for_player_two<=count_for_player_two+1;
                    end if;
        end if;
        end if;
 --------------------------------------------------------------------------------------------------------       
            VPOS<=0;
----------------------------------------------------------------------------------- clock for random number for both multi and single player
           if SQ_Y1/=0 then
                random_clk<='0';
            else
                random_clk<='1';
            end if;
            ----------------------------------------------------------------- square one movement int at  single player or multipalyer state 
            IF (single_player_signal='1' or multiplayer_signal='1') THEN
                SQ_Y1<= SQ_Y1-speed_counter;
            else
                SQ_X1<= 320;
                SQ_Y1<=484;
            END IF;
            -------------------------------------------------------------------------------------
            ----------------------------------------------------------------- square two movement int at  single player or multipalyer state 
            IF (multiplayer_signal='1') THEN
                SQ_Y2_2<= SQ_Y2_2-speed_counter_for_plyr_two;
            else
                SQ_X2<= 320;
                SQ_Y2_2<=484;
            END IF;
            ---------------------------------------------------------------------------------------------------------------------------------------------------
           END IF;
        END IF;
    IF (HPOS> 16 AND HPOS< 112) THEN
        HSYNC <= '0';
    ELSE
        HSYNC <= '1';
    END IF;
    IF (VPOS> 0 AND VPOS< 12) THEN
          VSYNC <= '0';
    ELSE
          VSYNC <= '1';
    END IF;
    
    IF ((HPOS>0 AND HPOS< 160)OR (VPOS>0 AND VPOS<45)) THEN
        R <= (OTHERS =>'0');
        G <= (OTHERS =>'0');
        B <= (OTHERS =>'0');
     END IF;

 END IF;
 END PROCESS;
 --------------------------------------------------------------------------------------------------------------------square one hitting obstacle and collecting reward
 --------------------------------------------------------------------------------------------
 process(SQ_X1,SQ_Y1,Left_Wall_up_y_boundry)
    begin
        for x in 320 to 440  loop-- hitting for obsticle 1
             IF ((x>=SQ_X1 and x<=SQ_X1+100) and ( SQ_Y1<=(Left_Wall_up_y_boundry +45+60) and (Left_Wall_up_y_boundry +45+60)<=SQ_Y1+50)) then
                gameover1_inner<='1';
                led(2)<='1';
                exit;
             else
                 gameover1_inner<='0';
                 led(2)<='0';
             end if;
        end loop;
      end process;
---- -----------------------------------------------------------------------------------------------
  process(SQ_X1,SQ_Y1,Right_Wall_up_y_boundry)
  begin
        for x in 500 to 620  loop
             IF ((x>=SQ_X1 and x<=SQ_X1+100) and ( SQ_Y1<=(Right_Wall_up_y_boundry +45+60 - random_adder_for_obs_two) and (Right_Wall_up_y_boundry +45+60 - random_adder_for_obs_two)<=SQ_Y1+50)) then-- hitting for obsticle 2
                 gameover2_inner<='1';
                 led(1)<='1';
                exit;
             else
                 gameover2_inner<='0';
                 led(1)<='0';
             end if;
        end loop;
       end process;
---------------------------------------------------------------------------------------------------     
 process(SQ_X1,SQ_Y1,SQ_Y2)
  begin
        
        for x in 445 to 469  loop
             IF ((x>=SQ_X1 and x<=SQ_X1+100) and ( SQ_Y1<=(SQ_Y2+random_adder+45) and (SQ_Y2+random_adder+45+25)<=SQ_Y1+50)) then-- hitting reward
                led(0)<='1';
                reward_inner<= '1';
                exit;
             else
                led(0)<='0';
                reward_inner<= '0';
             end if;
        end loop;
 end process;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------- 

---- --------------------------------------------------------------------------------------------------------------------square two hitting obstacle and collecting reward
---- --------------------------------------------------------------------------------------------
 process(SQ_X2,SQ_Y2_2,Left_Wall_up_y_boundry)
    begin
        for x in 320 to 440  loop-- hitting for obsticle 2
             IF ((x>=SQ_X2 and x<=SQ_X2+100) and ( SQ_Y1<=(Left_Wall_up_y_boundry +45+60) and (Left_Wall_up_y_boundry +45+60)<=SQ_Y2_2+50)) then
                gameover1_inner_for_second_plyr<='1';
          
                exit;
             else
                 gameover1_inner_for_second_plyr<='0';
             end if;
        end loop;
      end process;
---- -----------------------------------------------------------------------------------------------
  process(SQ_X2,SQ_Y2_2,Right_Wall_up_y_boundry)
  begin
        for x in 500 to 620  loop
             IF ((x>=SQ_X2 and x<=SQ_X2+100) and ( SQ_Y2_2<=(Right_Wall_up_y_boundry +45+60 - random_adder_for_obs_two) and (Right_Wall_up_y_boundry +45+60 - random_adder_for_obs_two) <=SQ_Y2_2+50)) then-- hitting for obsticle 2
                 gameover2_inner_for_second_plyr<='1';
 
                exit;
             else
                 gameover2_inner_for_second_plyr<='0';
   
             end if;
        end loop;
       end process;
-----------------------------------------------------------------------------------------------------     
 process(SQ_X2,SQ_Y2_2,SQ_Y2)
  begin
        
        for x in 445 to 469  loop
             IF ((x>=SQ_X2 and x<=SQ_X2+100) and ( SQ_Y2_2<=(SQ_Y2+random_adder+45) and (SQ_Y2+random_adder+45+25)<=SQ_Y2_2+50)) then-- hitting reward
     
                reward_inner_for_second_plyr<= '1';
                exit;
             else
    
                reward_inner_for_second_plyr<= '0';
             end if;
        end loop;
 end process;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
  
 reward_counter_led<=STD_LOGIC_VECTOR(to_unsigned(count,3));
 
 
process(OutClock_slow)
begin

   if reset='1' then
       speed_counter<=2;
  elsif rising_edge(OutClock_slow) then
        speed_counter<=speed_counter+2;
        if speed_counter=4 then
            speed_counter<=speed_counter;
            end if;
   end if;

end process;

process(OutClock_slow)
begin


   if reset='1' then
       speed_counter_for_plyr_two<=2;
   elsif  rising_edge(OutClock_slow) then
    speed_counter_for_plyr_two<=speed_counter_for_plyr_two+2;
    if speed_counter_for_plyr_two=4 then
        speed_counter_for_plyr_two<=speed_counter_for_plyr_two;
        end if;
     end if;

end process;

end MAIN;
