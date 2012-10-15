<!DOCTYPE html>
<html lang="en">
<head>

<title></title>

<style type="text/css">
body {
	color: #000000;
	background-color: #FFFFFF;
}

a {
	color: #0000FF;
}

a:visited {
	color: #800080;
}

a:hover {
	color: #008000;
}

a:active {
	color: #FF0000;
}

p.caption {
	font-size: 12pt;
	margin: 0px;
	padding: 0px;
	text-align:left;
	align:center;
}

p.captionsmall {
	font-size: 10pt;
	margin: 0px;
	padding: 0px;
	text-align:left;
	align:center;
}

p.section {
	font-size: 12pt;
	margin: 0px;
	padding: 0px border-style:none
}

p.header {
	font-size: 14pt;
	margin: 0px;
	padding: 0px;
}

td.increment {
	margin: 0px;
	padding: 0px;
	width: 0px;
	height: 0px
}

img.increment {
	margin: 0px;
	padding: 0px;
	width: 25px;
	height: 25px
}

table.bdr {
	border-style: solid;
	border-width: 1px;
}

table.externalXLarge {
	border-style: solid;
	border-width: 1px;
	width:600px;
	height:390px;
}



table.externalLarge {
	border-style: solid;
	border-width: 1px;
	width:600px;
	height:190px;
}

table.externalMedium {
	border-style: solid;
	border-width: 1px;
	width:600px;
	height:150px;
}

table.externalSmall {
	border-style: solid;
	border-width: 1px;
	width:600px;
	height:50px;
}


table.bdr-spread {
	border-style: solid;
	border-width: 1px;
	margin-left: auto;
	margin-right: auto
}

table.internal {
	border-style: solid;
	border-width: 1px;
	width: 179px;
	height: 123px;
}

table.internalwide {
	border-style: solid;
	border-width: 1px;
	width: 300px;
	height: 123px;
}


table.internalsmall {
	border-style: solid;
	border-width: 1px;
	width: 110px;
	height: 123px;
}

tr.bdr {
	border-style: solid;
	border-width: 1px;
}

td.bdr {
	border-style: solid;
	border-width: 1px;
	background-color: #8cc63e
}

td.sectionHeader {
	border-style: solid;
	border-width: 1px;
	background-color: #8cc63e;
	height: 7%;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	font-style: bold;
}

td.bdr2 {
	border-style: solid;
	border-width: 1px;
	background-color: #015697;
	height: 20px;
	width: 125px;
	color: #FFFFFF
}

select {
	margin: 0px;
	padding: 0px;
	width: 100%;
	height: 100%
}

table.small {
	font-size: 8pt;
	margin: 0px;
	padding: 0px;
	border-style: solid;
	border-width: 1px;
}

form.bdr {
	border-style: solid;
	border-width: 1px;
}

input {
	width:300px;
	text-align:center;
	}


</style>
<!--[if IE]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->





</head>
<body>
	<form name="addCluster1" method="post" action="/addCluster/{{clusterType}}">
	<table>
		<tr>
			<!-- CLUSTER WIDE CONFIGURATION ROW-->
			<td><table class="externalLarge">
					<tr>
						<td class="sectionHeader" colspan="4">
							<p class="header">Cluster-Wide Configuration</p>
						</td>
					</tr>
					<tr>
						<td class="bdr2">
							<p class="caption" style="text-align:right">Enter a Cluster Name:</p>
						</td>
						<td><input style="text-align:left" id="clusterName" name="clusterName" value="">
						</td>

					</tr>
					<tr>

						<td><table class="internalwide">
								<tr>
									<td class="bdr2">
										<p class="caption">Select Namenode Availability Option</p>
									</td>
								</tr>
								
								<tr>
									
									<td><input name="protection" id="none" type="radio" checked
										value="off">No Protection<br>
									</td>
								</tr>
								<tr>
									<td><input name="protection" id="vmha" type="radio"
										value="on">vSphere HA<br>
									</td>
								</tr>
								<tr>
									<td><input name="protection" id="vmft" type="radio"
										value="ft">vSphere FT<br>
									</td>
								</tr>
							
							</table></td>
						<td><table class="internalwide">
								<tr>
									<td class="bdr2">
										<p class="caption">Select Distribution</p>
									</td>
								</tr>
								<tr>
									<td><select id="distro" size="5" name="distro" >
											%for ds in distros:
					                    		<option  value={{ds['name']}} >{{ds['name']}}</option> 
					                    	%end
									</select></td>
								</tr>
						</table></td>
					
						
					</tr>
					<tr>

						<td><table class="internalwide">
								<tr>
									<td class="bdr2">
										<p class="caption">Select Datastore(s)</p>
									</td>
								</tr>
								<tr>
									<td>
										<select id="datastores" name="datastores" size="5" multiple="multiple" >
					                		%for ds in datastores:
					                    		<option  value={{ds['name']}} >{{ds['name']}}</option> 
					                    	%end
					                </select>
									</td>
								</tr>
								
						</table></td>
						
						
						<td><table class="internalwide">
			            	<tr>
			            		<td  class="bdr2">
			            			<p class="section">Select Network</p>
			            		</td>
			           		</tr>
			            	<tr>
			           			<td>
					                <select id="network" size="5" name="network" >
					                	%for net in networks:
					                    	<option  value={{net['name']}} >{{net['name']}}</option> 
					                    %end
					                </select>
				                </td>
							</tr>
						</table></td>
						
						
						
					</tr>
					
					<tr>
						<td colspan="4" style="text-align:center">
							<input type="submit" name="submit"
								value="Next ->" style="height: 40px; width: 140px; margin: 10px;">
							
						</td>
					</tr>

		

	
			</table></td>	
		</tr>
	
	</table>
	</form>
</body>

