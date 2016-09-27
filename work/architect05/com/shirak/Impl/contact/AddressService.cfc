component  output="false"
{
	import conference.repository.DAL.ContactDAL;
	
	public AddressService function init(){
		this.contactTranslator = new ContactTranslator();
		variables.contactDAL = new ContactDAL( this );
		return this;
	}
	
	package ContactAddress[] function getPersonAddress( required numeric personID ){
		
		try
        {
        	var str = variables.contactDAL.getPersonAddress( arguments.personID );
        	var result = this.contactTranslator.toArrayOfContactAddress( str );
			return result;
        }
        catch(Any e)
        {
        	var error = new conference.services.Error();
        	error.Message = e.message;
        	error.Code = e.ErrorCode;
        	error.AllowToContinue = false;
        	errors = [];
        	errors.append(error);
        	contactAddress = new ContactAddress();
        	contactAddress.errors = errors;
        	var contactAddresses = [];
        	contactAddresses.append( contactAddress );
        	return contactAddresses;
        }

	}
}