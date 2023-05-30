page 50011 "BLOB Test"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            field(FileName; FileName)
            {
                Caption = 'FileName';
                ApplicationArea = All;
            }
            field(BlobInt; BlobInt)
            {
                Caption = 'BLOB Big Int';
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Write)
            {
                Caption = 'Write into persistent blob';
                ApplicationArea = All;
                Image = New;
                trigger OnAction()
                var
                    BigInt: BigInteger;
                    InStr: InStream;
                begin
                    if UploadIntoStream('Select file to import', '', '', FileName, InStr) then begin
                        BigInt := PersistentBlob.Create();
                        PersistentBlob.CopyFromInStream(BigInt, InStr);
                        Message('Current Persistent Blob int: %1', BigInt);
                    end;
                end;
            }
            action(Download)
            {
                Caption = 'Download peristent blob';
                ApplicationArea = All;
                Image = Download;
                trigger OnAction()
                var
                    OutStr: OutStream;
                    FileMgt: Codeunit "File Management";
                    TempBlob: Codeunit "Temp Blob";
                begin
                    OutStr := TempBlob.CreateOutStream();
                    PersistentBlob.CopyToOutStream(BlobInt, OutStr);
                    FileMgt.BLOBExport(TempBlob, FileName, true);
                end;
            }
        }
    }

    var
        PersistentBlob: Codeunit "Persistent Blob";
        BlobValue: Text;
        BlobInt: BigInteger;
        FileName: Text;
}