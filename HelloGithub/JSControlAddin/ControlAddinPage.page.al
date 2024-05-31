page 50007 ControlAddinPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                usercontrol(MyCustomControlAddin; MyControlAddIn)
                {
                    trigger JSInitialized(MyText: Text)
                    begin
                        Message(MyText);
                    end;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RequestJS)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    CurrPage.MyCustomControlAddin.InitializeJS();
                end;
            }
        }
    }
}