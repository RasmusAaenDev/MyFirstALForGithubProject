/// <summary>
/// Table Automotive (ID 50100)
/// This table is a collection of all automotives in the organization
/// </summary>
table 50100 Automotive
{
    DataClassification = CustomerContent;
    Caption = 'Automotive';
    DataCaptionFields = "No.", Description;
    LookupPageId = "Automotive List";
    DrillDownPageId = "Automotive List";

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
                    Error('Your automotive cannot be named John');
            end;
        }
        field(3; Manufacturer; Code[20])
        {
            Caption = 'Manufacturer';
            TableRelation = "Automotive Manufacturer";
        }
        field(4; Model; Code[50])
        {
            Caption = 'Model';
            TableRelation = "Automotive Model";
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
        AutomotiveSetup: Record "Automotive Setup";
        IsHandled: Boolean;
        NoSeries: Codeunit "No. Series";
        Automotive: Record Automotive;
    begin
        IsHandled := false;
        OnBeforeInsertValidation(Rec, IsHandled);
        if IsHandled then
            exit;

        if Rec."No." = '' then begin
            if GuiAllowed() then
                VerifySetupExists(AutomotiveSetup);

            AutomotiveSetup.InsertIfNotExists();
            AutomotiveSetup.TestField("No. Series");

            Rec."No." := NoSeries.GetNextNo(AutomotiveSetup."No. Series");

            Automotive.ReadIsolation(IsolationLevel::ReadUncommitted);
            Automotive.SetLoadFields("No.");
            while Automotive.Get(Rec."No.") do
                Rec."No." := NoSeries.GetNextNo(AutomotiveSetup."No. Series");
        end;


        if Rec.Description = '' then
            Rec.Description := Rec."No.";
    end;

    local procedure VerifySetupExists(var AutomotiveSetup: Record "Automotive Setup")
    begin
        AutomotiveSetup.InsertIfNotExists();
        if AutomotiveSetup."No. Series" = '' then
            if Confirm('You havn''t setup your No. Series, would you like to do it now?', true) then
                Page.RunModal(Page::"Automotive Setup");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeInsertValidation(var Automotive: Record Automotive; var IsHandled: Boolean)
    begin
    end;

}