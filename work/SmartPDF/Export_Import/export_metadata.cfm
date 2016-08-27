<cfset destination = expandPath('./xmp/foxnews.xmp') />
<cfdump var="#destination#"><cfabort>
<cfpdf 
	action="export"
 	type="metadata" 
 	exportTo="xmp/foxnews.xmp" 
 	source="foxnews.pdf" 
 	overwrite="yes" 
/>