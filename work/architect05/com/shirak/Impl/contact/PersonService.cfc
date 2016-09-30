component extends="conference.Impl.BaseService" output="false"
{
	import conference.Impl.BusinessEntities.Person;
	
	public PersonService function init(){
		this.translator = new Translator(); 
		variables.repository = new Repository(); 
		return this;
	}
	
	package Person function getPerson( required numeric personID ){
		var pId = arguments.personID;		
		var queryResult = variables.repository.personDAO.getById( pId );
		
		for ( var row in queryResult ){
			var person = this.translator.toPerson( row );
			break;
		}	
		return person;
	}
	
	package Person[] function getAll( ){		
		var queryResult = variables.repository.personDAO.getAll();
		return this.translator.toArrayOfPerson( queryResult );
	}
}