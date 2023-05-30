page 50003 "Image Test"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Image Test";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Image; Rec.Image)
                {
                    ApplicationArea = All;
                }
            }
            group(Scale)
            {
                Caption = 'Scale';
                field(ScaleX; ScaleX)
                {
                    ApplicationArea = All;
                    Caption = 'Scale X';
                }
                field(ScaleY; ScaleY)
                {
                    ApplicationArea = All;
                    Caption = 'Scale Y';
                }
            }
            group(Crop)
            {
                Caption = 'Crop';
                field(CropX; CropX1)
                {
                    ApplicationArea = All;
                    Caption = 'Crop X from';
                }
                field(CropX2; CropX2)
                {
                    ApplicationArea = All;
                    Caption = 'Crop X to';
                }
                field(CropY; CropY1)
                {
                    ApplicationArea = All;
                    Caption = 'Crop Y from';
                }
                field(CropY2; CropY2)
                {
                    ApplicationArea = All;
                    Caption = 'Crop Y to';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ImportImage)
            {
                ApplicationArea = All;
                Caption = 'Import Image';
                Image = Import;

                trigger OnAction()
                var
                    InStr: InStream;
                    OutStr: OutStream;
                    FileMgt: Codeunit "File Management";
                    TempBlob: Codeunit "Temp Blob";
                begin
                    Rec.Image.CreateOutStream(OutStr);
                    FileMgt.BLOBImport(TempBlob, Rec.Name);
                    TempBlob.CreateInStream(InStr);
                    CopyStream(OutStr, InStr);
                    Rec.Modify();
                end;
            }
            action(ScaleImage)
            {
                ApplicationArea = All;
                Caption = 'Scale Image';
                Image = ViewDocumentLine;

                trigger OnAction()
                var
                    InStr: InStream;
                    OutStr: OutStream;
                    ToFileName: Text;
                    Image: Codeunit Image;
                begin
                    Rec.Image.CreateInStream(InStr);
                    Image.FromStream(InStr);
                    Image.Resize(ScaleX, ScaleY);
                    Rec.Image.CreateOutStream(OutStr);
                    Image.Save(OutStr);
                    Rec.Modify();
                end;
            }
            action(CropImage)
            {
                ApplicationArea = All;
                Caption = 'Crop Image';
                Image = ViewDocumentLine;

                trigger OnAction()
                var
                    InStr: InStream;
                    OutStr: OutStream;
                    ToFileName: Text;
                    Image: Codeunit Image;
                begin
                    Rec.Image.CreateInStream(InStr);
                    Image.FromStream(InStr);
                    Image.Crop(CropX1, CropY1, CropX2, CropY2);
                    Rec.Image.CreateOutStream(OutStr);
                    Image.Save(OutStr);
                    Rec.Modify();
                end;
            }
        }
    }

    var
        ScaleX: Integer;
        ScaleY: Integer;
        CropX1: Integer;
        CropY1: Integer;
        CropX2: Integer;
        CropY2: Integer;
}