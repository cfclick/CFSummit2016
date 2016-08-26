<cfscript>
	//Step 1 
	//cfhtmltopdf (source="http://www.foxnews.com/", destination="foxnews.pdf", overwrite="true", orientation="landscape");abort;
	
	//Step 2
	//File to use as source for custom property
	src = "C:\inetpub\wwwroot\TestProject\extractText\foxnews.pdf";
	//File to save to the result of adding custom properties
	dest = "C:\inetpub\wwwroot\TestProject\extractText\foxnews_custom_property.pdf";
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
    info.put("Title", "Hello World stamped");
    info.put("Subject", "Hello World with changed metadata");
    info.put("SortOder", "9");
    stamper.setMoreInfo(info);
    stamper.close();  
   
    reader = createobject("java","com.lowagie.text.pdf.PdfReader").init( dest );
    info = reader.getInfo();
    writeDump(info);
    reader.close();
</cfscript>	


