# 4:1 Multiplexer Using Verilog HDL

## 📌 Project Description

A **4:1 Multiplexer (MUX)** is a combinational logic circuit that selects one of four input signals and transfers the selected signal to a single output.

This project implements a **4:1 Multiplexer** using Verilog HDL. The multiplexer has four data inputs, two select inputs, and one output.

The two select inputs determine which data input is connected to the output.

## 🔌 Inputs and Output

### Data Inputs

* `I0` – First data input
* `I1` – Second data input
* `I2` – Third data input
* `I3` – Fourth data input

### Select Inputs

* `S1` – Most significant select bit
* `S0` – Least significant select bit

### Output

* `Y` – Multiplexer output

## ⚙️ Working Principle

The output depends on the values of the select inputs.

| S1 | S0 | Selected Input | Output |
| -- | -- | -------------- | ------ |
| 0  | 0  | I0             | Y = I0 |
| 0  | 1  | I1             | Y = I1 |
| 1  | 0  | I2             | Y = I2 |
| 1  | 1  | I3             | Y = I3 |

Therefore:

```text
S1 S0 = 00 → Y = I0
S1 S0 = 01 → Y = I1
S1 S0 = 10 → Y = I2
S1 S0 = 11 → Y = I3
```

## 🧮 Logic Equation

```text
Y = S1'S0'I0 + S1'S0I1 + S1S0'I2 + S1S0I3
```

## 💻 Verilog Design

File: `src/mux_4to1.v`

```verilog
module mux_4to1 (
    input I0,
    input I1,
    input I2,
    input I3,
    input S1,
    input S0,
    output Y
);

    assign Y = (~S1 & ~S0 & I0) |
               (~S1 &  S0 & I1) |
               ( S1 & ~S0 & I2) |
               ( S1 &  S0 & I3);

endmodule
```

## 🧪 Testbench

File: `testbench/mux_4to1_tb.v`

The testbench verifies the multiplexer by applying different input combinations and testing all four select combinations.

A VCD waveform file is also generated for viewing in GTKWave.

```verilog
`timescale 1ns/1ps

module mux_4to1_tb;

    reg I0;
    reg I1;
    reg I2;
    reg I3;
    reg S1;
    reg S0;

    wire Y;

    // Instantiate 4:1 Multiplexer
    mux_4to1 uut (
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .S1(S1),
        .S0(S0),
        .Y(Y)
    );

    initial begin

        // Generate waveform
        $dumpfile("simulation/waveform.vcd");
        $dumpvars(0, mux_4to1_tb);

        $display("S1 S0 | I0 I1 I2 I3 | Y");
        $display("------------------------");

        // Input values
        I0 = 0;
        I1 = 1;
        I2 = 0;
        I3 = 1;

        // Select I0
        S1 = 0;
        S0 = 0;
        #10;

        // Select I1
        S1 = 0;
        S0 = 1;
        #10;

        // Select I2
        S1 = 1;
        S0 = 0;
        #10;

        // Select I3
        S1 = 1;
        S0 = 1;
        #10;

        // Change input values
        I0 = 1;
        I1 = 0;
        I2 = 1;
        I3 = 0;

        // Select I0
        S1 = 0;
        S0 = 0;
        #10;

        // Select I1
        S1 = 0;
        S0 = 1;
        #10;

        // Select I2
        S1 = 1;
        S0 = 0;
        #10;

        // Select I3
        S1 = 1;
        S0 = 1;
        #10;

        $finish;

    end

    // Display simulation values
    initial begin
        $monitor("Time=%0t | S1=%b S0=%b | I0=%b I1=%b I2=%b I3=%b | Y=%b",
                 $time, S1, S0, I0, I1, I2, I3, Y);
    end

endmodule
```

## ▶️ Simulation

This project can be simulated using **Icarus Verilog** and **GTKWave**.

### Step 1: Compile

From the project directory:

```bash
iverilog -o mux_4to1_sim src/mux_4to1.v testbench/mux_4to1_tb.v
```

### Step 2: Run Simulation

```bash
vvp mux_4to1_sim
```

The simulation generates:

```text
simulation/waveform.vcd
```

### Step 3: View Waveform

Open the waveform using GTKWave:

```bash
gtkwave simulation/waveform.vcd
```

Add these signals:

```text
I0
I1
I2
I3
S1
S0
Y
```

## 📈 Expected Simulation

For the first set of inputs:

```text
I0 = 0
I1 = 1
I2 = 0
I3 = 1
```

The output should be:

```text
S1 S0 = 00 → Y = 0
S1 S0 = 01 → Y = 1
S1 S0 = 10 → Y = 0
S1 S0 = 11 → Y = 1
```

For the second set:

```text
I0 = 1
I1 = 0
I2 = 1
I3 = 0
```

The output should be:

```text
S1 S0 = 00 → Y = 1
S1 S0 = 01 → Y = 0
S1 S0 = 10 → Y = 1
S1 S0 = 11 → Y = 0
```

## 📋 Expected Output

```text
S1 S0 | I0 I1 I2 I3 | Y
------------------------
 0  0 |  0  1  0  1 | 0
 0  1 |  0  1  0  1 | 1
 1  0 |  0  1  0  1 | 0
 1  1 |  0  1  0  1 | 1
 0  0 |  1  0  1  0 | 1
 0  1 |  1  0  1  0 | 0
 1  0 |  1  0  1  0 | 1
 1  1 |  1  0  1  0 | 0
```

## 🛠️ Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Git
* GitHub

## 🎯 Applications

4:1 Multiplexers are commonly used in:

* Data selection
* Data routing
* Processor datapaths
* Digital switching
* Communication systems
* Control circuits
* Arithmetic circuits
* Digital system design

## ✅ Conclusion

The **4:1 Multiplexer** was successfully designed and verified using Verilog HDL. The testbench tests all four select combinations and verifies that the output `Y` correctly follows the selected input.

The simulation waveform provides a visual representation of the relationship between the select inputs, data inputs, and output.

## 👨‍💻 Author

**Your Name**

GitHub: **Your GitHub Username**
