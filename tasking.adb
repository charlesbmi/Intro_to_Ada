-- Concurrency can be offered by the OS, the language, or a combination
-- Link to some papers that say that threading can't be a library.
-- Ousterhout has an interesting paper here that shows that you can't guarantee pthreads correctness.
-- Processes offer protection but are too heavy-weight.
-- Compiler must take care of low-level thread management, as opposed to RTOS

with Ada.Text_IO;

procedure Tasking is
    -- Specification of nested task
    task HelloTask;
    task body HelloTask is
    begin
        -- Task body begins executing as soon as Tasking starts
        for idx in 1 .. 5 loop
            Ada.Text_IO.Put_Line("The task says hello.");
            delay 1.0;
        end loop;
    end HelloTask;

begin
    Ada.Text_IO.Put_Line("Starting Program!");
    -- Tasking ends when both the body and task have ended
    -- Task must terminate
end Tasking;
