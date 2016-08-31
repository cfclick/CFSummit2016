<h4>Generated QR Image</h4>
<cfscript>
	origText = serializeJSON(URL);
	//The preferred width & height in pixels	
	w = 20;	h = 20;	
	//Load Barcode types
	barcodeFormat = createobject("java","com.google.zxing.BarcodeFormat");
	// initialize the writer	
	writer = createobject("java","com.google.zxing.qrcode.QRCodeWriter").init();
	//representing encoded barcode image
	bitMatrix = writer.encode( origText, barcodeFormat.QR_CODE, w, h );
	matrixToImageWriter = createobject("java","com.google.zxing.client.j2se.MatrixToImageWriter");
	//Image buffer
	buff = variables.matrixToImageWriter.toBufferedImage( bitMatrix );
	img = ImageNew( buff );	
	cfimage( action="writeToBrowser", source=img);
	
	/*******************************************************************************************/
	
	src = expandPath('sanitizedPDFs/ABC_Voter_Registration.pdf');
	des = expandPath('../Client/pdfs/ABC_Voter_Registration.pdf');
	
	cfpdf( action="addheader"
			
				, source=src
				, image=img
				, destination=des  
				, topmargin="0.5"
				, leftmargin="0.5"
				, align="left", overwrite="yes", showonprint="yes");
				
	writeDump(URL);
	
	if( !directoryExists(expandPath('workflow/#URL.WF#/')))
		directoryCreate( expandPath('workflow/#URL.WF#/') );
		
	des2 = expandPath('workflow/#URL.WF#/#URL.TN#.pdf');
	fileCopy( des, des2 );
</cfscript>

