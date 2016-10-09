component extends="conference.Impl.BaseService" output="false"
{
	//import conference.impl.contact.ContactDAL;
	import conference.BusinessEntities.Person;
	
	public ContactGateway function init(){
		return this;
	}
	
	private AddressService function getAddressService(){
		if( isNull(variables.addressService) )
			variables.addressService = new AddressService();
		
		return variables.addressService;
	}
	private PersonService function getPersonService(){
		if( isNull(variables.personService) )
			variables.personService = new PersonService();
		
		return variables.personService;
	}
	
	public Address[] function getPersonAddress( required numeric personID ){	
		return getAddressService().getPersonAddress( arguments.personID );
	}
	
	public Person function getPerson( required numeric personID ){	
		return getPersonService().getPerson( arguments.personID );
	}
	
	public Person[] function listParticipant( ){
		return getPersonService().getAll();	
	}

}