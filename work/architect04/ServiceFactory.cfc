component  output="false"
{
	import conference.Interfaces.*;
	import conference.Services.*;
	
	public ServiceFactory function init(){
		return this;
	}
	
	public IParticipantService function getParticipantService(){
		return new ParticipantService();
	}
	
	public ILectureService function getLectureService(){
		return new LectureService();
	}
}