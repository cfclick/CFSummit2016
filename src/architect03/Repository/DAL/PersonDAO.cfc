component output="false"
{
	public any function init()
	{
			return this ;
	}
	
	public Person[] function listAll()
	{
		var arrayOfPerson = [];
		var qry = '';
		var i = 0;
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT * FROM Contact.Person" );
		}
		
		for(i=1;i<=qry.recordcount;i++)
		{
			var person = new Person();
			if( !isNull( qry.Personid[i] ) && len( qry.Personid[i] ) ) person.setPersonid(qry.Personid[i]);
			if( !isNull( qry.Persontypeid[i] ) && len( qry.Persontypeid[i] ) ) person.setPersontypeid(qry.Persontypeid[i]);
			if( !isNull( qry.Conferenceid[i] ) && len( qry.Conferenceid[i] ) ) person.setConferenceid(qry.Conferenceid[i]);
			if( !isNull( qry.Name[i] ) && len( qry.Name[i] ) ) person.setName(qry.Name[i]);
			if( !isNull( qry.Gender[i] ) && len( qry.Gender[i] ) ) person.setGender(qry.Gender[i]);
			if( !isNull( qry.Isactive[i] ) && len( qry.Isactive[i] ) ) person.setIsactive(qry.Isactive[i]);
			if( !isNull( qry.Createdby[i] ) && len( qry.Createdby[i] ) ) person.setCreatedby(qry.Createdby[i]);
			if( !isNull( qry.Createddatetime[i] ) && len( qry.Createddatetime[i] ) ) person.setCreateddatetime(qry.Createddatetime[i]);
			if( !isNull( qry.Updatedby[i] ) && len( qry.Updatedby[i] ) ) person.setUpdatedby(qry.Updatedby[i]);
			if( !isNull( qry.Updateddatetime[i] ) && len( qry.Updateddatetime[i] ) ) person.setUpdateddatetime(qry.Updateddatetime[i]);
			arrayAppend(arrayOfPerson, person);
		}

		return arrayOfPerson;
	}
	
	public Person function getById(id)
	{		
		var person = new Person();
		var i = 1;
		var qry="";
		
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT personid,persontypeid,conferenceid,name,gender,
						isactive,createdby,createddatetime,updatedby,updateddatetime
						FROM Contact.Person
						WHERE personid = #id#" );
		}
		
		if( qry.recordCount > 0 ){
			person.setPersonID(qry.PersonID[i]);
			person.setPersonTypeID(qry.PersonTypeID[i]);
			person.setConferenceID(qry.ConferenceID[i]);
			person.setName(qry.Name[i]);
			person.setGender(qry.Gender[i]);
			person.setIsActive(qry.IsActive[i]);
			person.setCreatedBy(qry.CreatedBy[i]);
			person.setCreatedDateTime(qry.CreatedDateTime[i]);
			person.setUpdatedBy(qry.UpdatedBy[i]);
			person.setUpdatedDateTime(qry.UpdatedDateTime[i]);
		}
		return person;
	}
	
	
	public numeric function create( numeric PersonTypeID, numeric ConferenceID= 0, string Name, string Gender, numeric IsActive= 0, string CreatedBy= '', date CreatedDateTime= '01/01/1900', string UpdatedBy= '', date UpdatedDateTime= '01/01/1900' )
	{
		//your sql insert logic
		var IdentityCol = 0;
		return IdentityCol;
	}
	
	public void function update(numeric PersonID,	numeric PersonTypeID,	numeric ConferenceID,	string Name,	string Gender,	numeric IsActive,	string CreatedBy,	date CreatedDateTime,	string UpdatedBy,	date UpdatedDateTime)
	{

	}
	
	public void function delete(numeric PersonID)
	{
		
	}

} 
