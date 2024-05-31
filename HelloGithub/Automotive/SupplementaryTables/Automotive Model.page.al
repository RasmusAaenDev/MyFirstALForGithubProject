page 50006 "Automotive Model"
{
    Caption = 'Model';
    PageType = List;
    SourceTable = "Automotive Model";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {

                field("Model Code"; Rec."Model Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Model Code field.', Comment = '%';
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