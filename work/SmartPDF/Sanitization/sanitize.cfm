<cfscript>
	
	src = expandpath('../Export_Import/cnnnews_imported.pdf');
	des = expandPath('./cnnnews_senitized.pdf.pdf');
	
	cfpdf( action="sanitize", source=src, destination=des, overwrite="yes" );
		
</cfscript>


