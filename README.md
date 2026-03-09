🛗 VHDL Elevator Controller
Welcome to the Elevator-VHDL repository! This project a fully functional elevator control system implemented in VHDL, simulated, and successfully tested on an FPGA development board.

📝 Project Overview
This system simulates the real-world behavior of an elevator, handling both internal (inside the cabin) and external (at the floor) requests. It features a complete datapath and control unit, ensuring smooth state transitions, request queuing, and hardware-level safety checks (like door sensors and weight limits).

A key highlight of this project is the smart display integration, which uses two 7-segment displays to output the current floor and movement direction in real time.

✨ Key Features
Smart 7-Segment Display: Real-time tracking of the current floor (et_crt).

Multi-Command Handling: Processes internal requests (et_int) and external requests (et_ext) using a dedicated command fetcher (getCMD).

Hardware Debouncing: Ensures clean, noise-free input from physical FPGA buttons/switches.

Safety Sensors Simulation: Integrates logic for a maximum weight limit (g_max), door sensors (SENZOR_USI), and obstruction detection (persoana_usa).

Direction Tracking: Automatically determines movement direction (Sens) based on target floors.

Custom Clock Divider: Scales down the high-frequency FPGA clock for debouncing and human-readable 7-segment multiplexing.

🏗️ System Architecture
The core of the project revolves around a central Control Unit that communicates with various specialized modules.

Core Components
Control Unit (FSM): The "brain" of the elevator. It evaluates current floors, target floors, sensor inputs, and dictates when the elevator should move or stop.

getCMD (Fetch Command): Parses 12-bit external vectors and 4-bit internal vectors to determine the next valid target floor.

Registers (Target, C1, C2, et_crt_reg): Used to queue incoming commands and store the current state/floor of the elevator.

Numarator (Counter): Increments or decrements the current floor based on the movement direction (Sens).

Divizor de frecventa (Clock Divider): Divides the main FPGA clock (clk) to generate a slower clock (clk_D) for debouncers and display modules.

7 Segment Driver: Translates the binary floor data into visual outputs for the 7-segment display anodes and cathodes.


📂 Repository Structure
src/ - Contains all VHDL source files (.vhd).

Control_Unit.vhd - Main state machine.

Debouncer.vhd - Button debouncing logic.

Seven_Segment.vhd - Display driver.

Counter.vhd - Floor counting logic.

sim/ - Testbenches used for behavioral simulation.

docs/ - Project documentation and block diagrams.

🚀 Getting Started
Prerequisites
Synthesis & Simulation Tool: Xilinx Vivado.

Hardware: An FPGA development board with at least two 7-segment displays, buttons, and switches (Nexys A7).

Running the Project
Clone the repository:

Bash
git clone https://github.com/Adelinn77/Elevator-VHDL.git
Open your preferred HDL IDE (e.g., Vivado).

Create a new project and add all .vhd files from the src/ folder.

Run the behavioral simulation using the provided testbenches in the sim/ folder to view the waveform.

To test on hardware, map the inputs/outputs to your specific board's constraint file (e.g., .xdc or .qsf) and generate the bitstream.

Program the FPGA and test the physical switches!
