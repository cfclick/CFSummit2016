<h4>Classic Service Oriented Architect</h4>
<cfscript>
	service = new conference.services.ParticipantService();
	writeOutput("<h4>List All Participant</h4>");
	writeDump(service.listParticipants()); 
	writeOutput("<h4>Get Participant by Person ID</h4>");
	writeDump(service.getParticipant(2) ); 
</cfscript>
