<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
   
    <title>networkHeader</title>
    
    <style type="text/css">
    <!--
    body {
      color:#000000;
      background-color:#C4C4C0;
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
				font-size:14px;
				border-width: 1px;
				border-color: black;
				border-style: solid}
	caption: {font-size:16px}
    -->
    </style>
   
    <!--[if IE]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
  </head>
  <body>
  	<center>
		<table>
		<caption>Configuration</caption>
			<tr>
			     <th>Name</th>
			     <th>Type</th>
			     <th>DNS 1</th>
			     <th>DNS 2</th>
			     <th>Port Group</th>
			     <th>Netmask</th>
			     <th>Gateway</th>
			</tr>
	     	<tr>
		 		<td>{{network['name']}}</td>
		 		%if str(network['dhcp']).upper() == "TRUE":
		 			%typeNet = "DHCP"
		 		%else:
		 			%typeNet = "STATIC"
		 		%end
		 		<td>{{typeNet}}</td>
		 		<td>{{network['dns1']}}</td>
		 		<td>{{network['dns2']}}</td>
		 		<td>{{network['portGroup']}}</td>
		 		<td>{{network['netmask']}}</td>
		 		<td>{{network['gateway']}}</td>
		 		
			</tr>			
			
		</table>
		</center>
		<center>
		<table>
		<caption>IP Blocks</caption>
			<tr>
				<th>Begin IP</th>
				<th>End IP</th>
			</tr>
			%if (network['allIpBlocks'] == None):
				<tr>
					<td>Not Defined</td>
					<td>Not Defined</td>
				</tr>
			%else:
				%for net in network['allIpBlocks']:
					<tr>
						<td>{{net['beginIp']}}</td>
						<td>{{net['endIp']}}</td>
					</tr>
				%end
			%end
		</table>
		</center>
		<center>
		<table style="border-width:0px">
			<tr>
				<td style="border-width:0px">
					<table>
					<caption>Assigned IP Blocks</caption>
						<tr>
							<th>Begin IP</th>
							<th>End IP</th>
						</tr>
						%if (network['assignedIpBlocks'] == None):
							<tr>
								<td>Not Defined</td>
								<td>Not Defined</td>
							</tr>
						%else:
							%for net in network['assignedIpBlocks']:
								<tr>
									<td>{{net['beginIp']}}</td>
									<td>{{net['endIp']}}</td>
								</tr>
							%end
						%end
					</table>
				</td>
				<td style="border-width:0px">
					<table>
					<caption>Free IP Blocks</caption>
						<tr>
							<th>Begin IP</th>
							<th>End IP</th>
						</tr>
						%if (network['freeIpBlocks'] == None):
							<tr>
								<td>Not Defined</td>
								<td>Not Defined</td>
							</tr>
						%else:
							%for net in network['freeIpBlocks']:
								<tr>
									<td>{{net['beginIp']}}</td>
									<td>{{net['endIp']}}</td>
								</tr>
							%end
						%end
					</table>
				</td>
			</tr>
		</table>
  		</center>
  </body>
</html>