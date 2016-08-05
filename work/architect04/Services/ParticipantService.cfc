component extends="BaseService" output="false" implements="conference.Interfaces.IParticipantService"   
{
	import conference.BusinessEntities.Participant;
	import conference.Repository.AutoGenerated.Person;
	
	public ParticipantService function init(){
		return this;
	}
	
	public Participant[] function listParticipants(){
		var participant = new Participant();
		var participants = [];
		participants.append(participant);
		return participants;
	}
	
	public Participant function getParticipant( required numeric id ){
		var participant = new Participant();
		participant.person = new Person();
		participant.person.personID = arguments.id;
		participant.person.firstName = "Shirak";
		participant.person.lastName = "Avakian";
		return participant;
	}
}