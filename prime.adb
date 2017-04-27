-- Taken from Ada Crash Course by Peter Chapin)

-- Context clause specifies packages that will be used.
-- `use` includes that package in the namespace
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

-- Our main function is "Prime"
procedure Prime is
    -- Declare local variables here
    Num : Integer; -- Type comes after the name
begin
    Put("Enter an integer: ");
    Get(Num); -- Retrieve the input into Num.
    if Num < 2 then
        Put("The value "); Put(Num, 0); Put_Line(" is bad.");
    else
        Put("The value "); Put(Num, 0);
        -- For loop syntax similar to Python range
        -- Requires reverse loop for decrementing
        for idx in 2 .. (Num - 1) loop
            -- rem is % in C. Single `=` to test for equality
            -- Assignment uses :=
            if Num rem idx = 0 then
                Put_Line(" is not prime.");
                return;
            end if;
            exit when (idx * idx > Num); -- Break early when we've hit all possible factors.
        end loop;
        Put_Line(" is prime.");
    end if;
end Prime;
