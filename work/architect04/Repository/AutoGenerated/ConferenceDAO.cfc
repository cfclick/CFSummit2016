component output="false"
{
	/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
	/* init */
	public any function init()
	{
			return this ;
	}
	
	/* create */
	public any function create( numeric AddressID, binary Name, date StartDate= '01/01/1900', date EndDate= '01/01/1900', string Location= '', numeric IsActive= 0, string CreatedBy= '', date CreatedDateTime= '01/01/1900', string UpdatedBy= '', date UpdatedDateTime= '01/01/1900' )
	{
				
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var IdentityCol="";
		var qry="";	
		
		/* insert record */
		var q =new query();
		q.setdataSource("dsnConference");
		q.setsql('INSERT INTO Conf.Conference
			(
				addressid,name,startdate,enddate,
				location,isactive,createdby,createddatetime,updatedby,
				updateddatetime
			)
			VALUES
			(
				#ARGUMENTS.AddressID#,
				#ARGUMENTS.Name#,
				#ARGUMENTS.StartDate#,
				#ARGUMENTS.EndDate#,
				#ARGUMENTS.Location#,
				#ARGUMENTS.IsActive#,
				#ARGUMENTS.CreatedBy#,
				#ARGUMENTS.CreatedDateTime#,
				#ARGUMENTS.UpdatedBy#,
				#ARGUMENTS.UpdatedDateTime#
			)');
		var r=q.execute().getresult();
		
		
		if(arguments.ConferenceID NEQ '')
			IdentityCol=arguments.ConferenceID;
					      
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
	
	
	/* read */
	public Conference function read(id)
	    {
		
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var obj = createObject('component', 'Conference');
		var i = 1;
		var qry="";
	
		var q= new query();
		q.setdatasource("dsnConference");
		q.setsql('SELECT conferenceid,addressid,name,startdate,enddate,
					location,isactive,createdby,createddatetime,updatedby,
					updateddatetime
			FROM Conf.Conference
			where conferenceid = #ARGUMENTS.id#');
		qry=q.execute().getresult();	
		
		/* load value object */
		obj.setConferenceID(qry.ConferenceID[i]);
		obj.setAddressID(qry.AddressID[i]);
		obj.setName(qry.Name[i]);
		obj.setStartDate(qry.StartDate[i]);
		obj.setEndDate(qry.EndDate[i]);
		obj.setLocation(qry.Location[i]);
		obj.setIsActive(qry.IsActive[i]);
		obj.setCreatedBy(qry.CreatedBy[i]);
		obj.setCreatedDateTime(qry.CreatedDateTime[i]);
		obj.setUpdatedBy(qry.UpdatedBy[i]);
		obj.setUpdatedDateTime(qry.UpdatedDateTime[i]);
		/* return success */
		return obj;
	    }
	
	/* update */
	public void function update(numeric ConferenceID,	numeric AddressID,	binary Name,	date StartDate,	date EndDate,	string Location,	numeric IsActive,	string CreatedBy,	date CreatedDateTime,	string UpdatedBy,	date UpdatedDateTime)
		{
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		
		var qry="";
		/* update database */
		var q =new query();
		q.setdatasource("dsnConference");
		q.setsql('UPDATE Conf.Conference
			SET addressid = "#ARGUMENTS.AddressID#" ,
				name = "#ARGUMENTS.Name#" ,
				startdate = "#ARGUMENTS.StartDate#" ,
				enddate = "#ARGUMENTS.EndDate#" ,
				location = "#ARGUMENTS.Location#" ,
				isactive = "#ARGUMENTS.IsActive#" ,
				createdby = "#ARGUMENTS.CreatedBy#" ,
				createddatetime = "#ARGUMENTS.CreatedDateTime#" ,
				updatedby = "#ARGUMENTS.UpdatedBy#" ,
				updateddatetime = "#ARGUMENTS.UpdatedDateTime#" 
			WHERE conferenceid = "#ARGUMENTS.ConferenceID#" ');
	    qry=q.execute().getresult();		
		
		
		}
	
	/* delete */
	public void function delete(numeric ConferenceID)
		{
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var qry="";
		/* delete from database */
		var q =new query();
		q.setdatasource("dsnConference");
		q.setsql('DELETE FROM Conf.Conference
			WHERE conferenceid = "#ARGUMENTS.ConferenceID#"' );
		qry=q.execute().getresult();
		
		}

} 
