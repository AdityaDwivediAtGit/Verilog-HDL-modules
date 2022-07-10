/* Behavioural Model

inputs outputs
A B C sum carry
0 0 0  0   0
0 0 1  0   1
0 1 0  0   1
0 1 1  1   0
1 0 0  0   1
1 0 1  1   0
1 1 0  1   0
1 1 1  1   1

Hence, 
    Sum = A xor B xor C
    Carry = AB + BC + CA
*/
module adder (
    input A,B,C,
    output sum, carry
);
    assign sum = A ^ B ^ C;             // sum = 1 if 1 time or 3 times ones exist
    assign carry = (A&B)|(B&C)|(C&A);   // carry=1 if 2 time or 3 times ones exist
endmodule