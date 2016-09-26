component output="false"
{
	import conference.services.auth.*;
	
	public AuthGateway function init(){
		return this;
	}
	
	private LoginService function getLoginService(){
		//You can cache loginservice
		if( isNull(variables.loginService) )
			variables.loginService = new LoginService();
		
		return variables.loginService;
	}
	
	private RoleService function getRoleService(){
		//You can cache loginservice
		if( isNull(variables.roleService) )
			variables.roleService = new RoleService();
		
		return variables.roleService;
	}
	
	public Identity function login( required string un, required string pass ){
		return getLoginService().Login( arguments.un,arguments.pass );
	}
	
	public string function getEnvironment(){
		return getLoginService().getEnvironment();
	}
	
	public Role[] function listRoles(){
		return getRoleService().listRoles();
	}
}