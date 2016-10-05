
component output="false"
{
	import conference.Impl.auth.*;
	
	public Gateway function init(){
		variables.service = new Service();
		return this;
	}
	
	public Identity function login( required string un, required string pass ){
		return service.LoginService.Login( arguments.un,arguments.pass );
	}
	
	public string function getEnvironment(){
		return service.LoginService.getEnvironment();
	}
	
	public Role[] function listRoles(){
		return service.RoleService.listRoles();
	}
}