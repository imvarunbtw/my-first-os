# my-first-os

A custom, 16-bit real-mode operating system bootloader built from scratch using pure **NASM Assembly**.

## 🚀 Features
* **Zero Dependencies:** Boots directly on bare-metal virtual hardware without an underlying OS.
* **Custom Boot Message:** Directly manipulates BIOS graphic subsystems to output text to the screen.

## 📁 Files Included
* `main.asm` - The raw assembly source code.
* `main(2).bin` - The compiled machine-code binary sector ready for virtual hardware emulation.
