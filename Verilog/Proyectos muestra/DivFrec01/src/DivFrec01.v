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
                 |                                  |
   Clk--->|                                 |---> Bit0
                 |                                  |---> Bit1
   Clr--->|                                  |---> Bit2
                |                                  |---> .
                |                                  |---> .
                |                                  |---> .
                |                                  |---> .
                |                                  |---> Bit26
                |                                  |---> Bit27
                |______________|
*/

module clkdiv (
    input wire clk ,
    input wire clr ,
    output wire clk421875,  // q[5]   
    output wire clk1647,    // q[13]
    output wire clk080,     // q[24]
    output wire clk020      // q[26]
);
reg [27:0] q;


always @(posedge clk or posedge clr)
    begin
        if(clr == 1)
            q <= 0;
        else
            q <= q + 1;
        end

    assign clk421875 = q[22];    // 421875 Hz
    assign clk1647   = q[23];   // 1647 Hz
    assign clk080    = q[24];   // 0.8 Hz
    assign clk020    = q[25];   // 0.2 Hz
endmodule