component extends="BaseDAL" output="false"
{
	function init(any dependency){
		super.init(arguments.dependency);
		
		return this;
	}
	
	public struct function getPerson( required numeric personID ){
		
	}
	
	public struct function getAddress( required numeric addressID ){
		
	}
	
	public struct function getPersonAddress( required numeric personID ){
		var personID = arguments.personID;
		//Person Query start **
        var person_qry = new query();         
        /* set properties using implict setters */         
        person_qry.setDatasource( dsn );    
       
        person_qry.addParam(name="personID",value=personID,cfsqltype="INTEGER");  
        var sqlSelect = "SELECT pa.PersonAddressID, pa.PersonID,t.AddressTypeID,a.* 
        				FROM Map.PersonAddress pa 
        				INNER JOIN Contact.[Address] a on pa.AddressID = a.AddressID
						INNER JOIN [Definition].[AddressType] t on a.AddressTypeID = t.AddressTypeID";            
        var sqlWhere = "WHERE pa.PersonID = :personID";                
        var sql = sqlSelect & " " & sqlWhere ;        
        /* invoke execute() on the query object to execute the query and return a component with properties result and prefix (which can be accessed as implcit getters) */         
        var result = person_qry.execute(sql=sql);         
        return result.getResult();  
        //Person Query End **
	}
	
	public struct function getContactInfo( required numeric personID ){
		
		var personID = arguments.personID;
		//Person Query start **
        var person_qry = new query();         
        /* set properties using implict setters */         
        person_qry.setDatasource( dsn );    
       
        person_qry.addParam(name="personID",value=personID,cfsqltype="INTEGER");  
        var sqlSelect = "SELECT * FROM Contact.Person";            
        var sqlWhere = "WHERE PersonID = :personID";                
        var sql = sqlSelect & " " & sqlWhere ;        
        /* invoke execute() on the query object to execute the query and return a component with properties result and prefix (which can be accessed as implcit getters) */         
        var result = person_qry.execute(sql=sql);         
        var identityQueries["person"] = result.getResult();  
        //Person Query End **
	}
}