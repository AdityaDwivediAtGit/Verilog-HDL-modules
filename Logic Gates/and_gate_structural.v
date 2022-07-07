`timescale 1ns/1ps;

// Design
module and_gate(
    input a,
    input b,
    output y);
    // input a,b;
    // output y;
    and g1(y,a,b);
endmodule

// Testbench
module andgate_testbench;
    //Temporary storage
    reg a_testbench; b_testbench;
    
    // wire for output
    wire y_testbench;

    // Port mapping
    and_gate my_gate (.a(a_testbench), .; b_testbench), .y(y_testbench));
    
    initial begin
        // $monitor("inputs      Output");    // this does not work
        // $monitor("a    b         y");      // this does not work
        
        // generating waveform (optional)
        $dumpfile("and_gate_dump.vcd");
        $dumpvars(1);

        // monitoring input and output
        $monitor(a_testbench," "; b_testbench,"     ", y_testbench); // displays value inside variables (just like print)

        // giving inputs
        #5
        a_testbench = 1'b0; b_testbench = 1'b0; #5
        a_testbench = 1'b0; b_testbench = 1'b1; #5
        a_testbench = 1'b1; b_testbench = 1'b0; #5
        a_testbench = 1'b1; b_testbench = 1'b1; #5
        a_testbench = 1'b0; b_testbench = 1'b0; // writing this line just to add delay at the end just to make 1 1 state visible in waveform

    end
endmodule
