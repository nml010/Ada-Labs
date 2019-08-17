--Lab 02
--movestack.ads
generic
	numStack, m, lo, float;
	type MyType is private;
	with procedure Put(x: MyType);
package movestack is
	procedure push(Item: in MyType; Status: out boolean);
	procedure pop(Item: out MyType; Status: out boolean);
	procedure PopLocation(Item: out MyType; Status: out boolean);
	procedure Reallocation(Item: in MyType; Status: out boolean);
	procedure move;
end movestack;