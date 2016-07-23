component{
	this.name = "Conference";
	this.approot = getDirectoryFromPath(getCurrentTemplatePath()); 
	this.mappings[ "/conference" ] = this.approot;
}