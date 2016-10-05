<h4>Sanitize</h4>
<cfscript>
	src = expandpath( "definedPDFs/ABC_Voter_Registration.pdf");
	des = expandPath('sanitizedPDFs/ABC_Voter_Registration.pdf');
	
	cfpdf( action="sanitize", source=src, destination=des, overwrite="yes" );
	
	/*cfpdf( action="read" ,name="sanitizedReader" ,source=des  )	;*/
</cfscript>

<cfoutput>
	<h3>PDF Sanitized and saved to #des#</h3>
			
	<p>Sanitize file name: ABC_Voter_Registration.pdf</p>
	
	<a href="generateQRBarcode.cfm?TN=#URL.TN#&WF=#URL.WF#" target="_self">Barcode PDF</a>
	
</cfoutput>