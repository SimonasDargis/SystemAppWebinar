pageextension 50000 "Item Card" extends "Item Card"
{
    layout
    {
        addafter(Description)
        {
            field("Video URL"; Rec."Video URL")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addfirst(Functions)
        {
            action(ShowVideo)
            {
                ApplicationArea = All;
                Caption = 'Show Video';
                Image = NextRecord;
                trigger OnAction()
                begin
                    Video.Play(Rec."Video URL");
                end;
            }
            action(TranslateDescription)
            {
                ApplicationArea = All;
                Caption = 'Translate Description';
                Image = Translate;
                trigger OnAction()
                var
                    Translation: Codeunit Translation;
                begin
                    Translation.Show(Rec, Rec.FieldNo(Description));
                end;
            }
        }
    }

    var
        Video: Codeunit Video;
}