component output="false"
{
	
	public any function init()
	{
			return this ;
	}
	
	/* getAll */
	public Lecture[] function listAll()
	{
		var arrayOfLecture = [];
		var lecture = '';
		var qry = '';
		var i = 0;
		/* get all records from database */
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT * FROM Conf.Lecture" );
		}
		
		for(i=1;i<=qry.recordcount;i++)
		{
			lecture = new Lecture();
			if( !isNull( qry.Lectureid[i] ) && len( qry.Lectureid[i] ) ) lecture.setLectureid(qry.Lectureid[i]);
			if( !isNull( qry.Title[i] ) && len( qry.Title[i] ) ) lecture.setTitle(qry.Title[i]);
			if( !isNull( qry.Description[i] ) && len( qry.Description[i] ) ) lecture.setDescription(qry.Description[i]);
			if( !isNull( qry.Stratdatetime[i] ) && len( qry.Stratdatetime[i] ) ) lecture.setStratdatetime(qry.Stratdatetime[i]);
			if( !isNull( qry.Enddatetime[i] ) && len( qry.Enddatetime[i] ) ) lecture.setEnddatetime(qry.Enddatetime[i]);
			if( !isNull( qry.Createdby[i] ) && len( qry.Createdby[i] ) ) lecture.setCreatedby(qry.Createdby[i]);
			if( !isNull( qry.Crerateddatetime[i] ) && len( qry.Crerateddatetime[i] ) ) lecture.setCrerateddatetime(qry.Crerateddatetime[i]);
			if( !isNull( qry.Updatedby[i] ) && len( qry.Updatedby[i] ) ) lecture.setUpdatedby(qry.Updatedby[i]);
			if( !isNull( qry.Updateddatetime[i] ) && len( qry.Updateddatetime[i] ) ) lecture.setUpdateddatetime(qry.Updateddatetime[i]);
			arrayAppend(arrayOfLecture, lecture);
		}
		/* return success */
		return arrayOfLecture;
	}
	
	/* read */
	public Lecture function getById(id)
	{		
		var lecture = new Lecture();
		var i = 1;
		var qry="";
		
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT lectureid,title,description,stratdatetime,enddatetime,
					createdby,crerateddatetime,updatedby,updateddatetime
			FROM Conf.Lecture
			where lectureid = #ARGUMENTS.id#" );
		}
		
		if( qry.recordcount > 0 ){
			lecture.setLectureID(qry.LectureID[i]);
			lecture.setTitle(qry.Title[i]);
			lecture.setDescription(qry.Description[i]);
			lecture.setStratDateTime(qry.StratDateTime[i]);
			lecture.setEndDateTime(qry.EndDateTime[i]);
			lecture.setCreatedBy(qry.CreatedBy[i]);
			lecture.setCreratedDateTime(qry.CreratedDateTime[i]);
			lecture.setUpdatedBy(qry.UpdatedBy[i]);
			lecture.setUpdatedDateTime(qry.UpdatedDateTime[i]);
		}
		
		return lecture;
	}
	
	public Lecture[] function listLecturesByPersonID( required numeric personID ){
		var id = arguments.personID;
		var arrayOfPersonLecture = [];
		var i = 1;
		var qry = "";
		cfquery( name="qry", datasource="dsnConference"  ){
			writeOutput( "SELECT 
							    lec.LectureID
							   ,lec.Title LectureTitle
							   ,lec.[Description] LectureDescription
							   ,lec.StratDateTime
							   ,lec.EndDateTime
							   ,lec.CreatedBy
							   ,lec.CreatedDateTime
							   ,lec.UpdatedBy
							   ,lec.UpdatedDateTime
						FROM Map.PersonLecture pl
						INNER JOIN Contact.Person p on pl.PersonID = p.PersonID
						LEFT JOIN Conf.Lecture lec on pl.LectureID = lec.LectureID
						WHERE p.PersonID = #id#" );
		}
		if( qry.recordcount > 0 ){	
			for(var q in qry )
			{
				var lecture = new Lecture();				
				lecture.setLectureID(qry.LectureID[i]);
				lecture.setTitle(qry.LectureTitle[i]);
				lecture.setDescription(qry.LectureDescription[i]);
				lecture.setStratDateTime(qry.StratDateTime[i]);
				lecture.setEndDateTime(qry.EndDateTime[i]);
				lecture.setCreatedBy(qry.CreatedBy[i]);
				lecture.setCreatedDateTime(qry.CreatedDateTime[i]);
				lecture.setUpdatedBy(qry.UpdatedBy[i]);
				lecture.setUpdatedDateTime(qry.UpdatedDateTime[i]);
				arrayAppend(arrayOfPersonLecture, lecture);
			}			
		}
		/* return success */
		return arrayOfPersonLecture;
	}
	
	/* create */
	public any function create( string Title, string Description= '', date StratDateTime= '01/01/1900', date EndDateTime= '01/01/1900', string CreatedBy= '', date CreratedDateTime= '01/01/1900', string UpdatedBy= '', date UpdatedDateTime= '01/01/1900' )
	{
	
	}
	
	/* update */
	public void function update(numeric LectureID,	string Title,	string Description,	date StratDateTime,	date EndDateTime,	string CreatedBy,	date CreratedDateTime,	string UpdatedBy,	date UpdatedDateTime)
	{	
	}
	
	/* delete */
	public void function delete(numeric LectureID)
	{
	}

} 
