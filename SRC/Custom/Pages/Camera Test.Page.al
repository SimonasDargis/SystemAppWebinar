page 50002 "Camera Test"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Camera Test";
    InsertAllowed = false;
    DeleteAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = All;
                }
                field("Image Name"; Rec."Image Name")
                {
                    ApplicationArea = All;
                }
                field(Picture; Rec.Picture)
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
            action(TakePicture)
            {
                ApplicationArea = All;
                Caption = 'Take a picture';

                trigger OnAction()
                var
                    Camera: Codeunit Camera;
                    InStr: InStream;
                    OutStr: OutStream;
                    ImageName: Text;
                    CameraTest: Record "Camera Test";
                begin
                    if Camera.IsAvailable() then begin
                        CameraTest.Init();
                        CameraTest.Picture.CreateOutStream(OutStr);
                        Camera.GetPicture(InStr, ImageName);
                        CopyStream(OutStr, InStr);
                        CameraTest."Image Name" := ImageName;
                        CameraTest.Insert();
                    end;
                end;
            }
            action(DownloadPicture)
            {
                ApplicationArea = All;
                Caption = 'Download picture';

                trigger OnAction()
                var
                    InStr: InStream;
                    ToFileName: Text;
                begin
                    Rec.Picture.CreateInStream(InStr);
                    ToFileName := Rec."Image Name";
                    DownloadFromStream(InStr, 'Download', '', 'All Files (*.*)|*.*', ToFileName);
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

}