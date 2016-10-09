component extends="BaseService" output="false"
{
	import conference.BusinessEntities.Participant;
	
	public ParticipantService function init()
	{
		variables.dal = new conference.repository.dal.ParticipantDAL();		
		return this;
	}
	
	public Participant[] function listParticipants()
	{
		var participants = [];
		participants = dal.listParticipants();
		return participants;
	}
	
	public Participant function getParticipant( required numeric personId )
	{
		var participant = new Participant();
		participant = dal.getParticipant( arguments.personId );
		return participant;
	}
}