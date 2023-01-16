page 50105 Stud
{
    ApplicationArea = All;
    Caption = 'Stud';
    PageType = List;
    SourceTable = Stud;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Fname; Rec.Fname)
                {
                    ToolTip = 'Specifies the value of the Fname field.';
                }
                field(Lname; Rec.Lname)
                {
                    ToolTip = 'Specifies the value of the Fname field.';
                }
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ToolTip = 'Specifies the value of the SystemId field.';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.';
                }
            }
        }
    }
}
