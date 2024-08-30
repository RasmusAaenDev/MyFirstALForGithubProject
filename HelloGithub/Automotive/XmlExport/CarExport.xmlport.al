xmlport 50000 "OTL CarExport"
{
    Direction = Export;
    FileName = 'Cars.xml';
    Format = Xml;

    schema
    {
        textelement(RootElement)
        {
            XmlName = 'root';
            tableelement(Car; Car)
            {
                fieldattribute(No; Car."No.") { }

                fieldelement(Description; Car.Description) { }

                textelement(Configuration)
                {
                    XmlName = 'Configuration';

                    fieldelement(Model; Car.Model)
                    {
                        fieldattribute(Manufacturer; Car.Manufacturer) { }
                        fieldattribute(Year; Car.Year) { }
                    }
                }

                fieldelement(FuelType; Car."Fuel Type")
                {
                    XmlName = 'Fuel';
                }
            }
        }
    }
}