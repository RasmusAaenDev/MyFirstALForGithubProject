report 50000 "OTL CarReport"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WordReport;

    dataset
    {
        dataitem(Car; Car)
        {
            column(No_Car; "No.")
            {
            }
            column(Description_Car; Description)
            {
            }
            column(Model_Car; Model)
            {
            }
            column(Manufacturer_Car; Manufacturer)
            {
            }
            column(FuelType_Car; "Fuel Type")
            {
            }
            column(Year_Car; Year)
            {
            }
            column(No_CarCpt; FieldCaption("No."))
            {
            }
            column(Description_CarCpt; FieldCaption(Description))
            {
            }
            column(Model_CarCpt; FieldCaption(Model))
            {
            }
            column(Manufacturer_CarCpt; FieldCaption(Manufacturer))
            {
            }
            column(FuelType_CarCpt; FieldCaption("Fuel Type"))
            {
            }
            column(Year_CarCpt; FieldCaption(Year))
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
            LayoutFile = './Reports/Car.docx';
        }

        layout(ExcelReport)
        {
            Type = Excel;
            LayoutFile = './Reports/Car.xlsx';
        }
    }

    labels
    {
        TitleLbl = 'List of Cars';
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