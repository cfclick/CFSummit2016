component output="false"
{

	/* init */
	public any function init()
	{
		var INSTANCE = {};
		INSTANCE.dao = createObject('component', 'LectureDAO').init();
		return this;
	}

	/* getAll */
	public Lecture[] function getAll()
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		/* get all records from database */
		var q= new query();
		q.setdatasource('dsnConference');
		q.setsql('SELECT * FROM Conf.Lecture');
		qry=q.execute().getresult();
		/* load value objects */
		for(i=1;i<="#qry.recordcount#";i++)
		{
			obj = createObject('component', 'Lecture').init();
			if( !isNull( qry.Lectureid[i] ) && len( qry.Lectureid[i] ) ) obj.setLectureid(qry.Lectureid[i]);
			if( !isNull( qry.Title[i] ) && len( qry.Title[i] ) ) obj.setTitle(qry.Title[i]);
			if( !isNull( qry.Description[i] ) && len( qry.Description[i] ) ) obj.setDescription(qry.Description[i]);
			if( !isNull( qry.Stratdatetime[i] ) && len( qry.Stratdatetime[i] ) ) obj.setStratdatetime(qry.Stratdatetime[i]);
			if( !isNull( qry.Enddatetime[i] ) && len( qry.Enddatetime[i] ) ) obj.setEnddatetime(qry.Enddatetime[i]);
			if( !isNull( qry.Createdby[i] ) && len( qry.Createdby[i] ) ) obj.setCreatedby(qry.Createdby[i]);
			if( !isNull( qry.Crerateddatetime[i] ) && len( qry.Crerateddatetime[i] ) ) obj.setCrerateddatetime(qry.Crerateddatetime[i]);
			if( !isNull( qry.Updatedby[i] ) && len( qry.Updatedby[i] ) ) obj.setUpdatedby(qry.Updatedby[i]);
			if( !isNull( qry.Updateddatetime[i] ) && len( qry.Updateddatetime[i] ) ) obj.setUpdateddatetime(qry.Updateddatetime[i]);
			arrayAppend(collection, obj);
		}
		/* return success */
		return collection;
	}
	
	/* getAll_paged */
	public Lecture[] function ngetAll_paged(numeric start,numeric count)
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		var end=0;
		/* get all records from database */
		var q= new query();
		q.setdatasource(dsnConference);
		q.setsql('SELECT * FROM Conf.Lecture');			
		qry=q.execute().getresult();
		
		/* load value objects */
		if((ARGUMENTS.start + ARGUMENTS.count - 1) GTE qry.recordcount)
			end =  qry.recordcount;
		else
			end= ARGUMENTS.start + ARGUMENTS.count - 1;
		
		for(i="#ARGUMENTS.start#";i<="#end#";i++)
			{
			 obj = createObject('component', 'Lecture').init();
			if( !isNull( qry.Lectureid[i] ) && len( qry.Lectureid[i] ) ) obj.setLectureid(qry.Lectureid[i]);
			if( !isNull( qry.Title[i] ) && len( qry.Title[i] ) ) obj.setTitle(qry.Title[i]);
			if( !isNull( qry.Description[i] ) && len( qry.Description[i] ) ) obj.setDescription(qry.Description[i]);
			if( !isNull( qry.Stratdatetime[i] ) && len( qry.Stratdatetime[i] ) ) obj.setStratdatetime(qry.Stratdatetime[i]);
			if( !isNull( qry.Enddatetime[i] ) && len( qry.Enddatetime[i] ) ) obj.setEnddatetime(qry.Enddatetime[i]);
			if( !isNull( qry.Createdby[i] ) && len( qry.Createdby[i] ) ) obj.setCreatedby(qry.Createdby[i]);
			if( !isNull( qry.Crerateddatetime[i] ) && len( qry.Crerateddatetime[i] ) ) obj.setCrerateddatetime(qry.Crerateddatetime[i]);
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
		q.setsql('SELECT COUNT(LectureID) AS total
			FROM Conf.Lecture');
		qry=q.execute().getresult();
		return qry.total[1];
	}

}
