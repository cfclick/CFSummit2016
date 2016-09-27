component output="false" extends="conference.BusinessEntities.BaseEntity" 
{
	property type="string" name="IdentityID";
	property type="Login" name="login";
	property type="numeric" name="personID";
	property type="Role[]" name="arrayOfRole"; 
}