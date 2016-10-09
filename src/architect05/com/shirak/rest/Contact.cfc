component displayname="Contact" output="false" rest="true" restpath="/Contact"
{
	
	remote any function listAll() httpmethod="get" restpath="/participant" produces="application/json" {
		var contactGateway =  new conference.Impl.contact.Gateway();
		var result = contactGateway.listParticipant();	
		return result;
	}
}