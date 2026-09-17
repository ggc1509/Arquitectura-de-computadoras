
module TopModel
    (
     input wire reloj,   
     input wire resetClk,
     input wire resetCont,
     output wire [3:0] leds
    );

    wire pulsos;

    DivFrec01 instanceDivFrec01(
        .clk(reloj),
        .rst(resetClk),
        .clk020(pulsos)
    );

    Contador4bits instanceContador4bits(
        .pulsos(clk),
        .count(leds),
        .rst(resetCont)
    );

endmodule