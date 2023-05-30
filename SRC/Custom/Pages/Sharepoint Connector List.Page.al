page 50004 "Sharepoint Connector List"
{
    PageType = ListPart;
    SourceTable = "Sharepoint Connector List";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Name; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}