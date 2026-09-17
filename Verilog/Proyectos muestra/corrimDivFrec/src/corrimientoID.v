/*
    Corrimiento bidireccional
    Elaborado por Germán Godínez Cardoza
    Pachuca de Soto Hidalgo a 04 de Octubre de 2005.
    Este programa sirve para ejecutar corrimientos
    hacia la izquierda y derecha en un contador de 4 bits.
    La dirección puede ser seleccionada con un solo pin.
            ________
           |        |
    clk--->|        |--->out[0]
    rst--->|        |--->out[1]
     en--->|        |--->out[2]
    dir--->|        |--->out[3]
           |________|


*/

module corrimientoID (
    input wire clk,             // Entrada de pulsos de reloj
    input wire rst,           // Pin de reset
    input wire en,          // Pin de habilitación
    input wire dir,       // 0=izquierda, 1=derecha
    output reg [3:0] out        // Registro del contador
);

always @(posedge ~clk or posedge rst) begin
    if (rst) begin                          // Si activa el reset
        out <= 4'b0001;                     // Siempre inicia con bit 0 en 1
    end else if (en) begin                  // Si está activo el habilitador
        if (dir == 1'b0) begin              // Si el bit de dirección está en 1
            out <= {out[2:0], out[3]};      // Corrimiento a la izquierda
        end else begin                      // Si el bit de dirección está en 0
            out <= {out[0], out[3:1]};      // Corrimiento a la derecha
        end
    end
end

endmodule
