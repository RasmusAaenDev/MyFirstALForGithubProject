tableextension 50000 "OTL Car Act. Ext" extends "Activities Cue"
{
    fields
    {
        field(50000; "OTL Total Cars"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Car);
        }

        field(50001; "OTL Total Diesel Cars"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Car where("Fuel Type" = const("Fuel Type"::Diesel)));
        }
    }
}