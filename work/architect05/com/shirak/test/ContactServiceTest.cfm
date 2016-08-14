<cfscript>
	s = new conference.services.contact.ContactGateway();
	//writeDump(s.getPersonAddress(2));
	
	writeDump(s.getPerson(2));
</cfscript>
