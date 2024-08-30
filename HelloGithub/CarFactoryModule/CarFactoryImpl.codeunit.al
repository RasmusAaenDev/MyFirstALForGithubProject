codeunit 50000 "OTL Car Factory Impl."
{
    Access = Internal;

    procedure InsertGasolineCar(No: Code[20]; Description: Text[100]; Manufacturer: code[20]; Model: Code[20]; Year: Integer)
    var
        Car: Record Car;
    begin
        Car.Init();
        Car.Validate("No.", No);
        Car.Validate(Description, Description);
        Car.Validate(Manufacturer, Manufacturer);
        Car.Validate(Model, Model);
        Car.Validate(Year, Year);
        Car.Validate("Fuel Type", "Fuel Type"::Gasoline);
        Car.Insert();
    end;
}