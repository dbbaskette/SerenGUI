<!DOCTYPE html>
<html lang="en">
  <head>
    <title>EMC Greenplum / VMware Project Serengeti</title>
    
    <style type="text/css">
    <!--
    body {
      color:#000000;
      background-color:#C0C0C0;
    }
    a  { color:#0000FF; }
    a:visited { color:#800080; }
    a:hover { color:#008000; }
    a:active { color:#FF0000; }
    -->
    </style>
    <!--[if IE]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
  <body>
<form action="/file-out" method="post">
<input type="hidden" name="role" value="core" />

<table border="1"  width="100%" cellpadding="10">
  <tr><!-- Title Row -->
     <td><center><h2>Cluster: {{clusterName}}</h2></center></td><!-- Col 1 -->
  </tr>
  <tr><!-- Description Row -->
     <td><center>
     	<table border="1" >
		     <tr> <!-- Header Row of Inner Table -->
		        <th>Status</th>
		        <th>Distro</th>
		        <th>Instance #</th>
		     </tr>
		     <tr> <!-- Data Row of Inner Table -->
				<td>{{rows['status']}}</td>
				<td>{{rows['distro']}}</td>
				<td>{{rows['instanceNum']}}</td>
			 </tr>
	     </table></center>
     </td>
   </tr>
   <tr><!-- Detail Row of Inner Table -->
   
   
     <td>
     	<left><h4>Nodegroups</h4></left>
     		%for nodeGroup in rows['nodeGroups']:
     			<center>
     			<table border="1" cellpadding="10" ><!-- Detail Table -->
     				<caption>{{nodeGroup['name']}}</caption
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

 