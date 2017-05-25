-- Example adapted from "Ada Crash Course"

with Ada.Unchecked_Deallocation;

-- Declaring access types (similar application to pointers)
-- Often times, an "out" variable will suffice
procedure Access_Types is
    type Integer_Access is access all Integer;
    Int_P : Integer_Access; -- initializes to null
    -- P1 = P2 if they point to the same object
    type Date is
        record
            Day, Month, Year : Integer;
        end record;
    type Date_Access is access all Date;
    D1, D2 : Date_Access;
    D3 : Date;

    -- `Unchecked_Deallocation` is a generic procedure, so we must 
    procedure Delete_Integer is new
        Ada.Unchecked_Deallocation(Integer, Integer_Access);
    procedure Delete_Date is new
        Ada.Unchecked_Deallocation(Date, Date_Access);

begin
   -- What is returned if new fails?
    Int_P := new Integer'(0); -- Ada 83 to create Integer access type, initialized to 0
    Int_P.all := 1; -- .all "dereferences" the pointer
    Delete_Integer(Int_P);
    -- Ada has OPTIONAL garbage collection, bc GC is problematic in embedded systems
    -- For maximum portability, programmers must assume GC is not done.

    D1 := new Date;
    D1.Day := 1;
    D2 := D1; -- D2 points to the same object as D1
    D3 := D2.all; -- copy Date objects (redundant)
    Delete_Date(D1);
end Access_Types;
