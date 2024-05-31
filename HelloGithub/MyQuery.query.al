query 50000 MyQuery
{
    QueryType = API;
    EntityName = 'SalesData';
    EntitySetName = 'SalesData';
    APIGroup = 'CustomSalesAPI';
    APIPublisher = 'Rasmus';
    APIVersion = 'v1.0';

    elements
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo_; "No.")
            {

            }

            column(Name; Name) { }

            dataitem(Sales_Invoice_Header; "Sales Invoice Header")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;

                dataitem(Sales_Invoice_Line; "Sales Invoice Line")
                {
                    DataItemLink = "Document No." = Sales_Invoice_Header."No.";

                    column(ItemNo_; "No.")
                    {

                    }

                    column(Quantity; Quantity)
                    {
                        Method = Sum;
                    }

                    dataitem(Item; Item)
                    {
                        DataItemLink = "No." = Sales_Invoice_Line."No.";

                        column(Inventory; Inventory)
                        { }

                        column(Description; Description)
                        { }
                    }
                }
            }
        }
    }
}