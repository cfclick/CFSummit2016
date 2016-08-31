<cfscript>
	src = expandPath('../incoming/ABC_Voter_Registration.pdf');
	
	if( fileExists(src ))
		barcode = detectQRBarcode(src);
	
	
		
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
					//if( file.Size < 1800 && file.Size > 1300 ){
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
							//writeDump(decodedResult);abort;
							if( len(decodedResult.getText()) && isJSON( decodedResult.getText() ) ){
								var barcodeData = deserializeJSON( decodedResult.getText() );
								
								/*if( structkeyExists( barcodeData, 'TN' ) && structkeyExists( barcodeData, 'WF' ) ){
									var src = expandPath('workflow/#URL.WF#/#barcodeData.TN#.pdf');
									var json = fileRead( "#customerPath#/workflow.json" );
									var customerWorkflowData = deserializeJSON( json );	
									if( barcodeData.token == customerWorkflowData.token && barcodeData.wID == customerWorkflowData.workflowID ){
										writelog(file="DMS_listener", application="yes" , text="ValidateBarcodeActivity QR barcose validated successfully");
										validBarcode = true;
										break;
									} else {
										writelog(file="DMS_listener", application="yes" , text="Error ValidateBarcodeActivity invalid QR barcose detected");
									}								
								}*/	
							} else {
								throw('Error Invalid json format from barcode result.');
								//writelog(file="DMS_listener", application="yes" , text="Error Invalid json format from barcode result. File:BarcodeService line:63");
							}
	                    } catch(Any e) {
	                    	continue;
	                    }
	
					//}					
				}
				
				try {
					thread action="run" name="deleteDir" priority="LOW" folder=ufolder{
						try {
	                    	DirectoryDelete( folder, true );
	                    } catch(Any e) {
	                    	
	                    	//writelog(file="DMS_listener", application="yes" , text=e.message);
	                    }
	
					}
	            	
	            } catch(Any e) {
	            	//writelog(file="DMS_listener", application="yes" , text="Error unable to run  delete director thread #ufolder#.");
	            }

				return barcodeData;
						
			
			}else{
				return {};
			}		
			
		}
</cfscript>
