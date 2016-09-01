component  output="true"
{
	public any function generateQRBarcode( required struct urlVar ){
		
		var origText = serializeJSON( arguments.urlVar );
		//The preferred width & height in pixels	
		var w = 20; var	h = 20;	
		//Load Barcode types
		var barcodeFormat = createobject("java","com.google.zxing.BarcodeFormat");
		// initialize the writer	
		var writer = createobject("java","com.google.zxing.qrcode.QRCodeWriter").init();
		//representing encoded barcode image
		var bitMatrix = writer.encode( origText, barcodeFormat.QR_CODE, w, h );
		var matrixToImageWriter = createobject("java","com.google.zxing.client.j2se.MatrixToImageWriter");
		//Image buffer
		var buff = matrixToImageWriter.toBufferedImage( bitMatrix );
		var img = ImageNew( buff );	
		return img;
	}
	
	public struct function detectQRBarcode( required pdfSource ){
			var src = arguments.pdfSource;
			//var data =  arguments.collection;
			var ufolder = getTempDirectory() & createUUID();
			var validBarcode = false;		
			cfpdf( action="extractimage", source=src, destination=ufolder, format="jpg");
	
			var imgDir = "";
			cfdirectory(action="list" ,directory=ufolder ,name="imgDir",filter="*.jpg");
			
			if( imgDir.recordCount > 0 ){
				for( var file in imgDir){
					try {
                    	var fullNameAndPath = file.Directory & "\" & File.Name;
						var img = "";
						cfimage(action="read", name="img", source=fullNameAndPath);
						var buff = ImageGetBufferedImage( img );
						//prepare the image for decoding
						var source = createobject("java","com.google.zxing.client.j2se.BufferedImageLuminanceSource").init( buff );
						var binarizer = createobject("java","com.google.zxing.common.GlobalHistogramBinarizer").init( source );
						var bitmap = createobject("java","com.google.zxing.BinaryBitmap").init( binarizer );
						var reader = createobject("java","com.google.zxing.qrcode.QRCodeReader").init();
						
						//decode the barcode
						var decodedResult = reader.decode( bitmap, javacast("null", ""));
						if( len(decodedResult.getText()) && isJSON( decodedResult.getText() ) ){
							var barcodeData = deserializeJSON( decodedResult.getText() );
							var workflowFile = expandPath('../Admin/workflow/#barcodeData.WF#/#barcodeData.TN#.pdf');
							if( fileExists( workflowFile ) ){
								fileMove( src,workflowFile );
								var xmp_src = expandpath('../../xmp/#barcodeData.TN#.xmp');
								var nextWorkflowID = barcodeData.WF + 10;
								var nextWorkflowDir = expandPath('../Admin/workflow') & '/' & nextWorkflowID;
								var dest = nextWorkflowDir & '/' & barcodeData.TN & '.pdf';
								if( !directoryExists( nextWorkflowDir ) )
									directoryCreate(nextWorkflowDir);
								
								
								cfpdf(
									action="import",
								 	type="metadata",
								 	importfrom=xmp_src,
								 	source=workflowFile,
								 	destination=dest,
								 	overwrite="yes" );
 	
							}
						} else {
							//throw('Error Invalid json format from barcode result.');
							writelog(file="SmartPDF", application="yes" , text='Error Invalid json format from barcode result.');
						}
                    } catch(Any e) {
                    	continue;
                    }
				}
				
				try {
					thread action="run" name="deleteDir" priority="LOW" folder=ufolder{
						try {
	                    	DirectoryDelete( folder, true );
	                    } catch(Any e) {
							writelog(file="SmartPDF", application="yes" , text=e.message);
	                    }
					}
	            } catch(Any e) {
	            	writelog(file="SmartPDF", application="yes" , text="Error unable to run  delete director thread #ufolder#.");
	            }

				return barcodeData;
						
			
			}else{
				return {};
			}		
			
		}
}