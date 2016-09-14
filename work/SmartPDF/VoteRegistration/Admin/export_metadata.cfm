<h4>Export Metadata</h4>
<cfscript>
	
	des = expandPath('../../xmp/#URL.TN#.xmp');
	src = expandpath( "definedPDFs/ABC_Voter_Registration.pdf");
	
	cfpdf(
	action="export",
 	type="metadata",
 	exportTo=des, 
 	source=src,
 	overwrite="yes" );
 	
</cfscript>
<cfoutput>
	<h3>Metadata Exported</h3>
	
	<h3>Sanitize PDF</h3>
			
	<p>Sanitize file name: ABC_Voter_Registration.pdf</p>
	
	
	<a href="sanitize.cfm?TN=#URL.TN#&WF=#URL.WF#" target="_self">Sanitize PDF</a>
</cfoutput>