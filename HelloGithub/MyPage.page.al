page 50000 MyPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field(Address; Rec.Address)
                {
                    NotBlank = true;
                    ToolTip = 'Specifies the customer''s address. This address will appear on all sales documents for the customer.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field(Balance; Rec.Balance)
                {
                    ToolTip = 'Specifies the value of the Balance field.', Comment = '%';
                }
                field("Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ToolTip = 'Specifies the payment amount that the customer owes for completed sales. This value is also known as the customer''s balance.';
                }
                field("Balance Due"; Rec."Balance Due")
                {
                    ToolTip = 'Specifies the value of the Balance Due field.', Comment = '%';
                }
                field("Balance Due (LCY)"; Rec."Balance Due (LCY)")
                {
                    ToolTip = 'Specifies the balance due for this customer in local currency.';
                }

            }
        }
    }

}
