codeunit 50009 "OTL MyTestCodeunit"
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
    procedure "CarSetupIsComplete_CreateANewCar_ANewCarExistsInMyCarTable"()
    var
        CarSetup: Record "Car Setup";
        CarNo: Code[20];
    begin
        // [GIVEN] CarSetupIsComplete 
        CarSetup.InsertIfNotExists();
        if CarSetup."No. Series" = '' then
            Error('The No. Series has not been setup');

        // [WHEN] CreateANewCar 
        CarNo := 'TESTCAR';
        InsertAnCar(CarNo);

        // [THEN] ANewCarExistsInMyCarTable 
        VerifyNewCar(CarNo);
    end;

    local procedure InsertAnCar(CarNo: Code[20])
    var
        Car: Record Car;
    begin
        Car.Init();
        Car.Validate("No.", CarNo);
        Car.Validate(Description, CarNo);
        Car.Insert();
    end;

    local procedure VerifyNewCar(CarNo: Code[20])
    var
        Car: Record Car;
    begin
        Car.Get(CarNo);
    end;
}