tarea: testbench.v
	iverilog -o salida testbench.v  
	vvp salida #Corre la simulación 
	gtkwave resultados.vcd 