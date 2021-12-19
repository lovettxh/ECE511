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

entity carry_generate is
    port(a: in std_logic_vector(3 downto 0);
         b: in std_logic_vector(3 downto 0);
         cin: in std_logic;
         cout: out std_logic);
end carry_generate;

architecture Behavioral of carry_generate is

begin
    cout <= (a(3) and b(3)) or ((a(2) and b(2)) and (a(3) or b(3))) or ((a(1) and b(1)) and (a(2) or b(2)) and (a(3) or b(3))) 
            or ((a(0) and b(0)) and (a(1) or b(1)) and (a(2) or b(2)) and (a(3) or b(3))) or (cin and ((a(0) or b(0))) and (a(1) or b(1)) and (a(2) or b(2)) and (a(3) or b(3)));

end Behavioral;
