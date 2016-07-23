component extends="conference.Injector" output="false"
{
	public void function init(){
	}
	
	
	
	public any function getConfig(){
		if( !isdefined("variables.config") || isSimpleValue( variables.config ) )
			variables.config = new CFSummit2016.work.architect03.Config();
		
		return variables.config;
	}
	
	public void function suppressError( any Exception,boolean sendEmail=true, boolean logIt=true, any object ){
		var except = arguments.Exception;
		var app_setting = getConfig().getEnvironmentSettings();
		if( arguments.sendEmail ){
			var mailerService = new mail();    
			mailerService.setTo(  app_setting.email.errorto );  
			mailerService.setFrom( app_setting.email.errorFrom );                    
	        var subject =  'Services -Error-' & left(except.message,50) & '-' & app_setting.environment;          
	        mailerService.setSubject( subject );                 
	        mailerService.setType("html");                 
	        savecontent variable="mailBody" {                 
	                           writeDump(except);
	                           writeDump(app_setting);
	                           if( isdefined("arguments.object"))
	                           		writeDump( arguments.object );
	                        }                             
	        mailerService.send(body=mailBody);
		}
		
		if( arguments.logIt ){
			writelog( text=except.message & "-::::-" & except.detail, application="yes", file="Error_log"  );
		}	
	}
}