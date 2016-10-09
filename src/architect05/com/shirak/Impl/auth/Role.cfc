component output="false" accessors="true" extends="conference.Impl.BusinessEntities.BaseEntity"
{
	/* properties */
	property name="Roleid" type="numeric" ;
	property name="Name" type="string" ;
	property name="Decription" type="string" ;
	
	/* init */
	function init()
	{
		return this;
	}
}
