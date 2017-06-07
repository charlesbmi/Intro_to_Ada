-- Example based on http://www.embedded.com/design/prototyping-and-development/4025713/Programming-real-time-with-Ada-2005, and
-- https://en.wikibooks.org/wiki/Ada_Style_Guide/Concurrency
package Threadsafe_Containers is

   type IntegerArray is array (Positive range<>) of Integer;

   -- Interface
   --  protected Threadsafe_Circbuf (Size : Positive) is -- Declares a protected object instead of type
   protected type Threadsafe_Circbuf (Size : Positive) is
   -- FIXME: This declaration inside here is not liked.
   -- Need to figure out how to make a variable-length protected type.
      entry Insert (Value : in Integer);
      entry Remove (Value : out Integer);
   private
      Buffer : IntegerArray(1 .. Size);
      Circbuf_Size : Positive := Size;
      Head : Positive := 1;
      Tail : Positive := 1;
      Length : Natural := 0;
   end Threadsafe_Circbuf;

end Threadsafe_Containers;
