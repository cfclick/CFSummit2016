component output="false" 
{	
	import conference.BusinessEntities.Participant;
	
	function init(){
		variables.personDAO = new PersonDAO();
		variables.conferenceDAO = new ConferenceDAO(); 
		variables.lectureDAO = new LectureDAO();
		return  this;
	}
	
	public Participant[] function listParticipants(){
		var participants = [];
		var persons = [];
		var lectures = [];
		persons = personDAO.listALL();
		
		for( var person in persons ){
		 	var participant = new Participant();
		 	//Person
		 	participant.person = person;
		 	//End
		 	//Conference
		 	var conference = new Conference();
		 	conference =  conferenceDAO.getById( person.getConferenceid() ); 			 	
		 	participant.conference = conference;
		 	//end
		 	//Lectures
		 	var lecture = new Lecture();
		 	lectures = lectureDAO.listLecturesByPersonID( person.getPersonID() );
		 	participant.lectures = lectures;
		 	participants.append( participant );
		}
		
		return participants;
	}
	
	
}