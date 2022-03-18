LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FullAdd IS
    PORT (x, y, cin: IN STD_LOGIC;
        sum, cout: OUT STD_LOGIC);
END FullAdd;

ARCHITECTURE FullAddBehaviour OF FullAdd IS
    BEGIN
    sum <= x XOR y XOR cin;
    cout <= (x AND y) OR (x AND cin) OR (y AND cin);
END FullAddBehaviour;
