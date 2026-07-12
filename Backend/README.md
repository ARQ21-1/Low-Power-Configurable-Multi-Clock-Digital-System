# Low Power Configurable Multi Clock Digital System

A small digital system that receives commands and operands over UART, performs ALU operations, and returns the result back over UART. Includes full RTL, a self-checking testbench, and a complete ASIC backend flow (synthesis, DFT insertion, and Formality equivalence checking).

## Architecture Overview

```
UART_RX_IN → UART → RX Data Sync → SYS_CTRL (FSM) → RegFile → ALU → SYS_CTRL → FIFO → UART → UART_TX_O
```

- **UART** — handles serial RX/TX, including parity and framing error detection
- **SYS_CTRL** — top-level FSM that decodes incoming commands and orchestrates register writes, ALU operations, and FIFO writes for the response
- **RegFile** — 4-register file (Operand A, Operand B, UART config, clock divider ratio)
- **ALU** — performs the configured operation on the two operands
- **FIFO_TOP** — asynchronous FIFO buffering ALU results before UART transmission
- **CLK_DIV / CLKDIV_MUX** — configurable clock dividers for independent UART RX/TX baud rates
- **CLK_GATE** — gates the ALU clock for power savings when idle
- **RST_SYNC / DATA_SYNC** — reset and data synchronizers for safe clock-domain crossing

See `sys.pdf` for the full system block diagram.

## Repository Structure

```
├── RTL/                 # All synthesizable RTL + testbench (SYSTEM_TB.v)
├── backend/             # ASIC backend flow (renamed from "backend stuff")
│   ├── syn/              # Synthesis outputs (netlist, timing/area/power reports)
│   ├── dft/               # DFT insertion outputs
│   ├── fm_syn/            # Formality: RTL vs. synthesized netlist equivalence check
│   └── fm_dft/            # Formality: synthesized vs. DFT netlist equivalence check
├── run.do                # ModelSim/Questa compile + simulate script
├── wave.do                # Waveform signal list for the simulation
└── sys.pdf               # System block diagram
```

## Running the Simulation

From the repository root, using ModelSim/Questa:

```tcl
do run.do
```

This compiles all RTL, elaborates `SYSTEM_tb`, loads the waveform configuration from `wave.do`, and runs the full testbench.

## Backend Flow

The `backend/` folder contains outputs from a Synopsys Design Compiler synthesis flow, DFT (scan) insertion, and Formality equivalence checking between each stage:

- `syn/` — synthesized netlist (`SYS_TOP.v`), timing constraints (`SYS_TOP.sdc`), and area/power/timing reports
- `dft/` — DFT-inserted netlist and associated reports
- `fm_syn/`, `fm_dft/` — Formality logs confirming logical equivalence was preserved at each transformation step

## Notes

- `SYS_TOP.v` appears at multiple stages (RTL, post-synthesis, post-DFT) — each copy reflects that specific stage of the flow, not a duplicate/leftover file.
- Parity and framing error outputs (`parity_error`, `framing_error`) are exposed at the top level for monitoring UART link integrity.
