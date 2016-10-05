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
	public any function create( numeric SessionID, numeric PersonID, string CreatedBy= '', date CreatedDateTime= '01/01/1900', string UpdatedBy= '', date UpdatedDateTime= '01/01/1900' )
	{
				
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var IdentityCol="";
		var qry="";	
		
		/* insert record */
		var q =new query();
		q.setdataSource("dsnConference");
		q.setsql('INSERT INTO Map.SessionSpeaker
			(
				sessionid,personid,createdby,createddatetime,
				updatedby,updateddatetime
			)
			VALUES
			(
				#ARGUMENTS.SessionID#,
				#ARGUMENTS.PersonID#,
				#ARGUMENTS.CreatedBy#,
				#ARGUMENTS.CreatedDateTime#,
				#ARGUMENTS.UpdatedBy#,
				#ARGUMENTS.UpdatedDateTime#
			)');
		var r=q.execute().getresult();
		
		
		if(arguments.SessionSpeakerID NEQ '')
			IdentityCol=arguments.SessionSpeakerID;
					      
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
	public Sessionspeaker function read(id)
	    {
		
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var obj = createObject('component', 'Sessionspeaker').init();
		var i = 1;
		var qry="";
		
		var q= new query();
		q.setdatasource("dsnConference");
		q.setsql('SELECT sessionspeakerid,sessionid,personid,createdby,createddatetime,
					updatedby,updateddatetime
			FROM Map.SessionSpeaker
			where sessionspeakerid = "#ARGUMENTS.id#"');
		qry=q.execute().getresult();	
		/* load value object */
		obj.setSessionSpeakerID(qry.SessionSpeakerID[i]);
		obj.setSessionID(qry.SessionID[i]);
		obj.setPersonID(qry.PersonID[i]);
		obj.setCreatedBy(qry.CreatedBy[i]);
		obj.setCreatedDateTime(qry.CreatedDateTime[i]);
		obj.setUpdatedBy(qry.UpdatedBy[i]);
		obj.setUpdatedDateTime(qry.UpdatedDateTime[i]);
		/* return success */
		return obj;
	    }
	
	/* update */
	public void function update(numeric SessionSpeakerID,	numeric SessionID,	numeric PersonID,	string CreatedBy,	date CreatedDateTime,	string UpdatedBy,	date UpdatedDateTime)
		{
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		
		var qry="";
		/* update database */
		var q =new query();
		q.setdatasource("dsnConference");
		q.setsql('UPDATE Map.SessionSpeaker
			SET sessionid = "#ARGUMENTS.SessionID#" ,
				personid = "#ARGUMENTS.PersonID#" ,
				createdby = "#ARGUMENTS.CreatedBy#" ,
				createddatetime = "#ARGUMENTS.CreatedDateTime#" ,
				updatedby = "#ARGUMENTS.UpdatedBy#" ,
				updateddatetime = "#ARGUMENTS.UpdatedDateTime#" 
			WHERE sessionspeakerid = "#ARGUMENTS.SessionSpeakerID#" ');
	    qry=q.execute().getresult();		
		
		
		}
	
	/* delete */
	public void function delete(numeric SessionSpeakerID)
		{
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var qry="";
		/* delete from database */
		var q =new query();
		q.setdatasource("dsnConference");
		q.setsql('DELETE FROM Map.SessionSpeaker
			WHERE sessionspeakerid = "#ARGUMENTS.SessionSpeakerID#"' );
		qry=q.execute().getresult();
		
		}

} 
