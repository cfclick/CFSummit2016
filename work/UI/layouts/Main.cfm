﻿<cfoutput>#html.doctype()#<html lang="en"><head>	<meta charset="utf-8">	<title>Welcome to Coldbox!</title>	<meta name="description" content="ColdBox Application Template">    <meta name="author" content="Ortus Solutions, Corp">	<!---Base URL --->	<base href="#getSetting("HTMLBaseURL")#" />	<!---css --->		<link href="includes/css/bootstrap.min.css" rel="stylesheet"><link href="includes/css/full-width-pics.css" rel="stylesheet">	<link href="includes/css/conference.css" rel="stylesheet">	<!---js --->    <script src="includes/js/jquery.js"></script>	<script src="includes/js/bootstrap.min.js"></script>	<style>	 /* Utility */	.centered { text-align: center !important; }	.inline{ display: inline !important; }	.margin10{ margin: 10px; }	.padding10{ padding: 10px; }	.margin0{ margin: 0px; }	.padding0{ padding: 0px; }	.footer {	  margin-top: 45px;	  padding: 35px 35px;	  border-top: 1px solid ##e5e5e5;	}	.footer p {	  margin-bottom: 0;	  color: ##555;	}	body{ padding-top: 50px; }	</style></head><body data-spy="scroll">	<!---Top NavBar --->	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">		<div class="container-fluid">			<!---Brand --->			<div class="navbar-header">				<!---Responsive Design --->				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="##navbar-collapse">					<span class="sr-only">Toggle navigation</span>				    <span class="icon-bar"></span>				    <span class="icon-bar"></span>				    <span class="icon-bar"></span>				</button>				<!---Branding --->				<a class="navbar-brand" href="#event.buildLink('')#"><strong>CFSummit (#Year(now())#)</strong></a>			</div>					</div> <!---end container --->	</nav> <!---end navbar ---><div id="body_container" class="image-bg-fluid-height">	<!---Container And Views --->	<div class="container-fluid">#renderView()#</div><footer class="footer">				<p>			<a href="https://cfsummit.adobeevents.com/">ColdFusion Summit 2016</a> is a copyright-trademark software by			<a href="##">Shirak Avakian</a>		</p>		<p>			Design thanks to			<a href="http://twitter.github.com/bootstrap">Twitter Boostrap</a>		</p>	</footer>	</div>	<script>	$(function() {		// activate all drop downs		$('.dropdown-toggle').dropdown();		// Tooltips		$("[rel=tooltip]").tooltip();	})	</script></body></html></cfoutput>