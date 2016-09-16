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
		once we are inside bedroom1 we will be able to see chair color
	*/
	writeDump(bedroom1Gateway.getChairColor());
	
	/*
		Bedroom1 is inside architect02 so 
		if we consider it as the gate keeper we can get other classes
	*/ 
	
	writeDump(bedroom1Gateway.getBedroom1().GetChair());
</cfscript>
