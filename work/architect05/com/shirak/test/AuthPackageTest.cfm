<h4>Architect05 Auth package test</h4>
<cfscript>
	gate = new conference.Impl.auth.AuthGateway();
	writeOutput("<h4>Get environment</h4>");
	writeDump(gate.getEnvironment());
	
	writeOutput("<h4>List Roles</h4>");
	writedump(gate.listRoles());	
	
	writeOutput("<h4>Valid Login</h4>");
	writedump(gate.login('shirak','123'));	
	
	writeOutput("<h4>InValid Login</h4>");
	writedump(gate.login('shirak','1203'));	
	
	
</cfscript>
