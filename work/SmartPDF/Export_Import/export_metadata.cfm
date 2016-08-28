<cfscript>
	
	src = expandPath('../customProperty/foxnews_with_custom_properties.pdf');
	des = expandPath('../xmp/foxnews.xmp');
	
	cfpdf(
	action="export",
 	type="metadata",
 	exportTo="#des#", 
 	source="#src#",
 	overwrite="yes" );
 	
</cfscript>
