<cfscript>
dal = new conference.Repository.DAL.PersonDAL();
writedump(dal.getAll());
 writedump(dal.read(2));
</cfscript>
