page 50003 "OTL Car Act."
{
    PageType = CardPart;
    SourceTable = "Activities Cue";
    RefreshOnActivate = true;
    ShowFilter = false;

    layout
    {
        area(Content)
        {
            cuegroup(Activities)
            {

                field("Total Cars"; Rec."Total Cars")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Cars field.', Comment = '%';
                }
                field("Total Diesel Cars"; Rec."Total Diesel Cars")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Diesel Cars field.', Comment = '%';
                }
                field("Sales This Month"; Rec."Sales This Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the sum of sales in the current month excluding taxes.';
                    DrillDownPageId = "Posted Sales Invoices";
                }
                field("Ongoing Sales Invoices"; Rec."Ongoing Sales Invoices")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies sales invoices that are not yet posted or only partially posted.';
                    DrillDownPageId = "Sales Invoice List";
                }
                field("Ongoing Sales Orders"; Rec."Ongoing Sales Orders")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies sales orders that are not yet posted or only partially posted.';
                    DrillDownPageId = "Sales Order List";
                }
                field("Ongoing Sales Quotes"; Rec."Ongoing Sales Quotes")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies sales quotes that have not yet been converted to invoices or orders.';
                    DrillDownPageId = "Sales Quotes";
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
            Commit();
        end;
    end;
}