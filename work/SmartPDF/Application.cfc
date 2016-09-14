component  output="false"
{
	this.name = hash(getDirectoryFromPath(getCurrentTemplatePath())) & "_SmartPDF";
	this.root = getDirectoryFromPath(getCurrentTemplatePath());
	this.mappings = {};
	this.mappings['/SmartPDF'] = this.root;
}