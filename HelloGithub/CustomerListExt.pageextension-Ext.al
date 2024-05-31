pageextension 50000 "CustomerListExt" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action(HelloWorld)
            {
                ApplicationArea = All;
                Caption = 'Hello World';
                Promoted = true;
                Image = Home;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    TempBlob: Codeunit "Temp Blob";
                    OutStr: OutStream;
                    InStr: Instream;
                    FileName: Text;
                begin
                    TempBlob.CreateOutStream(OutStr);
                    Rec.Image.ExportStream(OutStr);
                    TempBlob.CreateInStream(InStr);

                    FileName := 'Customer Picture';

                    DownloadFromStream(InStr, 'Download Image', '', 'Image Files (*.jpg;*.png)', FileName);
                end;
            }
        }
    }
}