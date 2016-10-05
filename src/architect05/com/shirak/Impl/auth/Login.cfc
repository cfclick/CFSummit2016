component output="false" accessors="true" extends="conference.Impl.BusinessEntities.BaseEntity"
{
	/* properties */
	property name="Loginid" type="numeric" ;
	property name="Username" type="string" ;
	property name="Password" type="string" ;
	
	/* init */
	function init()
	{
		return this;
	}
}
