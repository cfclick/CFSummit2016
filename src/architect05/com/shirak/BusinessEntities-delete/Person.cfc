component output="false" accessors="true" extends="conference.Impl.BusinessEntities.BaseEntity"
{
	/* properties */
	property name="Personid" type="numeric" ;
	property name="Persontypeid" type="numeric" ;
	property name="Conferenceid" type="numeric" ;
	property name="Name" type="string" ;
	property name="Gender" type="string" ;
	
	/* init */
	function init()
	{
		return this;
	}
}
