/*
********************************************************************************
Author      	:	Shirak Avakian
Email       	:	Shirak.Avakian@Qbillc.com
Company  	: 	QBI LLC
Date        	:	@{Date}
Component Name  : 	service.cfc
Description :
	A description about this page
********************************************************************************
*/
component  output="false"
{
	
	public function init()
	{
		return this;
	}
	
	public function onAdd(struct cfEvent)
	{
		//define PDF File Info
		try
        {
        	var fd = {};
			fd = arguments.cfEvent.data;
			writelog(file="SmartPDF", application="yes" , text="ACTION: #fd.type#;FILE: #fd.filename#; TIME: #timeFormat(fd.lastmodified)#");
			var dir = getDirectoryFromPath(fd.filename);
			//if( fileExists( fd.filename ) ){
				var fileInfo = getFileInfo(fd.filename);
				service = new CFSummit2016.work.SmartPDF.VoteRegistration.service.Barcode();
				
				service.detectQRBarcode( fd.filename );					
			//}
        }
        catch(Any e)
        {
        	writelog(file="SmartPDF", application="No" , text="Error: directory watcher onAdd() #e.message#");
        	throw(object=e);
        }

			
	}
	
	public function onDelete( struct cfEvent )
	{
		//var data = arguments.cfEvent.data;
		return cfEvent;
	}
	
	public function onChange( struct cfEvent )
	{
		//var data = arguments.cfEvent.data;
		return cfEvent;
	}
}