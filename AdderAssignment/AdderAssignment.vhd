LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;


ENTITY AdderAssignment IS
	PORT (X, Y: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		ZClone: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		LED: OUT STD_LOGIC_VECTOR(13 DOWNTO 0));
END AdderAssignment;

ARCHITECTURE AdderBehaviour OF AdderAssignment IS
SIGNAL m: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Z: STD_LOGIC_VECTOR(3 DOWNTO 0);
	COMPONENT FullAdd IS 
		PORT (x, y, cin: IN STD_LOGIC;
		sum, cout: OUT STD_LOGIC);
	END COMPONENT;
	BEGIN
	stage0: FullAdd PORT MAP(X(0), Y(0), '0', Z(0), m(0));
	stage1: FullAdd PORT MAP(X(1), Y(1), m(0), Z(1), m(1));
	stage2: FullAdd PORT MAP(X(2), Y(2), m(1), Z(2), m(2));
	Z(3) <= m(2);
	ZClone <= Z;
	PROCESS(Z)
	BEGIN
		CASE Z IS
			WHEN "0000" => LED(13 DOWNTO 7) <= NOT "0111111"; 
								LED(6 DOWNTO 0) <= NOT "0111111";
								
			WHEN "0001" => LED(13 DOWNTO 7) <= NOT "0111111";
								LED(6 DOWNTO 0) <= NOT "0000110";
								
			WHEN "0010" => LED(13 DOWNTO 7) <= NOT "0111111";
								LED(6 DOWNTO 0) <= NOT "1011011";
								
			WHEN "0011" => LED(13 DOWNTO 7) <= NOT "0111111";
								LED(6 DOWNTO 0) <= NOT "1001111";
								
			WHEN "0100" => LED(13 DOWNTO 7) <= NOT "0111111";
								LED(6 DOWNTO 0) <= NOT "1100110";
								
			WHEN "0101" => LED(13 DOWNTO 7) <= NOT "0111111";
								LED(6 DOWNTO 0) <= NOT "1101101";
								
			WHEN "0110" => LED(13 DOWNTO 7) <= NOT "0111111";
								LED(6 DOWNTO 0) <= NOT "1111101";
								
			WHEN "0111" => LED(13 DOWNTO 7) <= NOT "0111111";
								LED(6 DOWNTO 0) <= NOT "0000111";
								
			WHEN "1000" => LED(13 DOWNTO 7) <= NOT "0111111";
								LED(6 DOWNTO 0) <= NOT "1111111";
								
			WHEN "1001" => LED(13 DOWNTO 7) <= NOT "0111111";
								LED(6 DOWNTO 0) <= NOT "1101111";
								
			WHEN "1010" => LED(13 DOWNTO 7) <= NOT "0000110";
								LED(6 DOWNTO 0) <= NOT "0111111";
								
			WHEN "1011" => LED(13 DOWNTO 7) <= NOT "0000110";
								LED(6 DOWNTO 0) <= NOT "0000110";
								
			WHEN "1100" => LED(13 DOWNTO 7) <= NOT "0000110";
								LED(6 DOWNTO 0) <= NOT "1011011";
								
			WHEN "1101" => LED(13 DOWNTO 7) <= NOT "0000110";
								LED(6 DOWNTO 0) <= NOT "1001111";
								
			WHEN "1110" => LED(13 DOWNTO 7) <= NOT "0000110";
								LED(6 DOWNTO 0) <= NOT "1100110";
			WHEN OTHERS => LED <= "--------------";
		END CASE;
	END PROCESS;
END AdderBehaviour;