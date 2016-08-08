component  output="false"
{
	property name="injection" type="struct";
	
	public Config function init(){
		
		this.injection = {};
		this.injection.locations = [];
		var dependency = {};
		dependency.id = "DAL";
		dependency.map = "conference.repository.DAL";				
		this.injection.locations.append(dependency);
		
		dependency = {};
		dependency.id = "TRNS";
		dependency.map = "conference.translators";
		this.injection.locations.append(dependency);
		
		dependency = {};
		dependency.id = "REP";
		dependency.map = "conference.repository.AutoGenerated";
		this.injection.locations.append(dependency);
		
		return this;
	}
	
	public string function getPathByKey(string key){
		
		var location = "";		
		if( isArray( this.injection.locations ) && arraylen( this.injection.locations ) > 0 )
		{
			for( location in this.injection.locations )
			{
				if( location.id == key )
				{
					return location.map;
				} 
			}
		} else {
			return "";
		}			
	}
	
	public struct function getEnvironmentSettings(){
		var settings = {};		
		settings.email = {};
		settings.serverName = CGI.SERVER_NAME;
		var env = left( CGI.SERVER_NAME, 3 );
		switch( env ){
			case 'loc':
			case '127':{
				settings.email.errorTo = '';
				settings.email.errorFrom = '';
				settings.environment = "local";
				settings.isHttps = false;
				settings.dsnName = "";				
				break;
			}		
			
			case 'dev':	{
				settings.email.errorTo = '';
				settings.email.errorFrom = '';
				settings.environment = "Development";
				settings.isHttps = false;
				settings.dsnName = "";
				break;
			}
			
			case 'QA-':
			case 'QA':	{
				settings.email.errorTo = '';
				settings.email.errorFrom = '';
				settings.environment = "QA";
				settings.isHttps = false;
				settings.dsnName = "";
				break;
			}
			
			case 'res':	{
				settings.email.errorTo = '';
				settings.email.errorFrom = '';
				settings.environment = "Research";
				settings.isHttps = false;
				settings.dsnName = "";
				break;
			}
			
			case 'stg':	{
				settings.email.errorTo = '';
				settings.email.errorFrom = '';
				settings.environment = "Staging";
				settings.isHttps = true;
				settings.dsnName = "";	
				break;
			}
			
			case 'pro':	{
				settings.email.errorTo = '';
				settings.email.errorFrom = '';
				settings.environment = "Production";
				settings.isHttps = true;
				settings.dsnName = "";
				break;
			}
			
			
			default:
				throw( message="Server environment #env# is not defined in your config file - #CGI.SERVER_NAME# - #left( CGI.SERVER_NAME, 3 )#");

		}
		return settings;
	}
}