<h4>Service Factory Oriented Architect</h4>
<cfscript>
	factory = new Conference.ServiceFactory();
	// Service Factory instance
	writeDump(var=factory,label='Service Factory');
	
	// ParticipantService instance	
	participantService = factory.GetParticipantService();
	writeOutput("<h4>Get Participant by person ID </h4>");
	writeDump(participantService.getParticipant(2));
	
	// LectureService instance
	lectureService = factory.GetLectureService();
	writeOutput("<h4>Get Lecture by lecture ID </h4>");
	writeDump(lectureService.GetLecture( 1 ));
	 
</cfscript>
