component output="false"
{
	/* read */
	public Lecture function read(numeric primaryId)
	{
		var id = arguments.primaryId;
		var obj = new Lecture();
		var i = 1;
		var qry="";
		
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT lectureid,title,description,stratdatetime,enddatetime,
						  createdby,crerateddatetime,updatedby,updateddatetime
						  FROM Conf.Lecture
						  where lectureid = #id#" );
		}
		
		/* load value object */
		if( qry.recordcount > 0 ){
			obj.setLectureID(qry.LectureID[i]);
			obj.setTitle(qry.Title[i]);
			obj.setDescription(qry.Description[i]);
			obj.setStratDateTime(qry.StratDateTime[i]);
			obj.setEndDateTime(qry.EndDateTime[i]);
			obj.setCreatedBy(qry.CreatedBy[i]);
			obj.setCreratedDateTime(qry.CreratedDateTime[i]);
			obj.setUpdatedBy(qry.UpdatedBy[i]);
			obj.setUpdatedDateTime(qry.UpdatedDateTime[i]);
		}
		/* return success */
		return obj;
	}
	
	/* getAll */
	public Lecture[] function getAll()
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		/* get all records from database */
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT lectureid,title,description,stratdatetime,enddatetime,
						  createdby,crerateddatetime,updatedby,updateddatetime
						  FROM Conf.Lecture" );
		}
		/* load value objects */
		if( qry.recordcount > 0 ){
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
		}
		/* return success */
		return collection;
	}
	
}