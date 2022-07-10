// Structural model
module four_bit_adder(sum, carry_out, a, b, carry_in);
    //Syntax: Array of 64 registers containing 4 bits each
    //    reg [0:3]     abc      [0:63] ;
    //    reg bits/reg  reg_name no_of_reg;
    input [0:3] a,b;
    input carry_in;
    output [0:3] sum;
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