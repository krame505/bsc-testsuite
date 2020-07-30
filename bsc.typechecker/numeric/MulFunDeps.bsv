// Test the fundeps for built-in typeclass Mul

// This proviso is OK because there is a dependency: a b -> c
function Bit#(b) fn1(Bit#(a) v)  provisos (Mul#(a, b, c));
   return ?;
endfunction

// This proviso is OK because there is a dependency: a c -> b
function Bit#(c) fn2(Bit#(a) v)  provisos (Mul#(a, b, c));
   return ?;
endfunction

// This proviso is OK because there is a dependency: b c -> a
function Bit#(c) fn3(Bit#(b) v)  provisos (Mul#(a, b, c));
   return ?;
endfunction

