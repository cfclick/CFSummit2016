component  output="false"
{	
	
	public query function getById(numeric personId)
	{	
		var id = arguments.personId;
		//var person = new Person();
		var i = 1;
		var qry="";
		
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT * FROM Contact.Person
							WHERE personID = #id#" );
		}
		
		/*if( qry.recordCount > 0 ){
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
		return person;*/
		
		return qry;
	}
	
	/* getAll */
	public query function getAll()
	{
		var arrayOfPerson = [];
		var qry = '';
		var i = 0;
		/* get all records from database */
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT * FROM Contact.Person" );
		}
		
		/* load value objects */
		/*for( i=1; i <= qry.recordcount; i++ )
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
			if( !isNull( qry.Updatedby[i] ) && len( qry.Updatedby[i] ) ) obj.setUpdatedby(qry.Updatedby[i]);
			if( !isNull( qry.Updateddatetime[i] ) && len( qry.Updateddatetime[i] ) ) person.setUpdateddatetime(qry.Updateddatetime[i]);
			arrayAppend( arrayOfPerson, person );
		}*/
		/* return success */
		return qry;
	}
	

}