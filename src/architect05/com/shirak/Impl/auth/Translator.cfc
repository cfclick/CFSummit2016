
component extends="conference.Impl.BaseTranslator" output="false"
{
	public Translator function init(){
		return this;
	}
	
	public Identity function toIdentity( required struct procResultSet ) {
		var identityStruct = arguments.procResultSet;
		var identity = new Identity();
		
		identity.personID = identityStruct.personID;
		
		for(login in identityStruct.login) {
			identity.login = new Login();
			identity.login.loginID = login.LoginID;
			identity.login.userName = login.userName;
		}
		
		var arrayOfRole = [];
		identity.arrayOfRole = toArrayOfRole( identityStruct.LoginRole );
		/*for( loginRole in identityStruct.LoginRole ) {
			var role = new Role();
			role.roleID = loginRole.roleID;	
			role.name = loginRole.name;	
	
			arrayOfRole.append(role);
		}
		identity.arrayOfRole = arrayOfRole;*/
		return identity;
	}
	
	public Role[] function toArrayOfRole( required query procResultSet ) {
		var roles = arguments.procResultSet;
		var arrayOfRole = [];
		for( var roleRow in roles ) {
			arrayOfRole.append(toRole( roleRow ) );
		}
		return arrayOfRole;
	}
	
	public Role function toRole( required struct queryRow ) {
		var row = arguments.queryRow;
		
		var role = new Role();
		role.roleID = row.roleID;	
		role.name = row.name;	
		role.decription = row.Decription ?: '';	
		if( isdefined("row.Createdby"))
			role.createdby = row.Createdby;	
		if( isdefined("row.Createddatetime"))
			role.createddatetime = row.Createddatetime;
		if( isdefined("row.Updatedby"))	
			role.updatedby = row.Updatedby;	
		if( isdefined("row.Updateddatetime"))
			role.updateddatetime = row.Updateddatetime;
	
			
		return role;
	}
}