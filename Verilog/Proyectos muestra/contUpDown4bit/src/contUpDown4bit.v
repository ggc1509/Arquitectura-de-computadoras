module contUpDown (
    input wire reset,          // Reset síncrono
    input wire enable,         // Habilitador del contador
    input wire incrementar,    // Entrada para incrementar
    input wire decrementar,    // Entrada para decrementar
    output reg [3:0] contador  // Contador de 4 bits
);

// Contador con reset, enable y entradas separadas
always @(*) begin
    if (reset) begin
        contador = 4'b0000;     // Reset a 0
    end else if (enable) begin  // Solo opera si enable está activo
        if (incrementar && !decrementar) begin
            // Solo incrementar está activo
            if (contador < 4'b1111)
                contador = contador + 1;
        end else if (decrementar && !incrementar) begin
            // Solo decrementar está activo
            if (contador > 4'b0000)
                contador = contador - 1;
        end
        // Si ambos están activos o ninguno, mantener valor actual
    end
    // Si enable = 0, mantener valor actual
end

endmodule