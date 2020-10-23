----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2020 11:00:35 PM
-- Design Name: 
-- Module Name: DataMemory - Behavioral
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

Entity DataMemory is
generic ( RAM_WIDTH : integer := 32;
          ADDR_SPACE : integer := 10);

 port(
      clk       : IN std_logic;
      we        : IN std_logic;
	  addr      : IN std_logic_vector(ADDR_SPACE-1 downto 0);
	  d_in      : IN std_logic_vector(RAM_WIDTH-1 downto 0);
	  switches  : IN std_logic_vector(15 downto 0);
	  d_out     : OUT std_logic_vector(RAM_WIDTH-1 downto 0);
	  seven_seg : OUT std_logic_vector(15 downto 0)
	  );
end entity;

Architecture Behave of DataMemory is

type ram_array is array ((2** ADDR_SPACE)-1 downto 0) of std_logic_vector(RAM_WIDTH-1 downto 0);

signal mips_mem : ram_array := (others => (others => '0'));
--signal d_out_sig : std_logic_vector(RAM_WIDTH -1 downto 0);
constant max : std_logic_vector(ADDR_SPACE-1 downto 0) := "1111111111";
constant max2 : std_logic_vector(ADDR_SPACE-1 downto 0) := "1111111110";
begin
 
write_to_mem:process (clk) is
begin
if (rising_edge(clk)) then
  if (we = '1') then
    mips_mem(to_integer(unsigned(addr))) <= d_in;
  end if;
end if;
end process;

max_val:process (clk) is
begin
if (rising_edge(clk)) then
  if (addr = max) then
    if (we = '1') then
      seven_seg <= d_in(15 downto 0);
    end if;
  end if;
end if;
end process;

process (addr,switches,we,clk,d_in) is
begin
  if (addr = max2) then 
    d_out <= x"0000" & switches;
  else
    d_out <= mips_mem(to_integer(unsigned(addr)));
  end if;
  
end process;

end Behave;  

