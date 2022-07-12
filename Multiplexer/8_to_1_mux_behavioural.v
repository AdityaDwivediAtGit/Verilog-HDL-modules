module Eight_to_One_Mux(Out, Select_Line, I);
    input [0:7] I;
    input [0:2] Select_Line;
    output reg Out;

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


module testbench;
    reg [0:7] I;
    reg [0:2] Select_Line;
    wire Out;

    Eight_to_One_Mux m8 (Out, Select_Line, I);

    initial begin
        // monitoring inputs and outputs
        $monitor("8:1 Mux Time =", $time, ", I = %b, Select_Line = %b, Out = %b", I, Select_Line, Out);

        #1 I=8'hcb; Select_Line=0;
        #1 I=8'hcb; Select_Line=1;
        #1 I=8'hcb; Select_Line=2;
        #1 I=8'hcb; Select_Line=3;
        #1 I=8'hcb; Select_Line=4;
        #1 I=8'hcb; Select_Line=5;
        #1 I=8'hcb; Select_Line=6;
        #1 I=8'hcb; Select_Line=7;
        #1 $finish;
        // TESTED OK
    end
endmodule