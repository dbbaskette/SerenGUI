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


input.submit{
	background-color:light-gray;
}
input.submit:hover{
	background-color:gray;
}


</style>
<!--[if IE]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->





</head>
<body>
	<form name="addCluster" method="post" action="/addCluster/clusterConfig">
		<table name="clusterTypeTBL" width=100% height=100%>
			<tr>
				<td
					style="text-align: left; background-color:#8cc63e; border-width: 1px; border-style: solid; width:220px">
					<input name="clusterType" type="radio" checked value="standard">Standard
					
				</td>
				<td
					style="text-align: center; border-width: 1px; border-style: double">
					<img src="/static/images/standard.jpg" width="100%" height="100%"
					alt="" title="" border="0" />
				</td>

			</tr>
			<tr>
				<td
					style="text-align: left; background-color:#8cc63e;border-width: 1px; border-style: double">
					<input name="clusterType" type="radio" value="separate">Compute
					and Data Separated 
				</td>
				<td
					style="text-align: center; border-width: 1px; border-style: double">
					<img src="/static/images/separate.jpg" width="100%" height="100%"
					alt="" title="" border="0" />
				</td>
			</tr>
			<tr>
				<td
					style="text-align: left; background-color:#8cc63e;border-width: 1px; border-style: double">
					<input name="clusterType" type="radio" value="isilon">Compute Only (Isilon) 
				</td>
				<td
					style="text-align: center; border-width: 1px; border-style: double">
					<img src="/static/images/isilon.jpg" width="100%" height="100%"
					alt="" title="" border="0" />
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center"><input class="submit" type="submit" name="submit"
					value="Next ->" style="height: 40px; width: 140px; margin: 10px;"></td>
			</tr>

		</table>

	</form>
</body>


</html>