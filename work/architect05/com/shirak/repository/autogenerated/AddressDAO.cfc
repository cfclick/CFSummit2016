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
	public any function create( numeric AddressTypeID, string Address1, string address2= '', string City, string State, string ZipCode, numeric IsActive= 0, string CreatedBy= '', date CreatedDateTime= '01/01/1900', string UpdatedBy= '', date UpdatedDateTime= '01/01/1900' )
	{
				
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var IdentityCol="";
		var qry="";	
		
		/* insert record */
		var q =new query();
		q.setdataSource("dsnConference");
		q.setsql('INSERT INTO Contact.Address
			(
				addresstypeid,address1,address2,city,
				state,zipcode,isactive,createdby,createddatetime,
				updatedby,updateddatetime
			)
			VALUES
			(
				#ARGUMENTS.AddressTypeID#,
				#ARGUMENTS.Address1#,
				#ARGUMENTS.address2#,
				#ARGUMENTS.City#,
				#ARGUMENTS.State#,
				#ARGUMENTS.ZipCode#,
				#ARGUMENTS.IsActive#,
				#ARGUMENTS.CreatedBy#,
				#ARGUMENTS.CreatedDateTime#,
				#ARGUMENTS.UpdatedBy#,
				#ARGUMENTS.UpdatedDateTime#
			)');
		var r=q.execute().getresult();
		
		
		if(arguments.AddressID NEQ '')
			IdentityCol=arguments.AddressID;
					      
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
	public Address function read(id)
	    {
		
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var obj = createObject('component', 'Address').init();
		var i = 1;
		var qry="";
		
		var q= new query();
		q.setdatasource("dsnConference");
		q.setsql('SELECT addressid,addresstypeid,address1,address2,city,
					state,zipcode,isactive,createdby,createddatetime,
					updatedby,updateddatetime
			FROM Contact.Address
			where addressid = "#ARGUMENTS.id#"');
		qry=q.execute().getresult();	
		/* load value object */
		obj.setAddressID(qry.AddressID[i]);
		obj.setAddressTypeID(qry.AddressTypeID[i]);
		obj.setAddress1(qry.Address1[i]);
		obj.setaddress2(qry.address2[i]);
		obj.setCity(qry.City[i]);
		obj.setState(qry.State[i]);
		obj.setZipCode(qry.ZipCode[i]);
		obj.setIsActive(qry.IsActive[i]);
		obj.setCreatedBy(qry.CreatedBy[i]);
		obj.setCreatedDateTime(qry.CreatedDateTime[i]);
		obj.setUpdatedBy(qry.UpdatedBy[i]);
		obj.setUpdatedDateTime(qry.UpdatedDateTime[i]);
		/* return success */
		return obj;
	    }
	
	/* update */
	public void function update(numeric AddressID,	numeric AddressTypeID,	string Address1,	string address2,	string City,	string State,	string ZipCode,	numeric IsActive,	string CreatedBy,	date CreatedDateTime,	string UpdatedBy,	date UpdatedDateTime)
		{
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		
		var qry="";
		/* update database */
		var q =new query();
		q.setdatasource("dsnConference");
		q.setsql('UPDATE Contact.Address
			SET addresstypeid = "#ARGUMENTS.AddressTypeID#" ,
				address1 = "#ARGUMENTS.Address1#" ,
				address2 = "#ARGUMENTS.address2#" ,
				city = "#ARGUMENTS.City#" ,
				state = "#ARGUMENTS.State#" ,
				zipcode = "#ARGUMENTS.ZipCode#" ,
				isactive = "#ARGUMENTS.IsActive#" ,
				createdby = "#ARGUMENTS.CreatedBy#" ,
				createddatetime = "#ARGUMENTS.CreatedDateTime#" ,
				updatedby = "#ARGUMENTS.UpdatedBy#" ,
				updateddatetime = "#ARGUMENTS.UpdatedDateTime#" 
			WHERE addressid = "#ARGUMENTS.AddressID#" ');
	    qry=q.execute().getresult();		
		
		
		}
	
	/* delete */
	public void function delete(numeric AddressID)
		{
		/* Auto-generated method
		         Add authroization or any logical checks for secure access to your data */
		var qry="";
		/* delete from database */
		var q =new query();
		q.setdatasource("dsnConference");
		q.setsql('DELETE FROM Contact.Address
			WHERE addressid = "#ARGUMENTS.AddressID#"' );
		qry=q.execute().getresult();
		
		}

} 
