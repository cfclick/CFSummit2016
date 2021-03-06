component extends="BaseService" output="false" implements="conference.Interfaces.IParticipantService"   
{
	import conference.BusinessEntities.Participant;
	import conference.Repository.DAL.ParticipantDAL;
	import conference.Repository.AutoGenerated.Person;
	import conference.Repository.AutoGenerated.Conference;
	import conference.Repository.AutoGenerated.Lecture;
		
	function init(){
		variables.participantDAL = new ParticipantDAL();
		return this;
	}
	
	public Participant[] function listParticipants(){
		var participants = [];
		var persons = [];
		var lectures = [];
		
		persons = participantDAL.personDAO.getALL();
		
		for( var person in persons ){
		 	var participant = new Participant();
		 	//Person
		 	participant.person = person;
		 	//End
		 	//Conference
		 	var conference = new Conference();
		 	conference =  participantDAL.conferenceDAO.read( person.getConferenceid() ); 			 	
		 	participant.conference = conference;
		 	//end
		 	//Lectures
		 	var lecture = new Lecture();
		 	lectures = participantDAL.listPersonLectures( person.getPersonID() );
		 	participant.lectures = lectures;
		 	participants.append( participant );
		}
				
		return participants;
	}
	
	public Participant function getParticipant(required numeric personID ){
		var participant = new Participant();
		var person = new Person();
		var lectures = [];
		person = participantDAL.personDAO.getById( arguments.personID );
		//Person
		participant.person = person;
		//End
		//Conference
		var conference = new Conference();
		if( isnumeric( person.getConferenceid() )){
			conference =  participantDAL.conferenceDAO.getById( person.getConferenceid() ); 
		}
					 	
		participant.conference = conference;
		//end
		//Lectures
		var lecture = new Lecture();
		if( isnumeric( person.getPersonID() )){
			lectures = participantDAL.listPersonLectures( person.getPersonID() );
		}
		participant.lectures = lectures;
		
		return participant;
	}
	
}