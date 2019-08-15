--genericStack.adb
with Ada.Text_IO;
use Ada.Text_IO;

package body genericStack is
        type GenericStack is array(integer range<>) of element;
        RadioStack: GenericStack(1..size);
        top: natural;
        --Push procedure
        procedure push(y: in element) is 
            begin
                if top < size then
                    top:= top + 1;
                    RadioStack(top):= y;
                else
                    put_line("Overflow has occurred...");
                end if;
        end push;
        --Pop procedure
        procedure pop(y: out element) is
            begin   
                if underflow then  
                    put_line("The stack seems empty...");
                else    
                    y:= RadioStack(top);
                    top:= top - 1;
                end if;
        end pop;
        --Underflow Occurence
        function underflow return boolean is    
            begin   
                return top = 0;
            end underflow;

            begin
                top:= 0; --initialize to 0
end genericStack;
