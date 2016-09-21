component output="false"
{
	public any function init()
	{
			return this ;
	}
	
	public query function getAll()
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		/* get all records from database */
		
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT * FROM Contact.Person");
		}
		/*if( qry.recordcount > 0 ){
			
			for(i=1;i<="#qry.recordcount#";i++)
			{
				obj = createObject('component', 'Person').init();
				if( !isNull( qry.Personid[i] ) && len( qry.Personid[i] ) ) obj.setPersonid(qry.Personid[i]);
				if( !isNull( qry.Persontypeid[i] ) && len( qry.Persontypeid[i] ) ) obj.setPersontypeid(qry.Persontypeid[i]);
				if( !isNull( qry.Conferenceid[i] ) && len( qry.Conferenceid[i] ) ) obj.setConferenceid(qry.Conferenceid[i]);
				if( !isNull( qry.Name[i] ) && len( qry.Name[i] ) ) obj.setName(qry.Name[i]);
				if( !isNull( qry.Gender[i] ) && len( qry.Gender[i] ) ) obj.setGender(qry.Gender[i]);
				if( !isNull( qry.Isactive[i] ) && len( qry.Isactive[i] ) ) obj.setIsactive(qry.Isactive[i]);
				if( !isNull( qry.Createdby[i] ) && len( qry.Createdby[i] ) ) obj.setCreatedby(qry.Createdby[i]);
				if( !isNull( qry.Createddatetime[i] ) && len( qry.Createddatetime[i] ) ) obj.setCreateddatetime(qry.Createddatetime[i]);
				if( !isNull( qry.Updatedby[i] ) && len( qry.Updatedby[i] ) ) obj.setUpdatedby(qry.Updatedby[i]);
				if( !isNull( qry.Updateddatetime[i] ) && len( qry.Updateddatetime[i] ) ) obj.setUpdateddatetime(qry.Updateddatetime[i]);
				arrayAppend(collection, obj);
			}
		}*/
		
		/* return success */
		return qry;
	}
	
	/* read */
	public query function read(id)
	{
		var i = 1;
		var obj = new Person();
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT personid,persontypeid,name,gender,
						  isactive,createdby,createddatetime,updatedby,updateddatetime				
						  FROM Contact.Person
						  where personid = #ARGUMENTS.id#");
		}
			
		/* load value object */
		/*if( qry.recordcount > 0 ){
			obj.setPersonID(qry.PersonID[i]);
			obj.setPersonTypeID(qry.PersonTypeID[i]);
			obj.setName(qry.Name[i]);
			obj.setGender(qry.Gender[i]);
			obj.setIsActive(qry.IsActive[i]);
			obj.setCreatedBy(qry.CreatedBy[i]);
			obj.setCreatedDateTime(qry.CreatedDateTime[i]);
			obj.setUpdatedBy(qry.UpdatedBy[i]);
			obj.setUpdatedDateTime(qry.UpdatedDateTime[i]);
		}*/
		
		/* return success */
		return qry;
	}
} 
