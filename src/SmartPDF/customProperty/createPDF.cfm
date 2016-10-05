<cfscript>
	if( !isdefined("URL.address"))
		cfhtmltopdf (source="http://www.foxnews.com/", destination="foxnews.pdf", overwrite="true", orientation="landscape");
	else
		cfhtmltopdf (source=URL.address, destination="yahoo.pdf", overwrite="true", orientation="landscape");
	
	
	
</cfscript>
PDF crerated
