component output="false"
{
	import conference.Impl.BusinessEntities.Address;
	
	public AddressService function init(){
		this.translator = new Translator(); 
		variables.repository = new Repository(); 
		return this;
	}
	
	package Address[] function getPersonAddress( required numeric personID ){		
    	var arrayOfAddress = [];
    	var queryResult = variables.repository.getPersonAddress( arguments.personID );
    	var arrayOfAddress = this.translator.toArrayOfAddress( queryResult );
		return arrayOfAddress;
    
	}
}