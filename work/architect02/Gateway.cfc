/*
********************************************************************************
Author      	:	Shirak Avakian
Email       	:	Shirak.Avakian@Qbillc.com
Company  		: 	QBI LLC
Date        	:	@{Date}
Component Name  : 	Gateway.cfc
Description :
	A description about this page
********************************************************************************
*/
component displayname="Gateway"  hint="I'm the gate keeper for any incoming request request" output="false"
{	
	public CFSummit2016.work.architect02.Gateway function init(){
		return this;
	}
	
	public CFSummit2016.work.architect02.Bedroom.Gateway function getBedroom1Gateway(){
		return new CFSummit2016.work.architect02.Bedroom.Gateway();
	}
	
	
}