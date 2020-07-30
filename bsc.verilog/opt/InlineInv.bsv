
typedef 4 N;
Integer n = valueOf(N);

typedef Bit#(16) T;

(* synthesize *)
module sysInlineInv();
   Reg#(Bit#(N)) term <- mkRegU;
   Reg#(T) next <- mkRegU;
   Reg#(T) limit <- mkRegU;

   Reg#(Bool) active[n];
   Reg#(T) finished[n];
   for (Integer i=0; i<n; i=i+1) begin
      active[i] <- mkRegU;
      finished[i] <- mkRegU;
   end

   rule calc;
      if (active[term])
        finished[term] <= ~ (next + limit);
  endrule

endmodule

