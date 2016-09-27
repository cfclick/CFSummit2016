component  output="false"
{
	import conference.repository.DAL.ContactDAL;
	
	public AddressService function init(){
		this.contactTranslator = new ContactTranslator();
		variables.contactDAL = new ContactDAL( this );
		return this;
	}
	
	package Address[] function getPersonAddress( required numeric personID ){
		
		/*try
        {*/
        	var arrayOfAddress = [];
        	var queryResult = variables.contactDAL.getPersonAddress( arguments.personID );
        	var arrayOfAddress = this.contactTranslator.toArrayOfAddress( queryResult );
			return arrayOfAddress;
      /*  }
        catch(Any e)
        {
        	throw(e);
        }*/

	}
}