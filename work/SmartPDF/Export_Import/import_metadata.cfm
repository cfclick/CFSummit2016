<cfscript>
	/*
	src = expandPath('../customProperty/cnnnews.pdf');
	xmp_src = expandPath('../xmp/foxnews.xmp');
	des = expandpath('./cnnnews_imported.pdf');
	*/
	
	src = 'C:\incoming\ABC_Voter_Registration1.pdf';
	xmp_src = 'C:\inetpub\wwwroot\CFSummit2016\xmp\FCFFC19B-5056-AAAE-CE91444F7AAB945E.xmp';
	des = 'C:\inetpub\wwwroot\CFSummit2016\work\SmartPDF\VoteRegistration\Admin\workflow\110';
	
	cfpdf(
	action="import",
 	type="metadata",
 	importfrom=xmp_src,
 	source=src,
 	destination=des,
 	overwrite="yes" );
 	
</cfscript>
