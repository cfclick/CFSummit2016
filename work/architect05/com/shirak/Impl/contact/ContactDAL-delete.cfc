component extends="conference.Impl.BaseDAL" output="false"
{
	function init(any dependency){
		if( isdefined('arguments.dependency'))
			super.init(arguments.dependency);
		
		this.personDAO = new PersonDAO();
		this.addressDAO = new AddressDAO(); 
		return this;
	}
	
	package query function getPersonAddress( required numeric personID ){
		var id = arguments.personID;
		var qry = "";
		cfquery( name="qry", datasource="dsnConference"  ){
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