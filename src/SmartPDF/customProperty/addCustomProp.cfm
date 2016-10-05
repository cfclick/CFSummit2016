<cfscript>
	//File to use as source for custom property
	if( isdefined( 'URL.src') ){		
		src = expandpath( URL.src );
		if( !fileExists( src ) )
			throw(message="file #src# does not exist");
	}else{
		src = expandpath('foxnews.pdf');
	}
	
	
	//File to save to the result of adding custom properties
	dest = expandpath( "foxnews_with_custom_properties.pdf");
	
	if( !fileExists( src ))
		throw( message="Crerate PDF file first from step 1");
		
	
	//Prepare destination file to write to
	fileOutputStream = CreateObject("java", "java.io.FileOutputStream").init( dest );
	//Read the source
	reader = createobject("java","com.lowagie.text.pdf.PdfReader").init( src );
	//Initialize the stamper
    stamper = createobject("java","com.lowagie.text.pdf.PdfStamper").init( reader, fileOutputStream);
    //Read source file   
    info = reader.getInfo();
    //Create custom property (tracking number )
    info.put("TrackingNumber", CreateUUID());
  
    //Pushing data 
    
    info.put("Subject", "Hello World with changed metadata");
    info.put("SortOder", "9");
    stamper.setMoreInfo(info);
    stamper.close();  
   
    reader = createobject("java","com.lowagie.text.pdf.PdfReader").init( dest );
    info = reader.getInfo();
    writeDump(info);
    reader.close();
</cfscript>	


