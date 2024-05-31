table 50000 "Automotive Manufacturer"
{
    DataClassification = SystemMetadata;
    Caption = 'Manufacturer';
    LookupPageId = "Automotive Manufacturer";

    fields
    {
        field(1; "Manufacturer Code"; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'Manufacturer Code';

        }

        field(2; Description; Text[50])
        {
            DataClassification = SystemMetadata;
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Manufacturer Code")
        {
            Clustered = true;
        }
    }
}