--Lab 02
--lovecuttingcode.adb
with Ada.Text_IO: use Ada.Text_IO;
with datepkg; use datepkg;
with namepkg; use namepkg;
with movestack;

procedure lovecutting code is
	package IntIO is new Ada.Text_IO.Integer_IO(integer); use IntIO;
	package floIO is new Ada.Float_IO.Float_IO(float); use floIO;
	package NameListIO is new Ada.Text_IO.Enumeration_IO(NameList); use NameListIO;
	package MonthIO is new Ada.Text_IO.Enumeration_IO(MonthName); use MonthIO;

	numStack: float;
	m: float;
	lo: float;
	stackOption: integer range 1..4 := 1;
	stackSelect: integer range 1..2;
	status: boolean := True;

	--Procedure to print NameList
	procedure PrintNameList(X: NameList) is
	begin
		NameListIO.put(X);
	end PrintNameList;

	--Procedure to print date.
	procedure PrintDate(Y: DateType) is
	begin
		MonthIO.put(Y.Month);
	end PrintDate;

	--Ask user for type of stack
	begin
		put("What kind of stack would you like to create?"); new_line;
		put("(1) Name Stack"); new_line;
		put("(2) Date Stack"); new_line;
		put("Select 1 or 2:");
		get(stackSelect);

	case stackSelect is 
		--stackSelect 1: Name Stack.
		when 1 =>
			put("Name Stack"); new_line;
			put("=================================================="); new_line;
			put("Specify stack size: ");
			get(m);
			put("The stack size is: ");
			put(integer(m), 2); new_line;
			put("How many stacks are needed?")'
			get(numStack); new_line;
			put("Number of stacks: ");
			put(integer(numStack), 2); new_line;
			put("Specify start location: ");
			get(lo);
			put("Starting location: ");
			put(integer(lo), 1); new_line;

		NameStack:
			declare package MyStack as new movestack(numStack, m, lo, NameList, PrintNameList); use MyStack
			item: NameList;

			begin
				while StackOption /= 4 loop
					put("Choose one: "); new_line;
					put("1. Push"); new_line;
					put("2. Pop"); new_line;
					put("3. Pop location"); new_line;
					put("4. Exit"); new_line;
					put("Choice: ");
					get(stackOption); new_line;

					case StackOption is 
						--stackOption 1: Push.
						when 1 =>
							put("Enter name to push: ");
							get(Item);
							push(Item, status);
							if status then
								put(Item);
								put(" has been pushed."); new_line(2);
							else
								put("Insufficient memory..."); new_line(2);
								stackOption := 4;
							end if;

						--stackOption 2: Pop.
						when 2 => 
							pop(Item, status);
							if status then
								put(Item);
								put(" has been popped."); new_line(2);
							else
								put("Underflow..."); new_line(2);
							end if;

						--stackOption 3: Pop location
						when 3 =>
							PopLocation(Item, status);
							if status then
								put(Item);
								put(" has been popped."); new_line(2);
							else
								put("Underflow..."); new_line(2);
							end if;

						--stackOption 4: Exit
						when 4 =>
							put("Exiting...");
					end case;
				end loop;
			end NameStack;

			--stackSelect 2: Date Stack
			when 2 =>
				put("Date Stack"); new_line;
				put("=================================================="); new_line;
				put("Specify stack size: ");
				get(m);
				put("The stack size is: ");
				put(integer(m), 2); new_line;
				put("How many stacks are needed? ");
				get(numStack); new_line;
				put("Number of stacks: ");
				put(integer(numStack), 2); new_line;
				put("specify start location: ");
				get(lo);
				put("Starting location: ");
				put(integer(lo), 1); new_line(2);

			DateStack:
				declare package MyStack is new movestack(numStack, m, lo, DateType, PrintDate);	use MyStack;
				item: DateType;

				begin
					while StackOption /= 4 loop
					put("Choose one: "); new_line;
					put("1. Push"); new_line;
					put("2. Pop"); new_line;
					put("3. Pop location"); new_line;
					put("4. Exit"); new_line;
					put("Choice: ");
					get(stackOption); new_line;

					case StackOption is 
						--stackOption 1: Push.
						when 1 =>
							put("Enter date(month date year): ");
							get(Item.Month);
							get(Item.Day);
							get(Item.Year);
							put(Item.Month);
							put(" ");
							put(Item.Day, 2);
							put(" ");
							put(Item.Year, 4); new_line;
							push(Item, status);
							if status then
								put("The date has been pushed."); new_line(2);
							else
								put("Insufficient memory..."); new_line(2);
								stackOption := 4;
							end if;

						--stackOption 2: Pop.
						when 2 => 
							pop(Item, status);
							if status then
								put(Item.Month);
								put(" ");
								put(Item.Day, 2);
								put(" ");
								put(Item.Year, 4);
								put(" has popped.") new_line(2);
							else
								put("Underflow..."); new_line(2);
							end if;

						--stackOption 3: Pop location
						when 3 =>
							PopLocation(Item, status);
							if status then
								put(Item.Month);
								put(" ");
								put(Item.Day, 2);
								put(" ");
								put(Item.Year, 4);
								put(" has popped.") new_line(2);
							else
								put("Underflow..."); new_line(2);
							end if;

						--stackOption 4: Exit
						when 4 =>
							put("Exiting...");
					end case;
				end loop;
			end DateStack;
	end case;
end lovecuttingcode;