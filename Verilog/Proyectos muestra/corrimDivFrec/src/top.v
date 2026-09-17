module top
    (
     input wire reloj,   
     input wire resetClk,
     output wire clksal,

     input wire resetCont,
     input wire enCont,
     input wire dirCont,
     output wire [3:0] leds
    );

    wire pulsos;

    clkdiv instanceclkdiv(
        .clk(reloj),
        .clr(resetClk),
        .clkout(pulsos)
    );

    corrimientoID instancecorrimientoID(
        .clk(pulsos),
        .rst(resetCont),
        .en(enCont),
        .dir(dirCont),
        .out(leds)
    );

    assign clksal = pulsos;

endmodule

