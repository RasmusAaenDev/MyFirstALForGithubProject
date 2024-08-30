pageextension 50000 "OTL CustomerListExt" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action("OTL HelloWorld")
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