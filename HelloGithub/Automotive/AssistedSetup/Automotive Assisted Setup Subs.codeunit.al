codeunit 50007 "Automotive Assisted Setup Subs"
{

    local procedure UpdatedSetupStatus()
    var
        AutomotiveSetup: Record "Automotive Setup";
        GuidedExperience: Codeunit "Guided Experience";
    begin
        AutomotiveSetup.InsertIfNotExists();
        if AutomotiveSetup."No. Series" <> '' then
            GuidedExperience.CompleteAssistedSetup(ObjectType::Page, Page::AutomotiveAssistedSetup)
        else
            GuidedExperience.ResetAssistedSetup(ObjectType::Page, Page::AutomotiveAssistedSetup);
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
        GuidedExperience.InsertAssistedSetup('Automotive Setup',
            'Automotive Setup',
            'Allow you to setup and start using No. Series in the Automotive Solution',
            2,
            ObjectType::Page,
            Page::AutomotiveAssistedSetup,
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

        if (ObjectType <> ObjectType::Page) or (ObjectID <> Page::AutomotiveAssistedSetup) then
            exit;

        Handled := true;
        if Confirm('It seems that you have already completed the setup, would you like to rerun the setup?', true) then
            Page.RunModal(Page::AutomotiveAssistedSetup);
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", OnAfterRunAssistedSetup, '', false, false)]
    local procedure "Guided Experience_OnAfterRunAssistedSetup"(ExtensionID: Guid; ObjectType: ObjectType; ObjectID: Integer)
    var
        AutomotiveSetup: Record "Automotive Setup";
        CustomDimensions: Dictionary of [Text, Text];
    begin
        if ExtensionID <> GetMyAppId() then
            exit;

        if (ObjectType <> ObjectType::Page) or (ObjectID <> Page::AutomotiveAssistedSetup) then
            exit;

        CustomDimensions.Add('Assisted Setup Status', 'Complete');

        AutomotiveSetup.InsertIfNotExists();
        if AutomotiveSetup."No. Series" <> '' then begin
            UpdatedSetupStatus();
            Message('Congratulations you have completed the Automotive Setup.');

            LogMessage('318bba46-dc69-4490-b7b1-f012ef6a5e78',
                'Automotive Assisted Setup Has Completed',
                Verbosity::Verbose,
                DataClassification::SystemMetadata,
                TelemetryScope::All,
                CustomDimensions);
        end;

    end;
}