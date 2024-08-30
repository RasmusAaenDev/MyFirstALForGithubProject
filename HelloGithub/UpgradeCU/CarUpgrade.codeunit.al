codeunit 50002 "OTL CarUpgrade"
{
    Subtype = Upgrade;



    trigger OnUpgradePerCompany()
    var
        Car: Record Car;
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if CompanyName <> 'CRONUS Danmark A/S' then
            exit;


        if UpgradeTag.HasUpgradeTag(UpgradeTagLbl) then
            exit;

        if Car.FindSet() then
            repeat
                VerifyOrInsertManufacturer(Car.Manufacturer);
                VerifyOrInsertModel(Car.Model);
            until Car.Next() = 0;

        UpgradeTag.SetUpgradeTag(UpgradeTagLbl);
    end;

    var
        UpgradeTagLbl: Label 'Manufacturer-And-Model-Supplemental-Implementation-290524', Locked = true;

    local procedure VerifyOrInsertManufacturer(Manufacturer: Code[20])
    var
        CarManufacturer: Record "Car Manufacturer";
    begin
        if not CarManufacturer.Get(Manufacturer) then begin
            CarManufacturer.Init();
            CarManufacturer."Manufacturer Code" := Manufacturer;
            CarManufacturer.Description := Manufacturer;
            CarManufacturer.Insert();
        end;
    end;

    local procedure VerifyOrInsertModel(Model: Code[50])
    var
        CarModel: Record "Car Model";
    begin
        if not CarModel.Get(Model) then begin
            CarModel.Init();
            CarModel."Model Code" := Model;
            CarModel.Description := Model;
            CarModel.Insert();
        end;
    end;
}