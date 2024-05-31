codeunit 50006 TryCodeunit
{
    TableNo = Customer;
    trigger OnRun()
    begin
        Rec.Validate(Blocked, Rec.Blocked::All);
        Rec.Modify(true);
    end;
}