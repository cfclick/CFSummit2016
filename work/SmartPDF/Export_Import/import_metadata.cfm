<cfscript>
	
	src = expandPath('../customProperty/msnbc.pdf');
	xmp_src = expandPath('../xmp/foxnews.xmp');
	des = expandpath('./msnbc_imported.pdf');
	
	cfpdf(
	action="import",
 	type="metadata",
 	importfrom=xmp_src,
 	source=src,
 	destination=des,
 	overwrite="yes" );
 	
</cfscript>
Import process is complete