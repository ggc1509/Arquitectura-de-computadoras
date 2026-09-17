/*
    Multiplexor 4 a 1
    Este proyecto consiste de un multiplexor de 4 bits a la entrada 
    y una linea de salida. Para seleccionar la linea de entrada se 
    utilizan dos bits.
                 _______________
                |               |
   entrada0 --->|               |---> Salida
   entrada1 --->|               |
   entrada2 --->|               |
   entrada3 --->|               |
                |               |
   Selector1--->|               |
   Selector2--->|               |
                |_______________|     */


module mux41c (
    input wire [3:0] entrada ,
    input wire [1:0] selector ,
    output reg salida
);
always @(*)
    case(selector)
        0: salida = entrada[0];
        1: salida = entrada[1];
        2: salida = entrada[2];
        3: salida = entrada[3];
        default: salida = entrada[0];
    endcase
endmodule


