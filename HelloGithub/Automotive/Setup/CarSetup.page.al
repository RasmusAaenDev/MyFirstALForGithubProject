page 50008 "OTL Car Setup"
{

    PageType = Card;
    SourceTable = "Car Setup";
    Caption = 'Car Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;


    layout
    {
        area(content)
        {
            group(General)
            {

                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Series field.', Comment = '%';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;

}
