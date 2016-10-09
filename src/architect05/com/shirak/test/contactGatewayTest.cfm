<cfscript>
	gate = new conference.Impl.contact.Gateway();
	writedump(gate.GetPerson(2));
	writedump(gate.listParticipant());	
	writedump(gate.getPersonAddress( 2 ));	
</cfscript>
