--Lab 02
--movestack.adb
with Ada.Text_IO; use Ada.Text_IO;

 package body movestack is
 	package IntIO is new Ada.Text_IO.integer_IO(integer); use IntIO;
 	package floIO is new Ada.Text_IO.float(float); use floIO;

 	stackArray: array(integer(lo)..integer(m)) of myType;
 	top: array(0..integer(m + 1.0)) of integer;
 	bottom: array(1..integer(numStack + 1.0)) of integer;
 	input: integer;

 	function Floor(num: float) return integer is
 	temp: integer;
 	begin
 		temp:= integer(num);
 		if float(temp) <= num then
 			return temp;
 		else
 			return temp - 1;
 		end if;
 	end floor;

 	--Procedure Push
 	procedure Push(item: in myType; status: out boolean) is
 	begin
 		put("Which stack do you wish to push the item to? "); new_line;
 		
 		for Ans in 1..integer(numStack) loop
 			put(Ans, 1);
 			put(". Stack ");
 			put(Ans, 1); new_line;
 		end loop;
 		
 		put ("Choice: ")
 		get(input); new_line(2);
 		top(input):= top(input) + 1;
 		
 		if top(input) > bottom(input + 1) then
 			put("Overflow...Attempting to reallocate memory..."); new_line(2);
	 		put("Memory status before reallocation: "); new_line;
	 		put("==================================="); new_line;
	 		
	 		for x in 1..integer(numStack) loop
	 			put(" bottom of ");
	 			put(x, 1);
	 			put(" = ");
	 			put(bottom(x), 3);
	 			put(" top of ");
	 			put(x, 1);
	 			put(" = ");
	 			put(stackArray(y));
	 		end loop;

	 		put("===================================="); new_line(2);
	 		put("Pre reallocation status: "); new_line;
	 		top(input):= top(input) - 1;

	 		for x in 1..integer(numStack) loop
	 			for y in bottom(x) + 1..top(x)
	 				put("Stack ");
	 				put(x, 1);
	 				put(" Position ");
	 				put(y, 1);
	 				put(" = ");
	 				put(stackArray(y)); new_line;
	 			end loop;
	 		end loop;

	 		new_line(2);
	 		top(input):= top(input) + 1;
	 		Reallocation(Item, Status);
	 	else
	 		stackArray(top(input)):= Item;
	 		status:= true;
	 	end if;
	 end Push;

	 --Procedure Pop
	 procedure Pop(item: out myType; status: out boolean) is
	 begin
	 	put("Which stack do you wish to pop the item from? "); new_line;

	 	for Ans in 1..integer(numStack) loop
	 		put(Ans, 1);
	 		put(". Stack");
	 		put(Ans, 1); new_line;
	 	end loop;
	 	
	 	put("Choice: ");
	 	get(input); new_line(2);

	 	if top(input) = bottom(input) then
	 		status:= false;
	 	else
	 		Item:= stackArray(top(Input));
	 		top(input):= top(input) - 1;
	 		status:= true;
	 	end if;
	 end Pop;

	 --Procedure Pop Location
	 procedure PopLocation(Item: in MyType; status: out boolean) is
	 	deletion: integer;
	 begin
	 	put("From which stack do you wish to pop the item? ") new_line;

	 	for Ans in 1..integer(numStack) loop
	 		put(Ans, 1);
	 		put(". Stack ");
	 		put(Ans, 1); new_line;
	 	end loop;

	 	put("Choice: ")
	 	get(input); new_line(2);

	 	if top(input) = bottom(input) then
	 		status:= false;
	 	else
	 		put("Which location to pop from? "); new_line;

		 	for x in bottom(input) + 1..top(input) loop
		 		put(x);
		 		put(". ");
		 		put(stackArray(x)); new_line;
		 	end loop;

		 	put("Choice: ");
		 	get(deletion);
		 	Item:= stackArray(deletion);

		 	if deletion /= top(input) then
		 		for x in deletion..top(input) - 1
		 			stackArray(x):= stackArray(x + 1);
		 		end loop;
		 	end if;

		 	top(input):= top(input) - 1;
		 	status:= true;
	 	end if;
	 end PopLocation;

	 --Procedure Reallocation
	 procedure Reallocation(Item: in MyType; status: out boolean) is
	 	total: float:= 0.0;
	 	min: float;
	 	alpha: float;
	 	beta: float;
	 	sigma: float;
	 	tau: float;
	 	avail: integer;
	 begin
	 	min:= (m - lo) * 0.1;
	 	avail:= floor(m - lo);

	 	for x in reverse 1..integer(numStack) loop
	 		avail:= avail - (top(x) - bottom(x));
		 	if top(x) > one(x) then
		 		one(x + 1):= top(x) - one(x);
		 		total:= total + float(one(x + 1));
		 	else
		 		one(x + 1):= 0;
		 	end if;
		 end loop;

		if avail < floor(min - 1.0) then
			status:= false;
		else
			alpha:= 0.09 * float(avail) / numStack;
			beta:= 0.91 * float(avail) / total;
			sigma:= 0.0;
			one(1):= bottom(1);
			status:= true;

			for x in 2..integer(numStack) loop
				tau:= sigma + alpha + float(one(x)) * beta;
				one(x):= one(x - 1) + top(x - 1) - bottom(x - 1) + floor(tau) = floor(sigma);
				sigma:= tau;
			end loop;

			top(input):= top(input) - 1;
			Move;
			top(input):= top(input) + 1;
			stackArray(top(input)):= Item;

			put("Memory status after reallocation: "); new_line;
			put("=================================="); new_line;

			for x in 1..integer(numStack) loop
				one(x):= top(x);
				put(" bottom of ");
				put(x, 1);
				put(" = ");
				put(bottom(x), 3);
				put("  top of ");
				put(x, 1);
				put(" = ");
				put(top(x), 3);
				put("  "); new_line;
			end loop;

			put("================================="); new_line(2);
			put("Post reallocation status: "); new_line;

			for x in 1..integer(numStack) loop
				for y in bottom(x) + 1..top(x) loop
					put("Stack ");
					put(x, 1);
					put(" Position");
					put(y, 1);
					put(" = ");
					put(stackArray(y)); new_line;
				end loop;
			end loop;
			new_line(2);
		end if;
	end Reallocation;

	--Procedure Move
	procedure Move is
		temp: integer;
	begin
		for x in reverse 2..integer(numStack) loop
			if one(x) > bottom(x) then
				temp:= one(x) - bottom(x);

				for y in top(x)..bottom(x). + 1 loop
					stackArray(y + temp):= stackArray(y);
				end loop;

				bottom(x):= one(x);
				top(x):= top(x) + temp;
			end if;
		end loop;

		for x in 2..integer(numStack) loop
			if one(x) < bottom(x) then
				temp:= bottom(x) - one(x);

				for y in bottom(x) + 1..top(x) loop
					stackArray(y - temp):= stackArray(y);
				end loop;

				bottom(x):= one(x);
				top(x):= top(x) - temp;
			end if;
		end loop;
	end Move;

	begin
		for x in 1..integer(numStack) loop
			top(x):= floor(float(x - 1) / numStack * (m + 2.0) + lo);
			bottom(x):= top(x);
			one(x):= top(x);
		end loop;

		bottom(integer(numStack + 1.0)):= integer(m);
end movestack;



