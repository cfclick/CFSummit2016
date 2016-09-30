component extends="conference.Impl.BaseDAL" output="false"
{
	function init(any dependency){
		if( isdefined('arguments.dependency'))
			super.init(arguments.dependency);
		return this;
	}
	
	package struct function login( required string userName, required string password ) {
		var identityQueries = {};
		var un = arguments.userName;
		var pass = arguments.password;
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT * FROM Auth.Login
						  WHERE UserName = '#un#' and  Password = '#pass#'");
		}  
        identityQueries["login"] = qry;   
        
        if( identityQueries["login"].recordcount == 0 )
        	throw( message="Invalid login", ERRORCODE="601");
       
        //PersonLogin Query start **
        var loginID = identityQueries["login"].LoginID[1];
        cfquery( name="qry2", datasource="dsnConference"  ){
			writeOutput( "SELECT * FROM Auth.PersonLogin
						  WHERE LoginID = #loginID#");
		} 
        
        identityQueries["personLogin"] = qry2;
        identityQueries["personID"] = identityQueries["personLogin"].PersonID[1];   
        //PersonLogin Query End **      
   
        
        //LoginRole Query start **
        cfquery( name="qry3", datasource="dsnConference"  ){
			writeOutput( "SELECT r.RoleID, r.Name, lr.loginID FROM Auth.LoginRole lr inner join Definition.Role r on lr.roleID = r.roleID
						  WHERE LoginID = #loginID#");
		} 

        identityQueries["LoginRole"] = qry3;    
        //LoginRole Query End **

        return identityQueries;
	}
	
	package query function listRoles() {
		var qry = "";
		
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT * FROM Definition.Role");
		} 
		
		return qry;
	}
}