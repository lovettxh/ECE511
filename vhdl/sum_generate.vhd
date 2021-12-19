----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2021/12/19 03:41:49
-- Design Name: 
-- Module Name: clg_4 - Behavioral
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

entity sum_generate is
    port(a: in std_logic_vector(3 downto 0);
         b: in std_logic_vector(3 downto 0);
         cin: in std_logic;
         clgin: in std_logic_vector(2 downto 0);
         s: out std_logic_vector(3 downto 0));
end sum_generate;

architecture Behavioral of sum_generate is

begin
    s(0) <= a(0) xor b(0) xor cin;
    s(1) <= a(1) xor b(1) xor clgin(0);
    s(2) <= a(2) xor b(2) xor clgin(1);
    s(3) <= a(3) xor b(3) xor clgin(2);
end Behavioral;
