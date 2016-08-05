component extends="BaseService" output="false"
{
	import conference.BusinessEntities.Participant;
	
	public ParticipantService function init(){
		variables.dal = new conference.repository.dal.ParticipantDAL();
		return this;
	}
	
	public Participant[] function listParticipants(){
		var participants = [];
		participants = dal.listParticipants();
		return participants;
	}
	
	public Participant function getParticipants( required numeric id ){
		var participant = new Participant();
		participant.person = new Person();
		participant.person.personID = arguments.id;
		participant.person.firstName = "Shirak";
		participant.person.lastName = "Avakian";
		return participant;
	}
}