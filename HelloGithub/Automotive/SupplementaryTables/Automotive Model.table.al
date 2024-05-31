table 50001 "Automotive Model"
{
    DataClassification = SystemMetadata;
    Caption = 'Model';
    LookupPageId = "Automotive Model";

    fields
    {
        field(1; "Model Code"; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'Model Code';

        }

        field(2; Description; Text[50])
        {
            DataClassification = SystemMetadata;
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; "Model Code")
        {
            Clustered = true;
        }
    }
}