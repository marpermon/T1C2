module probador (
  Clk, Reset,
	Pin, Vehiculo, Termino, enterPin,
	Cerrado, Abierto, Alarma, Bloqueo
  );

output reg Clk, Reset, Vehiculo, Termino, enterPin;
output reg [7:0] Pin;
input Alarma, Cerrado, Abierto, Bloqueo;

parameter Pin_correcto = 8'b00010000;
parameter Pin_0 = 8'b0;
parameter medio_T = 5;


  initial begin
    Clk = 0;
    Reset = 0;
    Vehiculo = 0;
    Termino = 0;
    enterPin = 0;
    Pin=Pin_0;
    
    #5 Reset = 1; //5. reseteamos la máquina
    #10 Reset = 0; //15.
    //*funcionamiento normal*
    #5 Vehiculo = 1; //llega vehiculo
    #15 {enterPin,Pin}  = 9'b100000000+Pin_correcto;
    #10 enterPin = 0;
    #25 {Vehiculo, Termino} = 2'b01; //si la señal de vehiculo se apaga, es logico de que la que termino de entrar tambien se encienda al mismo tiempo
    #10 Termino = 0; //se apaga termino, dura sòlo un ciclo de relog
     //volvemos al estado cerrado
    //*pin incorrecto +de 3 veces*
    #10 Vehiculo = 1; //llega vehiculo
    #5 {enterPin,Pin}  = 9'b111111111; //introduce pin incorrecto
    #10 enterPin = 0;
    #10 Pin = Pin_0;//probamos que no pase nada si cambia el pin aunque no esté prendido enter
    #10 {enterPin,Pin}  = 9'b111111111; //introduce pin incorrecto por segunda vez
    #10 enterPin = 0;
    #10 enterPin = 1; //introduce pin incorrecto por tercera vez
    #10 enterPin = 0;
    #10 enterPin = 1;
    #10 enterPin = 0; //introduce pin incorrecto por cuarta vez
    #10 {enterPin,Pin}  = 9'b100000000+Pin_correcto;
    #10 enterPin = 0;
    #10 {Vehiculo, Termino} = 2'b01; //si la señal de vehiculo se apaga, es logico de que la que termino de entrar tambien se encienda al mismo tiempo
    #10 Termino = 0; //se apaga termino, dura sòlo un ciclo de relog
     //volvemos al estado cerrado
    //*menos de dos equivocaciones* 
    #5 Vehiculo = 1; //llega nuevo vehiculo
    #15 {enterPin,Pin}  = 9'b111111111; //introduce pin incorrecto sòlo una vez
    #10 enterPin = 0;
    #10 {enterPin,Pin}  = 9'b100000000+Pin_correcto;
    #10 enterPin = 0;
    //*bloqueo por dos señales al mismo tiempo*
    #10 {Vehiculo, Termino} = 2'b11; //si la señal de vehiculo se enciende al mismo tiempo que la señal termino, vamos al estado bloqueo
    #10 Termino = 0; //se apaga termino, dura sòlo un ciclo de relog
    #40 $finish;
  end

  always begin
    #medio_T Clk = !Clk;
  end

endmodule
