with Ada.Text_IO;
with Threadsafe_Containers; use Threadsafe_Containers;

procedure Circbuf_Example is
   circbuf : Threadsafe_Circbuf (3);

   task ProducerTask;
   task ConsumerTask;

   task body ProducerTask is
   begin
      for idx in 1..5 loop
         Ada.Text_IO.Put_Line("Producing!");
         circbuf.Insert(idx);
      end loop;
   end ProducerTask;

   task body ConsumerTask is
      Value : Integer;
   begin
      for idx in 1..5 loop
         Ada.Text_IO.Put_Line("Consuming!");
         circbuf.Remove(Value);
      end loop;
   end ConsumerTask;

begin
   null;
end Circbuf_Example;
