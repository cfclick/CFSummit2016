component output="false" accessors="true" extends="conference.BusinessEntities.BaseEntity"
{
	/* properties */
	property name="Roleid" type="numeric" ;
	property name="Name" type="string" ;
	property name="Decription" type="string" ;
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
