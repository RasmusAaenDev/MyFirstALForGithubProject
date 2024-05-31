
codeunit 50003 ExportXMLPort
{
    procedure DownloadXMLPort()
    var
        FileMgt: Codeunit "File Management";
        AutomotiveXMLPort: XmlPort AutomotiveExport;
        TempBlob: Codeunit "Temp Blob";
        OStream: OutStream;
        IStream: InStream;
        Filename: Text;
    begin
        Filename := 'Automotives.xml';
        TempBlob.CreateOutStream(OStream);
        AutomotiveXMLPort.SetDestination(OStream);
        AutomotiveXMLPort.Export();

        TempBlob.CreateInStream(IStream);
        File.DownloadFromStream(IStream, 'Download Automotive XML', '', FileMgt.GetToFilterText('', 'Automotives.xml'), Filename);
    end;
}