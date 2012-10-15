<!DOCTYPE html>
<html lang="en">
  <head>
    <title>EMC Greenplum / VMware Project Serengeti</title>
    
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
			margin-bottom: 25px }
	
	table th{	padding:3px;
				font-size:14px;
				border-width: 1px;
				border-color: black;
				border-style: solid}
	table td{	padding:3px;
				font-size:12px;
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
<form action="/file-out" method="post">
<input type="hidden" name="role" value="core" />

<table style="border-width:0px">
  
  <tr><!-- Description Row -->
     <td style="border-width:0px"><center>
     	<table>
		     <tr> <!-- Header Row of Inner Table -->
		     	<th>Name</th>
		        <th>Status</th>
		        <th>Distro</th>
		        <th># VMs</th>
		     </tr>
		     <tr> <!-- Data Row of Inner Table -->
		     	<td>{{clusterName}}</td>
		     	<td>{{cluster['status']}}</td>
				<td>{{cluster['distro']}}</td>
				<td>{{cluster['instanceNum']}}</td>
			 </tr>
	     </table></center>
     </td>
   </tr>
   <tr><!-- Detail Row of Inner Table -->
   
   
     <td style="border-width:0px">
     	%for nodeGroup in cluster['nodeGroups']:
     			<center>
     			<table><!-- Detail Table -->
     				<caption style="font-size:16px">{{nodeGroup['name'].title()}} Nodegroup</caption>
		     		<tr>
		 			 	<th>VM Name</th>
		 			 	<th>vSphere Host</th>
		 			 	<th>IP Address</th>
		 			 	<th>Status</th>
		 			 	<th>Roles</th>
		 			 	<th>CPU</TH>
		 			 	<th>RAM (MB)</th>
		 			 	<th>Storage Type</th>
		 			 	<th>Capacity (GB)</th>
		 			</tr>
				 %for instance in nodeGroup['instances']:
				 	<tr>
				 		<td>{{instance['name']}}</td>
				 		<td>{{instance['hostName']}}</td>
				 		<td>{{instance['ip']}}</td>
				 		<td>{{instance['status']}}</td>
				 		%roleStr=""
				 		%for role in instance['roles']:
				 			%roleStr = roleStr + "," + role[7:]
				 		%end
				 		%roleStr = roleStr[1:]
				 		<td>{{roleStr}}</td>
				 		<td>{{nodeGroup['cpuNum']}}</td>
				 		<td>{{nodeGroup['memCapacityMB']}}</td>
				 		<td>{{nodeGroup['storage']['type']}}</td>
				 		<td>{{nodeGroup['storage']['sizeGB']}}</td>
				 		
				 		
				 		
				 	</tr>
				 %end	
				 
	 		%end
     	</table>
     		<tr>
     		
     	
     	</table></center>
   </tr>
 
 
</table>


</form>
  </body>
</html
