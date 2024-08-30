
codeunit 50003 "OTL ExportXMLPort"
{
    procedure DownloadXMLPort()
    var
        FileMgt: Codeunit "File Management";
        CarXMLPort: XmlPort CarExport;
        TempBlob: Codeunit "Temp Blob";
        OStream: OutStream;
        IStream: InStream;
        Filename: Text;
    begin
        Filename := 'Cars.xml';
        TempBlob.CreateOutStream(OStream);
        CarXMLPort.SetDestination(OStream);
        CarXMLPort.Export();

        TempBlob.CreateInStream(IStream);
        File.DownloadFromStream(IStream, 'Download Car XML', '', FileMgt.GetToFilterText('', 'Cars.xml'), Filename);
    end;
}