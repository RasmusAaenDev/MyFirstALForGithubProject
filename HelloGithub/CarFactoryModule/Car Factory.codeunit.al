codeunit 50001 "Car Factory"
{
    var
        CarFactoryImpl: Codeunit "Car Factory Impl.";

    procedure InsertGasolineCar(No: Code[20]; Description: Text[100]; Manufacturer: code[20]; Model: Code[20]; Year: Integer)
    begin
        CarFactoryImpl.InsertGasolineCar(No, Description, Manufacturer, Model, Year);
    end;
}