function Action foo(Bool y, Reg#(Bool) r);
  action
    Bool x;
    case (y) matches
      tagged True: begin
              x = !y;
              r <= x;
            end
      tagged False: begin
               x = y;
               r <= x;
             end
    endcase
  endaction
endfunction: foo

module bar();
  Reg #(Bool) r();
  mkReg#(False) r_inst(r);

  rule bogus;
    foo(r, r);
  endrule
endmodule: bar
