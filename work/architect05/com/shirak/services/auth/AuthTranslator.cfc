component  output="false"
{
	//DI to inject another translator
	//property name="customerTranslator" inject="TRNS:CustomerTranslator";
	
	import conference.repository.autogenerated.Login;
	import conference.repository.autogenerated.Role;
	
	public AuthTranslator function init() {
		return this;
	}
	
	
	public Identity function toIdentity( required query procResultSet ) {
		var identityStruct = arguments.procResultSet;
		var identity = new Identity();
		
		for(login in identityStruct.login) {
			identity.login = new Login();
			identity.login.loginID = login.LoginID[1];
			identity.login.userName = login.userName[1];
		}
		
		for(person in identityStruct.person) {
			identity.person = new Person();
			identity.person.personID = person.personID[1];
			identity.person.firstName = person.firstName[1];
			identity.person.lastName = person.lastName[1];
		}
		
		var arrayOfRole = [];
		for( loginRole in identityStruct.LoginRole ) {
			var role = new Role();
			role.roleID = loginRole.roleID;	
			arrayOfRole.append(role);
		}
		identity.arrayOfRole = arrayOfRole;
		return identity;
	}
}