<cfscript>
	//File to use as source for custom property
		
	src = expandpath('../../lib/Voter_Registration.pdf');
	if( !fileExists( src ) )
		
		throw(message="file #src# does not exist");
	else{
		cfpdf( action="read" ,name="pdfReader" ,source=src  );
	}

	//writeDump(pdfReader);abort;
	//File to save to the result of adding custom properties
	dest = expandpath( "definedPDFs/ABC_Voter_Registration.pdf");
	
	//Prepare destination file to write to
	fileOutputStream = CreateObject("java", "java.io.FileOutputStream").init( dest );
	//Read the source
	reader = createobject("java","com.lowagie.text.pdf.PdfReader").init( src );
	//Initialize the stamper
    stamper = createobject("java","com.lowagie.text.pdf.PdfStamper").init( reader, fileOutputStream);
    //Read source file   
    info = reader.getInfo();
    //Create custom property (tracking number )
    info.put("TrackingNumber", URL.TN );
    info.put("WorkflowID", URL.WF );
  
    //Pushing data 
   	//info.put("Title", "Hello World stamped");
  	//info.put("Subject", "Hello World with changed metadata");
  	//info.put("SortOder", "9");
    stamper.setMoreInfo(info);
    stamper.close();  
    reader.close();
   
    reader = createobject("java","com.lowagie.text.pdf.PdfReader").init( dest );
    info = reader.getInfo();
    writeDump(info);
    reader.close();
   /* sleep(500);
    cfpdf( action="getinfo" ,name="info" ,source=dest  );
    writeDump(info);*/
</cfscript>	
<cfoutput>
	<h3>Custom properties created and saved to #dest#</h3>
	
	<h3>Export Metadata</h3>
		
	<p>export file name: #URL.TN#.xmp</p>
	
	<p>Export file location #expandPath('../../xmp')#</p>
	
	
	<a href="export_metadata.cfm?TN=#URL.TN#&WF=#URL.WF#" target="_self">Export Metadata</a>
	
</cfoutput>

