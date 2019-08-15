--telescope.ads
generic
    type element is private;
    size: natural;

package genericStack is
    procedure push(y: in element);
    procedure pop(y: out element);
    function underflow return boolean;
private

end genericStack;