<!---<cfhtmltopdf source="http://www.foxnews.com/" destination="foxnews.pdf" overwrite="true" orientation="landscape" />--->

<cfpdf action="getinfo" name="info" source="foxnews.pdf" >
<cfdump var="#info#">

<cfpdf action="export" type="metadata" exportTo="xmp/foxnews.xmp" source="foxnews.pdf" overwrite="yes" >

<cfpdf action="sanitize" source="foxnews.pdf" destination="foxnews_senitized.pdf" overwrite="yes" >

<cfpdf action="getinfo" name="info2" source="foxnews_senitized.pdf" >
<cfdump var="#info2#">

<cfpdf action="import" type="metadata" importfrom="xmp/foxnews.xmp" source="foxnews_senitized.pdf" destination="foxnews_imported.pdf" overwrite="yes" >

<cfpdf action="getinfo" name="info3" source="foxnews_imported.pdf" >
<cfdump var="#info3#">