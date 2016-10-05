<h4>Generated PDF417 Image</h4>
<cfscript>
	origText = "ColdFusion 2016 #datetimeformat(now(),'mm/dd/yyyy hh:mm:ss tt')#";
	BarcodeFormat = createobject("java","com.google.zxing.BarcodeFormat");	
	writer = createobject("java","com.google.zxing.pdf417.encoder.PDF417Writer").init();
	bitMatrix = writer.encode( origText, BarcodeFormat.PDF_417, 100, 100 );
	converter = createobject("java","com.google.zxing.client.j2se.MatrixToImageWriter");
	buff = converter.toBufferedImage( bitMatrix );
	img = ImageNew( buff );
	cfimage(action="writeToBrowser", source="#img#", format="png");
	/******************************************************************************************************/
	buff = ImageGetBufferedImage( img );
	source = createobject("java","com.google.zxing.client.j2se.BufferedImageLuminanceSource").init( buff );
	binarizer = createobject("java","com.google.zxing.common.GlobalHistogramBinarizer").init( source );
	bitmap = createobject("java","com.google.zxing.BinaryBitmap").init( binarizer ) ;		
	reader = createobject("java","com.google.zxing.pdf417.PDF417Reader");
	result = reader.decode( bitmap );
	decodedResult = result.getText();	
</cfscript>
<p>decoded text:</p>
<h4><cfoutput>#decodedResult#</cfoutput></h4>