
interface S1#(type aA);
 (* result = "mine" *)
 method aA result(aA c);
 method ActionValue#(aA) check(aA d);
endinterface

interface IFC#(type anyType);
 (* ready = "mine" *)
 method Action start(anyType a, anyType b);
 (*prefix = "" *)
 interface S1#(anyType) subIFC;
endinterface

typedef Bit#(5) Type;

(* synthesize *) 
module mkDesign_03 (IFC#(Type));

  Reg#(Type) val <- mkReg(0);
  Reg#(Type) res <- mkReg(0);


  method Action start(a,b);
    val <= a;
    res <= b;
  endmethod	

 interface S1 subIFC;
  method Type result(c);
     return res+c;
  endmethod	
  	 
  method ActionValue#(Type) check(d);
    val <= val + 1;
    res <= res + 2;
	return res+d;
  endmethod	
 endinterface
	
endmodule
