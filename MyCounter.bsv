interface Counter;
	method Bit#(8) read();
	method Bit#(8) term();
	method Bit#(1) readflag();
	method Action load(Bit#(8) newval);
	method Action increment();
endinterface

(* synthesize *)
module mkCounter(Counter);
// module body goes here
	Reg#(Bit#(8)) value <- mkReg(0);
	Reg#(Bit#(8)) total <- mkReg(0);
	Reg#(Bit#(1)) flag <- mkReg(0);
	method Bit#(8) read();
		return value;
	endmethod

	method Bit#(8) term();
		return total;
	endmethod

	method Bit#(1) readflag();
		return flag;
	endmethod

	method Action load(Bit#(8) newval);

		total <= newval;
	endmethod

	method Action increment();

	
	if(value != total) 
		value <= value + 1;
	else
		flag <= 1;
	endmethod

endmodule

