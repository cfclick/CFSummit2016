<cfscript>
	
	src = expandpath('../Export_Import/msnbc_imported.pdf');
	des = expandPath('./msnbc_senitized.pdf');
	
	cfpdf( action="sanitize", source=src, destination=des, overwrite="yes" );
		
</cfscript>
Sanitization is Complete

