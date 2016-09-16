/*
********************************************************************************
Author      	:	Shirak Avakian
Email       	:	ShirakAvakian@gmail.com
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
	public Chair function GetChair(){
		if( this.hasChair )
			return new Chair();
	}
	
	public KingBed function GetKingBed(){
		if( this.hasBed )
			return new KingBed();
	}
	
	public TV function GetTV(){
		if( this.hasTV )
			return new TV();
	}
	
	public AC function GetAC(){
		if( this.hasAC )
			return new AC();
	}
		
}