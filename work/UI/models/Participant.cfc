/**
* I am a new Model Object
*/
component singleton{
	
	import conference.Impl.contact.Gateway;
	
	Participant function init(){
		variables.contactGateway = new Gateway();
		return this;
	}
	
	public any function listParticipants(){
		
		var arrayOfParticipant = contactGateway.listParticipant();
		return arrayOfParticipant;
	}
	
	public any function listParticipantsWithRest(){
		
		cfhttp( method="get" ,url="http://#CGI.Server_NAME#:#CGI.SERVER_PORT#/rest/api/Contact/participant.json", result='participants');
		return deserializeJSON( participants.Filecontent );
		//writeDump(participants);abort;
	}
	
}
