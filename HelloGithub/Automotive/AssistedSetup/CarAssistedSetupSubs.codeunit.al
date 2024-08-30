codeunit 50007 "OTL Car Assisted Setup Subs"
{

    local procedure UpdatedSetupStatus()
    var
        CarSetup: Record "Car Setup";
        GuidedExperience: Codeunit "Guided Experience";
    begin
        CarSetup.InsertIfNotExists();
        if CarSetup."No. Series" <> '' then
            GuidedExperience.CompleteAssistedSetup(ObjectType::Page, Page::CarAssistedSetup)
        else
            GuidedExperience.ResetAssistedSetup(ObjectType::Page, Page::CarAssistedSetup);
    end;

    local procedure GetMyAppId(): Guid
    var
        ModInfo: ModuleInfo;
    begin
        NavApp.GetCurrentModuleInfo(ModInfo);
        exit(ModInfo.Id());
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", OnRegisterAssistedSetup, '', false, false)]
    local procedure "Guided Experience_OnRegisterAssistedSetup"()
    var
        GuidedExperience: Codeunit "Guided Experience";
    begin
        GuidedExperience.InsertAssistedSetup('Car Setup',
            'Car Setup',
            'Allow you to setup and start using No. Series in the Car Solution',
            2,
            ObjectType::Page,
            Page::CarAssistedSetup,
            "Assisted Setup Group"::Extensions,
            '',
            "Video Category"::Uncategorized,
            '');

        UpdatedSetupStatus();
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", OnReRunOfCompletedAssistedSetup, '', false, false)]
    local procedure "Guided Experience_OnReRunOfCompletedAssistedSetup"(ExtensionID: Guid; ObjectType: ObjectType; ObjectID: Integer; var Handled: Boolean)
    begin
        if ExtensionID <> GetMyAppId() then
            exit;

        if (ObjectType <> ObjectType::Page) or (ObjectID <> Page::CarAssistedSetup) then
            exit;

        Handled := true;
        if Confirm('It seems that you have already completed the setup, would you like to rerun the setup?', true) then
            Page.RunModal(Page::CarAssistedSetup);
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", OnAfterRunAssistedSetup, '', false, false)]
    local procedure "Guided Experience_OnAfterRunAssistedSetup"(ExtensionID: Guid; ObjectType: ObjectType; ObjectID: Integer)
    var
        CarSetup: Record "Car Setup";
        CustomDimensions: Dictionary of [Text, Text];
    begin
        if ExtensionID <> GetMyAppId() then
            exit;

        if (ObjectType <> ObjectType::Page) or (ObjectID <> Page::CarAssistedSetup) then
            exit;

        CustomDimensions.Add('Assisted Setup Status', 'Complete');

        CarSetup.InsertIfNotExists();
        if CarSetup."No. Series" <> '' then begin
            UpdatedSetupStatus();
            Message('Congratulations you have completed the Car Setup.');

            LogMessage('318bba46-dc69-4490-b7b1-f012ef6a5e78',
                'Car Assisted Setup Has Completed',
                Verbosity::Verbose,
                DataClassification::SystemMetadata,
                TelemetryScope::All,
                CustomDimensions);
        end;

    end;
}