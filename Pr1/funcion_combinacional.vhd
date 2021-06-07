-------------------------------------------
-- definición de puertas para el multiplexor4a1
-------------------------------------------
--puerta lógica or de cuatro entradas
ENTITY or4 IS
  PORT(i1, i2,i3,i4 : IN bit; o : OUT bit);
END or4;

ARCHITECTURE comportamiento OF or4 IS
BEGIN
  o <= i1 OR i2 OR i3 OR i4;
END comportamiento;

--puerta lógica and de cuatro entradas
ENTITY and3 IS
  PORT(i1, i2,i3: IN bit; o : OUT bit);
END and3;

ARCHITECTURE comportamiento OF and3 IS
BEGIN
   o <= i1 and i2 and i3;
END comportamiento;

--puerta lógica inv de dos entradas
ENTITY inv IS
  PORT(i1 : IN bit; o : OUT bit);
END inv;

ARCHITECTURE comportamiento OF inv IS
BEGIN
  o <= not i1;
END comportamiento;



entity funcion_combinacional is
	port(	x2,x1,x0: 	in bit;	 -- entradas de datos
			f: 			out bit);			-- salida
end funcion_combinacional;


architecture puertas of funcion_combinacional is

--declaración de componentes
  component or4 
    	port(i1, i2,i3,i4 : in bit; o : out bit);
  end component;
  
  component and3
    	 PORT(i1, i2,i3: IN bit; o : OUT bit);
  end component;
  
  component inv
   	 port(i1 : in bit; o : out bit);
  end component;
  
  --declaración de señales internas
  signal not_x2,not_x1,not_x0,ao1,ao2,ao3,ao4: bit;

--empieza el cuerpo de la arquitectura  
begin
	i_inv_2 : inv  port map(x2, not_x2);
	i_inv_1 : inv  port map(x1,not_x1);
	i_inv_0 : inv  port map(x0,not_x0);

	i_and_1 : and3  port map(not_x2,not_x1,not_x0,ao1);
	i_and_2 : and3  port map(not_x2,not_x1,x0, ao2);
	i_and_3 : and3  port map(x2,not_x1,not_x0,ao3);
	i_and_4 : and3  port map(x2,not_x1,x0,ao4);

	i_or_1  : or4   port map(ao1,ao2,ao3,ao4,f);

end puertas;
