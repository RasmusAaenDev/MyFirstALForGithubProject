page 50003 "Automotive Act."
{
    PageType = CardPart;
    SourceTable = "Activities Cue";
    RefreshOnActivate = true;
    ShowFilter = false;

    layout
    {
        area(Content)
        {
            cuegroup("Activities")
            {

                field("Total Automotives"; Rec."Total Automotives")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Automotives field.', Comment = '%';
                }
                field("Total Diesel Automotives"; Rec."Total Diesel Automotives")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Diesel Automotives field.', Comment = '%';
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