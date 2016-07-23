component output="false" accessors="true" 
{
	/* properties */
	property name="Addressid" type="numeric" ;
	property name="Addresstypeid" type="numeric" ;
	property name="Address1" type="string" ;
	property name="Address2" type="string" ;
	property name="City" type="string" ;
	property name="State" type="string" ;
	property name="Zipcode" type="string" ;
	property name="Isactive" type="numeric" ;
	property name="Createdby" type="string" ;
	property name="Createddatetime" type="date" ;
	property name="Updatedby" type="string" ;
	property name="Updateddatetime" type="date" ;
	
	/* init */
	function init()
	{
		return this;
	}
}
