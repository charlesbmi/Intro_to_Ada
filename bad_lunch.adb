with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Exceptions;      use Ada.Exceptions;

procedure Bad_Lunch is
   -- Enumeration type
   type Lunch_Spot_t is (WS, Nine, Home);
   type Day_t is (Sun, Mon, Tue, Wed, Thu, Fri, Sat);
   -- Subtype Weekday_t is a constrained Day_t
   subtype Weekday_t is Day_t range Mon .. Fri;
   -- Declaring a fixed-size array
   Where_To_Eat : array(Weekday_t) of Lunch_Spot_t;
begin
   -- Array is the same size as number of Day_t values
   Where_To_Eat := (Nine, WS, Nine, WS, Nine);
   -- Can loop over a fixed-size array, or over a type/subtype itself
   for Day in Day_t loop
      case Where_To_Eat (Day) is
         when Home =>
            Put_Line("Eating at home.");
         when Nine =>
            Put_Line("Eating on 9.");
         when WS =>
            Put_Line("Eating at Wise Sons");
            -- case statement must include all cases
      end case;
   end loop;

exception
   when Error : Constraint_Error =>
      Put_Line("It's the weekend, no lunch at Square.");
      Put_Line(Exception_Information(Error));

end Bad_Lunch;
