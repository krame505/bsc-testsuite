(* synthesize *)
module sysx () ;
  Reg#(Bool) myregister <- mkRegU();
  rule foobar;
        (* split=0 *)
        if (myregister)
        $display("123");
        else
        $display("999");

  endrule
endmodule
