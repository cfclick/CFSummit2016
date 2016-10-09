<cfpdf action="getInfo" name="info" source="foxnews.pdf" >
<cfdump var="#info#" >

<cfscript>
Properties = {};
Properties.Name = "Shirak";
Properties.Workflow = "100"	;
writeDump(Properties);
</cfscript>
