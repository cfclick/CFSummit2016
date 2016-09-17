<h4>Classic Service Oriented Architect</h4>
<cfscript>
	service = new conference.services.ParticipantService();
	writeDump(service.listParticipants()); 
</cfscript>
