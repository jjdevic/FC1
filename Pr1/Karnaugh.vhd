-------------------------------------------
-- definición de puertas para el multiplexor4a1
-------------------------------------------
--puerta lógica or de dos entradas
ENTITY or2 IS
  PORT(i1, i2: IN bit; o : OUT bit);
END or2;

ARCHITECTURE comportamiento OF or2 IS
BEGIN
  o <= i1 OR i2;
END comportamiento;

--puerta lógica and de dos entradas
ENTITY and2 IS
  PORT(i1, i2: IN bit; o : OUT bit);
END and2;

ARCHITECTURE comportamiento OF and2 IS
BEGIN
   o <= i1 and i2;
END comportamiento;

--puerta lógica inv 
ENTITY inv IS
  PORT(i1 : IN bit; o : OUT bit);
END inv;

ARCHITECTURE comportamiento OF inv IS
BEGIN
  o <= not i1;
END comportamiento;



entity Karnaugh is
	port(x2,x1,x0: 	in bit;	 	-- entradas de datos
		g: 		out bit);		-- salida
end Karnaugh;


architecture puertas of Karnaugh is

-- declaración de componente�
	component or2
		PORT(i1, i2: IN bit; o : OUT bit);
	end component;

	component and2
		PORT(i1, i2: IN bit; o : OUT bit);
	end component;

	component inv
		PORT(i1 : IN bit; o : OUT bit);
	end component;
--	declaración de señales
signal not_x0, not_x1, and0: bit;

begin
	i_inv_1 : inv port map(x1, not_x1);
	i_inv_0 : inv port map(x0, not_x0);
	
	i_and_0 : and2 port map(not_x0,x2,and0);
	
	i_or_0 : or2 port map(not_x1,and0,g);

end puertas;
