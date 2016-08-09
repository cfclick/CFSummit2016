<cfscript>
	s = new conference.services.auth.AuthService();
	writeDump(s.getEnvironment());
	
	writedump(s.login('shirak','123'));	
	
	writedump(s.login('shirak','1203'));	
</cfscript>
