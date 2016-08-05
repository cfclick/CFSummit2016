<cfscript>
	service = new conference.services.ParticipantService();
	writeDump(service.listParticipants()); 
</cfscript>
