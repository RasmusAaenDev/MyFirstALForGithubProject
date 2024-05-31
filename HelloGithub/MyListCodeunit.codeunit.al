codeunit 50005 MyListCodeunit
{
    procedure GoThroughAllAutomotives()
    var
        Automotive: Record Automotive;
        AutomotiveBuffer: Record Automotive temporary;
        AutomotiveList: List of [Text];
        AutomotiveName: Text;
        StringOfNames: Text;
    begin
        Automotive.SetLoadFields(Description);
        if Automotive.FindSet() then
            repeat
                if not AutomotiveList.Contains(Automotive.Description) then
                    AutomotiveList.Add(Automotive.Description);
            until Automotive.Next() = 0;

        foreach AutomotiveName in AutomotiveList do begin
            if StringOfNames <> '' then
                StringOfNames += ', ';

            StringOfNames += AutomotiveName;
        end;


        Message(StringOfNames);
    end;


    procedure StoreAllCustomerBalances()
    var
        CustomerBalances: Dictionary of [Code[20], Decimal];
        Customer: Record Customer;
        Balance: Decimal;
        CurrDuration: Duration;
        InitialTime: Time;
        TextVar: Text;
    begin
        Customer.SetAutoCalcFields("Balance (LCY)");
        if Customer.FindSet() then
            repeat
                CustomerBalances.Add(Customer."No.", Customer."Balance (LCY)")
            until Customer.Next() = 0;

        if CustomerBalances.Get('10000', Balance) then
            TextVar := StrSubstNo('For customer 10000, the current balance is %1,\\The last customer inspected was %2', Balance, Customer."No.");

        Message(TextVar);
        //Message('The Balance of Customer 10000 is:\\' + Format(Balance));
    end;

    procedure ConvertTextToNumber(NewText: Text)
    begin
        NewText := NewText.Replace('Doe', 'John');
        Message(NewText);
    end;


    procedure IsThereAnyUSCustomer(): Boolean
    var
        Customer: Record Customer;
    begin
        if Customer.FindSet() then
            repeat
                Customer.Validate(Name, Customer.Name + ' New');
                Customer.Modify();
            until Customer.Next() = 0;

        LongRunningFunction();
    end;

    local procedure LongRunningFunction()
    begin
        Sleep(10000);
    end;

    [TryFunction]
    local procedure TryBlockingCustomer(var Customer: Record Customer)
    begin
        Customer.Validate(Blocked, Customer.Blocked::All);
        Customer.Modify(true);
    end;

    procedure MyProcedure()
    var
        Customer: Record Customer;
        TryCodeunit: Codeunit TryCodeunit;
    begin
        Customer.FindSet();
        if Customer.FindSet() then
            repeat
                if not TryCodeunit.Run(Customer) then
                    Message('Customer %1 cannot be blocked\\%2', Customer."No.", GetLastErrorText());
            until Customer.Next() = 0;
    end;

}