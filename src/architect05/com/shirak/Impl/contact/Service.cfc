
component extends="conference.Impl.BaseService" output="false"
{
	public Service function init(){	
		this.AddressService = new AddressService();
		this.personService = new PersonService();
		return this;
	}
	
}