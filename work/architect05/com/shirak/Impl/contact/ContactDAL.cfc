component extends="conference.Impl.BaseDAL" output="false"
{
	function init(any dependency){
		if( isdefined('arguments.dependency'))
			super.init(arguments.dependency);
		
		this.personDAO = new PersonDAO(); 
		return this;
	}
}