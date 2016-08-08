component output="false"
{

	/* init */
	public any function init()
	{
		var INSTANCE = {};
		INSTANCE.dao = createObject('component', 'LoginroleDAO').init();
		return this;
	}

	/* getAll */
	public Loginrole[] function getAll()
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		/* get all records from database */
		var q= new query();
		q.setdatasource('dsnConference');
		q.setsql('SELECT * FROM Auth.LoginRole');
		qry=q.execute().getresult();
		/* load value objects */
		for(i=1;i<="#qry.recordcount#";i++)
		{
			obj = createObject('component', 'Loginrole').init();
			if( !isNull( qry.Loginroleid[i] ) && len( qry.Loginroleid[i] ) ) obj.setLoginroleid(qry.Loginroleid[i]);
			if( !isNull( qry.Loginid[i] ) && len( qry.Loginid[i] ) ) obj.setLoginid(qry.Loginid[i]);
			if( !isNull( qry.Roleid[i] ) && len( qry.Roleid[i] ) ) obj.setRoleid(qry.Roleid[i]);
			if( !isNull( qry.Description[i] ) && len( qry.Description[i] ) ) obj.setDescription(qry.Description[i]);
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
	public Loginrole[] function ngetAll_paged(numeric start,numeric count)
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		var end=0;
		/* get all records from database */
		var q= new query();
		q.setdatasource(dsnConference);
		q.setsql('SELECT * FROM Auth.LoginRole');			
		qry=q.execute().getresult();
		
		/* load value objects */
		if((ARGUMENTS.start + ARGUMENTS.count - 1) GTE qry.recordcount)
			end =  qry.recordcount;
		else
			end= ARGUMENTS.start + ARGUMENTS.count - 1;
		
		for(i="#ARGUMENTS.start#";i<="#end#";i++)
			{
			 obj = createObject('component', 'Loginrole').init();
			if( !isNull( qry.Loginroleid[i] ) && len( qry.Loginroleid[i] ) ) obj.setLoginroleid(qry.Loginroleid[i]);
			if( !isNull( qry.Loginid[i] ) && len( qry.Loginid[i] ) ) obj.setLoginid(qry.Loginid[i]);
			if( !isNull( qry.Roleid[i] ) && len( qry.Roleid[i] ) ) obj.setRoleid(qry.Roleid[i]);
			if( !isNull( qry.Description[i] ) && len( qry.Description[i] ) ) obj.setDescription(qry.Description[i]);
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
		q.setsql('SELECT COUNT(LoginRoleID) AS total
			FROM Auth.LoginRole');
		qry=q.execute().getresult();
		return qry.total[1];
	}

}
