<cfscript>
	src = expandPath('../incoming/ABC_Voter_Registration.pdf');
	
	if( fileExists(src )){
		service = new CFSummit2016.work.SmartPDF.VoteRegistration.service.Barcode();
		barcode = service.detectQRBarcode(src);
	
	}
</cfscript>
