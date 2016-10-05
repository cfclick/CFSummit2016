component  output="false"
{	
	public PersonDAO function init( string datasource=''){
		if( len(arguments.datasource) > 0  )
		 	variables.dsn = arguments.datasource;
		else
			variables.dsn = getDataSource('Conference');//Conference
		
		return this;
	}
	
	package query function getById(numeric personId){	
		var id = arguments.personId;
		var i = 1;
		var qry="";
		
		cfquery( name="qry", datasource=dsn  ){
			writeOutput( "SELECT * FROM Contact.Person
							WHERE personID = #id#" );
		}		
		return qry;
	}
	
	/* getAll */
	package query function getAll(){
		var arrayOfPerson = [];
		var qry = '';
		var i = 0;
		/* get all records from database */
		cfquery( name="qry", datasource=dsn  ){
			writeOutput( "SELECT * FROM Contact.Person" );
		}
		return qry;
	}
	

}