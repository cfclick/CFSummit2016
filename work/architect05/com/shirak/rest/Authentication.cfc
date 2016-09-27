component displayname="Authentication" output="false" rest="true" restpath="/Auth"
{
	remote any function validateIdentity(string userName restArgSource="path", string token restArgSource="path") httpmethod="GET" restpath="/Login/{userName}/{token}"  produces="application/json" {
		
		var identity = new conference.Impl.auth.Identity();
		var gate = new conference.Impl.auth.authGateway();
		identity = gate.login( arguments.userName, 123 );
		
		return identity;
	}
}