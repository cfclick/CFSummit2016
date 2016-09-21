component output="false"
{
	public any function init()
	{
			return this ;
	}
	
	
	/* read */
	public Person function read(id)
	{
		var obj = new Person();
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT personid,persontypeid,name,gender,
						  isactive,createdby,createddatetime,updatedby,updateddatetime				
						  FROM Contact.Person
						  where personid = #ARGUMENTS.id#");
		}
			
		/* load value object */
		if( qry.recordcount > 0 ){
			obj.setPersonID(qry.PersonID[i]);
			obj.setPersonTypeID(qry.PersonTypeID[i]);
			//obj.setConferenceID(qry.ConferenceID[i]);
			obj.setName(qry.Name[i]);
			obj.setGender(qry.Gender[i]);
			obj.setIsActive(qry.IsActive[i]);
			obj.setCreatedBy(qry.CreatedBy[i]);
			obj.setCreatedDateTime(qry.CreatedDateTime[i]);
			obj.setUpdatedBy(qry.UpdatedBy[i]);
			obj.setUpdatedDateTime(qry.UpdatedDateTime[i]);
		}
		
		/* return success */
		return obj;
	}
} 
