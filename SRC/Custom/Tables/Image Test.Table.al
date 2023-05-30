table 50003 "Image Test"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; Image; Blob)
        {
            Caption = 'Image';
            Subtype = Bitmap;
        }
    }

    keys
    {
        key(Key1; "ID")
        {
            Clustered = true;
        }
    }
}