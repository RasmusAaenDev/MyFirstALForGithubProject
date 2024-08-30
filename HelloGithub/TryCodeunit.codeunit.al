codeunit 50006 "OTL TryCodeunit"
{
    TableNo = Customer;
    trigger OnRun()
    begin
        Rec.Validate(Blocked, Rec.Blocked::All);
        Rec.Modify(true);
    end;
}