`include "tester.v"
`include "controlador.v"
                                        
// Testbench Code Goes here
module controlador_tb;

  wire Clk, Reset, Pin, Vehiculo, Termino, Cerrado, Abierto, Alarma, Bloqueo;

  initial begin
	$dumpfile("resultados.vcd");
	$dumpvars(-1, U0);
	$monitor ("Clk=%b, Reset=%b, Pin=%b, Vehiculo=%b, Termino=%b, Cerrado=%b, Abierto=%b, Alarma=%b, Bloqueo=%b, contador=%b",
  Clk, Reset, Pin, Vehiculo, Termino, Cerrado, Abierto, Alarma, Bloqueo);
  end

  controlador U0 (
    .Clk (Clk), 
    .Reset (Reset), 
    .Pin (Pin), 
    .Vehiculo (Vehiculo), 
    .Termino (Termino), 
    .Cerrado (Cerrado), 
    .Abierto (Abierto), 
    .Alarma (Alarma), 
    .Bloqueo (Bloqueo)
  );

  probador P0 (
    .Clk (Clk), 
    .Reset (Reset), 
    .Pin (Pin), 
    .Vehiculo (Vehiculo), 
    .Termino (Termino), 
    .Cerrado (Cerrado), 
    .Abierto (Abierto), 
    .Alarma (Alarma), 
    .Bloqueo (Bloqueo)
  );

endmodule
