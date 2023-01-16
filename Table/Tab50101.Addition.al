table 50109 Addition
{
    Caption = 'Addition';
    DataClassification = ToBeClassified;
    LookupPageID = "Addition";
    DataCaptionFields = "No", "studid";

    fields
    {
        // field(1; Addition; Integer)
        // {
        //     CalcFormula = SUM("Stud".Fname WHERE("No" = field("studid")));

        //     Editable = false;
        //     FieldClass = FlowField;

        // }

        field(2; studid; Text[10])
        {
            TableRelation = Stud;
            //DataClassification = StudContent;

            trigger OnValidate()
            begin
                OnBeforeValidateAdditionStudid(Rec, xRec);
                GetVend(Rec.studid);

                "Lname" := Stud.Lname;
            end;

        }
        field(4; Lname; Text[20])
        {


            Caption = 'Lname';
            TableRelation = Stud.Lname;
            ValidateTableRelation = false;


            trigger OnLookup()
            var
                StudLname: Text;
            begin
                StudLname := "Lname";
                LookupBuyFromStudLname(StudLname);
                "Lname" := CopyStr(StudLname, 1, MaxStrLen("Lname"));
                "studid" := Stud.No;
            end;

            trigger OnValidate()
            var
                Stud: Record Stud;
                LookupStateManager: Codeunit "Mylookups";

            begin
                if LookupStateManager.IsRecordSaved() then begin
                    Stud := LookupStateManager.GetSavedRecord();
                    if Stud.No <> '' then begin
                        LookupStateManager.ClearSavedRecord();
                        OnLookupBuyfromStudLnameOnAfterSuccessfulLookup(Rec);
                        Validate("Studid", Stud.No);
                        exit;

                    end;
                end;

                // Vendor.GetVendorNo("Buy-from Vendor Name"));
            end;
        }

        field(3; "No"; Text[10])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; No)
        {

        }
    }

    var
        Stud: Record Stud;

    procedure GetVend(Studid: Code[20])
    begin

        Stud.Get(Studid);
    end;

    procedure ABC(var Addition: Record "Addition"; var xAddition: Record "Addition")
    begin

        Addition.SetRange("studid");
        if Addition.GetFilter("studid") = xAddition."studid" then
            if Addition."studid" <> Addition."studid" then
                Addition.SetRange("studid");


    end;



    procedure AddtionEditable() IsEditable: Boolean;
    begin
        IsEditable := Rec."Studid" <> '';

        OnAfterPurchaseLinesEditable(Rec, IsEditable);
    end;

    procedure LookupBuyFromStudLname(var StudLname: Text): Boolean
    var
        Stud: Record Stud;
        LookupStateManager: Codeunit "Mylookups";
        RecVariant: Variant;
        SearchStudLname: Text;
    begin
        SearchStudLname := StudLname;
        //Stud.SetFilter("Date Filter", GetFilter("Date Filter"));
        if "studid" <> '' then
            Stud.Get("studid");
        if Stud.StudLookup(Stud) then begin
            if Rec."studid" = Stud.Lname then
                StudLname := SearchStudLname
            else
                StudLname := Stud.LName;
            //StudLname := Stud.Lname;
            RecVariant := Stud;
            LookupStateManager.SaveRecord(RecVariant);
            exit(true);
        end;
    end;





    [IntegrationEvent(false, false)]
    local procedure OnAfterPurchaseLinesEditable(Addtion: Record "Addition"; var IsEditable: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeValidateAdditionStudid(var Addition: Record "Addition"; xAddition: Record "Addition")
    begin
    end;


    [IntegrationEvent(false, false)]
    local procedure OnLookupBuyfromStudLnameOnAfterSuccessfulLookup(var Addition: Record "Addition")
    begin
    end;



}


