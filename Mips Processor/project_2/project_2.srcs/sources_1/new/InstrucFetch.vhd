----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2020 08:45:22 AM
-- Design Name: 
-- Module Name: InstrucFetch - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstrucFetch is
Port ( clk         : IN std_logic;
       rst         : IN std_logic;
       Instruction : OUT std_logic_vector(31 downto 0) 
      );
end InstrucFetch;

architecture Behavioral of InstrucFetch is

Component InstrucMemory is
    Port ( clk      : IN std_logic;
           addr     : IN std_logic_vector(27 downto 0);
           d_out    : OUT std_logic_vector(31 downto 0)
          );
end Component;

signal pc_out : unsigned(27 downto 0) := x"0000000";
signal pc_in : unsigned(27 downto 0) := x"0000000";

begin

        --pc_in <= unsigned(pc_out) + "0100"; 
       
 Process(clk,rst)
 begin
    if (rst = '1') then
        pc_out <= x"0000000";
    elsif(rising_edge(clk)) then
        pc_out <= pc_out + "0100";
    end if;
 end process;
 
 
 
 Instmem:InstrucMemory
 PORT MAP(
           clk   => clk,  
           addr  => std_logic_vector(pc_out), 
           d_out => Instruction  
        );
        
 
end Behavioral;
