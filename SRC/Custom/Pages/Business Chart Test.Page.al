page 50010 "Business Chart Test"
{
    PageType = Card;
    Caption = 'Business Chart Test';
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            usercontrol(BusinessChart; "Microsoft.Dynamics.Nav.Client.BusinessChart")
            {
                ApplicationArea = All;

                trigger Refresh()
                begin
                    UpdateChart();
                end;

                trigger AddInReady()
                begin
                    UpdateChart();
                end;

                trigger DataPointClicked(point: JsonObject)
                var
                    JsonTokenXValueString: JsonToken;
                    XValueString: text;
                begin
                    if point.Get('XValueString', JsonTokenXValueString) then begin //Get the XValueString property of the point data
                        XValueString := Format(JsonTokenXValueString); //Parse the value into a string
                        XValueString := DelChr(XValueString, '=', '"'); //Remove the quotes from the string
                        Message('Customer Balance: %1', XValueString); //Display in a message
                    end;
                end;

            }
        }
    }

    local procedure UpdateChart()
    var
        Customer: Record Customer; //Record to get the customers
        Index: Integer;
        BusinessChartBuffer: Record "Business Chart Buffer" temporary;
    begin
        BusinessChartBuffer.Initialize(); //Initializes a chart buffer

        //Creates a measure (y-axis), data type is set to decimal based on the Balance field
        BusinessChartBuffer.AddMeasure('Balance', 1, BusinessChartBuffer."Data Type"::Decimal, BusinessChartBuffer."Chart Type"::Column.AsInteger());

        //Defines the x-axis
        BusinessChartBuffer.SetXAxis('Customer', BusinessChartBuffer."Data Type"::String);

        if Customer.FindSet() then begin //Finds all customers
            repeat
                Customer.CalcFields("Balance"); //Calculates the balance

                BusinessChartBuffer.AddColumn(Customer."No."); //Creates a column (X-Axis point)

                BusinessChartBuffer.SetValueByIndex(0, Index, Customer.Balance);

                Index += 1; //Index is the ID of the X-Axis point, increase it by 1 every time a column is added
            until (Customer.Next() = 0) or (Index >= 10); //Repeat the process throughout every customer, index check has been added to limit customers to 10 as an example
        end;
        BusinessChartBuffer.Update(CurrPage.BusinessChart);
    end;
}