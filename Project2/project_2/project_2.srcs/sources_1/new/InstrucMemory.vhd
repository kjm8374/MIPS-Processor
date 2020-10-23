----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology
-- Engineer: Kushal Malhotra(kjm8374@rit.edu)
-- 
-- Create Date: 02/08/2020 06:06:55 PM
-- Design Name: InstrucMemory
-- Module Name: InstrucMemory - Behavioral
-- Project Name: InstrucFetch
-- Target Devices: Basys3
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstrucMemory is
    Port ( clk      : IN std_logic;
           addr     : IN std_logic_vector(27 downto 0);
           d_out    : OUT std_logic_vector(31 downto 0)
          );
end InstrucMemory;

architecture Behavioral of InstrucMemory is

type rom_type is array (0 to 1023) of std_logic_vector(7 downto 0);
signal ROM : rom_type := ( 
               ------------------------ PART A ---------------------------------------                                                                                
--                          x"20",x"01",x"00",x"0F", --ADDI R1,R0, 15
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP

--                          x"20",x"21",x"00",x"01", --ADDI R1,R1, 1
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00",
                          
--                          x"00",x"21",x"10",x"18", --MULTU R1,R1
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
                          
--                          x"00",x"21",x"10",x"20", --ADD R2, R1,R1
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
                          
--                          x"00",x"41",x"10",x"26", --xor R2, R2,R1
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP                                                  
                          
--                          x"00",x"41",x"10",x"22", --SUB R2, R2,R1
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
                          
--                          x"20",x"21",x"00",x"0A", --ADDI R1,R1, 11
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00",                           
                          
--                          x"00",x"41",x"10",x"00", --sll R2, R1,16
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
                                                   
                          
--                          x"00",x"41",x"10",x"03", --sra R2, R1,16
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP                                                    
                          
--                          x"AC",x"42",x"18",x"00", --SW R2, imm(R2)
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
                          
--                          x"8C",x"43",x"00",x"00", --LW R3, imm(R2)
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP
--                          x"00",x"00",x"00",x"00", --NOOP

               ------------------------ PART B Fibonnaci sequence ---------------------------------------                                                                                

                            x"20",x"01",x"00",x"01", --ADDI R1,R0, 1 --1
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            
                            x"AC",x"01",x"00",x"00", --SW R1, imm(R0)
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP                          
                            
                            x"00",x"01",x"10",x"20", --ADD R2,R1,R0 -- 1
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            
                            x"AC",x"22",x"00",x"00", --SW R2, imm(R1)
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP

                            x"00",x"22",x"18",x"20", --ADD R3,R2,R1 -- 2
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                           
                            x"AC",x"43",x"00",x"00", --SW R3, imm(R2)
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            
                            x"00",x"43",x"20",x"20", --ADD R4,R3,R2 -- 3
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            
                            x"AC",x"64",x"00",x"00", --SW R4, imm(R3)
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP   
                            
                            x"00",x"64",x"28",x"20", --ADD R5,R4,R3 -- 5
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            
                            x"AC",x"85",x"00",x"00", --SW R5, imm(R4)
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP                           

                            x"00",x"85",x"30",x"20", --ADD R6,R5,R4 -- 8
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            
                            x"AC",x"A6",x"00",x"00", --SW R6, imm(R5)
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            
                            x"00",x"A6",x"38",x"20", --ADD R7,R6,R5 -- 13
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                           
                            x"AC",x"C7",x"00",x"00", --SW R7, imm(R6)
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP                            

                            x"00",x"C7",x"40",x"20", --ADD R8,R7,R6 -- 21
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            
                            x"AC",x"E8",x"00",x"00", --SW R8, imm(R7)
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP

                            x"00",x"E8",x"48",x"20", --ADD R9,R8,R7
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            
                            x"AD",x"09",x"00",x"00", --SW R9, imm(R8)
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP

                            x"01",x"09",x"50",x"20", --ADD R10,R9,R8
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            
                            x"AD",x"2A",x"00",x"00", --SW R10, imm(R9)
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP
                            x"00",x"00",x"00",x"00", --NOOP                                                         
                          
                          others =>(others =>'0')
                          );

signal cons1 : unsigned(27 downto 0) := x"0000000";
signal cons2 : unsigned(27 downto 0) := x"0000000";
signal cons3 : unsigned(27 downto 0) := x"0000000";

begin

cons1 <= unsigned(addr) + "01";
cons2 <= unsigned(addr) + "10";
cons3 <= unsigned(addr) + "11";

process(clk)

begin
    if (rising_edge(clk)) then
      if (to_integer(unsigned(addr)) >= 1023) then 
        d_out   <= x"00000000";
      else 
        d_out(7 downto 0) <= ROM(to_integer(unsigned(cons3)));
        d_out(15 downto 8) <= ROM(to_integer(unsigned(cons2)));
        d_out(23 downto 16) <= ROM(to_integer(unsigned(cons1)));
        d_out(31 downto 24) <= ROM(to_integer(unsigned(addr)));
      end if;
    end if;
end process;

end Behavioral;



















