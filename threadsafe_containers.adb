package body Threadsafe_Containers is

   -- Implementation
   protected body Threadsafe_Circbuf is
     -- Blocks if full
     entry Insert (Value : in Integer)
        when (Length < Size) is
        begin
            Buffer(Tail) := Value;
            Tail := (Tail mod Size) + 1;
            Length := Length + 1;
        end Insert;

    -- Blocks if empty
    entry Remove (Value : out Integer)
        when (Length > 0) is
     begin
        Value := Buffer(Head);
        Head := (Head mod Size) + 1;
        Length := Length - 1;
     end Remove;

  end Threadsafe_Circbuf;

end Threadsafe_Containers;
