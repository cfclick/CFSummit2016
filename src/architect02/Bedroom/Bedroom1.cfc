/*
********************************************************************************
Author      	:	Shirak Avakian
Email       	:	Shirak.Avakian@Qbillc.com
Company  		: 	QBI LLC
Date        	:	@{Date}
Component Name  : 	Bedroom1.cfc
Description :
	A description about this page
********************************************************************************
*/
component displayname="Bedroom1"  output="false"
{
	import Chair;
	import Kingbed;
	import TV;
	import AC;
	
	public Bedroom1 function init(){
		this.hasChair = hasChair();
		this.hasBed = hasBed();
		this.hasTV = hasTV();
		this.hasAC = hasAC();
		return this;
	}
	
	/** Private methods **/
	private boolean function hasChair(){
		return true;
	}
	
	private boolean function hasBed(){
		return true;
	}
	
	private boolean function hasTV(){
		return true;
	}
	
	private boolean function hasAC(){
		return true;
	}
	
	private boolean function hasFurniture(){
		return true;
	}
	
	/** public method **/
	package Chair function GetChair(){
		if( this.hasChair )
			return new Chair();
	}
	
	package KingBed function GetKingBed(){
		if( this.hasBed )
			return new KingBed();
	}
	
	package TV function GetTV(){
		if( this.hasTV )
			return new TV();
	}
	
	package AC function GetAC(){
		if( this.hasAC )
			return new AC();
	}
		
}