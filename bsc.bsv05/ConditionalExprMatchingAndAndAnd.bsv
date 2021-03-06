// (a ? b : c ? d : e) should parse as (a ? b : (c ? d : e))
module e4();
  Reg#(Bit#(8)) x();
  mkReg#(0) the_x(x);
  Reg#(Bit#(8)) y();
  mkReg#(0) the_y(y);
  Reg#(Maybe#(Bool)) m();
  mkReg#(Invalid) the_m(m);
  rule foo (True);
   x <= x>0 ? 1 : m matches tagged Invalid &&& m matches .pat ? 2 : 3;
   y <= y>3 ? x>4 ? 4 : 5 : 6;
  endrule
endmodule

// x > 0 ? 1 : x < 0 ? 2 : 3
// x > 0 ? 1 : (x < 0 ? 2 : 3)
// y>3 ? x>4 ? 4 : 5 : 6;
// y>3 ? (x>4 ? 4 : 5) : 6;
