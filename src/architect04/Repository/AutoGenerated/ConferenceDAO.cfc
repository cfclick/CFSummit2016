component  output="false"
{
	/* read */
	public Conference function getById( required numeric conferenceID)
	{
		var id = arguments.conferenceID;
		var conference = new Conference();
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
			conference.setConferenceID(qry.ConferenceID[i]);
			conference.setAddressID(qry.AddressID[i]);
			conference.setName(qry.Name[i]);
			conference.setStartDate(qry.StartDate[i]);
			conference.setEndDate(qry.EndDate[i]);
			conference.setLocation(qry.Location[i]);
			conference.setIsActive(qry.IsActive[i]);
			conference.setCreatedBy(qry.CreatedBy[i]);
			conference.setCreatedDateTime(qry.CreatedDateTime[i]);
			conference.setUpdatedBy(qry.UpdatedBy[i]);
			conference.setUpdatedDateTime(qry.UpdatedDateTime[i]);
			/* return success */
			return conference;
		}
		
	}
	
	/* getAll */
	public Conference[] function getAll()
	{
		var arrayOfConference = [];
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
			for( i=1; i <= qry.recordcount; i++ )
			{
				conference = new Conference();
				if( !isNull( qry.Conferenceid[i] ) && len( qry.Conferenceid[i] ) ) conference.setConferenceid(qry.Conferenceid[i]);
				if( !isNull( qry.Addressid[i] ) && len( qry.Addressid[i] ) ) conference.setAddressid(qry.Addressid[i]);
				if( !isNull( qry.Name[i] ) && len( qry.Name[i] ) ) conference.setName(qry.Name[i]);
				if( !isNull( qry.Startdate[i] ) && len( qry.Startdate[i] ) ) conference.setStartdate(qry.Startdate[i]);
				if( !isNull( qry.Enddate[i] ) && len( qry.Enddate[i] ) ) conference.setEnddate(qry.Enddate[i]);
				if( !isNull( qry.Location[i] ) && len( qry.Location[i] ) ) conference.setLocation(qry.Location[i]);
				if( !isNull( qry.Isactive[i] ) && len( qry.Isactive[i] ) ) conference.setIsactive(qry.Isactive[i]);
				if( !isNull( qry.Createdby[i] ) && len( qry.Createdby[i] ) ) conference.setCreatedby(qry.Createdby[i]);
				if( !isNull( qry.Createddatetime[i] ) && len( qry.Createddatetime[i] ) ) conference.setCreateddatetime(qry.Createddatetime[i]);
				if( !isNull( qry.Updatedby[i] ) && len( qry.Updatedby[i] ) ) conference.setUpdatedby(qry.Updatedby[i]);
				if( !isNull( qry.Updateddatetime[i] ) && len( qry.Updateddatetime[i] ) ) conference.setUpdateddatetime(qry.Updateddatetime[i]);
				arrayAppend( arrayOfConference, conference );
			}
		}
		
		/* return success */
		return arrayOfConference;
	}
}