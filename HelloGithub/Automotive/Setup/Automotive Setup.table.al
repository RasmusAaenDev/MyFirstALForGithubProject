table 50002 "Automotive Setup"
{
    DataClassification = SystemMetadata;
    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = SystemMetadata;

        }

        field(2; "No. Series"; Code[50])
        {
            DataClassification = SystemMetadata;
            TableRelation = "No. Series";
            Caption = 'No. Series';
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    procedure InsertIfNotExists()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;
}