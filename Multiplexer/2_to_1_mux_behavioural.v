module Two_to_One_Mux(Out, Select_Line, I);
    input [0:1] I;
    input Select_Line;
    output reg Out;

    always @(I or Select_Line) begin
        case(Select_Line)
            1'b0 : Out = I[0];
            1'b1 : Out = I[1];
            default : Out = 1'bx;
        endcase
    end
endmodule



module testbench;
    reg [0:1] I;
    reg Select_Line;
    wire Out;

    Two_to_One_Mux m2 (Out, Select_Line, I);

    initial begin
        // monitoring inputs and outputs
        $monitor("2:1 Mux Time =", $time, ", I = %b, Select_Line = %b, Out = %b", I, Select_Line, Out);

        #1 I=2'bzx; Select_Line=0;
        #1 I=2'bzx; Select_Line=1;
        #1 I=2'b01; Select_Line=0;
        #1 I=2'b10; Select_Line=1;
        #1 $finish;
        // TESTED OK
    end    
endmodule
