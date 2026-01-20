
# 📡 UART Controller – RTL Design (Verilog HDL)

## 📌 Project Overview
* This repository contains the RTL design and verification of a UART (Universal Asynchronous Receiver Transmitter) implemented using Verilog HDL.
* The design demonstrates reliable parallel-to-serial transmission and serial-to-parallel reception using asynchronous communication.
* This project was developed as a first industry-oriented VLSI RTL project and verified using Synopsys VCS and DVE.

---

## 🎯 Key Objectives
* Understand UART protocol fundamentals
* Design UART TX and RX at RTL level
* Implement baud rate–based timing control
* Verify functionality through waveform analysis
* Gain hands-on experience with Synopsys tools

---

## ⚙️ UART Specifications
* Communication Type: Asynchronous serial
* Data Width: 8 bits
* Frame Format: 1 Start bit, 8 Data bits, 1 Stop bit
* Bit Order: LSB first
* Error Handling: Not included (ideal conditions)

---

## 🧱 Architecture Overview
The UART controller consists of the following blocks:
* Baud Rate Generator – Generates timing tick for UART operation
* UART Transmitter (TX) – Converts parallel data to serial format
* UART Receiver (RX) – Converts serial data back to parallel format
* Top Module – Integrates all UART sub-blocks
* Testbench – Verifies TX–RX loopback functionality

---

## 📊 Simulation & Verification
* Simulator: Synopsys VCS
* Waveform Viewer: Synopsys DVE
* Verification Method: TX → RX loopback

---

## Test Case:
* Transmitted Data: 8'hA5
* Received Data: 8'hA5

✔ Correct start bit detection
✔ LSB-first transmission
✔ Accurate serial-to-parallel reconstruction

---

## 🔗 View Results:
📈 Waveforms (DVE Screenshots):
[👉 Click here to view waveforms:](./cdw.png)

🧩 UART Block / Schematic Diagram:
[👉 Click here to view diagram:](./cd.png)

---

## 🧑‍💻 RTL Implementation
🔹 Top Module –[uart.v](./uart.v) 

🔹 Baud Rate Generator – [baud_rate_generator.v](./baud_rate_generator.v) 

🔹 UART Transmitter – [uart_tx.v](./uart_tx.v) 
  
🔹 UART Receiver – [uart_rx.v](./uart_rx.v) 

🔹 Testbench – [uart_tb.v](./uart_tb.v) 

---

## 🧠 Learning Outcomes
* UART protocol understanding
* Parallel vs serial data handling
* RTL design using Verilog HDL
* Timing-based sampling concepts
* Professional simulation workflow with Synopsys tools

---

## 🚀 Future Enhancements
* Parity bit support
* Configurable baud rates
* FIFO buffering
* Error detection and framing error flags

---

## 👨‍💻 Author
Kowshin
ECE Student | Aspiring VLSI Engineer
RTL Design | Verilog HDL | UART | Synopsys
