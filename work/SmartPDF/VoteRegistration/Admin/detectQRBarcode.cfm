<cfscript>
	src = expandPath('../incoming/ABC_Voter_Registration.pdf');
	
	if( fileExists(src ))
		barcode = detectQRBarcode(src);
	
</cfscript>