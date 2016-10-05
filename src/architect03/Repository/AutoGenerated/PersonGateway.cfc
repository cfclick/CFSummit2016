component output="false"
{

	/* init */
	public any function init()
	{
		var INSTANCE = {};
		INSTANCE.dao = createObject('component', 'PersonDAO').init();
		return this;
	}

	/* getAll */
	public Person[] function getAll()
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		/* get all records from database */
		var q= new query();
		q.setdatasource('dsnConference');
		q.setsql('SELECT * FROM Contact.Person');
		qry=q.execute().getresult();
		/* load value objects */
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
		/* return success */
		return collection;
	}
	
	/* getAll_paged */
	public Person[] function ngetAll_paged(numeric start,numeric count)
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		var end=0;
		/* get all records from database */
		var q= new query();
		q.setdatasource(dsnConference);
		q.setsql('SELECT * FROM Contact.Person');			
		qry=q.execute().getresult();
		
		/* load value objects */
		if((ARGUMENTS.start + ARGUMENTS.count - 1) GTE qry.recordcount)
			end =  qry.recordcount;
		else
			end= ARGUMENTS.start + ARGUMENTS.count - 1;
		
		for(i="#ARGUMENTS.start#";i<="#end#";i++)
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
		/* return success */
		return collection;
	}
	
	/* count */
	public numeric function count()
	{
		var qry = "";
		var q=new query();
		q.setdatasource(dsnConference);
		q.setsql('SELECT COUNT(PersonID) AS total
			FROM Contact.Person');
		qry=q.execute().getresult();
		return qry.total[1];
	}

}
