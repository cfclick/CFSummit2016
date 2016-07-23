<cfscript>
	dal = new CFSummit2016.work.architect03.repository.dal.ParticipantDAL();
	writeDump(dal.listParticipants()); 
</cfscript>
