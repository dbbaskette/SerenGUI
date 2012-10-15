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
		        <th>Type</th>
		        <th>Total Space (GB)</th>
		        <th>Free Space (GB)</th>
		     </tr>
		     <tr> <!-- Data Row of Inner Table -->
		     	<td>{{ds['name']}}</td>
		     	<td>{{ds['type']}}</td>
				<td>{{ds['totalSpaceGB']}}</td>
				<td>{{ds['freeSpaceGB']}}</td>
			 </tr>
	     </table></center>
     </td>
   </tr>
   <tr>
   	<td style="border-width:0px">
   		<center>
     	<table><!-- VC Table -->
     		%for vcds in ds['datastoreReadDetails']:
		    <tr>
 			 	<th>VC Datastore Name</th>
 			 	<th>Total Storage (GB)</th>
 			 	<th>Free Space (GB)</th>
 			 	<th>Local Host</th>
			</tr>
		 	<tr>
		 		<td>{{vcds['vcDatastoreName']}}</td>
		 		<td>{{vcds['totalStorageSizeGB']}}</td>
		 		<td>{{vcds['freeSpaceGB']}}</td>
		 		<td>{{vcds['host']}}</td>
		 	</tr>	
	   	</table>
     	</center>
     </td> 
  </tr>
 </table>


</form>
  </body>
</html
