/// <summary>
/// Table "OTL Car" (ID 50100)
/// This table is a collection of all Cars in the organization
/// </summary>
table 50100 Car
{
    DataClassification = CustomerContent;
    Caption = 'Car';
    DataCaptionFields = "No.", Description;
    LookupPageId = "Car List";
    DrillDownPageId = "Car List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }

        field(2; Description; Text[100])
        {
            Caption = 'Description';

            trigger OnValidate()
            begin
                if Rec.Description = 'John' then
                    Error('Your Car cannot be named John');
            end;
        }
        field(3; Manufacturer; Code[20])
        {
            Caption = 'Manufacturer';
            TableRelation = "Car Manufacturer";
        }
        field(4; Model; Code[50])
        {
            Caption = 'Model';
            TableRelation = "Car Model";
        }
        field(5; Year; Integer)
        {
            Caption = 'Year';
        }
        field(6; "Fuel Type"; enum "Fuel Type")
        {
            Caption = 'Fuel Type';
        }
    }

    keys
    {
        key(PrimayKey; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "No.", Description, Manufacturer)
        { }

    }

    trigger OnInsert()
    var
        CarSetup: Record "Car Setup";
        IsHandled: Boolean;
        NoSeries: Codeunit "No. Series";
        Car: Record Car;
    begin
        IsHandled := false;
        OnBeforeInsertValidation(Rec, IsHandled);
        if IsHandled then
            exit;

        if Rec."No." = '' then begin
            if GuiAllowed() then
                VerifySetupExists(CarSetup);

            CarSetup.InsertIfNotExists();
            CarSetup.TestField("No. Series");

            Rec."No." := NoSeries.GetNextNo(CarSetup."No. Series");

            Car.ReadIsolation(IsolationLevel::ReadUncommitted);
            Car.SetLoadFields("No.");
            while Car.Get(Rec."No.") do
                Rec."No." := NoSeries.GetNextNo(CarSetup."No. Series");
        end;


        if Rec.Description = '' then
            Rec.Description := Rec."No.";
    end;

    local procedure VerifySetupExists(var CarSetup: Record "Car Setup")
    begin
        CarSetup.InsertIfNotExists();
        if CarSetup."No. Series" = '' then
            if Confirm('You havn''t setup your No. Series, would you like to do it now?', true) then
                Page.RunModal(Page::"Car Setup");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertValidation(var Car: Record Car; var IsHandled: Boolean)
    begin
    end;

}