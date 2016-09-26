<!---
********************************************************************************
Author      	:	Shirak Avakian
Email       	:	ShirakAvakian@gmail.com
Company  		: 	QBI LLC
Date        	:	@{Date}
Component Name  : 	index.cfc
Description :
	A description about this page
********************************************************************************
--->
<h4>Source Code Architect 02</h4>
<cfscript>
	/*
		Create instance of architect02.Gateway()
		Consider architect02 has door called Gateway
	*/
	gateway = new CFSummit2016.work.architect02.Gateway() ;
	writeOutput("First we create instance of Gateway() (the Building door) Architect02.Gateway");
	writeOutput("<br>");
	writeDump(gateway);
	/*
		Bedroom1 is inside architect02 so we can open (call) the bedroom1 door (gateway)
	*/ 
	writeOutput("Second we create instance of bedroom1 Gateway() (bedroom1 door) Architect02.Gateway.Bedroom1.Gateway");
	writeOutput("<br>");
	bedroom1Gateway = gateway.getBedroom1Gateway();
	writeDump(bedroom1Gateway);
	
	/*
		lets get in the bedoroom1;
	*/
	writeOutput("Third we create instance of bedroom1 (bedroom1 items) Architect02.Gateway.Bedroom1.Bedroom");
	writeOutput("<br>");
	bedroom1 = bedroom1Gateway.getBedroom1();
	writedump(bedroom1);
	/*
		once we are inside bedroom1 we will be able to see chair color
	*/
	if( bedroom1.hasChair )
	{
		try
        {
        	writeOutput("I'm trying to get the chair from the bedroom without using the gateway.");
        	writeOutput("<br>");
        	chair = bedroom1.getChair();
			writeDump(chair);
        }
        catch(Any e)
        {
        	writeOutput("<h4>You can not get the chair from the bedroom1, unless you come from the door(gatway)</h4>");
        }
        
		writeOutput("I will get the chair color from the bedroom1 door(Gateway)");
		
		chairColor = bedroom1Gateway.getChairColor();
		writeOutput("<br><br>The Chair color is: #chairColor#");
	}
		
	else
		writeOutput('No chairs in the bedroom1');
		writeOutput("<br>");
	try
    {
    	writeDump(bedroom1Gateway.getBedroom1().GetChair());
    	writeOutput("<br>");
    }
    catch(Any e)
    {
    	writeOutput('<h3>' & e.message & '</h3>');
    	writeOutput("<br>");
    }

</cfscript>
