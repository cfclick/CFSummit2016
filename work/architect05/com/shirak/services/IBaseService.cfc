interface 
{
	Pakcage Conference.Config function getConfig();
	Package void function suppressError( any Exception,boolean sendEmail=true, boolean logIt=true, any object );
}