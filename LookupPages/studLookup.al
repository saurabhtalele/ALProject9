page 50111 "Stud Lookup"
{
    Caption = 'Stud';

    Editable = false;
    PageType = List;
    SourceTable = Stud;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the number.';
                }
                field(Name; Rec.Lname)
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(STudList)
            {
                ApplicationArea = All;
                Caption = 'Advanced View';
                Image = CustomerList;
                ToolTip = 'Open the Stud page showing all possible columns. ';

                trigger OnAction()
                var
                    VendorList: Page "Stud";
                begin
                    VendorList.SetTableView(Rec);
                    VendorList.SetRecord(Rec);
                    VendorList.LookupMode := true;
                    if VendorList.RunModal() = ACTION::LookupOK then begin
                        VendorList.GetRecord(Rec);
                        CurrPage.Close();
                    end;
                end;
            }
        }

    }
}

