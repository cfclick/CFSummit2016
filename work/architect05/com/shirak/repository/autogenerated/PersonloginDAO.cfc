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
	public any function create( numeric PersonID, numeric LoginID, string Description= '', numeric IsActive= 0, string Createdby= '', date CreatedDateTime= '01/01/1900', string UpdatedBy= '', date UpdatedDateTime= '01/01/1900' )
	{
				
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var IdentityCol="";
		var qry="";	
		
		/* insert record */
		var q =new query();
		q.setdataSource("dsnConference");
		q.setsql('INSERT INTO Auth.PersonLogin
			(
				personid,loginid,description,isactive,
				createdby,createddatetime,updatedby,updateddatetime
			)
			VALUES
			(
				#ARGUMENTS.PersonID#,
				#ARGUMENTS.LoginID#,
				#ARGUMENTS.Description#,
				#ARGUMENTS.IsActive#,
				#ARGUMENTS.Createdby#,
				#ARGUMENTS.CreatedDateTime#,
				#ARGUMENTS.UpdatedBy#,
				#ARGUMENTS.UpdatedDateTime#
			)');
		var r=q.execute().getresult();
		
		
		if(arguments.PersonLoginID NEQ '')
			IdentityCol=arguments.PersonLoginID;
					      
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
	public Personlogin function read(id)
	    {
		
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var obj = createObject('component', 'Personlogin').init();
		var i = 1;
		var qry="";
		
		var q= new query();
		q.setdatasource("dsnConference");
		q.setsql('SELECT personloginid,personid,loginid,description,isactive,
					createdby,createddatetime,updatedby,updateddatetime
			FROM Auth.PersonLogin
			where personloginid = "#ARGUMENTS.id#"');
		qry=q.execute().getresult();	
		/* load value object */
		obj.setPersonLoginID(qry.PersonLoginID[i]);
		obj.setPersonID(qry.PersonID[i]);
		obj.setLoginID(qry.LoginID[i]);
		obj.setDescription(qry.Description[i]);
		obj.setIsActive(qry.IsActive[i]);
		obj.setCreatedby(qry.Createdby[i]);
		obj.setCreatedDateTime(qry.CreatedDateTime[i]);
		obj.setUpdatedBy(qry.UpdatedBy[i]);
		obj.setUpdatedDateTime(qry.UpdatedDateTime[i]);
		/* return success */
		return obj;
	    }
	
	/* update */
	public void function update(numeric PersonLoginID,	numeric PersonID,	numeric LoginID,	string Description,	numeric IsActive,	string Createdby,	date CreatedDateTime,	string UpdatedBy,	date UpdatedDateTime)
		{
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		
		var qry="";
		/* update database */
		var q =new query();
		q.setdatasource("dsnConference");
		q.setsql('UPDATE Auth.PersonLogin
			SET personid = "#ARGUMENTS.PersonID#" ,
				loginid = "#ARGUMENTS.LoginID#" ,
				description = "#ARGUMENTS.Description#" ,
				isactive = "#ARGUMENTS.IsActive#" ,
				createdby = "#ARGUMENTS.Createdby#" ,
				createddatetime = "#ARGUMENTS.CreatedDateTime#" ,
				updatedby = "#ARGUMENTS.UpdatedBy#" ,
				updateddatetime = "#ARGUMENTS.UpdatedDateTime#" 
			WHERE personloginid = "#ARGUMENTS.PersonLoginID#" ');
	    qry=q.execute().getresult();		
		
		
		}
	
	/* delete */
	public void function delete(numeric PersonLoginID)
		{
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var qry="";
		/* delete from database */
		var q =new query();
		q.setdatasource("dsnConference");
		q.setsql('DELETE FROM Auth.PersonLogin
			WHERE personloginid = "#ARGUMENTS.PersonLoginID#"' );
		qry=q.execute().getresult();
		
		}

} 
