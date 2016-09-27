<h4>Architect05 Auth package test</h4>
<cfscript>

	gate = new conference.Impl.contact.ContactGateway();
	writeOutput("<h4>List Participants</h4>");
	writeDump(gate.listParticipant());
	
	writeOutput("<h4>Get Person by ID</h4>");
	writeDump(gate.getPerson(2));
	
	writeOutput("<h4>Get Person Address by person ID</h4>");
	writeDump(gate.getPersonAddress(2));
	
	/* You cant access data by going directly to service */
	/*
	service = new conference.Impl.contact.ContactDAL();
	writedump(service);
	result = service.personDAO.getAll(2);
	writeDump(result);
	*/
</cfscript>
