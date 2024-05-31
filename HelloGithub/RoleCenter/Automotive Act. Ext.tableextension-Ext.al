tableextension 50000 "Automotive Act. Ext" extends "Activities Cue"
{
    fields
    {
        field(50000; "Total Automotives"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Automotive);
        }

        field(50001; "Total Diesel Automotives"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Automotive where("Fuel Type" = const("Fuel Type"::Diesel)));
        }
    }
}