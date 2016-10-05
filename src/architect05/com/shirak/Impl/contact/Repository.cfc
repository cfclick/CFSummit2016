
component displayname="ContactRepository"  extends="conference.Impl.BaseRepository" output="false"
{
	public Repository function init(){	
		super.init();
		variables.dsn = getDataSource('Conference');//Conference
		this.PersonDAO = new PersonDAO(dsn);
		this.addressDAO = new AddressDAO(dsn);
		variables.dsn = getDataSource('Conference');//Conference
		return this;
	}
	
	package query function getPersonAddress( required numeric personID ){
		var id = arguments.personID;
		
		var qry = "";
		cfquery( name="qry", datasource=dsn  ){
			writeOutput( "SELECT pa.[PersonAddressID]
					      ,pa.[PersonID]
					      ,pa.[AddressID]
						  ,ad.AddressTypeID
					      ,pa.[IsActive]
					      ,pa.[CreatedBy]
					      ,pa.[CreatedDateTime]
					      ,pa.[UpdatedBy]
					      ,pa.[UpdatedDateTime]
						  ,ad.Address1
						  ,ad.address2
						  ,ad.City
						  ,ad.[State]
						  ,ad.ZipCode
					  FROM [Conference].[Map].[PersonAddress] pa
					  INNER JOIN Contact.[Address] ad on pa.AddressID = ad.AddressID
					  WHERE pa.PersonID = #id#" );
		}	
		return qry;
	}
	
}