<cfscript>
	
	src = expandPath('../customProperty/cnnnews.pdf');
	xmp_src = expandPath('../xmp/foxnews.xmp');
	des = expandpath('./cnnnews_imported.pdf');
	
	cfpdf(
	action="import",
 	type="metadata",
 	importfrom=xmp_src,
 	source=src,
 	destination=des,
 	overwrite="yes" );
 	
</cfscript>
