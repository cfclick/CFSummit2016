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
	<p>Exported file name: #URL.TN#.xmp</p>	
	<p>Exported file location #expandPath('../../xmp')#</p>
	
	<h3>Sanitize PDF</h3>
			
	<p>Sanitize file name: #info.TrackingNumber#.xmp</p>
	
	<p>Sanitize file location #expandPath('../../xmp')#</p>
	
	
	<a href="export_metadata.cfm?TN=#info.TrackingNumber#&WF=#info.WorkflowID#" target="_self">Export Metadata</a>
</cfoutput>