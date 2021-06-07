
ENTITY biestable IS
	PORT(	
        clk: in bit;
	rst_n: in bit;
	en:in bit;
        d: in bit;
        q: out bit);
END biestable;

ARCHITECTURE comportamiento OF biestable IS
BEGIN
	PROCESS(clk,rst_n)
	BEGIN
		IF (rst_n='0') THEN
			q <= '0';
		ELSIF (rising_edge (clk)) THEN
			if en='1' then
				q <= d;
			end if;
		END IF;
	END PROCESS;
END comportamiento;


