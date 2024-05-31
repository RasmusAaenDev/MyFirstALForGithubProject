page 50001 "Automotive List"
{
    Caption = 'Automotive List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Automotive;
    Editable = false;
    CardPageId = "Automotive Card";

    layout
    {
        area(Content)
        {
            repeater(Automotives)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Fuel Type"; Rec."Fuel Type")
                {
                    ToolTip = 'Specifies the value of the Fuel Type field.', Comment = '%';
                }
                field(Manufacturer; Rec.Manufacturer)
                {
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
            action(ExportXML)
            {
                Caption = 'Export XML';
                ApplicationArea = All;

                trigger OnAction()
                var
                    ExportXMLPort: Codeunit ExportXMLPort;
                begin
                    ExportXMLPort.DownloadXMLPort();
                end;
            }

            action(PrintAllNames)
            {
                Caption = 'Print all Names';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = ShowList;
                ApplicationArea = All;

                trigger OnAction()
                var
                    MyListCodeunit: Codeunit MyListCodeunit;
                begin
                    MyListCodeunit.GoThroughAllAutomotives();
                end;
            }

            action(GetCustomerBalance)
            {
                ApplicationArea = All;
                Caption = 'Get Customer 10000 Balance';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Image = Balance;

                trigger OnAction()
                var
                    MyListCodeunit: Codeunit MyListCodeunit;
                begin
                    MyListCodeunit.StoreAllCustomerBalances();
                end;
            }

            action(NumberChecker)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Caption = 'Number Checker';

                trigger OnAction()
                var
                    MyListCodeunit: Codeunit MyListCodeunit;
                begin
                    MyListCodeunit.ConvertTextToNumber('2');
                end;
            }

            action(TestStringReplace)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Caption = 'String Replace Tester';

                trigger OnAction()
                var
                    MyListCodeunit: Codeunit MyListCodeunit;
                begin
                    MyListCodeunit.ConvertTextToNumber('John Doe, is not my name');
                end;
            }
        }
    }
}