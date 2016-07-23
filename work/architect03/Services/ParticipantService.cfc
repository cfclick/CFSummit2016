component extends="BaseService" output="false"
{
	import conference.BusinessEntities.Participants;
	
	public ParticipantService function init(){
		return this;
	}
	
	package Participant[] function listParticipants(){
		var participant = new Participants();
		var participants = [];
		participants.append(participant);
		return participants;
	}
}