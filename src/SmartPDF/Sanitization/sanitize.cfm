<cfscript>
	
	src = expandpath('../Export_Import/yahoo_imported.pdf');
	des = expandPath('./yahoo_senitized.pdf');
	
	cfpdf( action="sanitize", source=src, destination=des, overwrite="yes" );
		
</cfscript>
<h3>Sanitization is Complete and saved to <cfoutput>#des#</cfoutput></h3>

