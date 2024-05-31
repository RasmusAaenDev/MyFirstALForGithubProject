codeunit 50009 MyTestCodeunit
{
    Subtype = Test;


    [Test]
    procedure "CustomerExists_InsertSalesDocument_SalesDocumentWithCustomerExists"()
    var
        LibrarySales: Codeunit "Library - Sales";
        CustomerNo: Code[20];
    begin
        // [GIVEN] CustomerExists 
        CustomerNo := LibrarySales.CreateCustomerNo();
        // [WHEN] InsertSalesDocument 
        // [THEN] SalesDocumentWithCustomerExists 
    end;





    [Test]
    procedure "AutomotiveSetupIsComplete_CreateANewAutomotive_ANewAutomotiveExistsInMyAutomotiveTable"()
    var
        AutomotiveSetup: Record "Automotive Setup";
        AutomotiveNo: Code[20];
    begin
        // [GIVEN] AutomotiveSetupIsComplete 
        AutomotiveSetup.InsertIfNotExists();
        if AutomotiveSetup."No. Series" = '' then
            Error('The No. Series has not been setup');

        // [WHEN] CreateANewAutomotive 
        AutomotiveNo := 'TESTAUTO';
        InsertAnAutomotive(AutomotiveNo);

        // [THEN] ANewAutomotiveExistsInMyAutomotiveTable 
        VerifyNewAutomotive(AutomotiveNo);
    end;

    local procedure InsertAnAutomotive(AutomotiveNo: Code[20])
    var
        Automotive: Record Automotive;
    begin
        Automotive.Init();
        Automotive.Validate("No.", AutomotiveNo);
        Automotive.Validate(Description, AutomotiveNo);
        Automotive.Insert();
    end;

    local procedure VerifyNewAutomotive(AutomotiveNo: Code[20])
    var
        Automotive: Record Automotive;
    begin
        Automotive.Get(AutomotiveNo);
    end;
}