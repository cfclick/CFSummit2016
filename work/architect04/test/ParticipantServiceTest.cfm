<cfscript>
	service = new conference.services.ParticipantService();
	writedump(service.listParticipants());	
	writedump(service.getParticipant(2));	
		
</cfscript>
