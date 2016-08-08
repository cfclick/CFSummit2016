component  output="false"
{
	public struct function initDI( any dependency ){
		
		variables.config = new conference.Config();
		var metadata = getMetaData(arguments.dependency);
		var cfc = createobject(metadata.fullName);
		for ( property in metadata.properties )
		{
			var key = ListFirst(property.inject,":");
			var file = ListLast(property.inject,":");	
			var map = config.getPathByKey(key);
			var fullpath = map & '.' & file;
			var injectedObject = createobject( fullpath ).init();
			cfc[property.name] = injectedObject;
		}
		
		return cfc;
	}
}