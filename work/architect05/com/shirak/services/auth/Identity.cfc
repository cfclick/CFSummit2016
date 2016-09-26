component output="false" extends="conference.BusinessEntities.BaseEntity" 
{
	property type="string" name="IdentityID";
	property type="conference.services.auth.Login" name="login";
	property type="numeric" name="personID";
	property type="conference.services.auth.Role[]" name="arrayOfRole"; 
}