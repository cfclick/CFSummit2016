<h4>Generated QR Image</h4>
<cfscript>
	origText = "Hello CFSummit-#datetimeformat(now(),'mm/dd/yyyy hh:mm:ss tt')#";
	//The preferred width & height in pixels	
	w = 80;	h = 80;	
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
	
	buff = ImageGetBufferedImage( img );
	//prepare the image for decoding
	source 	  = createobject("java","com.google.zxing.client.j2se.BufferedImageLuminanceSource").init( buff );
	binarizer = createobject("java","com.google.zxing.common.GlobalHistogramBinarizer").init( source );
	bitmap 	  = createobject("java","com.google.zxing.BinaryBitmap").init( binarizer );
	reader 	  = createobject("java","com.google.zxing.qrcode.QRCodeReader").init();
	//decode the barcode
	decodedResult = reader.decode( bitmap, javacast("null", ""));
	
</cfscript>
<h4>decoded text: <cfoutput>#decodedResult#</cfoutput></h4>


