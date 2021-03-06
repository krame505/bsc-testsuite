/* Using while loop within for loop, also calculating no. of clock cycles. */

import StmtFSM ::*;

(*synthesize*)
module whileInFor();

Reg#(Bit#(4)) i <- mkRegA(0);
Reg#(Bit#(4)) j <- mkRegA(0);
Reg#(Bool) going <- mkRegA(False);
Reg#(int)  count <- mkRegA(0);

Stmt test_seq =

  seq
      for (i <= 0 ; i <= 5 ; i <= i + 1)
		seq  
		  while ( j <= 5)
		  seq
			  j <= j + 1;
			  if (j == 2) continue;
		      $display(" i = %5d   j = %5d", i, j);
			  if (j == 4) break;
		  endseq
		  j <= 0;
		endseq  
 endseq;

FSM testFSM <- mkFSM(test_seq);

rule start(!going);
    testFSM.start;
	going <= True;
endrule	

rule always_fire;
	count <= count + 1;
endrule

rule clock_cycles(going && testFSM.done);
     $display("Total number of clock cycles =%5d", count);
	 $finish(0);
endrule	 

endmodule
