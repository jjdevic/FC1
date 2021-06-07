
entity decodificador2a4 is
port (	entrada: in bit_vector(1 downto 0); --- Entradas de dirección
		en: in bit; 					--- Entrada de habilitación
		salida: out bit_vector(3 downto 0)); --- Salidas
end decodificador2a4;
architecture comportamiento of decodificador2a4 is
begin
	process (entrada, en)
	begin
		if en = '0' then
			salida <= "0000";
		else
			case entrada is
				when "00" => salida <= "0001";
				when "01" => salida <= "0010";
				when "10" => salida <= "0100";
				when "11" => salida <= "1000";
				when others => salida <= "0000";
			end case;
		end if;
	end process;
end comportamiento;