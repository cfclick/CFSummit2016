
component  output="false"
{
	import conference.Impl.contact.*;
	
	public Gateway function init(){
		variables.service = new Service();
		return this;
	}
	
	public Address[] function getPersonAddress( required numeric personID ){	
		return service.addressService.getPersonAddress( arguments.personID );
	}
	
	public Person function getPerson( required numeric personID ){	
		return service.personService.getPerson( arguments.personID );
	}
	
	public Person[] function listParticipant( ){
		return service.personService.getAll();	
	}

}