library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


ENTITY GARAGE IS 
PORT (CLK,ButtonInput,infraInput, ButtonInputEX ,smokeInput,infraInputEX,CLKEX: IN std_logic;
		PWM :OUT STD_LOGIC;
				PWMEX :OUT STD_LOGIC;
		RED : OUT STD_logic:='1'; 
				green : OUT STD_logic:='1';

		LED :OUT STD_LOGIC_VECTOR (13 downto 0);
		buzz: OUT std_logic); 
END GARAGE;


ARCHITECTURE ARCH of GARAGE IS
	SIGNAL Flag :StD_logic:= '0';
	SIGNAL Flag2 :StD_logic:= '0';
		SIGNAL FlagEX :StD_logic:= '0';

	SIGNAL MOTORINP: Std_logic:='0';
		SIGNAL MOTORINPEX: Std_logic:='0';

	Signal	 counter:  integer range  0 to 17:=0;

		SIGNAL MaxC: Std_logic:='0';

	BEGIN
	motorFunc: ENTITY work.motorFunc(behave)
	port map( 
				CLK => CLK,
				MOTORINP => MOTORINP,
				MaxC=>MaxC,
				
				PWM => PWM
				);
	motorFunc2: ENTITY work.motorFunc2(behave)
	port map( 
				CLK => CLK,
				MOTORINP => MOTORINPEX,
				
				PWM => PWMEX
				);
				
				
		process(infraInput, ButtonInput, clk, ButtonInputEX, infraInputEX)

			begin
			
			if clk'Event and clk = '1' then
				
				if infraInputEX = '0' and FlagEX = '1' and counter > 0 then
					
					FlagEX <= '0';
					MOTORINPEX <= '0';
					MaxC <= '0';
					red <= '1';
					green <= '1';
					counter <= counter - 1;
						
				else if ButtonInputEX = '0' and counter > 0 then
					
					FlagEX <= '1';
					MaxC <= '0';
					red <= '1';
					green <= '1';
					MOTORINPEX <= '1';
				
				else if counter = 15 then
					
					MaxC <= '1';
					red <= '0';
					green <= '0';
				
				else if infraInput = '0' and Flag = '1' then
					
					Flag <= '0';
					MOTORINP <= '0';
					counter <= counter + 1;
				
				else if ButtonInput = '0' then
					Flag <= '1';
					MOTORINP <= '1';
			
				end if;	
				end if;
				end if;
				end if;
				end if;	
			end if;	
			end process;


			process (smokeInput)
				begin
					if smokeInput ='0' then
						Buzz <= '1';
					else
						Buzz <= '0';
					end if;
				end process;


	
			   WITH counter SELECT
            LED(13 DOWNTO 0)  <=  NOT "01111110111111" when 0,
                                  NOT "01111110000110" when 1,
                                  NOT "01111111011011" when 2,
                                  NOT "01111111001111" when 3,
                                  NOT "01111111100110" when 4,
                                  NOT "01111111101101" when 5,
                                  NOT "01111111111101" when 6,
                                  NOT "01111110000111" when 7,
                                  NOT "01111111111111" when 8,
                                  NOT "01111111101111" when 9,
                                  NOT "00001100111111" when 10,
                                  NOT "00001100000110" when 11,
                                  NOT "00001101011011" when 12,
                                  NOT "00001101001111" when 13,
                                  NOT "00001101100110" when 14,
                                  NOT "00001101101101" when OTHERS;

END ARCH;			