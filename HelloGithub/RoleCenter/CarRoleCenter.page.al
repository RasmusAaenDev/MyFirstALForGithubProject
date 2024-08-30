page 50004 "OTL Car Role Center"
{
    PageType = RoleCenter;
    Caption = 'Car';

    layout
    {
        area(RoleCenter)
        {
            part(Headline; "Headline RC Business Manager")
            {
                ApplicationArea = All;
            }
            part(Activities; "Car Act.")
            {
                ApplicationArea = All;
            }
            part("Help And Chart Wrapper"; "Help And Chart Wrapper")
            {
                ApplicationArea = All;
            }
            part("Report Inbox Part"; "Report Inbox Part")
            {
                ApplicationArea = All;
            }
            part("Power BI Report Spinner Part"; "Power BI Report Spinner Part")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action(ExportCars)
            {
                ApplicationArea = All;
                Caption = 'Export Cars';
                RunObject = xmlport CarExport;
            }
        }
        area(Reporting)
        {
            action(CarReport)
            {
                ApplicationArea = All;
                Caption = 'List of Cars';
                ToolTip = 'Print a list of Cars';
                RunObject = report CarReport;
            }
        }

        area(Processing)
        {
            action(CarSetup)
            {
                ApplicationArea = All;
                Caption = 'Car Setup';
                ToolTip = 'Setup for our Cars';
                RunObject = page "Car Setup";
            }

            action(CarWizard)
            {
                ApplicationArea = All;
                Caption = 'Start the Car Setup Wizard';
                RunObject = page CarAssistedSetup;
            }
        }
    }
}