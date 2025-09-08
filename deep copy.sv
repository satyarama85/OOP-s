// Code your testbench here
// or browse Examples
class packet;
  int data;
endclass
class vlsi;
  int a;
  int b;
  packet pkt=new();
  function void print();
    $display("a=%0d",a);
    $display("b=%0d",b);
    $display("a=%0p",pkt);
  endfunction
  function void copy(output vlsi v);
    v=new();
    v.a=a;
    v.b=b;
    v.pkt=new();
    v.pkt.data=pkt.data;
  endfunction
endclass
module top;
  vlsi v1,v2;
  initial begin
    v1=new();
    v2=new();
    v2.a=15;
    //v1=new v2;//shallow copy syntax
    v2.copy(v1);
    $display("v1=%0p",v1);
    v2.a=25;
    v2.b=35;
    v2.pkt.data=400;
    //$display("v1=%0p",v1);
    //display("v2=%0p",v2);
    //no output (handle name will be printed).
    v1.print();
    v2.print();
    v2.a=20;
    v2.b=50;
    v2.pkt.data=500;
    v1.print();
    v2.print();
  end
endmodule

//output:
# KERNEL: v1=15 0 <class handle>
# KERNEL: a=15
# KERNEL: b=0
# KERNEL: a=0
# KERNEL: a=25
# KERNEL: b=35
# KERNEL: a=400
# KERNEL: a=15
# KERNEL: b=0
# KERNEL: a=0
# KERNEL: a=20
# KERNEL: b=50
# KERNEL: a=500
