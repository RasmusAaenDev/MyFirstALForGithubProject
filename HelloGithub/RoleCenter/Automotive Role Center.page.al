page 50004 "Automotive Role Center"
{
    PageType = RoleCenter;
    Caption = 'Automotive';

    layout
    {
        area(RoleCenter)
        {
            part(Headline; "Headline RC Business Manager")
            {
                ApplicationArea = All;
            }
            part(Activities; "Automotive Act.")
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
            action(ExportAutomotives)
            {
                ApplicationArea = All;
                Caption = 'Export Automotives';
                RunObject = xmlport AutomotiveExport;
            }
        }
        area(Reporting)
        {
            action(AutomotiveReport)
            {
                ApplicationArea = All;
                Caption = 'List of Automotives';
                ToolTip = 'Print a list of automotives';
                RunObject = report AutomotiveReport;
            }
        }

        area(Processing)
        {
            action(AutomotiveSetup)
            {
                ApplicationArea = All;
                Caption = 'Automotive Setup';
                ToolTip = 'Setup for our Automotives';
                RunObject = page "Automotive Setup";
            }

            action(AutomotiveWizard)
            {
                ApplicationArea = All;
                Caption = 'Start the Automotive Setup Wizard';
                RunObject = page AutomotiveAssistedSetup;
            }
        }
    }
}