table 50001 "Barcode Test"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Barcode"; Blob)
        {
            DataClassification = ToBeClassified;
            Subtype = Bitmap;
        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}