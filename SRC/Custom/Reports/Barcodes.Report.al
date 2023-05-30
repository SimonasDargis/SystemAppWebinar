report 50000 "Barcodes"
{
    DefaultRenderingLayout = LayoutName;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(DataItemName; Item)
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            {
            }
            column(BarcodeNo; BarcodeNo)
            {
            }

            trigger OnAfterGetRecord()
            begin
                BarcodeNo := Generate1DBarcodeSymbology(Enum::"Barcode Symbology"::Code128, "No.");
            end;
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = '.\SRC\Custom\Reports\RdlcLayouts\Barcodes.rdlc';
        }
    }

    procedure Generate1DBarcodeSymbology(BarcodeSymbology: Enum "Barcode Symbology"; BarcodeString: Text[50]): Text
    var
        BarcodeFontProviderEnum: Enum "Barcode Font Provider";
        BarcodeFontProvider: Interface "Barcode Font Provider";
    begin
        BarcodeFontProvider := BarcodeFontProviderEnum::IDAutomation1D;
        BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);
        Exit(BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology));
    end;

    var
        BarcodeNo: Text;

}