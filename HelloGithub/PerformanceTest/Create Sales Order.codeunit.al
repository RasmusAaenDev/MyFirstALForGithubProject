codeunit 50008 "Create Sales Order"
{
    Subtype = Test;

    trigger OnRun()
    var
        Customer: Record Customer;
        SalesOrder: TestPage "Sales Order";
    begin
        BCPTTestContext.StartScenario('Initialize Order');
        Customer.FindFirst();
        SalesOrder.OpenNew();
        SalesOrder."No.".SetValue('');
        BCPTTestContext.EndScenario('Initialize Order');
        BCPTTestContext.UserWait();
        BCPTTestContext.StartScenario('Enter Customer No.');
        SalesOrder."Sell-to Customer No.".SetValue(Customer."No.");
        Sleep(500);
        BCPTTestContext.EndScenario('Enter Customer No.');
        BCPTTestContext.UserWait();
    end;

    var
        BCPTTestContext: Codeunit "BCPT Test Context";
}