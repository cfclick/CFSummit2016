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
	writeDump(gateway);
	/*
		Bedroom1 is inside architect02 so we can open (call) the bedroom1 door (gateway)
	*/ 
	bedroom1Gateway = gateway.getBedroom1Gateway();
	writeDump(bedroom1Gateway);
	
	/*
		lets get in the bedoroom1;
	*/
	bedroom1 = bedroom1Gateway.getBedroom1();
	writedump(bedroom1);
	/*
		once we are inside bedroom1 we will be able to see chair color
	*/
	if( bedroom1.hasChair )
	{
		try
        {
        	chair = bedroom1.getChair();
			writeDump(chair);
        }
        catch(Any e)
        {
        	writeOutput("<h4>You can not get the chair from the bedroom1, unless you come from the door(gatway)</h4>");
        }
		
		writeOutput("<br><br>The Chair color is:");
		chairColor = bedroom1Gateway.getChairColor();
		writeDump(chairColor);
	}
		
	else
		writeOutput('No chairs in the bedroom1');
	
	try
    {
    	writeDump(bedroom1Gateway.getBedroom1().GetChair());
    }
    catch(Any e)
    {
    	writeOutput('<h3>' & e.message & '</h3>');
    }

</cfscript>
