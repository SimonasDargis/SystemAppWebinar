page 50006 "Base64 Convert Test"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(Convert; Convert)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ConvertTo)
            {
                ApplicationArea = All;
                Caption = 'Convert To Base64';
                Image = EncryptionKeys;
                trigger OnAction()
                begin
                    Convert := Base64Convert.ToBase64(Convert);
                end;
            }
            action(ConvertFrom)
            {
                ApplicationArea = All;
                Caption = 'Convert From Base64';
                Image = EncryptionKeys;
                trigger OnAction()
                begin
                    Convert := Base64Convert.FromBase64(Convert);
                end;
            }
        }
    }

    var
        Base64Convert: Codeunit "Base64 Convert";
        Convert: Text[100];
}