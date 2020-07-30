import FIFO::*;

// two rules using different invocations of a single-ported method:
// fails when aggressive conditions are default and the invocations
// are lifted to the rule predicates and need too many resources

(* synthesize *)
module sysAggCondsRules();
   FIFO#(Bool) f1 <- mkFIFO;
   FIFO#(Bool) f2 <- mkFIFO;
   Reg#(Bool) r1 <- mkRegU;
   Reg#(Bool) r2 <- mkRegU;
   Reg#(Bool) r3 <- mkRegU;
   I i <- mkI;

   rule rule1(r3);
      r1 <= i.m(2) == 1 ? f1.first : f2.first;
   endrule

   rule rule2(!r3);
      r2 <= i.m(10) == 5 ? f2.first : f1.first;
   endrule
endmodule

interface I;
    method Bit#(8) m(Bit#(8) arg);
endinterface

import "BVI" I =
   module mkI (I);
      default_clock clk();
      default_reset rst();
      method M m (ARG);
      schedule m CF m;
   endmodule

