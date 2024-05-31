page 50002 "Automotive Card"
{
    PageType = Card;
    ApplicationArea = All;
    SourceTable = Automotive;
    AboutTitle = 'About the Automotive';
    AboutText = 'The automotive details can help you setup a basic automotive, which can later be used for automotive rentals.';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
            group(Configuration)
            {
                AboutTitle = 'Manage automotive configurations';
                AboutText = 'Here you can specify the model and manufacturer details, about the automotive.';
                Caption = 'Configuration';
                field("Fuel Type"; Rec."Fuel Type")
                {
                    AboutTitle = 'Define the Fuel Type';
                    AboutText = 'Specify which kind of fuel this automotive is going to need, to operate';
                    ToolTip = 'Specifies the value of the Fuel Type field.', Comment = '%';
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Manufacturer field.', Comment = '%';
                }
                field(Model; Rec.Model)
                {
                    ToolTip = 'Specifies the value of the Model field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(TryCustomer)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    Customer.FindFirst();
                    PrintRecordName(Customer);
                end;
            }

            action(TryVendor)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    Vendor: Record Vendor;
                begin
                    Vendor.FindFirst();
                    PrintRecordName(Vendor);
                end;
            }
        }
    }

    var
        MyGloabInt: Integer;

    protected var
        SomethingImportantLoadedWhenThePageLoads: Boolean;

    trigger OnOpenPage()
    var
        MyLocalInt: Integer;
        MyText: Text;
        CR: Char;
        LF: Char;
    begin
        SomethingImportantLoadedWhenThePageLoads := true;
        CR := 'A';

        CR := 13;
        LF := 10;


        MyText := 'Some text With line break ' + CR + LF + 'New line';

    end;


    procedure PrintRecordName(Customer: Record Customer)
    begin
        Message(Customer.Name);
    end;

    procedure PrintRecordName(Vendor: Record Vendor)
    begin
        Message(Vendor.Name);
    end;
}