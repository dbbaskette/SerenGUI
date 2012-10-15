<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
  
    <title>datastoreSelection</title>
    
    <style type="text/css">
   
	    body {
	      color:#000000;
	      background-color:#C0C0C0;
	    }
	    a  { color:#0000FF; }
	    a:visited { color:#800080; }
	    a:hover { color:#008000; }
	    a:active { color:#FF0000; }
	   
	    table {	padding:0px;
				font-size:14px;
				border-width: 1px;
				border-color: black;
				border-style: solid;
				margin-bottom: 25px;
				margin-left: auto;
				margin-right: auto;
				text-align:center;
				width:100% }
		
		table th{	padding:3px;
					font-size:14px;
					border-width: 1px;
					border-color: black;
					border-style: solid}
		table td{	padding:3px;
					font-size:14px;
					border-width: 1px;
					border-color: black;
					border-style: solid}
		caption: {font-size:16px}
   
   
   
   
    </style>
     
    
    <!--[if IE]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
  <body>
  <center>
  	<table>
		<caption>Available Datastores</caption>
	    <tr>
			<th>Name</th>
			<th>Type</th>
	    </tr>
	    %for ds in datastores:
	     	<tr>
				<td><a href="http://localhost:8010/datastores/{{ds['name']}}" target="datastoreDetail">{{ds['name']}}</a></td>
				<td>{{ds['type']}}</td>
		 	</tr>			
		 %end
	</table>
		</center>
		<table
			 	style="
			 		border-style:none;
			 		border-width:0px
			 		width:140px;
			 		margin-left: auto;
					margin-right: auto;
					padding:0px;
					cursor:default">
			<caption>Operations</caption>
			 	<tr>
			 		<td
			 			style="border-width:0px;
			 			padding:0px;">
			 	
				 	<a href="/addDatastore" target=datastoreDetail><img src="/static/images/addDatastore.png" width="140" height="30" alt="" title="" border="0" 
				 		onmouseover="this.src='/static/images/addDatastore2.png'"
						onmouseout="this.src='/static/images/addDataStore.png'" /> 
				 	</a>
				 </td>
			 	</tr>
			 	<tr>
			 		<td style="border-width:0px;
			 		padding:0px;">
			 		<a href="/removeDatastore" target=datastoreDetail><img src="/static/images/removeDatastore.png" width="140" height="30" alt="" title="" border="0" 
				 		onmouseover="this.src='/static/images/removeDatastore2.png'"
						onmouseout="this.src='/static/images/removeDatastore.png'" /> 
				 	</a>	
				 	</td>
			 	</tr>
			 	
	  </table>
  </body>
</html>