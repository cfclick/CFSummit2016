<cfoutput>


<div class="row">
	<div class="col-md-10">
		
	</div>

	<!---Side Bar --->
	<div class="col-md-2">
		<div class="well">
			<ul class="nav nav-list">
				<cfloop list="#getSetting("RegisteredHandlers")#" index="handler">
				<li><a href="#event.buildLink( handler )#">#handler#</a></li>
				</cfloop>
				
			</ul>
		</div>
	</div>
</div>
</cfoutput>