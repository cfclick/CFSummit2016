
component extends="conference.Impl.BaseService" output="false"
{	
	public Service function init(){	
		this.RoleService = new RoleService();
		this.LoginService = new LoginService();
		variables.repository = new Repository();
		variables.translator = new Translator();
		return this;
	}
	
}