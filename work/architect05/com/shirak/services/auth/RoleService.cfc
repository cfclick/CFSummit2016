component extends="conference.services.BaseService" output="false"
{
	public RoleService function init(){
		this.authTranslator = new AuthTranslator();
		variables.authDAL = new AuthDAL( this );
		return this;
	}
	
	package Role[] function listRoles(){
		var arrayOfRole = [];
		try
        {
        	var queryResult = variables.authDAL.listRoles();
			arrayOfRole = this.authTranslator.toArrayOfRole( queryResult );
			return arrayOfRole;
        }
        catch(Any e)
        {
        	suppressError( e, false, true );
        	return [];
        }

	}
}