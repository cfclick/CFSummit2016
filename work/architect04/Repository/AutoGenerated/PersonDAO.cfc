component output="false"
{
	public any function init()
	{
			return this ;
	}
	
	public any function create( numeric PersonTypeID, numeric ConferenceID= 0, string Name, string Gender, numeric IsActive= 0, string CreatedBy= '', date CreatedDateTime= '01/01/1900', string UpdatedBy= '', date UpdatedDateTime= '01/01/1900' )
	{
				
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var IdentityCol="";
		var qry="";	
		
		/* insert record */
		var q =new query();
		q.setdataSource("dsnConference");
		q.setsql('INSERT INTO Contact.Person
			(
				persontypeid,conferenceid,name,gender,
				isactive,createdby,createddatetime,updatedby,updateddatetime
				
			)
			VALUES
			(
				#ARGUMENTS.PersonTypeID#,
				#ARGUMENTS.ConferenceID#,
				#ARGUMENTS.Name#,
				#ARGUMENTS.Gender#,
				#ARGUMENTS.IsActive#,
				#ARGUMENTS.CreatedBy#,
				#ARGUMENTS.CreatedDateTime#,
				#ARGUMENTS.UpdatedBy#,
				#ARGUMENTS.UpdatedDateTime#
			)');
		var r=q.execute().getresult();
		
		
		if(arguments.PersonID NEQ '')
			IdentityCol=arguments.PersonID;
					      
		 else
		 {
		/*TODO: This logic is for diffrent db's.Delete the conditions not applicable */	 
      	 if(IsDefined("qry.GENERATEDKEY"))
            identityCol = qry.GENERATEDKEY;
		 else if(IsDefined("qry.IDENTITYCOL"))/* SQL Server only*/	
            identityCol = qry.IDENTITYCOL;
      	 else if(IsDefined("qry.GENERATED_KEY")) /* MySQL only*/
            identityCol = qry.GENERATED_KEY;
      	 else if(IsDefined("qry.GENERATED_KEYS"))
            identityCol = qry.GENERATED_KEYS;
      	 else if(IsDefined("qry.ROWID"))/* Oracle only */
            identityCol = qry.ROWID;
      	 else if(IsDefined("qry.SYB_IDENTITY"))/* Sybase only */
            identityCol = qry.SYB_IDENTITY;
      	 else if(IsDefined("qry.SERIAL_COL")) /*Informix only*/
            identityCol = qry.SERIAL_COL;
      	 else if(IsDefined("qry.KEY_VALUE"))
            identityCol = qry.KEY_VALUE;
      	
		
	  	}	
		/* return IdentityCol */
		return IdentityCol;
	}
	
	public Person function read(id)
	    {
		
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var obj = createObject('component', 'Person');
		var i = 1;
		var qry="";
		
		var q= new query();
		q.setdatasource("dsnConference");
		q.setsql('SELECT personid,persontypeid,conferenceid,name,gender,
					isactive,createdby,createddatetime,updatedby,updateddatetime
					
			FROM Contact.Person
			where personid = #ARGUMENTS.id#');
		qry=q.execute().getresult();	
		/* load value object */
		obj.setPersonID(qry.PersonID[i]);
		obj.setPersonTypeID(qry.PersonTypeID[i]);
		obj.setConferenceID(qry.ConferenceID[i]);
		obj.setName(qry.Name[i]);
		obj.setGender(qry.Gender[i]);
		obj.setIsActive(qry.IsActive[i]);
		obj.setCreatedBy(qry.CreatedBy[i]);
		obj.setCreatedDateTime(qry.CreatedDateTime[i]);
		obj.setUpdatedBy(qry.UpdatedBy[i]);
		obj.setUpdatedDateTime(qry.UpdatedDateTime[i]);
		/* return success */
		return obj;
	    }
	
	public void function update(numeric PersonID,	numeric PersonTypeID,	numeric ConferenceID,	string Name,	string Gender,	numeric IsActive,	string CreatedBy,	date CreatedDateTime,	string UpdatedBy,	date UpdatedDateTime)
		{
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		
		var qry="";
		/* update database */
		var q =new query();
		q.setdatasource("dsnConference");
		q.setsql('UPDATE Contact.Person
			SET persontypeid = "#ARGUMENTS.PersonTypeID#" ,
				conferenceid = "#ARGUMENTS.ConferenceID#" ,
				name = "#ARGUMENTS.Name#" ,
				gender = "#ARGUMENTS.Gender#" ,
				isactive = "#ARGUMENTS.IsActive#" ,
				createdby = "#ARGUMENTS.CreatedBy#" ,
				createddatetime = "#ARGUMENTS.CreatedDateTime#" ,
				updatedby = "#ARGUMENTS.UpdatedBy#" ,
				updateddatetime = "#ARGUMENTS.UpdatedDateTime#" 
			WHERE personid = "#ARGUMENTS.PersonID#" ');
	    qry=q.execute().getresult();		
		
		
		}
	
	public void function delete(numeric PersonID)
		{
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var qry="";
		/* delete from database */
		var q =new query();
		q.setdatasource("dsnConference");
		q.setsql('DELETE FROM Contact.Person
			WHERE personid = "#ARGUMENTS.PersonID#"' );
		qry=q.execute().getresult();
		
		}

} 
