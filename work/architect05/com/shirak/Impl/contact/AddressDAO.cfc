component output="false"
{	
	
	package query function getById(numeric personId)
	{	
		var id = arguments.personId;
		var i = 1;
		var qry="";
		
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT * FROM Contact.Address
							WHERE AddressID = #id#" );
		}		
		return qry;
	}
	
	/* getAll */
	package query function getAll()
	{
		var qry = '';
		var i = 0;
		/* get all records from database */
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT * FROM Contact.Address" );
		}
		return qry;
	}
	

}