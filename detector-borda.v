module detector_borda (
    input clk,
    input rst,
    input [1:0] entrada,
    output [1:0] detector
);
    
    //insira seu código aqui
    reg [1:0] entrada_anterior;
    reg [1:0] _detector;
    integer i;
    parameter N = 2;

    always @(posedge clk or rst) begin
        if(rst) begin
            _detector = 2'b00;
            entrada_anterior = 2'b00;
        end 
        else begin
            for(i = 0; i < N; i = i+1) begin
                _detector[i] = entrada[i] & ~entrada_anterior[i];
            end
            entrada_anterior = entrada;
        end
    end

    assign detector = _detector;
endmodule



// module tb();
//     reg clk;
//     reg rst;
//     reg [1:0] entrada;
//     wire [1:0] detector;

//     detector_borda d(
//         .clk(clk),
//         .rst(rst),
//         .entrada(entrada),
//         .detector(detector)
//     );

//     always #1 clk = (clk===1'b0);

//     initial begin
//         $monitor("clock = %b, reset = %b, entrada[0]=%b, detector[0]=%b, entrada[1]=%b, detector[1]=%b", clk, rst, entrada[0], detector[0], entrada[1], detector[1]);

//         entrada[0]=1;entrada[1]=1;
//         #3;
//         rst = 0;
//         #3;
//         entrada[0] = 1;
//         #3;
//         entrada[0] = 1;
//         #3;
//         entrada[0] = 0;
//         #3;
//         entrada[0] = 1;
//         #3;


//         $finish;
//     end


// endmodule