page 50007 "Cryptography Management Test"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(TextToEncrypt; TextToEncrypt)
                {
                    ApplicationArea = All;
                }
                field(EncryptedText; EncryptedText)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Encrypt)
            {
                ApplicationArea = All;
                Image = EncryptionKeys;
                Caption = 'Encrypt';
                trigger OnAction()
                begin
                    EncryptedText := CryptographyManagement.EncryptText(TextToEncrypt);
                end;
            }
            action(Decrypt)
            {
                ApplicationArea = All;
                Image = EncryptionKeys;
                Caption = 'Decrypt';
                trigger OnAction()
                begin
                    TextToEncrypt := CryptographyManagement.Decrypt(EncryptedText);
                end;
            }
        }
    }

    var
        CryptographyManagement: Codeunit "Cryptography Management";
        TextToEncrypt: Text[100];
        EncryptedText: Text;
}