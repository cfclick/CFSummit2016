component extends="BaseDAL" output="false"
{
	function init(any dependency){
		super.init(arguments.dependency);
		
		return this;
	}
	
	public query function getPersonAddress( required numeric personID ){
		var pID = arguments.personID;
		//Person Query start **
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT pa.PersonAddressID, pa.PersonID,t.Name AddressTypeName,a.* 
        				FROM Map.PersonAddress pa 
        				INNER JOIN Contact.[Address] a on pa.AddressID = a.AddressID
						INNER JOIN [Definition].[AddressType] t on a.AddressTypeID = t.AddressTypeID          
        				WHERE pa.PersonID = #pID#");
		}
        //Person Query End **
        return qry;  
        
	}
	
	public query function getContactInfo( required numeric personID ){		
		var pID = arguments.personID;
		var dsn = "dsnConference";
		//Person Query start **
        var person_qry = new query();         
        /* set properties using implict setters */         
        person_qry.setDatasource( dsn );    
       
        person_qry.addParam(name="personID",value=pID,cfsqltype="INTEGER");  
        var sqlSelect = "SELECT pa.PersonAddressID
							, pa.PersonID
							, p.PersonTypeID
							, p.Name PersonName
							, p.ConferenceID
							, p.Gender
							, p.IsActive PersonActive
							, t.Name AddressTypeName
							,a.* 
						FROM Map.PersonAddress pa 
						INNER JOIN [Contact].Person p on pa.PersonID = p.PersonID
						INNER JOIN [Definition].PersonType pt on p.PersonTypeID = pt.PersonTypeID
						INNER JOIN [Contact].[Address] a on pa.AddressID = a.AddressID
						INNER JOIN [Definition].[AddressType] t on a.AddressTypeID = t.AddressTypeID";            
        var sqlWhere = "WHERE PersonID = :personID";                
        var sql = sqlSelect & " " & sqlWhere ;        
        /* invoke execute() on the query object to execute the query and return a component with properties result and prefix (which can be accessed as implcit getters) */         
        var result = person_qry.execute(sql=sql);         
        return result.getResult();  
        //Person Query End **
	}
}