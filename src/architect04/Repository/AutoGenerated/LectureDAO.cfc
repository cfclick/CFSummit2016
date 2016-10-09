component output="false"
{
	/* read */
	public Lecture function getById(required numeric lectureID)
	{
		var id = arguments.lectureID;
		var lecture = new Lecture();
		var i = 1;
		var qry="";
		
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT lectureid,title,description,stratdatetime,enddatetime,
						  createdby,createddatetime,updatedby,updateddatetime
						  FROM Conf.Lecture
						  where lectureid = #id#" );
		}
		
		/* load value object */
		if( qry.recordcount > 0 ){
			lecture.setLectureID(qry.LectureID[i]);
			lecture.setTitle(qry.Title[i]);
			lecture.setDescription(qry.Description[i]);
			lecture.setStratDateTime(qry.StratDateTime[i]);
			lecture.setEndDateTime(qry.EndDateTime[i]);
			lecture.setCreatedBy(qry.CreatedBy[i]);
			lecture.setCreatedDateTime(qry.CreatedDateTime[i]);
			lecture.setUpdatedBy(qry.UpdatedBy[i]);
			lecture.setUpdatedDateTime(qry.UpdatedDateTime[i]);
		}
		/* return success */
		return lecture;
	}
	
	/* getAll */
	public Lecture[] function getAll()
	{
		var arrayOfLecture = [];
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
			for( i=1; i <= qry.recordcount; i++ )
			{
				lecture = new Lecture();
				if( !isNull( qry.Lectureid[i] ) && len( qry.Lectureid[i] ) ) lecture.setLectureid(qry.Lectureid[i]);
				if( !isNull( qry.Title[i] ) && len( qry.Title[i] ) ) lecture.setTitle(qry.Title[i]);
				if( !isNull( qry.Description[i] ) && len( qry.Description[i] ) ) lecture.setDescription(qry.Description[i]);
				if( !isNull( qry.Stratdatetime[i] ) && len( qry.Stratdatetime[i] ) ) lecture.setStratdatetime(qry.Stratdatetime[i]);
				if( !isNull( qry.Enddatetime[i] ) && len( qry.Enddatetime[i] ) ) lecture.setEnddatetime(qry.Enddatetime[i]);
				if( !isNull( qry.Createdby[i] ) && len( qry.Createdby[i] ) ) lecture.setCreatedby(qry.Createdby[i]);
				if( !isNull( qry.Createddatetime[i] ) && len( qry.Createddatetime[i] ) ) lecture.setCreateddatetime(qry.Createddatetime[i]);
				if( !isNull( qry.Updatedby[i] ) && len( qry.Updatedby[i] ) ) lecture.setUpdatedby(qry.Updatedby[i]);
				if( !isNull( qry.Updateddatetime[i] ) && len( qry.Updateddatetime[i] ) ) lecture.setUpdateddatetime(qry.Updateddatetime[i]);
				arrayAppend( arrayOfLecture, lecture );
			}
		}
		/* return success */
		return arrayOfLecture;
	}
	
}