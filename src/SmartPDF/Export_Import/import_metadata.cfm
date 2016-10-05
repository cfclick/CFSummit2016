<cfscript>
	
	src = expandPath('../customProperty/yahoo.pdf');
	xmp_src = expandPath('../xmp/foxnews.xmp');
	des = expandpath('./yahoo_imported.pdf');
	
	cfpdf(
	action="import",
 	type="metadata",
 	importfrom=xmp_src,
 	source=src,
 	destination=des,
 	overwrite="yes" );
 	
</cfscript>
<h3>Import process is complete and saved to <cfoutput>#des#</cfoutput></h3>