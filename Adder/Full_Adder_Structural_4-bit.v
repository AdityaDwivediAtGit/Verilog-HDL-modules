// Structural model
module four_bit_adder(sum, carry_out, a, b, carry_in);
    //Syntax: Array of 64 registers containing 4 bits each
    //    reg [0:3]     abc      [0:63] ;
    //    reg bits/reg  reg_name no_of_reg;
    input [3:0] a,b;
    input carry_in;
    output [3:0] sum;
    output carry_out;
    wire t1, t2, t3;
    // Syntax:
    // module      ModuleVariableName  parameters
    single_bit_adder        a0         (sum[0],   t1,      a[0], b[0], carry_in);
    single_bit_adder        a1         (sum[1],   t2,      a[1], b[1], t1);
    single_bit_adder        a2         (sum[2],   t3,      a[2], b[2], t2);
    single_bit_adder        a3         (sum[3], carry_out, a[3], b[3], t3);
endmodule

// Structural model
module single_bit_adder(sum, carry_out, a, b, carry_in);
    input a,b,carry_in;
    output sum, carry_out;

    half_adder_sum s1 (sum,       a, b, carry_in);
    carry          c1 (carry_out, a, b, carry_in);
endmodule

// Structural model
module half_adder_sum (sum, a, b, carry_in);
    input a,b, carry_in;
    output sum;
    wire t;
    // sum = a xor b xor carry_in
    xor x1 (t,  a,b);
    xor x2 (sum,t,carry_in);
endmodule

// Structural model
module carry (carry_out, a, b, carry_in);
    input a,b,carry_in;
    output carry_out;
    wire t1, t2, t3;
    // Carry = AB + BC + CA
    and a1 (t1, a, b);
    and a2 (t2, b, carry_in);
    and a3 (t3, a, carry_in);
    or  a4 (carry_out, t1, t2, t3);
endmodule

module testbench; // Note: Testbench does not have inputs and outputs
    reg [3:0] A,B;    // reg used for giving inputs
    reg carry_in;
    wire [3:0] sum;     // wire used to collect outputs
    wire carry_out;

    // instantiation
    four_bit_adder a1 (sum, carry_out, A, B, carry_in);

    initial begin
        // monitoring (prints whenever the variables inside it change)
        $monitor("Time =",$time," : A=%b, B=%b, carry_in=%b, carry_out=%b, sum=%b", A,B,carry_in,carry_out,sum);
        //$monitor("Time =",$time," : A=%d, B=%d, carry_in=%d, carry_out=%d, sum=%d", A,B,carry_in,carry_out,sum);

        // Giving inputs to test
        #5 A=0; B=0; carry_in=0; // lowest input (OK)
        #5 A=0; B=0; carry_in=1;
        #5 A=0; B=1; carry_in=0;
        #5 A=0; B=1; carry_in=1;
        #5 A=0; B=2; carry_in=0;
        #5 A=0; B=2; carry_in=1;
        #5 A=0; B=6; carry_in=0;
        #5 A=0; B=7; carry_in=1;
        #5 A=3; B=8; carry_in=0;
        #5 A=3; B=9; carry_in=1;
        #5 A=8; B=8; carry_in=0;
        #5 A=8; B=8; carry_in=1;
        #5 A=15; B=15; carry_in=1; // highest input (OK)
        #5 $finish;
        // TESTED OK
    end
endmodule