import MyCounter::*;

(* synthesize *)

module mkTbCounter();

	Counter counter <- mkCounter();

	Reg#(Bit#(16)) state <- mkReg(0);

	rule step0(state == 0);

		counter.load(42); //carrega
		
		state <= 3;
	endrule

	rule step3(state == 3);

		counter.increment();
		$display(counter.read());
		if (counter.readflag() == 1) state <= 2;	
	endrule

	rule step4(state == 4);
		if(counter.read() != 42 )
			state <= 3;
	endrule

	rule done(state == 2);
		$display("TESTS FINISHED");
		$finish(0);
	endrule
endmodule

