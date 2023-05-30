table 50005 "Sharepoint Connector List"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Id; Guid)
        {
            Caption = 'Id';
        }

        field(2; Title; Text[250])
        {
            Caption = 'Title';
        }

        field(3; Created; DateTime)
        {
            Caption = 'Created';
        }

        field(4; Description; Text[250])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(Key1; Id)
        {
            Clustered = true;
        }
    }
}