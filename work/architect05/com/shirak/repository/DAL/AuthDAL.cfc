component extends="BaseDAL" output="false"
{
	function init(any dependency){
		super.init(arguments.dependency);
		return this;
	}
	
	public struct function login( required string userName, required string password ) {
		var identityQueries = {};
		var dsn = "dsnConference";
		var q1 = new query();         
         /* set properties using implict setters */         
        q1.setDatasource( dsn );         
        
        //Login Query start **
       // q1.setName("login_qry");                  
        /* Add sql queryparams using named and positional notation */         
        q1.addParam(name="userName",value=arguments.userName,cfsqltype="VARCHAR");  
        q1.addParam(name="password",value=arguments.password,cfsqltype="VARCHAR");          
        /* Add sql statement */        
        var sqlSelect = "SELECT * FROM Auth.Login";            
        var sqlWhere = "WHERE UserName = :userName and  Password = :password";                
        var sql = sqlSelect & " " & sqlWhere ;        
        /* invoke execute() on the query object to execute the query and return a component with properties result and prefix (which can be accessed as implcit getters) */         
        var result = q1.execute(sql=sql);         
        identityQueries["login"] = result.getResult();   
        //Login Query End **
        
        if( identityQueries["login"].recordcount == 0 )
        	throw( message="Invalid login", ERRORCODE="601");
       
        //PersonLogin Query start **
        var q2 = new query();         
         /* set properties using implict setters */         
        q2.setDatasource( dsn );    
        var loginID = identityQueries["login"].LoginID[1];
        q2.addParam(name="loginID",value=loginID,cfsqltype="INTEGER");  
        var sqlSelect2 = "SELECT * FROM Auth.PersonLogin";            
        var sqlWhere2 = "WHERE LoginID = :loginID";                
        var sql2 = sqlSelect2 & " " & sqlWhere2 ;        
        /* invoke execute() on the query object to execute the query and return a component with properties result and prefix (which can be accessed as implcit getters) */         
        var result2 = q2.execute(sql=sql2);         
        identityQueries["personLogin"] = result2.getResult();
        identityQueries["personID"] = identityQueries["personLogin"].PersonID[1];   
        //PersonLogin Query End **      
   
        
        //LoginRole Query start **
        var q4 = new query();         
        /* set properties using implict setters */         
        q4.setDatasource( dsn );    
        q4.addParam(name="loginID",value=loginID,cfsqltype="INTEGER");  
        var sqlSelect4 = "SELECT r.RoleID, r.Name, lr.loginID FROM Auth.LoginRole lr inner join Definition.Role r on lr.roleID = r.roleID";            
        var sqlWhere4 = "WHERE LoginID = :loginID";                
        var sql4 = sqlSelect4 & " " & sqlWhere4 ;        
        /* invoke execute() on the query object to execute the query and return a component with properties result and prefix (which can be accessed as implcit getters) */         
        var result4 = q4.execute(sql=sql4);         
        identityQueries["LoginRole"] = result4.getResult();    
        //LoginRole Query End **

        return identityQueries;
	}
}