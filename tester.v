module probador (
  Clk, Reset,
	Pin, Vehiculo, Termino,
	Cerrado, Abierto, Alarma, Bloqueo
  );

output reg Clk, Reset, Vehiculo, Termino;
output reg [7:0] Pin;
input Alarma, Cerrado, Abierto, Bloqueo;

parameter Pin_correcto = 8'b00001000;
parameter Pin_espera = 8'b0;
parameter medio_T = 5;


  initial begin
    Clk = 0;
    Reset = 0;
    Vehiculo = 0;
    Termino = 0;
    Pin=Pin_espera;
    #5 Reset = 1; //5. reseteamos la máquina
    #10 Reset = 0; //15.
    #5 Vehiculo = 1; //llega vehiculo
    #3 Pin = 8'b11111111; //introduce pin incorrecto
    #10 Pin = Pin_espera;//se apaga la entrada
    #3 Pin = 8'b11111111; //introduce pin incorrecto
    #10 Pin = Pin_espera;//se apaga la entrada
    #3 Pin = 8'b11111111; //introduce pin incorrecto
    #10 Pin = Pin_espera;//se apaga la entrada
    #3 Pin = 8'b11111111; //introduce pin incorrecto
    #10 Pin = Pin_espera;//se apaga la entrada
    #2 Pin = Pin_correcto; //introduce pin incorrecto
    #10 Pin = Pin_espera;//se apaga la entrada
    #20 $finish;
  end

  always begin
    #medio_T Clk = !Clk;
  end

endmodule
