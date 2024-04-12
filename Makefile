tarea: testbench.v ondas.gtkw
	iverilog -o salida testbench.v
	vvp salida #Corre la simulación
	gtkwave ondas.gtkw
