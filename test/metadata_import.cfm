<cfscript>
	
	export_src = expandPath('./Voter_Registration_original.pdf');
	export_to = expandPath('./Voter_Registration_original.xmp');
	
	cfpdf(
	action="export",
 	type="metadata",
 	exportTo=export_to, 
 	source=export_src,
 	overwrite="yes" );
 	
 	san_src = export_src;
	san_des = expandPath('./Voter_Registration_sanitized.pdf');
	
	startTick = getTickCount();
	cfpdf( action="sanitize", source=san_src, destination=san_des, overwrite="yes" );
	endTick = getTickCount();
	sanitizeTime = endTick - startTick;
	writeOutput('Sanitize execution time:');
	writeOutput(sanitizeTime/1000);
	
	import_src = san_des;
	//import_xmp_src = export_src;
	import_xmp_src = export_to;
	import_des = expandpath('./imported/Voter_Registration_imported.pdf');
	
	cfpdf(
	action="import",
 	type="metadata",
 	importfrom=import_xmp_src,
 	source=import_src,
 	destination=import_des,
 	overwrite="yes" );
 	
</cfscript>