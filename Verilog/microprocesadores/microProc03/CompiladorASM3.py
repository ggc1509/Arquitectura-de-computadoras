import os
import tkinter as tk
from tkinter import filedialog, messagebox, ttk

# Tabla de Opcodes y Reglas de Formato (Procesador 12 bits)
OPCODES = {
    "NOP": "0000",
    "LOADI": "0001",
    "ADD": "0010",
    "SUB": "0011",
    "AND": "0100",
    "OR": "0101",
    "XOR": "0110",
    "NOT": "0111",
    "SHL": "1000",
    "SHR": "1001",
    "IN": "1010",
    "OUT": "1011",
    "JMP": "1100",
    "JZ": "1101",
    "BITSET": "1110",
    "BITCLR": "1111",
}

REGISTERS = {
    "R0": "00",
    "R1": "01",
    "R2": "10",
    "R3": "11",
}

PORTS = {
    "OUT0": "00",
    "OUT1": "01",
    "IN0": "00",
    "IN1": "01",
}


class AssemblerGUI:

  def __init__(self, root):
    self.root = root
    self.root.title("Compilador / Ensamblador - Procesador 12-Bits")
    self.root.geometry("1150x720")

    # -----------------------------------------------------------------
    # CONTENEDOR VERTICAL PRINCIPAL (Permite redimensionar arriba/abajo)
    # -----------------------------------------------------------------
    vertical_pane = ttk.PanedWindow(root, orient=tk.VERTICAL)
    vertical_pane.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

    # -----------------------------------------------------------------
    # PANEL SUPERIOR CON SUBVENTANAS HORIZONTALES (PanedWindow)
    # -----------------------------------------------------------------
    main_pane = ttk.PanedWindow(vertical_pane, orient=tk.HORIZONTAL)

    # SUBVENTANA 1: Editor de Ensamblador
    left_frame = tk.LabelFrame(
        main_pane, text=" Código Fuente (Ensamblador) "
    )
    self.text_assembly = tk.Text(left_frame, font=("Courier", 11), undo=True)
    self.text_assembly.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)
    self.text_assembly.bind("<Tab>", self.insert_four_spaces)

    sample_code = (
        "; Ejemplo de programa para Procesador de 12 bits\n"
        "LOADI   R0, 0\n"
        "BITSET  R0, 2\n"
        "OUT     OUT0, R0\n"
        "BITSET  R0, 0\n"
        "OUT     OUT0, R0\n"
        "BITCLR  R0, 2\n"
        "OUT     OUT0, R0\n"
        "JMP     0\n"
    )
    self.text_assembly.insert(tk.END, sample_code)
    main_pane.add(left_frame, weight=3)

    # SUBVENTANA 2: Código Máquina Generado
    center_frame = tk.LabelFrame(
        main_pane, text=" Código Máquina Generado (HEX / BIN) "
    )
    self.text_machine = tk.Text(
        center_frame, font=("Courier", 10), state=tk.DISABLED, bg="#f4f4f4"
    )
    self.text_machine.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)
    main_pane.add(center_frame, weight=3)

    # SUBVENTANA 3: Set de Instrucciones
    right_frame = tk.LabelFrame(main_pane, text=" Set de Instrucciones ")
    self.text_isa = tk.Text(
        right_frame,
        font=("Courier", 9),
        bg="#eef2f5",
        fg="#222222",
        relief=tk.FLAT,
    )
    self.text_isa.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)
    self.show_isa_reference()
    main_pane.add(right_frame, weight=2)

    # Agregar el bloque superior al contenedor vertical
    vertical_pane.add(main_pane, weight=4)

    # -----------------------------------------------------------------
    # PANEL INFERIOR: Estructura + Botones de Compilación y Guardado
    # -----------------------------------------------------------------
    struct_frame = tk.LabelFrame(
        vertical_pane,
        text=(
            " Estructura de la Palabra de Instrucción (12 Bits) y Opciones de"
            " Compilación "
        ),
    )

    # Sub-contenedor para los botones dentro de struct_frame
    action_buttons_frame = tk.Frame(struct_frame)
    action_buttons_frame.pack(fill=tk.X, padx=5, pady=(5, 0))

    btn_save_asm = tk.Button(
        action_buttons_frame,
        text="📄 Guardar .ASM",
        command=self.save_asm_file,
        bg="#fd7e14",
        fg="white",
        font=("Arial", 10, "bold"),
        padx=10,
    )
    btn_save_asm.pack(side=tk.LEFT, padx=5)

    btn_open_asm = tk.Button(
        action_buttons_frame,
        text="📂 Abrir .ASM",
        command=self.open_asm_file,
        bg="#6c757d",
        fg="white",
        font=("Arial", 10, "bold"),
        padx=10,
    )
    btn_open_asm.pack(side=tk.LEFT, padx=5)

    btn_compile = tk.Button(
        action_buttons_frame,
        text="⚙️ Compilar Código",
        command=self.compile_code,
        bg="#007acc",
        fg="white",
        font=("Arial", 10, "bold"),
        padx=15,
    )
    btn_compile.pack(side=tk.LEFT, padx=5)

    btn_export_hex = tk.Button(
        action_buttons_frame,
        text="💾 Guardar .HEX",
        command=lambda: self.export_file("hex"),
        bg="#28a745",
        fg="white",
        font=("Arial", 10, "bold"),
        padx=10,
    )
    btn_export_hex.pack(side=tk.LEFT, padx=5)

    btn_export_mem = tk.Button(
        action_buttons_frame,
        text="💾 Guardar .MEM (Binario)",
        command=lambda: self.export_file("mem"),
        bg="#17a2b8",
        fg="white",
        font=("Arial", 10, "bold"),
        padx=10,
    )
    btn_export_mem.pack(side=tk.LEFT, padx=5)

    # Cuadro de texto para visualizar la estructura de la palabra
    self.text_structure = tk.Text(
        struct_frame,
        font=("Courier", 10, "bold"),
        bg="#f8f9fa",
        fg="#1a252f",
        relief=tk.FLAT,
    )
    self.text_structure.pack(fill=tk.BOTH, expand=True, padx=5, pady=5)
    self.show_instruction_structure()

    # Agregar el bloque inferior redimensionable
    vertical_pane.add(struct_frame, weight=2)

    self.compiled_bin_lines = []
    self.compiled_hex_lines = []

  def insert_four_spaces(self, event):
    """Inserta 4 espacios en blanco al presionar la tecla Tab."""
    self.text_assembly.insert(tk.INSERT, "    ")
    return "break"

  def save_asm_file(self):
    """Guarda el código fuente del editor en un archivo con extensión .asm"""
    asm_content = self.text_assembly.get("1.0", tk.END).strip()
    if not asm_content:
      messagebox.showwarning("Advertencia", "El editor de código está vacío.")
      return

    file_path = filedialog.asksaveasfilename(
        defaultextension=".asm",
        filetypes=[
            ("Archivos Ensamblador (*.asm)", "*.asm"),
            ("Todos los archivos", "*.*"),
        ],
    )

    if file_path:
      try:
        with open(file_path, "w", encoding="utf-8") as f:
          f.write(asm_content)
        messagebox.showinfo(
            "Guardado",
            f"Código ensamblador guardado en:\n{os.path.basename(file_path)}",
        )
      except Exception as e:
        messagebox.showerror("Error", f"No se pudo guardar el archivo: {e}")

  def open_asm_file(self):
    """Abre un archivo .asm existente y carga su contenido en el editor."""
    file_path = filedialog.askopenfilename(
        filetypes=[
            ("Archivos Ensamblador (*.asm)", "*.asm"),
            ("Archivos de Texto (*.txt)", "*.txt"),
            ("Todos los archivos", "*.*"),
        ]
    )

    if file_path:
      try:
        with open(file_path, "r", encoding="utf-8") as f:
          content = f.read()
        self.text_assembly.delete("1.0", tk.END)
        self.text_assembly.insert(tk.END, content)
        messagebox.showinfo(
            "Archivo Cargado",
            f"Se cargó correctamente {os.path.basename(file_path)}",
        )
      except Exception as e:
        messagebox.showerror("Error", f"No se pudo abrir el archivo: {e}")

  def show_isa_reference(self):
    """Muestra la tabla de referencia con todas las instrucciones del procesador."""
    isa_text = (
        " SINTAXIS Y OPCODES (12 bits)\n"
        "------------------------------\n"
        "LOADI R, Imm    | 0x1 (Imm:0-15)\n"
        "ADD   R1, R2    | 0x2\n"
        "SUB   R1, R2    | 0x3\n"
        "AND   R1, R2    | 0x4\n"
        "OR    R1, R2    | 0x5\n"
        "XOR   R1, R2    | 0x6\n"
        "NOT   R1        | 0x7\n"
        "SHL   R1        | 0x8\n"
        "SHR   R1        | 0x9\n"
        "IN    R1, Port  | 0xA (IN0, IN1)\n"
        "OUT   Port, R1  | 0xB (OUT0,OUT1)\n"
        "JMP   Addr      | 0xC (Addr:0-63)\n"
        "JZ    Addr      | 0xD (Addr:0-63)\n"
        "BITSET R1, Bit  | 0xE (Bit: 0-3)\n"
        "BITCLR R1, Bit  | 0xF (Bit: 0-3)\n"
        "NOP             | 0x0\n"
        "------------------------------\n"
        "Registros: R0, R1, R2, R3\n"
        "Comentarios con ';'\n"
    )
    self.text_isa.config(state=tk.NORMAL)
    self.text_isa.delete("1.0", tk.END)
    self.text_isa.insert(tk.END, isa_text)
    self.text_isa.config(state=tk.DISABLED)

  def show_instruction_structure(self):
    """Muestra el desglose de los bits de la instrucción."""
    struct_text = (
        "Bits:   |  [11 : 8]   |    [7 : 6]    |        [5 : 4]         |     [3 : 0]      |\n"
        "Campo:  |   Opcode    | Reg. Destino  | Reg. Fuente / Ind. Bit | Valor Inmediato  |\n"
        "Ancho:  |   4 bits    |    2 bits     |        2 bits          |     4 bits       |")
    
    self.text_structure.config(state=tk.NORMAL)
    self.text_structure.delete("1.0", tk.END)
    self.text_structure.insert(tk.END, struct_text)
    self.text_structure.config(state=tk.DISABLED)

  def parse_line(self, line, line_num):
    line = line.split(";")[0].strip()
    if not line:
      return None

    tokens = line.replace(",", " ").split()
    mnemonic = tokens[0].upper()

    if mnemonic not in OPCODES:
      raise ValueError(f"Línea {line_num}: Instrucción '{mnemonic}' no válida.")

    opcode = OPCODES[mnemonic]
    binary_instr = ""

    if mnemonic in ["NOP"]:
      binary_instr = opcode + "00000000"

    elif mnemonic == "LOADI":
      reg_dest = REGISTERS.get(tokens[1].upper())
      imm_val = int(tokens[2])
      if not (0 <= imm_val <= 15):
        raise ValueError(f"Línea {line_num}: Inmediato fuera de rango (0-15).")
      binary_instr = f"{opcode}{reg_dest}00{imm_val:04b}"

    elif mnemonic in ["ADD", "SUB", "AND", "OR", "XOR"]:
      reg_dest = REGISTERS.get(tokens[1].upper())
      reg_src = REGISTERS.get(tokens[2].upper())
      binary_instr = f"{opcode}{reg_dest}{reg_src}0000"

    elif mnemonic in ["NOT", "SHL", "SHR"]:
      reg_dest = REGISTERS.get(tokens[1].upper())
      binary_instr = f"{opcode}{reg_dest}000000"

    elif mnemonic in ["BITSET", "BITCLR"]:
      reg_dest = REGISTERS.get(tokens[1].upper())
      bit_idx = int(tokens[2])
      if not (0 <= bit_idx <= 3):
        raise ValueError(f"Línea {line_num}: Índice de bit fuera de rango (0-3).")
      binary_instr = f"{opcode}{reg_dest}{bit_idx:02b}0000"

    elif mnemonic == "OUT":
      port = PORTS.get(tokens[1].upper(), "00")
      reg_src = REGISTERS.get(tokens[2].upper())
      binary_instr = f"{opcode}{reg_src}{port}0000"

    elif mnemonic in ["JMP", "JZ"]:
      target_addr = int(tokens[1])
      if not (0 <= target_addr <= 63):
        raise ValueError(
            f"Línea {line_num}: Dirección de salto fuera de rango (0-63)."
        )
      binary_instr = f"{opcode}{target_addr:08b}"

    else:
      raise ValueError(f"Línea {line_num}: Error de sintaxis.")

    hex_val = f"{int(binary_instr, 2):03X}"
    return binary_instr, hex_val

  def compile_code(self):
    raw_code = self.text_assembly.get("1.0", tk.END).splitlines()
    self.compiled_bin_lines = []
    self.compiled_hex_lines = []

    display_text = ""
    addr = 0

    try:
      for idx, line in enumerate(raw_code, start=1):
        parsed = self.parse_line(line, idx)
        if parsed:
          bin_str, hex_str = parsed
          self.compiled_bin_lines.append(bin_str)
          self.compiled_hex_lines.append(hex_str)

          display_text += f"Dir 0x{addr:02X} ({addr:02d}) : {hex_str}  |  {bin_str[0:4]}_{bin_str[4:6]}_{bin_str[6:8]}_{bin_str[8:12]}\n"
          addr += 1

      while len(self.compiled_bin_lines) < 64:
        self.compiled_bin_lines.append("000000000000")
        self.compiled_hex_lines.append("000")

      self.text_machine.config(state=tk.NORMAL)
      self.text_machine.delete("1.0", tk.END)
      self.text_machine.insert(tk.END, display_text)
      self.text_machine.config(state=tk.DISABLED)

      messagebox.showinfo(
          "Éxito",
          f"Compilación Exitosa. Se generaron {addr} instrucciones de 12 bits.",
      )

    except Exception as e:
      messagebox.showerror("Error de Compilación", str(e))

  def export_file(self, file_type):
    if not self.compiled_hex_lines:
      messagebox.showwarning(
          "Advertencia", "Primero debes compilar el código."
      )
      return

    ext = ".hex" if file_type == "hex" else ".mem"
    file_path = filedialog.asksaveasfilename(
        defaultextension=ext,
        filetypes=[(f"Archivos {ext.upper()}", f"*{ext}")],
    )

    if file_path:
      with open(file_path, "w") as f:
        if file_type == "hex":
          f.write("\n".join(self.compiled_hex_lines))
        else:
          f.write("\n".join(self.compiled_bin_lines))
      messagebox.showinfo(
          "Guardado", f"Archivo {os.path.basename(file_path)} creado con éxito."
      )


if __name__ == "__main__":
  root = tk.Tk()
  app = AssemblerGUI(root)
  root.mainloop()