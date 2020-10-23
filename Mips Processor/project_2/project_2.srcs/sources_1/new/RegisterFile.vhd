----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology(RIT)
-- Engineer: Kushal Malhotra(kjm8374@rit.edu)
-- 
-- Create Date: 01/23/2020 08:47:19 AM
-- Design Name: RegisterFile
-- Module Name: RegisterFile - Behavioral
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

entity RegisterFile is
generic(
		BIT_DEPTH : integer := 32; --Bit depth of signals
		LOG_PORT_DEPTH : integer := 5 --log_2 of the signal width
	);
	
PORT( 
     Addr1,Addr2,Addr3 : IN std_logic_vector(LOG_PORT_DEPTH-1 downto 0);
     wd                : IN std_logic_vector(BIT_DEPTH-1 downto 0);
     clk_n,we,reset          : IN std_logic;
     RD1,RD2           : OUT std_logic_vector(BIT_DEPTH-1 downto 0)
    ); 	
end RegisterFile;

architecture Behavioral of RegisterFile is

Component genericDecoder is
	generic(
    LOG_PORT_DEPTH : integer := 3);
Port (
      Addr_3        : IN std_logic_vector(LOG_PORT_DEPTH-1 downto 0);
      output_to_and : OUT std_logic_vector(2**LOG_PORT_DEPTH-1 downto 0)
     );
end Component;

Component two_input_and is
PORT ( 
      A           : IN STD_LOGIC;
      we          : IN STD_LOGIC;
      output      : OUT STD_LOGIC
      
      );
end Component;

Component RegisterModule is
Generic ( BIT_DEPTH : integer := 8);
Port ( 
      input      : IN std_logic_vector(BIT_DEPTH -1 downto 0);
      clk_n,we,reset   : IN std_logic;
      output     : OUT std_logic_vector(BIT_DEPTH -1 downto 0)
      
     );
end Component;


Component genericMux is
	generic(
		BIT_DEPTH : integer := 8; --Bit depth of signals
		LOG_PORT_DEPTH : integer := 3 --log_2 of the signal width
	);
	port(
		X	: in std_logic_vector(((2**LOG_PORT_DEPTH) * BIT_DEPTH)-1 downto 0);
		Sel : in std_logic_vector(LOG_PORT_DEPTH-1 downto 0);
		Y	: out std_logic_vector(BIT_DEPTH-1 downto 0)
	);
end Component;

signal decode_out : std_logic_vector(2**LOG_PORT_DEPTH - 1 downto 0);
signal and_out    : std_logic_vector(2**LOG_PORT_DEPTH - 1 downto 0);
signal reg_out : std_logic_vector(((2**LOG_PORT_DEPTH)*BIT_DEPTH)-1 downto 0);
signal RD1_sig : std_logic_vector(BIT_DEPTH-1 downto 0);
signal RD2_sig : std_logic_vector(BIT_DEPTH-1 downto 0);

begin

decode : genericDecoder
 GENERIC MAP ( LOG_PORT_DEPTH => 5)
 PORT MAP ( 
            Addr_3        => Addr3,            output_to_and => decode_out
          );
          
 and_gen : FOR I IN 0 TO 2**LOG_PORT_DEPTH - 1 GENERATE
    and_gate : two_input_and
        PORT MAP (
                A      => decode_out(I),
                we     => we,
                output => and_out(I)
                );
 END GENERATE and_gen;
          
module_gen : FOR I IN 0 TO 2**LOG_PORT_DEPTH - 1 GENERATE
    module : RegisterModule
    Generic Map( BIT_DEPTH => 32)
    Port Map( 
      input  => wd,
      clk_n  => clk_n,
      reset  => reset,
      we     => and_out(I),
      output => reg_out(((i+1) * BIT_DEPTH) - 1 downto (i * BIT_DEPTH))
     );
END GENERATE module_gen;


mux1 : genericMux 
GENERIC MAP (
        BIT_DEPTH => 32,
		LOG_PORT_DEPTH => 5
		)
PORT MAP (
		X   => reg_out,
        Sel => Addr1,
        Y   => RD1_sig
        );
        
mux2 : genericMux 
        GENERIC MAP (
                BIT_DEPTH => 32,
                LOG_PORT_DEPTH => 5
                )
        PORT MAP (
                X   => reg_out,
                Sel => Addr2,
                Y   => RD2_sig
                );
                
 RD1 <= x"00000000" when Addr1 = "00000" else
        RD1_sig;
 RD2 <= x"00000000" when Addr2 = "00000" else
        RD2_sig;
         

end Behavioral;
