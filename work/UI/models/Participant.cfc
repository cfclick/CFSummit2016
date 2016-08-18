/**
* I am a new Model Object
*/
component singleton{
	
	import conference.services.contact.ContactGateway;
	
	Participant function init(){
		variables.contactGateway = new ContactGateway();
		return this;
	}
	
	public any function listParticipants(){
		//writeDump(contactGateway);abort;
		var arrayOfParticipant = contactGateway.listParticipant();
		return arrayOfParticipant;
	}
	
}
