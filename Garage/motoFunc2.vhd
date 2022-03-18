library ieee;
use ieee.std_logic_1164.all;

ENTITY motorFunc2 IS
		PORT(CLK,MOTORINP: IN Std_logic;
						PWM : OUT STD_Logic);--na2es el count 
	END motorFunc2;
ARCHITECTURE behave OF motorFunc2 IS 

CONSTANT clk_hz : REAL := 10.0e6;
CONSTANT pulse_hz : REAL :=50.0;
CONSTANT min_pulse_us : REAL := 500.0;
CONSTANT max_pulse_us : REAL := 2500.0;
CONSTANT step_count : POSITIVE := 2**8;
SIGNAL position : INTEGER RANGE 0 TO step_count -1;
SIGNAL Flag: std_logic := '0';--close the gate

BEGIN
	
		Flag <= '1' WHEN (MOTORINP ='1' ) ELSE '0';--na2es el count wel instantantenous
		position <= 127 WHEN Flag = '1' ELSE 0;

		
 SERVOMAP : entity work.servo(serve)
				GENERIC MAP(
				clk_hz => clk_hz,
				pulse_hz => pulse_hz,
				min_pulse_us => min_pulse_us,
				max_pulse_us => max_pulse_us,
				step_count => step_count
				)
				
	port map (
		clk => clk,
		rst => '0',
		position => position,
		pwm => pwm
		);
END behave;