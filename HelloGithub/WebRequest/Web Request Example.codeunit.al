codeunit 50010 "Web Request Example"
{
    procedure RequestJsonPlaceHolder()
    var
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        ResponseText: Text;
        JArray: JsonArray;
        JObject: JsonObject;
        JToken: JsonToken;
        NameToken: JsonToken;
        NameList: List of [Text];
        NameText: Text;
        StringOfNames: Text;
    begin
        Client.Get('https://jsonplaceholder.typicode.com/users', ResponseMessage);
        if not ResponseMessage.IsSuccessStatusCode then
            Error('Could not access API');

        ResponseMessage.Content().ReadAs(ResponseText);

        JArray.ReadFrom(ResponseText);
        foreach JToken in JArray do begin
            JToken.SelectToken('name', NameToken);
            NameToken.WriteTo(NameText);

            NameList.Add(NameText);
        end;

        foreach NameText in NameList do begin
            if StringOfNames <> '' then
                StringOfNames += ', ';

            StringOfNames += NameText;
        end;

        Message(StringOfNames);
    end;
}