report 50000 AutomotiveReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WordReport;

    dataset
    {
        dataitem(Automotive; Automotive)
        {
            column(No_Automotive; "No.")
            {
            }
            column(Description_Automotive; Description)
            {
            }
            column(Model_Automotive; Model)
            {
            }
            column(Manufacturer_Automotive; Manufacturer)
            {
            }
            column(FuelType_Automotive; "Fuel Type")
            {
            }
            column(Year_Automotive; Year)
            {
            }
            column(No_AutomotiveCpt; FieldCaption("No."))
            {
            }
            column(Description_AutomotiveCpt; FieldCaption(Description))
            {
            }
            column(Model_AutomotiveCpt; FieldCaption(Model))
            {
            }
            column(Manufacturer_AutomotiveCpt; FieldCaption(Manufacturer))
            {
            }
            column(FuelType_AutomotiveCpt; FieldCaption("Fuel Type"))
            {
            }
            column(Year_AutomotiveCpt; FieldCaption(Year))
            {
            }

            trigger OnAfterGetRecord()
            var
                LanguageCU: Codeunit Language;
            begin
                CurrReport.Language := LanguageCU.GetLanguageIdOrDefault('DAN');
            end;
        }
    }

    rendering
    {
        layout(WordReport)
        {
            Type = Word;
            LayoutFile = './Reports/Automotive.docx';
        }

        layout(ExcelReport)
        {
            Type = Excel;
            LayoutFile = './Reports/Automotive.xlsx';
        }
    }

    labels
    {
        TitleLbl = 'List of Automotives';
    }

    var
        myInt: Integer;

    trigger OnPreReport()
    var
        LanguageCU: Codeunit Language;
    begin
        CurrReport.Language := LanguageCU.GetLanguageIdOrDefault('DAN');
    end;
}