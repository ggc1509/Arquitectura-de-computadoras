/*
    Divisor de frecuencia de 28 bits
    Este proyecto consiste divisor de frecuencia 
    con una entrada de reloj CLK y reset RST y con 
    diferentes salidas de hasta 28 bits. 
    La entrada Clk está conectada al pin 52 el cual
    está conectado al oscilador de 27 Mhz de la 
    Tang Nano 9k.
    Para este ejemplo usamos las salidas 
    q[5], q[13], q[24] y q[26].
           _______________
          |               |
   Clk--->|               |---> Bit0
          |               |---> Bit1
   Clr--->|               |---> Bit2
          |               |---> .
          |               |---> .
          |               |---> .
          |               |---> .
          |               |---> Bit26
          |               |---> Bit27
          |_______________|
*/

module clkdiv (
    input wire clk ,
    input wire clr ,
    output wire clkout      // q[26]
);

reg [27:0] q;

always @(posedge clk or posedge clr)
    begin
        if(clr == 1) 
            q <= 0;
        else
            q <= q + 1;
        end

    assign clkout = q[22];   
endmodule

