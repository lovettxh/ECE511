----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/12/19 03:59:52
-- Design Name: 
-- Module Name: approx_adder - Behavioral
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

entity approx_adder is
    port(a: in std_logic_vector(31 downto 0);
         b: in std_logic_vector(31 downto 0);
         s: out std_logic_vector(31 downto 0));
end approx_adder;

architecture Behavioral of approx_adder is
    component clg_4 is
        port(a: in std_logic_vector(3 downto 0);
             b: in std_logic_vector(3 downto 0);
             cin: in std_logic;
             cout: out std_logic_vector(2 downto 0));
    end component;
    component sum_generate is
        port(a: in std_logic_vector(3 downto 0);
             b: in std_logic_vector(3 downto 0);
             cin: in std_logic;
             clgin: in std_logic_vector(2 downto 0);
             s: out std_logic_vector(3 downto 0));
    end component;
    component carry_generate is
        port(a: in std_logic_vector(3 downto 0);
             b: in std_logic_vector(3 downto 0);
             cin: in std_logic;
             cout: out std_logic);
    end component;
    signal temp_clg1,temp_clg2, temp_clg3,temp_clg4: std_logic_vector(2 downto 0);
    signal temp_carry: std_logic_vector(3 downto 0);
begin
    process
    begin
    for i in 16 to 31 loop
        s(i) <= a(i) or b(i);
    end loop;
    end process;
    sum4:sum_generate port map(a=>a(15 downto 12), b=>b(15 downto 12), cin=>'0', clgin=>temp_clg4 );
    clg4:clg_4 port map(a=>a(15 downto 12), b=>b(15 downto 12), cin=>'0', cout=>temp_clg4);
    carry4:carry_generate port map(a=>a(15 downto 12), b=>b(15 downto 12), cin=>'0', cout=>temp_carry(3));
    
    sum3:sum_generate port map(a=>a(11 downto 8), b=>b(11 downto 8), cin=>temp_carry(3), clgin=>temp_clg3 );
    clg3:clg_4 port map(a=>a(11 downto 8), b=>b(11 downto 8), cin=>temp_carry(3), cout=>temp_clg3);
    carry3:carry_generate port map(a=>a(11 downto 8), b=>b(11 downto 8), cin=>'0', cout=>temp_carry(2));
    
    sum2:sum_generate port map(a=>a(7 downto 4), b=>b(7 downto 4), cin=>temp_carry(2), clgin=>temp_clg2 );
    clg2:clg_4 port map(a=>a(7 downto 4), b=>b(7 downto 4), cin=>temp_carry(2), cout=>temp_clg2);
    carry2:carry_generate port map(a=>a(7 downto 4), b=>b(7 downto 4), cin=>'0', cout=>temp_carry(1));
    
    sum1:sum_generate port map(a=>a(3 downto 0), b=>b(3 downto 0), cin=>temp_carry(1), clgin=>temp_clg1 );
    clg1:clg_4 port map(a=>a(3 downto 0), b=>b(3 downto 0), cin=>temp_carry(1), cout=>temp_clg1);
        

end Behavioral;
