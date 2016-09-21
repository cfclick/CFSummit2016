interface displayname="IParticipant"
{
	import conference.BusinessEntities.Participants;
	
	Participant[] function listParticipants();
	Participant function getParticipant( required numeric personID );
}