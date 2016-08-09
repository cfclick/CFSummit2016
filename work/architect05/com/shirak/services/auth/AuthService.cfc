component output="false"
{
	import conference.services.auth.*;
	
	public AuthService function init(){
		return this;
	}
	
	private LoginService function getLoginService(){
		return new LoginService();
	}
	
	public Identity function login( required string un, required string pass ){
		return getLoginService().Login( arguments.un,arguments.pass );
	}
	
	public string function getEnvironment(){
		return getLoginService().getEnvironment();
	}
	
}