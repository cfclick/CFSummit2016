component extends="conference.Impl.BaseService" output="false" 
{
	public LoginService function init(){
		this.translator = new Translator(); 
		variables.repository = new Repository(); 
		//this.authTranslator = new AuthTranslator();
		//variables.authDAL = new AuthDAL( this );
		return this;
	}
	
	package Identity function Login( required string userName, required string password ){
		
		try
        {
        	var str = variables.repository.login( arguments.userName, arguments.password );
			return this.translator.toIdentity( str );
        }
        catch(Any e)
        {
        	var error = new conference.Impl.BusinessEntities.Error();
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