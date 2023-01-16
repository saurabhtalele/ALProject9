page 50101 Addition
{
    ApplicationArea = All;
    Caption = 'Addition';
    PageType = List;
    RefreshOnActivate = true;
    SourceTable = Addition;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                // field(Addition; Rec.Addition)
                // {
                //     ToolTip = 'Specifies the value of the Addition field.';
                // }
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No. field.';


                }
                field(Lname; Rec.Lname)
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    // ApplicationArea = all;
                    Importance = Promoted;
                    // Lookup = true;
                    trigger OnValidate()
                    begin

                        Rec.ABC(Rec, xRec);
                        CurrPage.Update();
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        exit(Rec.LookupBuyFromStudLname(Text));
                    end;
                }
                //    
                field(studid; Rec.studid)
                {
                    ToolTip = 'Specifies the value of the studid field.';

                    trigger OnValidate()
                    begin
                        IsPurchaseLinesEditable := Rec.AddtionEditable();
                        Rec.ABC(Rec, xRec);


                        CurrPage.Update();
                    end;
                }
            }

        }
    }
    var
        [InDataSet]
        IsPurchaseLinesEditable: Boolean;


}
