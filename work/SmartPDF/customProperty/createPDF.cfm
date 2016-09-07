<cfscript>
	cfhtmltopdf (source="http://www.foxnews.com/", destination="foxnews.pdf", overwrite="true", orientation="landscape");
	
	cfpdf( action="getinfo", name="info", source="foxnews.pdf");
	
	writedump(info);
</cfscript>
