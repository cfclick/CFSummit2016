/*
********************************************************************************
Author      	:	Shirak Avakian
Email       	:	Shirak.Avakian@Qbillc.com
Company  		: 	QBI LLC
Date        	:	@{Date}
Component Name  : 	AC.cfc
Description :
	A description about this page
********************************************************************************
*/
component displayname="AC unit"  output="false"
{
	package string function getACType(){
		return "carrier";
	}
}