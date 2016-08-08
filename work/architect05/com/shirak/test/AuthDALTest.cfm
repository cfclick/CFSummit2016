<cfscript>
	authDAL = new conference.repository.DAL.AuthDAL();
	writedump( authDAL.login('shirak','123') );	
</cfscript>
