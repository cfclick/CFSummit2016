<cfscript>
	cfhtmltopdf (source="http://www.cnn.com/", destination="cnnnews.pdf", overwrite="true", orientation="landscape");
	
	cfpdf( action="getinfo", name="cnnNews", source="cnnnews.pdf");
	
	writedump(cnnNews);
</cfscript>
