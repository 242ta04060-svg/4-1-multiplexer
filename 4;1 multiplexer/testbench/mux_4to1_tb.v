`timescale 1ns/1ps

module mux_4to1_tb;

```
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

    // First input combination
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

    // Second input combination
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
```

endmodule
