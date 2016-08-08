component  output="false"
{
	function init(){
		
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
        var identityQueries["login"] = result.getResult();   
        //Login Query End **
        
        
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
        var identityQueries["personLogin"] = result2.getResult();  
        //PersonLogin Query End **      
        
        
        //Person Query start **
        var q3 = new query();         
        /* set properties using implict setters */         
        q3.setDatasource( dsn );    
        var personID = identityQueries["personLogin"].PersonID[1];
        q3.addParam(name="personID",value=personID,cfsqltype="INTEGER");  
        var sqlSelect3 = "SELECT * FROM Contact.Person";            
        var sqlWhere3 = "WHERE PersonID = :personID";                
        var sql3 = sqlSelect3 & " " & sqlWhere3 ;        
        /* invoke execute() on the query object to execute the query and return a component with properties result and prefix (which can be accessed as implcit getters) */         
        var result3 = q3.execute(sql=sql3);         
        var identityQueries["person"] = result3.getResult();  
        //Person Query End **
        
        
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
        var identityQueries["LoginRole"] = result4.getResult();    
        //LoginRole Query End **
        
        
        
        return identityQueries;
	}
}