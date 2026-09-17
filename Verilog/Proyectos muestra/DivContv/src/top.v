
//(* top_module = "true" *)


module top
    (
     input wire reloj,   
     input wire resetClk,
     input wire resetCont,
     output wire clksal,
     output wire [3:0] leds
    );

    wire pulsos;

    clkdiv instanceDivFrec01(
        .clk(reloj),
        .clr(resetClk),
        .clk020(pulsos)
    );

    contador4bits instanceContador4bits(
        .clk(clk),
        .count(leds),
        .rst(resetCont)
    );

    assign clk = pulsos;
    assign clksal = pulsos;

endmodule