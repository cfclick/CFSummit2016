component extends="conference.Impl.BaseService" output="false"
{
	import conference.BusinessEntities.Person;
	
	public PersonService function init(){
		this.contactTranslator = new ContactTranslator();
		variables.contactDAL = new ContactDAL( this );
		return this;
	}
	
	package Person function getPerson( required numeric personID ){
		var pId = arguments.personID;		
		var queryResult = variables.contactDAL.personDAO.getById( pId );
		
		for ( var row in queryResult ){
			var person = this.contactTranslator.toPerson( row );
			break;
		}
		
		return person;
	}
	
	package Person[] function getAll( ){		
		var queryResult = variables.contactDAL.personDAO.getAll();
		return this.contactTranslator.toArrayOfPerson( queryResult );
	}
}