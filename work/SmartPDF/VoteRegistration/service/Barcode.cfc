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
			try
            {
            	var src = arguments.pdfSource;
				//var data =  arguments.collection;
				var ufolder = getTempDirectory() & createUUID();
				
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
								var workflowDir = expandPath('VoteRegistration/Admin/workflow/#barcodeData.WF#/');
								
								if( !directoryExists( workflowDir ) ){
									directoryCreate(workflowDir);
								}
									try
                                    {
                                    	if( fileExists(src)){
                                    		filemove( src,workflowDir );
                                    		writelog(file="SmartPDF", application="yes" , text="#workflowDir#");
                                    	}
                                    	
                                    }
                                    catch(Any e)
                                    {
                                    	writelog(file="SmartPDF", application="yes" , text="#e.message#-#e.detail#");
                                    	throw(e);
                                    	break;
                                    }

									var xmp_src = expandpath('../../xmp/#barcodeData.TN#.xmp');
									writelog(file="SmartPDF", application="yes" , text="#xmp_src#");
									var nextWorkflowID = barcodeData.WF + 10;
									writelog(file="SmartPDF", application="yes" , text="#nextWorkflowID#");
									var nextWorkflowDir = expandPath('VoteRegistration/Admin/workflow') & '\' & nextWorkflowID;
									writelog(file="SmartPDF", application="yes" , text="#nextWorkflowDir#");
									var dest = nextWorkflowDir & '\' & barcodeData.TN & '.pdf';
									writelog(file="SmartPDF", application="yes" , text="#dest#");
									if( !directoryExists( nextWorkflowDir ) )
										directoryCreate(nextWorkflowDir);
									
									var workflowFile = workflowDir & '\' & barcodeData.TN & '.pdf';
									cfpdf(
										action="import",
									 	type="metadata",
									 	importfrom=xmp_src,
									 	source=workflowFile,
									 	destination=dest,
									 	overwrite="yes" );
	 								break;
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
            catch(Any e)
            {
            	writelog(file="SmartPDF", application="yes" , text="Error: #e.message#");
            }

			
		}
}