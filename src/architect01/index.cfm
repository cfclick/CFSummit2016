<!---
********************************************************************************
Author      	:	Shirak Avakian
Email       	:	Shirak.Avakian@Qbillc.com
Company  		: 	QBI LLC
Date        	:	@{Date}
Component Name  : 	index.cfc
Description :
	A description about this page
********************************************************************************
--->
<h4>Source Code Architect 02</h4>

<cfscript>
	bedroom1 = new CFSummit2016.src.architect01.components.Bedroom1() ;
	writeDump(var=bedroom1,label='Bedroom1');
	writeOutput('<br>');
	chair = bedroom1.GetChair();
	writeDump(var=chair,label='Chair');
	writeOutput('<br>');
	chairColor = chair.getChairColor();
	writeOutput('Chair color is: #chairColor#');	
</cfscript>

