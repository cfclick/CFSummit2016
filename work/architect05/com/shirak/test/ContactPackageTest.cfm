<h4>Architect05 Auth package test</h4>
<cfscript>

	gate = new conference.Impl.contact.ContactGateway();
	writeOutput("<h4>List Participants</h4>");
	writeDump(gate.listParticipant());
	
	writeOutput("<h4>Get Person by ID</h4>");
	writeDump(gate.getPerson(2));
	
</cfscript>
