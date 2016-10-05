component output="false"
{

	/* init */
	public any function init()
	{
		var INSTANCE = {};
		INSTANCE.dao = createObject('component', 'AddressDAO').init();
		return this;
	}

	/* getAll */
	public Address[] function getAll()
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		/* get all records from database */
		var q= new query();
		q.setdatasource('dsnConference');
		q.setsql('SELECT * FROM Contact.Address');
		qry=q.execute().getresult();
		/* load value objects */
		for(i=1;i<="#qry.recordcount#";i++)
		{
			obj = createObject('component', 'Address').init();
			if( !isNull( qry.Addressid[i] ) && len( qry.Addressid[i] ) ) obj.setAddressid(qry.Addressid[i]);
			if( !isNull( qry.Addresstypeid[i] ) && len( qry.Addresstypeid[i] ) ) obj.setAddresstypeid(qry.Addresstypeid[i]);
			if( !isNull( qry.Address1[i] ) && len( qry.Address1[i] ) ) obj.setAddress1(qry.Address1[i]);
			if( !isNull( qry.Address2[i] ) && len( qry.Address2[i] ) ) obj.setAddress2(qry.Address2[i]);
			if( !isNull( qry.City[i] ) && len( qry.City[i] ) ) obj.setCity(qry.City[i]);
			if( !isNull( qry.State[i] ) && len( qry.State[i] ) ) obj.setState(qry.State[i]);
			if( !isNull( qry.Zipcode[i] ) && len( qry.Zipcode[i] ) ) obj.setZipcode(qry.Zipcode[i]);
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
	public Address[] function ngetAll_paged(numeric start,numeric count)
	{
		var collection = [];
		var obj = '';
		var qry = '';
		var i = 0;
		var end=0;
		/* get all records from database */
		var q= new query();
		q.setdatasource(dsnConference);
		q.setsql('SELECT * FROM Contact.Address');			
		qry=q.execute().getresult();
		
		/* load value objects */
		if((ARGUMENTS.start + ARGUMENTS.count - 1) GTE qry.recordcount)
			end =  qry.recordcount;
		else
			end= ARGUMENTS.start + ARGUMENTS.count - 1;
		
		for(i="#ARGUMENTS.start#";i<="#end#";i++)
			{
			 obj = createObject('component', 'Address').init();
			if( !isNull( qry.Addressid[i] ) && len( qry.Addressid[i] ) ) obj.setAddressid(qry.Addressid[i]);
			if( !isNull( qry.Addresstypeid[i] ) && len( qry.Addresstypeid[i] ) ) obj.setAddresstypeid(qry.Addresstypeid[i]);
			if( !isNull( qry.Address1[i] ) && len( qry.Address1[i] ) ) obj.setAddress1(qry.Address1[i]);
			if( !isNull( qry.Address2[i] ) && len( qry.Address2[i] ) ) obj.setAddress2(qry.Address2[i]);
			if( !isNull( qry.City[i] ) && len( qry.City[i] ) ) obj.setCity(qry.City[i]);
			if( !isNull( qry.State[i] ) && len( qry.State[i] ) ) obj.setState(qry.State[i]);
			if( !isNull( qry.Zipcode[i] ) && len( qry.Zipcode[i] ) ) obj.setZipcode(qry.Zipcode[i]);
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
		q.setsql('SELECT COUNT(AddressID) AS total
			FROM Contact.Address');
		qry=q.execute().getresult();
		return qry.total[1];
	}

}
