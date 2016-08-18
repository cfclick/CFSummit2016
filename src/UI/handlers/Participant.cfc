/**
* I am a new handler
*/
component{
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";		
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};
	
	
		
	function index(event,rc,prc){
		var model = getModel('Participant');
		rc.participants = model.listParticipants();
		rc.participantREST = model.listParticipantsWithRest();
		event.setView("Participant/index");
	}	
	
}
