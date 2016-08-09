component extends="conference.services.BaseService" output="false" 
{
	import conference.repository.DAL.AuthDAL;
	
	public LoginService function init(){
		this.authTranslator = new AuthTranslator();
		variables.authDAL = new AuthDAL( this );
		return this;
	}
	
	package Identity function Login( required string userName, required string password ){
		
		try
        {
        	var str = variables.authDAL.login( arguments.userName, arguments.password );
			return this.authTranslator.toIdentity( str );
        }
        catch(Any e)
        {
        	var error = new conference.services.Error();
        	error.Message = e.message;
        	error.Code = e.ErrorCode;
        	error.AllowToContinue = false;
        	errors = [];
        	errors.append(error);
        	identity = new Identity();
        	identity.errors = errors;
        	return identity;
        }

	}
	
	package string function getEnvironment(){
		return getConfig().getEnvironmentSettings().environment;
	}
}