
component extends="conference.Impl.BaseTranslator" output="false"
{
	import conference.Impl.BusinessEntities.Person;
	
	public Translator function init(){
		return this;
	}
	
	public Person[] function toArrayOfPerson( required query qryResultSet ) {
		var qry = arguments.qryResultSet;
		var arrayOfPerson = [];
		
		for( var person in qry ) {
			var obj = toPerson( person );
			arrayOfPerson.append( obj );
		}

		return arrayOfPerson;
	}
	
	public Person function toPerson( required struct qryRowResultSet ) {
		var qRow = arguments.qryRowResultSet;
		var person = new Person();
		person.setPersonID(qRow.PersonID);
		person.setPersonTypeID(qRow.PersonTypeID);
		person.setConferenceID(qRow.ConferenceID);
		person.setName(qRow.Name);
		person.setGender(qRow.Gender);
		person.setIsActive(qRow.IsActive);
		person.setCreatedBy(qRow.CreatedBy);
		person.setCreatedDateTime(qRow.CreatedDateTime);
		person.setUpdatedBy(qRow.UpdatedBy);
		person.setUpdatedDateTime(qRow.UpdatedDateTime);
		return person;
	}
	
	
	
	/*public ContactAddress function toContactAddress( required struct procResultSet ) {
		var add = arguments.procResultSet;
		var ContactAddress = new ContactAddress();	
		ContactAddress.AddressID = add.AddressID;
		ContactAddress.AddressTypeID = add.AddressTypeID;
		ContactAddress.Address1 = add.Address1;
		ContactAddress.Address2 = add.Address2;
		ContactAddress.City = add.City;
		ContactAddress.State = add.State;
		ContactAddress.ZipCode = add.ZipCode;
		ContactAddress.IsActive = add.IsActive;
		ContactAddress.AddressTypeName = add.AddressTypeName;
		ContactAddress.baseEntity = new BaseEntity();
		ContactAddress.baseEntity.createdBy = add.createdBy;
		ContactAddress.baseEntity.createdDateTime = add.createdDateTime;
		ContactAddress.baseEntity.updatedBy = add.updatedBy;
		ContactAddress.baseEntity.updatedDateTime = add.updatedDateTime;
		return ContactAddress;
	}
	
	
	public ContactAddress[] function toArrayOfContactAddress( required query qryResultSet ) {
		var address_qry = arguments.qryResultSet;
		var ContactAddresses = [];
		
		for( var address in address_qry ) {
			var contactAddress = toContactAddress( address );
			ContactAddresses.append( contactAddress );
		}

		return ContactAddresses;
	}*/
	
	public Role[] function toArrayOfRole( required query procResultSet ) {
		var roles = arguments.procResultSet;
		var arrayOfRole = [];
		for( var roleRow in roles ) {
			arrayOfRole.append(toRole( roleRow ) );
		}
		return arrayOfRole;
	}
	
	public Role function toRole( required struct queryRow ) {
		var row = arguments.queryRow;
		
		var role = new Role();
		role.roleID = row.roleID;	
		role.name = row.name;	
		role.decription = row.Decription ?: '';	
		if( isdefined("row.Createdby"))
			role.createdby = row.Createdby;	
		if( isdefined("row.Createddatetime"))
			role.createddatetime = row.Createddatetime;
		if( isdefined("row.Updatedby"))	
			role.updatedby = row.Updatedby;	
		if( isdefined("row.Updateddatetime"))
			role.updateddatetime = row.Updateddatetime;
	
			
		return role;
	}
}