component extends="conference.Impl.BaseService" output="false"
{
	public RoleService function init(){
		this.translator = new Translator();
		variables.repository = new Repository( this );
		return this;
	}
	
	package Role[] function listRoles(){
		var arrayOfRole = [];
		try
        {
        	var queryResult = variables.repository.listRoles();
			arrayOfRole = this.translator.toArrayOfRole( queryResult );
			return arrayOfRole;
        }
        catch(Any e)
        {
        	suppressError( e, false, true );
        	return [];
        }

	}
}