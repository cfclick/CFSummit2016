<cfscript>
	cfhtmltopdf (source="http://www.foxnews.com/", destination="foxnews.pdf", overwrite="true", orientation="landscape");
	
</cfscript>
<cfpdf action="getinfo" name="foxNews" source="foxnews.pdf" >
<cfdump var="#foxNews#">