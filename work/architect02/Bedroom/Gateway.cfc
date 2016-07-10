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
	import CFSummit2016.work.architect02.Bedroom.*;
	
	public Gateway function init(){
		variables.getChair = new Chair(); 		
		return this;
	}
	
	public string function getChairColor(){
		return getChair.getChairColor();
	}
	
}