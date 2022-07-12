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
module Four_to_One_Mux(
    input [0:3] I,
    input [0:1] Select_Line,
    output reg Out
);
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


// Similarly, making 2:1 Multiplexer and 8:1 Multiplexer
module Two_to_One_Mux(
    input [1:0] I,
    input Select_Line,
    output reg Out
);
    always @(I or Select_Line) begin
        case(Select_Line)
            1'b0 : Out = I[0];
            1'b1 : Out = I[1];
            default : Out = 1'bx;
        endcase
    end
endmodule


module Eight_to_One_Mux(
    input [7:0] I,
    input [2:0] Select_Line,
    output reg Out
);
    always @(I or Select_Line) begin
        case(Select_Line)
            3'b000 : Out = I[0];
            3'b001 : Out = I[1];
            3'b010 : Out = I[2];
            3'b011 : Out = I[3];
            3'b100 : Out = I[4];
            3'b101 : Out = I[5];
            3'b110 : Out = I[6];
            3'b111 : Out = I[7];
            default : Out = 1'bx;
        endcase
    end
endmodule
