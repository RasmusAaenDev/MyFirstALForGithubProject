page 50010 "OTL CarAPI"
{
    PageType = API;
    Caption = 'CarAPI';
    APIPublisher = 'rasmus';
    APIGroup = 'Car';
    APIVersion = 'v1.0';
    EntityName = 'Car';
    EntitySetName = 'Cars';
    SourceTable = Car;
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