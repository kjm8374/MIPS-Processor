----------------------------------------------------------------------------------
-- Company: Rochester Institute of Technology(RIT)
-- Engineer: Kushal Malhotra(kjm8374@rit.edu)
-- 
-- Create Date: 02/15/2020 01:31:35 PM
-- Design Name: InstrucDecode
-- Module Name: InstrucDecode - Behavioral
-- Project Name: InstrucDecode
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

entity InstrucDecode is
  Port ( 
         clk          : IN std_logic;
         Instruction  : IN std_logic_vector(31 downto 0);
         RegWriteAddr : IN std_logic_vector(4 downto 0);
         RegWriteData : IN std_logic_vector(31 downto 0);
         RegWriteEn   : IN std_logic;
         RegWrite     : OUT std_logic;
         MemtoReg     : OUT std_logic;
         MemWrite     : OUT std_logic;
         ALUControl   : OUT std_logic_vector(3 downto 0);
         ALUSrc       : OUT std_logic;
         RegDst       : OUT std_logic;
         RD1          : OUT std_logic_vector(31 downto 0);
         RD2          : OUT std_logic_vector(31 downto 0);
         RtDest       : OUT std_logic_vector(4 downto 0);
         RdDest       : OUT std_logic_vector(4 downto 0);
         Immout       : OUT std_logic_vector(31 downto 0)
   
       );
end InstrucDecode;

architecture Behavioral of InstrucDecode is

Component RegisterFile is
generic(
		BIT_DEPTH      : integer := 32; --Bit depth of signals
		LOG_PORT_DEPTH : integer := 5 --log_2 of the signal width
	);
	
PORT( 
     Addr1      : IN std_logic_vector(LOG_PORT_DEPTH-1 downto 0);
     Addr2      : IN std_logic_vector(LOG_PORT_DEPTH-1 downto 0);
     Addr3      : IN std_logic_vector(LOG_PORT_DEPTH-1 downto 0);
     wd         : IN std_logic_vector(BIT_DEPTH-1 downto 0);
     clk_n      : IN std_logic;
     we         : IN std_logic;
     reset      : IN std_logic;
     RD1        : OUT std_logic_vector(BIT_DEPTH-1 downto 0);
     RD2        : OUT std_logic_vector(BIT_DEPTH-1 downto 0)
    );
end component; 	

Component ControlUnit is
Port ( 
       Opcode     : IN std_logic_vector(5 downto 0);
       Funct      : IN std_logic_vector(5 downto 0);
       RegWrite   : OUT std_logic;
       MemtoReg   : OUT std_logic;
       MemWrite   : OUT std_logic;
       ALUControl : OUT std_logic_vector(3 downto 0);
       ALUSrc     : OUT std_logic;
       RegDst     : OUT std_logic
     );
end Component;

begin

regfile : RegisterFile
generic map (
             BIT_DEPTH     => 32,
		     LOG_PORT_DEPTH => 5 
		    )
port map    (
              Addr1   => Instruction(25 downto 21),
              Addr2   => Instruction(20 downto 16),
              Addr3   => RegWriteAddr,
              wd      => RegWriteData,
              clk_n   => clk,
              we      => RegWriteEn,
              reset   => '0',
              RD1     => RD1,
              RD2     => RD2
             );
             
           
control_unit : ControlUnit

port map (
          Opcode    => Instruction(31 downto 26),              
          Funct     => Instruction(5 downto 0),  
          RegWrite  => RegWrite,   
          MemtoReg  => MemtoReg,
          MemWrite  => MemWrite,
          ALUControl=> ALUControl,
          ALUSrc    => ALUSrc,
          RegDst    => RegDst
         );
         
RtDest <= Instruction(20 downto 16);
RdDest <= Instruction(15 downto 11);

ImmOut(15 downto 0) <=  Instruction(15 downto 0);
ImmOut(31 downto 16) <= (others => Instruction(15));


end Behavioral;
