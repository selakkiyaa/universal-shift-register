module usr_tb;
    reg clk;                   
    reg rst;                   
    reg [1:0] mode;           
    reg [3:0] data_in;        
    reg serial_in_left;        
    reg serial_in_right;      
    wire [3:0] q;
    usr uut (
        .clk(clk),.rst(rst),.mode(mode),.data_in(data_in),
         .serial_in_left(serial_in_left),
        .serial_in_right(serial_in_right),
        .q(q)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        rst = 1; mode = 2'b00; 
        data_in = 4'b0000; 
        serial_in_left = 0;
        serial_in_right = 0;
        #10;  
        rst = 0; mode = 2'b11; 
        data_in = 4'b1010;
        #10;  
        mode = 2'b01; serial_in_left = 1;        
        #10;        
        mode = 2'b10; serial_in_right = 0;       
        #10;        
        mode = 2'b00;                            
        #10;
        $finish;                                 
    end
    initial begin
        $monitor("Time=%0d, rst=%b, mode=%b, data_in=%b, serial_in_left=%b, serial_in_right=%b, q=%b",
                 $time, rst, mode, data_in, serial_in_left, serial_in_right, q);
    end
endmodule
