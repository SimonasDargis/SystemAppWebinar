pageextension 50001 "Sales Order Subform" extends "Sales Order Subform"
{
    actions
    {
        addfirst("F&unctions")
        {
            action(Translate)
            {
                ApplicationArea = All;
                Caption = 'Translate';
                Image = Translate;
                trigger OnAction()
                var
                    Translation: Codeunit Translation;
                    Item: Record Item;
                begin
                    if Item.Get(Rec."No.") then begin
                        Rec."Description" := Translation.Get(Item, Item.FieldNo(Description));
                        Rec.Modify();
                    end else
                        Error('Item not found.');
                end;
            }
        }
    }
}