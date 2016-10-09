component  output="false" 
{
	import conference.Impl.BusinessEntities.*;
	
	public BaseTranslator function init(){
		return this;
	}
	
	public Address[] function toArrayOfAddress( required query qryResultSet ) {
		var qry = arguments.qryResultSet;
		var arrayOfAddress = [];
		
		for( var row in qry ) {
			var obj = toAddress( row );
			arrayOfAddress.append( obj );
		}
		return arrayOfAddress;
	}
	
	public Address function toAddress( required struct procResultSet ) {
		var add = arguments.procResultSet;
		
		var address = new Address();	
		address.setAddressID( add.AddressID );
		address.setAddressTypeID( add.AddressTypeID );
		address.setAddress1( add.Address1 );
		address.setAddress2( add.Address2 );
		address.setCity( add.City );
		address.setState( add.State );
		address.setZipCode( add.ZipCode );
		address.setIsActive( add.IsActive );
		address.setcreatedBy( add.createdBy );
		address.setcreatedDateTime( add.createdDateTime );
		address.setupdatedBy( add.updatedBy );
		address.setupdatedDateTime( add.updatedDateTime ) ;
		return address;
	}
}