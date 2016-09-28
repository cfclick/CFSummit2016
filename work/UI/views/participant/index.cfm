<cfoutput>
	<h4>
		Welcome to participants
	</h4>
	
	<div class="row">
	  <div class="col-md-6">
	  	Participants
	  	<ul class="list-group">
	  	<cfloop array="#rc.participants#" index="participant" >
			<li class="list-group-item">#participant.getName()#</li>
	  	</cfloop>
	  	</ul>
	  </div>
	  <div class="col-md-6">
	  	Participants REST
	  	<ul class="list-group">
	  	<cfloop array="#rc.participantREST#" index="participant" >
			<li class="list-group-item">#participant.Name#</li>
	  	</cfloop>
	  	</ul>
	  </div>
	</div>
	<cfoutput>#CGI.server_NAME#:#cgi.SERVER_PORT#</cfoutput>
</cfoutput>