page 50010 AutomotiveAPI
{
    PageType = API;
    Caption = 'automotiveAPI';
    APIPublisher = 'rasmus';
    APIGroup = 'automotive';
    APIVersion = 'v1.0';
    EntityName = 'automotive';
    EntitySetName = 'automotives';
    SourceTable = Automotive;
    DelayedInsert = true;
    DataAccessIntent = ReadOnly;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {

                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(manufacturer; Rec.Manufacturer)
                {
                    Caption = 'Manufacturer';
                }
                field(model; Rec.Model)
                {
                    Caption = 'Model';
                }
                field(fuelType; Rec."Fuel Type")
                {
                    Caption = 'Fuel Type';
                }
                field(year; Rec.Year)
                {
                    Caption = 'Year';
                }
            }
        }
    }
}