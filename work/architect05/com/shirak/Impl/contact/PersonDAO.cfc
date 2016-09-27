component  output="false"
{	
	
	package query function getById(numeric personId)
	{	
		var id = arguments.personId;
		var i = 1;
		var qry="";
		
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT * FROM Contact.Person
							WHERE personID = #id#" );
		}
		
		return qry;
	}
	
	/* getAll */
	package query function getAll()
	{
		var arrayOfPerson = [];
		var qry = '';
		var i = 0;
		/* get all records from database */
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT * FROM Contact.Person" );
		}
		return qry;
	}
	

}