
component output="false"
{
	public BaseRepository function init(){
		
		if( isNull( application.config ) ){
			application.config = new Conference.Config();
			application.settings = application.config.getEnvironmentSettings();
		}
		return this;
	}
	
	public string function getDataSource( required string key ){
		if( isNull( application.settings ) ) init();

		var dsnKey = trim( arguments.key );
		if( len( dsnKey ) > 1 ){			
			if( structkeyExists(application.settings.dsn,dsnKey) )
				return application.settings.dsn[dsnKey];
			else
				throw(message="Datasource is not defined");		
		}
		
	}
}