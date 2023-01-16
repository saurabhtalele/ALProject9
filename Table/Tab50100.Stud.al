table 50106 Stud
{
    Caption = 'Stud';
    DataClassification = ToBeClassified;
    LookupPageID = "Stud Lookup";

    fields
    {
        field(1; "No"; Text[10])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; Fname; Decimal)
        {
            Caption = 'Fname';

            DataClassification = ToBeClassified;

        }
        field(3; Lname; Text[10])
        {
            Caption = 'Lname';
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(PK; No)
        {

        }

    }
    procedure SelectStud(var Stud: Record Stud): Boolean
    begin
        exit(StudLookup(Stud));
    end;

    procedure StudLookup(var Stud: Record Stud): Boolean
    var
        StudLookup: Page "Stud Lookup";
        Result: Boolean;
    begin
        StudLookup.SetTableView(Stud);
        StudLookup.SetRecord(Stud);
        StudLookup.LookupMode := true;
        Result := StudLookup.RunModal() = ACTION::LookupOK;
        if Result then
            StudLookup.GetRecord(Stud)
        else
            Clear(Stud);

        exit(Result);
    end;
}
