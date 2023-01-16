codeunit 50100 Mylookups


{
    SingleInstance = true;

    trigger OnRun()
    begin

    end;

    var
        SavedVariant: Variant;
        RecordSaved: Boolean;

    procedure GetSavedRecord(): Variant
    begin
        if SavedVariant.IsRecord() then
            exit(SavedVariant);
    end;

    procedure ClearSavedRecord()
    begin
        clear(SavedVariant);
        RecordSaved := false;
    end;

    procedure IsRecordSaved(): Boolean
    begin
        exit(RecordSaved);
    end;

    procedure SaveRecord(var RecordVariant: Variant)
    begin
        SavedVariant := RecordVariant;
        RecordSaved := true;
    end;
}


