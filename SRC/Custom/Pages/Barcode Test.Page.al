page 50001 "Barcode Test"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Barcode Test";
    ModifyAllowed = true;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(BarcodeGroup)
            {
                Caption = 'Barcode';
                field(InputText; InputText)
                {
                    ApplicationArea = All;
                    Caption = 'Input';
                }
                field(Barcode; Rec.Barcode)
                {
                    ApplicationArea = All;
                    Caption = 'Result';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Encode2D)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    BarcodeEncoder: Interface "Barcode Image Provider 2D";
                    TempBlob: Codeunit "Temp Blob";
                    InStr: InStream;
                    OutStr: OutStream;
                begin
                    BarcodeEncoder := Enum::"Barcode Image Provider 2D"::Dynamics2D;
                    TempBlob := BarcodeEncoder.EncodeImage(InputText, Enum::"Barcode Symbology 2D"::"QR-Code");
                    TempBlob.CreateInStream(InStr);
                    Rec.Barcode.CreateOutStream(OutStr);
                    CopyStream(OutStr, InStr);
                    Rec.Modify();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

    var
        InputText: Text;
}