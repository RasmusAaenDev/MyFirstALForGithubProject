controladdin MyControlAddIn
{
    RequestedHeight = 300;
    MinimumHeight = 300;
    MaximumHeight = 300;
    RequestedWidth = 700;
    MinimumWidth = 700;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts =
        'https://code.jquery.com/jquery-3.2.1.min.js';
    //'script2.js';
    // StyleSheets =
    //     'style.css';
    StartupScript = './JSControlAddin/ControlAddin.js';
    // RecreateScript = 'recreateScript.js';
    // RefreshScript = 'refreshScript.js';
    // Images =
    //     'image1.png',
    //     'image2.png';

    event JSInitialized(MyText: Text)

    procedure InitializeJS()
}