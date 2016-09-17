<h4>Service Factory Oriented Architect</h4>
<cfscript>
	factory = new Conference.ServiceFactory();
	// Service Factory instance
	writeDump(var=factory,label='Service Factory');
	
	// ParticipantService instance
	participantService = factory.GetParticipantService();
	writeDump(participantService.GETPARTICIPANT(2));
	
	// LectureService instance
	lectureService = factory.GetLectureService();
	writeDump(lectureService.GetLecture( 1 ));
	 
</cfscript>
