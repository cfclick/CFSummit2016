component output="false"
{

	/* init */
	public any function init()
	{
		var INSTANCE = {};
		INSTANCE.dao = createObject('component', 'ConferenceDAO').init();
		return this;
	}

	/* getAll */
	public Conference[] function getAll()
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		/* get all records from database */
		var q= new query();
		q.setdatasource('dsnConference');
		q.setsql('SELECT * FROM Conf.Conference');
		qry=q.execute().getresult();
		/* load value objects */
		for(i=1;i<="#qry.recordcount#";i++)
		{
			obj = createObject('component', 'Conference').init();
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
		/* return success */
		return collection;
	}
	
	/* getAll_paged */
	public Conference[] function ngetAll_paged(numeric start,numeric count)
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		var end=0;
		/* get all records from database */
		var q= new query();
		q.setdatasource(dsnConference);
		q.setsql('SELECT * FROM Conf.Conference');			
		qry=q.execute().getresult();
		
		/* load value objects */
		if((ARGUMENTS.start + ARGUMENTS.count - 1) GTE qry.recordcount)
			end =  qry.recordcount;
		else
			end= ARGUMENTS.start + ARGUMENTS.count - 1;
		
		for(i="#ARGUMENTS.start#";i<="#end#";i++)
			{
			 obj = createObject('component', 'Conference').init();
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
		/* return success */
		return collection;
	}
	
	/* count */
	public numeric function count()
	{
		var qry = "";
		var q=new query();
		q.setdatasource(dsnConference);
		q.setsql('SELECT COUNT(ConferenceID) AS total
			FROM Conf.Conference');
		qry=q.execute().getresult();
		return qry.total[1];
	}

}
