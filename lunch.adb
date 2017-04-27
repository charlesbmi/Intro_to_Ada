with Ada.Text_IO;         use Ada.Text_IO;

procedure Lunch is
   -- Enumeration type
   type Lunch_Spot_t is (WS, Nine, Home);
   type Day_t is (Sun, Mon, Tue, Wed, Thu, Fri, Sat);
   -- Subtype Weekday_t is a constrained Day_t
   subtype Weekday_t is Day_t range Mon .. Fri;
   -- Declaring a fixed-size array
   Where_To_Eat : array(Day_t) of Lunch_Spot_t;
begin
   -- Array is the same size as number of Day_t values
   Where_To_Eat := (Home, Nine, WS, Nine, WS, Nine, Home);
   -- Can loop over a fixed-size array, or over a type/subtype itself
   for Day in Weekday_t loop
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

end Lunch;
