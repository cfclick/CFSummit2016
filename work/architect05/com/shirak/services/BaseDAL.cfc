component output="false"
{
	function init(any dependency){
		var metadata = getMetaData(arguments.dependency);
		if( !findnocase( 'conference.services', metadata.fullName ) )
			throw(message="Invalid request",detail="Request should be initiated from services");
	}
}