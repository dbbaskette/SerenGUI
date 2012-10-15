<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
  
    <title>networkHeader</title>
    
    <style type="text/css">
    
    body {
      color:#000000;
      background-color:#C0C0C0;
    }
    a  { color:#0000FF; }
    a:visited { color:#800080; }
    a:hover { color:#008000; }
    a:active { color:#FF0000; }
   
 td.operations{

}
table.internal {
	border-style: solid;
	border-width: 1px;
	margin-left: auto;
	margin-right: auto;
	height:100px;
	width:210px;
}    

td.bdr2 {
	border-style: solid;
	border-width: 1px;
	background-color: #015697;
	color: #FFFFFF;
}

th.bdr2 {
	background-color:#8cc63e;

}

button.selection{
	height:35px;
	width:200px;
	margin:0px;
	padding:0px;
}

input.selection{
	height:35px;
	width:200px;
	margin:0px;
	padding:0px;
}
 
a.selection{

	text-decoration:none;
}  
    
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
  <form method="post" action="/clusterPower">
  <table class="internal">
				<tr>
					<td  colspan="3" class="bdr2">
						<p class="caption">Available Clusters</p>
					</td>
				</tr>
				<tr>
  	
			    	<th class="bdr2"></th>
					<th class="bdr2">Name</th>
					<th class="bdr2">Status</th>
			    </tr>
			    %for cluster in clusters:
			    			    	
			    <tr>
			    	<td><input type="checkbox" name="clusters" value="{{cluster['name']}}">
					<td><a href="http://localhost:8010/clusters/{{cluster['name']}}" target="clusterDetail">{{cluster['name']}}</a></td>
					<td>{{cluster['status']}}</td>
					
				</tr>	
				 
				
				%end
				</tr>
			</table>
		</tr>
		<tr>
		
		
		
			<table class="internal">
				<tr>
					<td class="bdr2">
						<p class="caption">Power Operations</p>
					</td>
				</tr>
				<tr>
					<td class="operations">
						<input class="selection" type="submit" name="start" value="Power On">
  					</td
				</tr>
				<tr>	
					<td class="operations">
						<input class="selection" type="submit" name="stop" value="Power Off">
  					</td
				</tr>
			</table>
	</form>
	<table class="internal">
				<tr>
					<td class="bdr2">
						<p class="caption">Provisioning</p>
					</td>
				</tr>
				<tr>
					<td class="operations">
				 		<a class="selection" href="/addCluster/clusterType" target="clusterDetail"><button class="selection" type="button">Add Cluster</button></a>
				 	</td>
				</tr>
				<tr>	
					<td class="operations">
						<a class="selection" href="/removeCluster" target="clusterDetail"><button class="selection" type="button">Remove Cluster</button></a>
  					</td
				</tr>
			</table>
	
	
  </body>
</html>