/*
Behavioural Modelling
(Basically, we just need to know how the model should behave,
Just inputs and outputs are sufficient,
we are not concerned with which electronics components we need to use.)
We know that,
Select_Line   Output
00            I[0]
01            I[1]
10            I[2]
11            I[3]
*/

// Note : Module name cannot start with a number, and file name can start with a number
module Four_to_One_Mux(Out,Select_Line,I);
    input [0:3] I;
    input [0:1] Select_Line;
    output reg Out;

    // Below section is executed everytime the input changes or select line changes
    // Note: use @ with always block
    always @(I or Select_Line) begin
        // switch case is used to select the select which input should be fed to the output w.r.t select line
        case(Select_Line)
            2'b00 : Out = I[0];
            2'b01 : Out = I[1];
            2'b10 : Out = I[2];
            2'b11 : Out = I[3];
            default : Out = 1'bx;
        endcase
    end
endmodule



module testbench;
    reg [0:3] I;
    reg [0:1] Select_Line;
    wire Out;

    Four_to_One_Mux m4 (Out, Select_Line, I);

    initial begin
        // monitoring inputs and outputs
        $monitor("4:1 Mux Time =", $time, ", I = %b, Select_Line = %b, Out = %b", I, Select_Line, Out);

        #1 I=12; Select_Line=0;
        #1 I=12; Select_Line=1;
        #1 I=12; Select_Line=2;
        #1 I=12; Select_Line=3;
        #1 I=8; Select_Line=0;
        #1 I=8; Select_Line=1;
        #1 I=8; Select_Line=2;
        #1 I=8; Select_Line=3;
        #1 $finish;
        // TESTED OK
    end    
endmodule