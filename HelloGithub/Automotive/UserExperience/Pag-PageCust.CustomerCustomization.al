pagecustomization CustomerCustomization customizes "Customer List"
{
    layout
    {
        modify("Name 2")
        {
            Visible = true;
        }

        modify("Search Name")
        {
            Visible = true;
        }
    }

    views
    {
        addfirst
        {
            view(BalanceDue)
            {
                Caption = 'BlanaceDue';
                Filters = where("Balance (LCY)" = filter(> 0));
                SharedLayout = true;
            }
        }
    }
}