with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Conditions is
   -- Enable preconditions and postconditinos.
   pragma Assertion_Policy(Check);

   -- Trivial example of a post-condition
   function Increment (x : Integer) return Integer
     with Post => Increment'Result = (x + 1);

   -- Precondition checking that Integer division without roundoff is possible
   procedure Integer_Division (Num :     Integer;
                               Den :     Integer;
                               Res : out Integer)
     with Pre => (Num rem Den) = 0;

   function Increment (x : Integer) return Integer is
   begin
      return (x + 1);
   end Increment;

   procedure Integer_Division (Num :     Integer;
                               Den :     Integer;
                               Res : out Integer) is
   begin
      Res := Num / Den;
   end Integer_Division;

   x : Integer := 10;
   y : Integer := 3;
   Res : Integer;
begin
   Put ("The value of x is "); Put (x, 0); Put_Line (".");
   Put ("The value of Increment (x) is "); Put (Increment (x), 0); Put_Line (".");

   Put ("Trying to divide "); Put (x, 0); Put (" by "); Put (y,0); Put_Line (".");
   -- Precondition will fail for `Integer_Division`
   Integer_Division (x, y, Res);
   Put ("The result is "); Put (Res, 0); Put_Line (".");
end Conditions;
