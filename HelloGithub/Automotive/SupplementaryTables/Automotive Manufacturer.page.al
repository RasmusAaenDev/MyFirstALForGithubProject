page 50005 "Automotive Manufacturer"
{
    Caption = 'Manufacturer';
    PageType = List;
    SourceTable = "Automotive Manufacturer";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                field("Manufacturer Code"; Rec."Manufacturer Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Manufacturer Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}