<cfscript>
	gate = new conference.Impl.auth.Gateway();
	writeDump(gate);
	writeDump(gate.LOGIN('shirak','123'));
	writeDump(gate.listRoles());
</cfscript>
