--Lab 01 telescope.adb
with Ada.Unchecked_Conversion;
with Ada.Text_IO;
use Ada.Text_IO;
with GenericStack;
with DatePkg;
use DatePkg;

procedure telescope is

package integerIO is new Ada.Text_IO.Integer_IO(integer);
use integerIO;
package MonthIO is new Ada.Text_IO.Enumeration_IO(MonthName);
use MonthIO;

--Format for printing the Date
procedure printDate(aDate: in DateType) is
	begin
		put(aDate.month);
		put(aDate.day, 3);
		put(aDate.year, 5);
		
end printDate;

--Conversions----------------------------------------------------------
--integer to character
function intTOchar is new Ada.Unchecked_Conversion(integer, character);
--character to Integer_IO
function charTOint is new Ada.Unchecked_Conversion(character, integer);
-----------------------------------------------------------------------
--Variables------------------------------------------------------------
cnvrt01: integer;
cnvrt02: character;
stackSize: integer;
x: integer = 1;
length: natural;
stackSelect: integer;
stackOption: integer;
intIn: integer;
stringIn: string(1..20);
char: character;
aDate: DateType;
tDate: DateType:= (January, 1, 0); --entered to terminate date input
cDate: DateType:= (January, 1, 0); --counter for Date Stack
------------------------------------------------------------------------
begin
	put("Do you wish to set the stack size? (y or n): ");
	get(char);
	
	if char = 'y' then
		put("Enter stack size: ");
		get(stackSize);
	else
		put("Stack has defaulted to size 5...");
		stackSize = 5;
	end if;
	
	put("Stack Types: ");
	new_line;
	put("1. Character Stack");
	new_line;
	put("2. Integer Stack");
	new_line;
	put("3. Date Stack");
	new_line;
	put("Choice (1, 2, 3): ");
	get(stackSelect);
	new_line;
	
	--Case for stackSelect
	case stackSelect is
		--stackSelect 1: Character Stack
		when 1 => declare
		package CharacterStack is new GenericStack(element => character, size => stackSize);
			use CharacterStack;
			
			begin
				put("Character stack has been allocated...");
				new_line;
				new_line;
				
				loop --CharacterStack loop
					put("Choose one: ");
					new_line;
					put("1. Push");
					new_line;
					put("2. Pop");
					new_line;
					put("3. Exit");
					new_line;
					put("Choice (1, 2, 3): ");
					new_line;
					new_line;
				
					--case for push, pop, exit
					case stackOption is 
						--stackOption 1: Push
						when 1 => 
							skip_line;
							put("Enter string: ");
							get_line(stringIn, length);
							new_line;
						
							loop --stackOption 1 loop
								exit when(x > length);
								char:= stringIn(x);
								push(char);
								put(char);
								put(" has been pushed.");
								new_line;
								x:= x + 1;
							end loop; --end stackOption 1 loop
							--new_line
							x:= 1; --reset x
							cnvrt02: intTOchar(length);
							push(cnvrt02);
							put(cnvrt02);
							--put(" has been pushed.");
							new_line;
						--stackOption 2: Pop
						when 2 =>
							pop(char)
							if underflow then 
								null;
							else
								cnvrt(char);
								put("String is being popped...");
								null;
							
								for x in integer range 1...cnvrt01
									loop --for loop
										pop(char);
							end if;
							new_line;
						--stackOption 3+: Exit
						when others ==>
							put("Exiting...");
							exit;
					end case; --end case stackOption
				end loop; --end CharacterStack loop
			end;
--------------------------------------------------------------------------------
	--stackSelect 2: Integer stackOption
	when 2 => delcare	
	package IntegerStack is new GenericStack(element => integer, size => stackSize);
		use IntegerStack;
		
		begin
			put("Integer stack has been allocated...");
			new_line;

		loop --IntegerStack Loop
			put("Choose one: ");
			new_line;
			put("1. Push");
			new_line;
			put("2. Pop");
			new_line;
			put("3. Exit");
			new_line;
			put("Choice (1, 2, 3): ");
			get(stackOption);
			new_line;

			--Case for push, pop, exit
			case stackOption is	
				--stackOption 1: Push
				when 1 =>
					skip_line;
					put("Enter integers: ");
					x:= 0;

					loop --stackOption 1 loop
						get(intIn);

						if intIn /= 0 then
							push(intIn);
							put(intIn);
							put(" has been pushed.");
							new_line;
						else
							push(x);
							put(x);
							put(" integers pushed");
							new_line;
							x:= 1; --reset x
							exit;
						end if;
						x:= x + 1;
					end loop; --end stackOption 1 loop
					new_line;
				--stackOption 2: Pop
				when 2 =>
					skip_line;
					pop(intIn);
					length:= intIn;
					new_line;

					if underflow then
						null;
					else
						put(intIn);
						put(" integers will be popped.");
						new_line;
					
					for x in integer range 1..length
						loop
							pop(intIn);
							put(intIn);
							new_line;
						end loop;
					end if;
				--stackOption 3+: Exit
				when others =>
					put("Exiting...");
					exit;
			end case; --end case stackOption
		end loop; --end IntegerStack loop
	end;
	--------------------------------------------------------------------------------------------------------------------------
	--stackSelect 3: Date Stack
	package DateStack is new GenericStack(element => datetype, size => stackSize);
		use DateStack;

		begin
			loop --DateStack loop
				put("Choose one: ");
				new_line;
				put("1. Push");
				new_line;
				put("2. Pop");
				new_line;
				put("3. Exit");
				new_line;
				put("Choice (1, 2, 3): ");
				get(stackOption)
				new_line;

				--stackOption case
				case stackOption is	
					--stackOption 1: Push
					when 1 => 
						put("Enter dates (January 1, 0 to terminate): ");
						new_line;
						loop --stackOption 1 loop
							get(aDate.month);
							get(aDate.day);
							get(aDate.year);
							new_line;

							if aDate /= tDate then
								push(aDate);
								printDate(aDate);
								put(" has been pushed.");
								new_line;
								new_line;
								cDate.year:= cDate.year + 1;
							else	
								push(cDate)
								exit;
							end if;
						end loop --end stackOption 1 loop
						cDate.year:= 0; --reset counter
					--stackOption 2: Pop
					when 2 =>
						if underflow then
							put("The stack seems empty...");
							new_line;
						else	
							pop(cDate);
							length:= cDate.year;
							put("Dates are being popped...");
							new_line;

							for x in integer range 1..length
								loop 
									pop(aDate);
									printDate(aDate);
								end loop
							cDate.year:= 0; --reset counter
						end if;
					--stackOption 3+: Exit
					when others =>
						put("Exiting...");
						exit;
				end case; --end case stackOption
			end loop; --end DateStack loop
		end;
--------------------------------------------------------------------------------------------------------------------------
		--stackSelect 3+: Error
		when others =>
			put("Valid options are 1, 2, and 3!");
			new_line;
	end case; --end case stackSelect			
end telescope;
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				