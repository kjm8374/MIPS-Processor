----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/23/2020 08:47:19 AM
-- Design Name: 
-- Module Name: genericMux - Behavioral
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

entity genericMux is
	generic(
		BIT_DEPTH : integer := 8; --Bit depth of signals
		LOG_PORT_DEPTH : integer := 3 --log_2 of the signal width
	);
	port(
		X	: in std_logic_vector(((2**LOG_PORT_DEPTH) * BIT_DEPTH)-1 downto 0);
		Sel : in std_logic_vector(LOG_PORT_DEPTH-1 downto 0);
		Y	: out std_logic_vector(BIT_DEPTH-1 downto 0)
	);
end genericMux;

architecture Behavioral of genericMux is
	type t_mux_arr is array(integer range <>) of std_logic_vector(BIT_DEPTH-1 downto 0);
	signal s_mux_arr : t_mux_arr(2**LOG_PORT_DEPTH-1 downto 0);
begin

	generate_inputs : for i in 0 to 2**LOG_PORT_DEPTH-1 generate
		s_mux_arr(i) <= X(((i+1) * BIT_DEPTH) - 1 downto (i * BIT_DEPTH));
	end generate;

	Y <= s_mux_arr(to_integer(unsigned(Sel)));

end Behavioral;
