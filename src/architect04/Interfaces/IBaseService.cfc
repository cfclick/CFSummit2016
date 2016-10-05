interface 
{
	Conference.Config function getConfig();
	void function suppressError( any Exception,boolean sendEmail=true, boolean logIt=true, any object );
}