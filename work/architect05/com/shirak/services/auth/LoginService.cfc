component extends="conference.services.BaseService" output="false"
{
	
	public LoginService function init(){
		this.authTranslator = new AuthTranslator();
	}
	
	package Identity function Login( required string userName, required string password ){
		
	}
	
	
}