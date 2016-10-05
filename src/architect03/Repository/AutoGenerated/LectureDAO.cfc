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
	public any function create( string Title, string Description= '', date StratDateTime= '01/01/1900', date EndDateTime= '01/01/1900', string CreatedBy= '', date CreratedDateTime= '01/01/1900', string UpdatedBy= '', date UpdatedDateTime= '01/01/1900' )
	{
				
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var IdentityCol="";
		var qry="";	
		
		/* insert record */
		var q =new query();
		q.setdataSource("dsnConference");
		q.setsql('INSERT INTO Conf.Lecture
			(
				title,description,stratdatetime,enddatetime,
				createdby,crerateddatetime,updatedby,updateddatetime
			)
			VALUES
			(
				#ARGUMENTS.Title#,
				#ARGUMENTS.Description#,
				#ARGUMENTS.StratDateTime#,
				#ARGUMENTS.EndDateTime#,
				#ARGUMENTS.CreatedBy#,
				#ARGUMENTS.CreratedDateTime#,
				#ARGUMENTS.UpdatedBy#,
				#ARGUMENTS.UpdatedDateTime#
			)');
		var r=q.execute().getresult();
		
		
		if(arguments.LectureID NEQ '')
			IdentityCol=arguments.LectureID;
					      
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
	public Lecture function read(id)
	    {
		
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var obj = createObject('component', 'Lecture').init();
		var i = 1;
		var qry="";
		
		var q= new query();
		q.setdatasource("dsnConference");
		q.setsql('SELECT lectureid,title,description,stratdatetime,enddatetime,
					createdby,crerateddatetime,updatedby,updateddatetime
			FROM Conf.Lecture
			where lectureid = #ARGUMENTS.id#');
		qry=q.execute().getresult();	
		/* load value object */
		obj.setLectureID(qry.LectureID[i]);
		obj.setTitle(qry.Title[i]);
		obj.setDescription(qry.Description[i]);
		obj.setStratDateTime(qry.StratDateTime[i]);
		obj.setEndDateTime(qry.EndDateTime[i]);
		obj.setCreatedBy(qry.CreatedBy[i]);
		obj.setCreratedDateTime(qry.CreratedDateTime[i]);
		obj.setUpdatedBy(qry.UpdatedBy[i]);
		obj.setUpdatedDateTime(qry.UpdatedDateTime[i]);
		/* return success */
		return obj;
	    }
	
	/* update */
	public void function update(numeric LectureID,	string Title,	string Description,	date StratDateTime,	date EndDateTime,	string CreatedBy,	date CreratedDateTime,	string UpdatedBy,	date UpdatedDateTime)
		{
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		
		var qry="";
		/* update database */
		var q =new query();
		q.setdatasource("dsnConference");
		q.setsql('UPDATE Conf.Lecture
			SET title = "#ARGUMENTS.Title#" ,
				description = "#ARGUMENTS.Description#" ,
				stratdatetime = "#ARGUMENTS.StratDateTime#" ,
				enddatetime = "#ARGUMENTS.EndDateTime#" ,
				createdby = "#ARGUMENTS.CreatedBy#" ,
				crerateddatetime = "#ARGUMENTS.CreratedDateTime#" ,
				updatedby = "#ARGUMENTS.UpdatedBy#" ,
				updateddatetime = "#ARGUMENTS.UpdatedDateTime#" 
			WHERE lectureid = "#ARGUMENTS.LectureID#" ');
	    qry=q.execute().getresult();		
		
		
		}
	
	/* delete */
	public void function delete(numeric LectureID)
		{
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var qry="";
		/* delete from database */
		var q =new query();
		q.setdatasource("dsnConference");
		q.setsql('DELETE FROM Conf.Lecture
			WHERE lectureid = "#ARGUMENTS.LectureID#"' );
		qry=q.execute().getresult();
		
		}

} 
