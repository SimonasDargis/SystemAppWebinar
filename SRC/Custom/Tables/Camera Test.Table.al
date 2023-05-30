table 50002 "Camera Test"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Integer)
        {
            DataClassification = OrganizationIdentifiableInformation;
            AutoIncrement = true;
        }
        field(2; "Picture"; Blob)
        {
            DataClassification = OrganizationIdentifiableInformation;
            Subtype = Bitmap;
        }
        field(3; "Image Name"; Text[250])
        {
            DataClassification = OrganizationIdentifiableInformation;
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