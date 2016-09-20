component  output="false"
{
	/* read */
	public Conference function read( numeric primaryId)
	{
		local.id = arguments.primaryId;
		var obj = new Conference();
		var i = 1;
		var qry="";	
		
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT conferenceid,addressid,name,startdate,enddate,
								location,isactive,createdby,createddatetime,updatedby,
								updateddatetime
						FROM Conf.Conference
						where conferenceid = #id#" );
		}
		
		/* load value object */
		if( qry.recordcount > 0 ){
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
		
	}
	
	/* getAll */
	public Conference[] function getAll()
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		/* get all records from database */
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT conferenceid,addressid,name,startdate,enddate,
								location,isactive,createdby,createddatetime,updatedby,
								updateddatetime
						FROM Conf.Conference
						" );
		}
		/* load value objects */
		if( qry.recordcount > 0 ){
			for(i=1;i<=qry.recordcount;i++)
			{
				obj = new Conference();
				if( !isNull( qry.Conferenceid[i] ) && len( qry.Conferenceid[i] ) ) obj.setConferenceid(qry.Conferenceid[i]);
				if( !isNull( qry.Addressid[i] ) && len( qry.Addressid[i] ) ) obj.setAddressid(qry.Addressid[i]);
				if( !isNull( qry.Name[i] ) && len( qry.Name[i] ) ) obj.setName(qry.Name[i]);
				if( !isNull( qry.Startdate[i] ) && len( qry.Startdate[i] ) ) obj.setStartdate(qry.Startdate[i]);
				if( !isNull( qry.Enddate[i] ) && len( qry.Enddate[i] ) ) obj.setEnddate(qry.Enddate[i]);
				if( !isNull( qry.Location[i] ) && len( qry.Location[i] ) ) obj.setLocation(qry.Location[i]);
				if( !isNull( qry.Isactive[i] ) && len( qry.Isactive[i] ) ) obj.setIsactive(qry.Isactive[i]);
				if( !isNull( qry.Createdby[i] ) && len( qry.Createdby[i] ) ) obj.setCreatedby(qry.Createdby[i]);
				if( !isNull( qry.Createddatetime[i] ) && len( qry.Createddatetime[i] ) ) obj.setCreateddatetime(qry.Createddatetime[i]);
				if( !isNull( qry.Updatedby[i] ) && len( qry.Updatedby[i] ) ) obj.setUpdatedby(qry.Updatedby[i]);
				if( !isNull( qry.Updateddatetime[i] ) && len( qry.Updateddatetime[i] ) ) obj.setUpdateddatetime(qry.Updateddatetime[i]);
				arrayAppend(collection, obj);
			}
		}
		
		/* return success */
		return collection;
	}
}