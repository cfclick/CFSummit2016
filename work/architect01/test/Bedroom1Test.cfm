<cfscript>
	bedroom1 = new CFSummit2016.work.architect01.components.Bedroom1() ;
	writeDump(bedroom1,'Bedroom1');
	chair = bedroom1.GetChair();
	writeDump(chair,'Chair');
	chairColor = chair.getChairColor();
	writeOutput('Chair color is: #chairColor#');	
</cfscript>
