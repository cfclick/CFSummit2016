<cfscript>
dal = new Conference.Repository.DAL.ParticipantDAL();
	// Service Factory instance
	writeDump(var=dal,label='Participant DAL');	
	
	writeDump(dal.listPersonLectures(2));
</cfscript>
