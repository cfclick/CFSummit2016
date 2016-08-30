<cfoutput>
	<cfscript>
    	  prop = {};
    	  prop.TrackingNumber = CreateUUID();
    	  prop.WorkflowID = 100;
    	
    </cfscript>

	<h3>Custom Properties</h3>
	
	<p>Key: TrackingNumber Value: #prop.TrackingNumber#</p>
	
	<p>Key: WorkflowID Value: #prop.WorkflowID#</p>
	
	
	<a href="addCustomProp.cfm?TN=#prop.TrackingNumber#&WF=#prop.WorkflowID#" target="_self">Create The properties</a>
	
</cfoutput>