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
		
		var arrayOfParticipant = contactGateway.listParticipant();
		return arrayOfParticipant;
	}
	
	public any function listParticipantsWithRest(){
		
		cfhttp( method="get" ,url="http://localhost/rest/api/Contact/participant.json", result='participants');
		return deserializeJSON( participants.Filecontent );
		//writeDump(participants);abort;
	}
	
}
