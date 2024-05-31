codeunit 50002 AutomotiveUpgrade
{
    Subtype = Upgrade;



    trigger OnUpgradePerCompany()
    var
        Automotive: Record Automotive;
        UpgradeTag: Codeunit "Upgrade Tag";
    begin
        if CompanyName <> 'CRONUS Danmark A/S' then
            exit;


        if UpgradeTag.HasUpgradeTag(UpgradeTagLbl) then
            exit;

        if Automotive.FindSet() then
            repeat
                VerifyOrInsertManufacturer(Automotive.Manufacturer);
                VerifyOrInsertModel(Automotive.Model);
            until Automotive.Next() = 0;

        UpgradeTag.SetUpgradeTag(UpgradeTagLbl);
    end;

    var
        UpgradeTagLbl: Label 'Manufacturer-And-Model-Supplemental-Implementation-290524', Locked = true;

    local procedure VerifyOrInsertManufacturer(Manufacturer: Code[20])
    var
        AutomotiveManufacturer: Record "Automotive Manufacturer";
    begin
        if not AutomotiveManufacturer.Get(Manufacturer) then begin
            AutomotiveManufacturer.Init();
            AutomotiveManufacturer."Manufacturer Code" := Manufacturer;
            AutomotiveManufacturer.Description := Manufacturer;
            AutomotiveManufacturer.Insert();
        end;
    end;

    local procedure VerifyOrInsertModel(Model: Code[50])
    var
        AutomotiveModel: Record "Automotive Model";
    begin
        if not AutomotiveModel.Get(Model) then begin
            AutomotiveModel.Init();
            AutomotiveModel."Model Code" := Model;
            AutomotiveModel.Description := Model;
            AutomotiveModel.Insert();
        end;
    end;
}