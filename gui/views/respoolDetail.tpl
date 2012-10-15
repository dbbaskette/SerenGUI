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
			margin-bottom: 25px;
			margin-left: auto;
			margin-right: auto;}
	
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

<table style="border-width:0px"> <!-- Formatting Table -->
  
  <tr><!-- Description Row -->
     <td style="border-width:0px"><center>
     	<table>    <!-- DS Table -->
		     <tr> <!-- Header Row of Inner Table -->
		     	<th>Name</th>
		        <th>vSphere RP Name</th>
		        <th>Cluster</th>
		        <th>Total CPU (MHz)</th>
		        <th>Used CPU (Mhz)</th>
		        <th>Used RAM (MB)</th>
		     </tr>
		     <tr> <!-- Data Row of Inner Table -->
		     	<td>{{rp['rpName']}}</td>
		     	<td>{{rp['rpVsphereName']}}</td>
				<td>{{rp['vcCluster']}}</td>
				<td>{{rp['totalCPUInMHz']}}</td>
				<td>{{rp['usedCPUInMHz']}}</td>
				<td>{{rp['usedRAMInMB']}}</td>
			 </tr>
	     </table></center>
     </td>
   </tr>
   <tr>
   	<td style="border-width:0px">
   		<center>
     	<table><!-- VC Table -->
     		<caption>Nodes in Resource Pool</caption>
     	
     		
		    <tr>
 				<th>VM Name</th>
		 		<th>vSphere Host</th>
 			 	<th>IP Address</th>
 			 	<th>Status</th>
 			 	<th>Roles</th>
 			 	<th>Action</th>
 			 	<th>CPU (MHz)</TH>
 			 	<th>RAM (MB)</th>
 			</tr>
 			%for node in rp['nodes']:
 			<tr>
				<td>{{node['name']}}</td>
		 		<td>{{node['hostName']}}</td>
		 		<td>{{node['ip']}}</td>
		 		<td>{{node['status']}}</td>
				%roleStr=""
		 		%for role in node['roles']:
		 			%roleStr = roleStr + "," + role[7:]
		 		%end
		 		%roleStr = roleStr[1:]
		 		<td>{{roleStr}}</td>
		 		<td>{{node['action']}}</td>
		 		<td>{{node['totalCPUInMHz']}}</td>
				<td>{{node['totalRAMInMB']}}</td>
		 	<tr>
		 	%end	
	   	</table>
     	</center>
     </td> 
  </tr>
 </table>


</form>
  </body>
</html
