----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology(RIT)
-- Engineer: Kushal Malhotra(kjm8374@rit.edu)
-- 
-- Create Date: 01/23/2020 08:47:19 AM
-- Design Name: RegisterModule
-- Module Name: RegisterModule - Behavioral
-- Project Name: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterModule is
Generic ( BIT_DEPTH : integer := 32);
Port ( 
      input      : IN std_logic_vector(BIT_DEPTH -1 downto 0);
      clk_n,we,reset   : IN std_logic;
      output     : OUT std_logic_vector(BIT_DEPTH -1 downto 0)
      
     );
end RegisterModule;

architecture Behavioral of RegisterModule is

--signal sig_result_out : std_logic_vector(BIT_DEPTH -1 downto 0);

begin

process (clk_n,reset)
begin
    if reset = '1' then
        output <= (others => '0');
    elsif falling_edge(clk_n) then
      if (we = '1') then
         output <= input;
     end if;
       --output <= sig_result_out;
   end if;

 end process;
end Behavioral;
