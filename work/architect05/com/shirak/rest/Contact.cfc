component displayname="Contact" output="false" rest="true" restpath="/Contact"
{
	remote array function listAll() httpmethod="get" restpath="/participant" produces="application/json" {
		var contactGateway =  new conference.services.contact.ContactGateway();
		var result = contactGateway.listParticipant();
		return result;
	}
}