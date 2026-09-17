


module rom_8bits_256dir (
    input wire enable,         // Señal de habilitación
    input wire [7:0] addr,     // Dirección de 8 bits (256 posiciones) en binario
    output reg [7:0] data_out  // Dato de salida de 8 bits en binario
);

// Memoria ROM - 256 palabras de 8 bits cada una
// Todas las direcciones y datos en formato binario
always @(*) begin
    if (enable) begin
        case (addr)
            // === BLOQUE 0: Direcciones 0-7 ===
            8'b00000000: data_out = 8'b00000000; // Dirección 0
            8'b00000001: data_out = 8'b00000001; // Dirección 1
            8'b00000010: data_out = 8'b00000010; // Dirección 2
            8'b00000011: data_out = 8'b00000011; // Dirección 3
            8'b00000100: data_out = 8'b00000100; // Dirección 4
            8'b00000101: data_out = 8'b00000101; // Dirección 5
            8'b00000110: data_out = 8'b00000110; // Dirección 6
            8'b00000111: data_out = 8'b00000111; // Dirección 7
            
            // === BLOQUE 1: Direcciones 8-15 ===
            8'b00001000: data_out = 8'b00001000; // Dirección 8
            8'b00001001: data_out = 8'b00001001; // Dirección 9
            8'b00001010: data_out = 8'b00001010; // Dirección 10
            8'b00001011: data_out = 8'b00001011; // Dirección 11
            8'b00001100: data_out = 8'b00001100; // Dirección 12
            8'b00001101: data_out = 8'b00001101; // Dirección 13
            8'b00001110: data_out = 8'b00001110; // Dirección 14
            8'b00001111: data_out = 8'b00001111; // Dirección 15
            
            // === BLOQUE 2: Direcciones 16-23 ===
            8'b00010000: data_out = 8'b00010000; // Dirección 16
            8'b00010001: data_out = 8'b00010001; // Dirección 17
            8'b00010010: data_out = 8'b00010010; // Dirección 18
            8'b00010011: data_out = 8'b00010011; // Dirección 19
            8'b00010100: data_out = 8'b00010100; // Dirección 20
            8'b00010101: data_out = 8'b00010101; // Dirección 21
            8'b00010110: data_out = 8'b00010110; // Dirección 22
            8'b00010111: data_out = 8'b00010111; // Dirección 23
            
            // === BLOQUE 3: Direcciones 24-31 ===
            8'b00011000: data_out = 8'b00011000; // Dirección 24
            8'b00011001: data_out = 8'b00011001; // Dirección 25
            8'b00011010: data_out = 8'b00011010; // Dirección 26
            8'b00011011: data_out = 8'b00011011; // Dirección 27
            8'b00011100: data_out = 8'b00011100; // Dirección 28
            8'b00011101: data_out = 8'b00011101; // Dirección 29
            8'b00011110: data_out = 8'b00011110; // Dirección 30
            8'b00011111: data_out = 8'b00011111; // Dirección 31
            
            // === BLOQUE 4: Direcciones 32-39 ===
            8'b00100000: data_out = 8'b00100000; // Dirección 32
            8'b00100001: data_out = 8'b00100001; // Dirección 33
            8'b00100010: data_out = 8'b00100010; // Dirección 34
            8'b00100011: data_out = 8'b00100011; // Dirección 35
            8'b00100100: data_out = 8'b00100100; // Dirección 36
            8'b00100101: data_out = 8'b00100101; // Dirección 37
            8'b00100110: data_out = 8'b00100110; // Dirección 38
            8'b00100111: data_out = 8'b00100111; // Dirección 39
            
            // === BLOQUE 5: Direcciones 40-47 ===
            8'b00101000: data_out = 8'b00101000; // Dirección 40
            8'b00101001: data_out = 8'b00101001; // Dirección 41
            8'b00101010: data_out = 8'b00101010; // Dirección 42
            8'b00101011: data_out = 8'b00101011; // Dirección 43
            8'b00101100: data_out = 8'b00101100; // Dirección 44
            8'b00101101: data_out = 8'b00101101; // Dirección 45
            8'b00101110: data_out = 8'b00101110; // Dirección 46
            8'b00101111: data_out = 8'b00101111; // Dirección 47
            
            // === BLOQUE 6: Direcciones 48-55 ===
            8'b00110000: data_out = 8'b00110000; // Dirección 48
            8'b00110001: data_out = 8'b00110001; // Dirección 49
            8'b00110010: data_out = 8'b00110010; // Dirección 50
            8'b00110011: data_out = 8'b00110011; // Dirección 51
            8'b00110100: data_out = 8'b00110100; // Dirección 52
            8'b00110101: data_out = 8'b00110101; // Dirección 53
            8'b00110110: data_out = 8'b00110110; // Dirección 54
            8'b00110111: data_out = 8'b00110111; // Dirección 55
            
            // === BLOQUE 7: Direcciones 56-63 ===
            8'b00111000: data_out = 8'b00111000; // Dirección 56
            8'b00111001: data_out = 8'b00111001; // Dirección 57
            8'b00111010: data_out = 8'b00111010; // Dirección 58
            8'b00111011: data_out = 8'b00111011; // Dirección 59
            8'b00111100: data_out = 8'b00111100; // Dirección 60
            8'b00111101: data_out = 8'b00111101; // Dirección 61
            8'b00111110: data_out = 8'b00111110; // Dirección 62
            8'b00111111: data_out = 8'b00111111; // Dirección 63
            
            // === BLOQUE 8: Direcciones 64-71 ===
            8'b01000000: data_out = 8'b01000000; // Dirección 64
            8'b01000001: data_out = 8'b01000001; // Dirección 65
            8'b01000010: data_out = 8'b01000010; // Dirección 66
            8'b01000011: data_out = 8'b01000011; // Dirección 67
            8'b01000100: data_out = 8'b01000100; // Dirección 68
            8'b01000101: data_out = 8'b01000101; // Dirección 69
            8'b01000110: data_out = 8'b01000110; // Dirección 70
            8'b01000111: data_out = 8'b01000111; // Dirección 71
            
            // === BLOQUE 9: Direcciones 72-79 ===
            8'b01001000: data_out = 8'b01001000; // Dirección 72
            8'b01001001: data_out = 8'b01001001; // Dirección 73
            8'b01001010: data_out = 8'b01001010; // Dirección 74
            8'b01001011: data_out = 8'b01001011; // Dirección 75
            8'b01001100: data_out = 8'b01001100; // Dirección 76
            8'b01001101: data_out = 8'b01001101; // Dirección 77
            8'b01001110: data_out = 8'b01001110; // Dirección 78
            8'b01001111: data_out = 8'b01001111; // Dirección 79
            
            // === BLOQUE 10: Direcciones 80-87 ===
            8'b01010000: data_out = 8'b01010000; // Dirección 80
            8'b01010001: data_out = 8'b01010001; // Dirección 81
            8'b01010010: data_out = 8'b01010010; // Dirección 82
            8'b01010011: data_out = 8'b01010011; // Dirección 83
            8'b01010100: data_out = 8'b01010100; // Dirección 84
            8'b01010101: data_out = 8'b01010101; // Dirección 85
            8'b01010110: data_out = 8'b01010110; // Dirección 86
            8'b01010111: data_out = 8'b01010111; // Dirección 87
            
            // === BLOQUE 11: Direcciones 88-95 ===
            8'b01011000: data_out = 8'b01011000; // Dirección 88
            8'b01011001: data_out = 8'b01011001; // Dirección 89
            8'b01011010: data_out = 8'b01011010; // Dirección 90
            8'b01011011: data_out = 8'b01011011; // Dirección 91
            8'b01011100: data_out = 8'b01011100; // Dirección 92
            8'b01011101: data_out = 8'b01011101; // Dirección 93
            8'b01011110: data_out = 8'b01011110; // Dirección 94
            8'b01011111: data_out = 8'b01011111; // Dirección 95
            
            // === BLOQUE 12: Direcciones 96-103 ===
            8'b01100000: data_out = 8'b01100000; // Dirección 96
            8'b01100001: data_out = 8'b01100001; // Dirección 97
            8'b01100010: data_out = 8'b01100010; // Dirección 98
            8'b01100011: data_out = 8'b01100011; // Dirección 99
            8'b01100100: data_out = 8'b01100100; // Dirección 100
            8'b01100101: data_out = 8'b01100101; // Dirección 101
            8'b01100110: data_out = 8'b01100110; // Dirección 102
            8'b01100111: data_out = 8'b01100111; // Dirección 103
            
            // === BLOQUE 13: Direcciones 104-111 ===
            8'b01101000: data_out = 8'b01101000; // Dirección 104
            8'b01101001: data_out = 8'b01101001; // Dirección 105
            8'b01101010: data_out = 8'b01101010; // Dirección 106
            8'b01101011: data_out = 8'b01101011; // Dirección 107
            8'b01101100: data_out = 8'b01101100; // Dirección 108
            8'b01101101: data_out = 8'b01101101; // Dirección 109
            8'b01101110: data_out = 8'b01101110; // Dirección 110
            8'b01101111: data_out = 8'b01101111; // Dirección 111
            
            // === BLOQUE 14: Direcciones 112-119 ===
            8'b01110000: data_out = 8'b01110000; // Dirección 112
            8'b01110001: data_out = 8'b01110001; // Dirección 113
            8'b01110010: data_out = 8'b01110010; // Dirección 114
            8'b01110011: data_out = 8'b01110011; // Dirección 115
            8'b01110100: data_out = 8'b01110100; // Dirección 116
            8'b01110101: data_out = 8'b01110101; // Dirección 117
            8'b01110110: data_out = 8'b01110110; // Dirección 118
            8'b01110111: data_out = 8'b01110111; // Dirección 119
            
            // === BLOQUE 15: Direcciones 120-127 ===
            8'b01111000: data_out = 8'b01111000; // Dirección 120
            8'b01111001: data_out = 8'b01111001; // Dirección 121
            8'b01111010: data_out = 8'b01111010; // Dirección 122
            8'b01111011: data_out = 8'b01111011; // Dirección 123
            8'b01111100: data_out = 8'b01111100; // Dirección 124
            8'b01111101: data_out = 8'b01111101; // Dirección 125
            8'b01111110: data_out = 8'b01111110; // Dirección 126
            8'b01111111: data_out = 8'b01111111; // Dirección 127
            
            // === BLOQUE 16: Direcciones 128-135 ===
            8'b10000000: data_out = 8'b10000000; // Dirección 128
            8'b10000001: data_out = 8'b10000001; // Dirección 129
            8'b10000010: data_out = 8'b10000010; // Dirección 130
            8'b10000011: data_out = 8'b10000011; // Dirección 131
            8'b10000100: data_out = 8'b10000100; // Dirección 132
            8'b10000101: data_out = 8'b10000101; // Dirección 133
            8'b10000110: data_out = 8'b10000110; // Dirección 134
            8'b10000111: data_out = 8'b10000111; // Dirección 135
            
            // === BLOQUE 17: Direcciones 136-143 ===
            8'b10001000: data_out = 8'b10001000; // Dirección 136
            8'b10001001: data_out = 8'b10001001; // Dirección 137
            8'b10001010: data_out = 8'b10001010; // Dirección 138
            8'b10001011: data_out = 8'b10001011; // Dirección 139
            8'b10001100: data_out = 8'b10001100; // Dirección 140
            8'b10001101: data_out = 8'b10001101; // Dirección 141
            8'b10001110: data_out = 8'b10001110; // Dirección 142
            8'b10001111: data_out = 8'b10001111; // Dirección 143
            
            // === BLOQUE 18: Direcciones 144-151 ===
            8'b10010000: data_out = 8'b10010000; // Dirección 144
            8'b10010001: data_out = 8'b10010001; // Dirección 145
            8'b10010010: data_out = 8'b10010010; // Dirección 146
            8'b10010011: data_out = 8'b10010011; // Dirección 147
            8'b10010100: data_out = 8'b10010100; // Dirección 148
            8'b10010101: data_out = 8'b10010101; // Dirección 149
            8'b10010110: data_out = 8'b10010110; // Dirección 150
            8'b10010111: data_out = 8'b10010111; // Dirección 151
            
            // === BLOQUE 19: Direcciones 152-159 ===
            8'b10011000: data_out = 8'b10011000; // Dirección 152
            8'b10011001: data_out = 8'b10011001; // Dirección 153
            8'b10011010: data_out = 8'b10011010; // Dirección 154
            8'b10011011: data_out = 8'b10011011; // Dirección 155
            8'b10011100: data_out = 8'b10011100; // Dirección 156
            8'b10011101: data_out = 8'b10011101; // Dirección 157
            8'b10011110: data_out = 8'b10011110; // Dirección 158
            8'b10011111: data_out = 8'b10011111; // Dirección 159
            
            // === BLOQUE 20: Direcciones 160-167 ===
            8'b10100000: data_out = 8'b10100000; // Dirección 160
            8'b10100001: data_out = 8'b10100001; // Dirección 161
            8'b10100010: data_out = 8'b10100010; // Dirección 162
            8'b10100011: data_out = 8'b10100011; // Dirección 163
            8'b10100100: data_out = 8'b10100100; // Dirección 164
            8'b10100101: data_out = 8'b10100101; // Dirección 165
            8'b10100110: data_out = 8'b10100110; // Dirección 166
            8'b10100111: data_out = 8'b10100111; // Dirección 167
            
            // === BLOQUE 21: Direcciones 168-175 ===
            8'b10101000: data_out = 8'b10101000; // Dirección 168
            8'b10101001: data_out = 8'b10101001; // Dirección 169
            8'b10101010: data_out = 8'b10101010; // Dirección 170
            8'b10101011: data_out = 8'b10101011; // Dirección 171
            8'b10101100: data_out = 8'b10101100; // Dirección 172
            8'b10101101: data_out = 8'b10101101; // Dirección 173
            8'b10101110: data_out = 8'b10101110; // Dirección 174
            8'b10101111: data_out = 8'b10101111; // Dirección 175
            
            // === BLOQUE 22: Direcciones 176-183 ===
            8'b10110000: data_out = 8'b10110000; // Dirección 176
            8'b10110001: data_out = 8'b10110001; // Dirección 177
            8'b10110010: data_out = 8'b10110010; // Dirección 178
            8'b10110011: data_out = 8'b10110011; // Dirección 179
            8'b10110100: data_out = 8'b10110100; // Dirección 180
            8'b10110101: data_out = 8'b10110101; // Dirección 181
            8'b10110110: data_out = 8'b10110110; // Dirección 182
            8'b10110111: data_out = 8'b10110111; // Dirección 183
            
            // === BLOQUE 23: Direcciones 184-191 ===
            8'b10111000: data_out = 8'b10111000; // Dirección 184
            8'b10111001: data_out = 8'b10111001; // Dirección 185
            8'b10111010: data_out = 8'b10111010; // Dirección 186
            8'b10111011: data_out = 8'b10111011; // Dirección 187
            8'b10111100: data_out = 8'b10111100; // Dirección 188
            8'b10111101: data_out = 8'b10111101; // Dirección 189
            8'b10111110: data_out = 8'b10111110; // Dirección 190
            8'b10111111: data_out = 8'b10111111; // Dirección 191
            
            // === BLOQUE 24: Direcciones 192-199 ===
            8'b11000000: data_out = 8'b11000000; // Dirección 192
            8'b11000001: data_out = 8'b11000001; // Dirección 193
            8'b11000010: data_out = 8'b11000010; // Dirección 194
            8'b11000011: data_out = 8'b11000011; // Dirección 195
            8'b11000100: data_out = 8'b11000100; // Dirección 196
            8'b11000101: data_out = 8'b11000101; // Dirección 197
            8'b11000110: data_out = 8'b11000110; // Dirección 198
            8'b11000111: data_out = 8'b11000111; // Dirección 199
            
            // === BLOQUE 25: Direcciones 200-207 ===
            8'b11001000: data_out = 8'b11001000; // Dirección 200
            8'b11001001: data_out = 8'b11001001; // Dirección 201
            8'b11001010: data_out = 8'b11001010; // Dirección 202
            8'b11001011: data_out = 8'b11001011; // Dirección 203
            8'b11001100: data_out = 8'b11001100; // Dirección 204
            8'b11001101: data_out = 8'b11001101; // Dirección 205
            8'b11001110: data_out = 8'b11001110; // Dirección 206
            8'b11001111: data_out = 8'b11001111; // Dirección 207
            
            // === BLOQUE 26: Direcciones 208-215 ===
            8'b11010000: data_out = 8'b11010000; // Dirección 208
            8'b11010001: data_out = 8'b11010001; // Dirección 209
            8'b11010010: data_out = 8'b11010010; // Dirección 210
            8'b11010011: data_out = 8'b11010011; // Dirección 211
            8'b11010100: data_out = 8'b11010100; // Dirección 212
            8'b11010101: data_out = 8'b11010101; // Dirección 213
            8'b11010110: data_out = 8'b11010110; // Dirección 214
            8'b11010111: data_out = 8'b11010111; // Dirección 215
            
            // === BLOQUE 27: Direcciones 216-223 ===
            8'b11011000: data_out = 8'b11011000; // Dirección 216
            8'b11011001: data_out = 8'b11011001; // Dirección 217
            8'b11011010: data_out = 8'b11011010; // Dirección 218
            8'b11011011: data_out = 8'b11011011; // Dirección 219
            8'b11011100: data_out = 8'b11011100; // Dirección 220
            8'b11011101: data_out = 8'b11011101; // Dirección 221
            8'b11011110: data_out = 8'b11011110; // Dirección 222
            8'b11011111: data_out = 8'b11011111; // Dirección 223
            
            // === BLOQUE 28: Direcciones 224-231 ===
            8'b11100000: data_out = 8'b11100000; // Dirección 224
            8'b11100001: data_out = 8'b11100001; // Dirección 225
            8'b11100010: data_out = 8'b11100010; // Dirección 226
            8'b11100011: data_out = 8'b11100011; // Dirección 227
            8'b11100100: data_out = 8'b11100100; // Dirección 228
            8'b11100101: data_out = 8'b11100101; // Dirección 229
            8'b11100110: data_out = 8'b11100110; // Dirección 230
            8'b11100111: data_out = 8'b11100111; // Dirección 231
            
            // === BLOQUE 29: Direcciones 232-239 ===
            8'b11101000: data_out = 8'b11101000; // Dirección 232
            8'b11101001: data_out = 8'b11101001; // Dirección 233
            8'b11101010: data_out = 8'b11101010; // Dirección 234
            8'b11101011: data_out = 8'b11101011; // Dirección 235
            8'b11101100: data_out = 8'b11101100; // Dirección 236
            8'b11101101: data_out = 8'b11101101; // Dirección 237
            8'b11101110: data_out = 8'b11101110; // Dirección 238
            8'b11101111: data_out = 8'b11101111; // Dirección 239
            
            // === BLOQUE 30: Direcciones 240-247 ===
            8'b11110000: data_out = 8'b11110000; // Dirección 240
            8'b11110001: data_out = 8'b11110001; // Dirección 241
            8'b11110010: data_out = 8'b11110010; // Dirección 242
            8'b11110011: data_out = 8'b11110011; // Dirección 243
            8'b11110100: data_out = 8'b11110100; // Dirección 244
            8'b11110101: data_out = 8'b11110101; // Dirección 245
            8'b11110110: data_out = 8'b11110110; // Dirección 246
            8'b11110111: data_out = 8'b11110111; // Dirección 247
            
            // === BLOQUE 31: Direcciones 248-255 ===
            8'b11111000: data_out = 8'b11111000; // Dirección 248
            8'b11111001: data_out = 8'b11111001; // Dirección 249
            8'b11111010: data_out = 8'b11111010; // Dirección 250
            8'b11111011: data_out = 8'b11111011; // Dirección 251
            8'b11111100: data_out = 8'b11111100; // Dirección 252
            8'b11111101: data_out = 8'b11111101; // Dirección 253
            8'b11111110: data_out = 8'b11111110; // Dirección 254
            8'b11111111: data_out = 8'b11111111; // Dirección 255
            
            default: data_out = 8'b00000000;
        endcase
    end else begin
        // Cuando enable = 0, la salida es 0
        data_out = 8'b00000000;
    end
end

endmodule
