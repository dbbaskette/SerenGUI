<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="generator" content="CoffeeCup HTML Editor (www.coffeecup.com)">
    <meta name="created" content="Wed, 26 Sep 2012 20:10:52 GMT">
    <meta name="description" content="">
    <meta name="keywords" content="">
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
		<caption>Available Networks</caption>
	    <tr>
			<th>Name</th>
		    <th>Type</th>
		   
		    				     
	    </tr>
	    %for net in networks:
	     	<tr>
		 		<td><a href="http://localhost:8010/networks/{{net['name']}}" target="networkDetail">{{net['name']}}</a></td>
		 		
		 		%if str(net['dhcp']).upper() == "TRUE":
		 			%typeNet = "DHCP"
		 		%else:
		 			%typeNet = "STATIC"
		 		%end
		 		<td>{{typeNet}}</td>
		 	
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
			 	
				 	<a href="/addNetwork" target=networkDetail><img src="/static/images/addNetwork.png" width="140" height="30" alt="" title="" border="0" 
				 		onmouseover="this.src='/static/images/addNetwork2.png'"
						onmouseout="this.src='/static/images/addNetwork.png'" /> 
				 	</a>
				 </td>
			 	</tr>
			 	<tr>
			 		<td style="border-width:0px;
			 		padding:0px;">
			 		<a href="/removeNetwork" target=networkDetail><img src="/static/images/removeNetwork.png" width="140" height="30" alt="" title="" border="0" 
				 		onmouseover="this.src='/static/images/removeNetwork2.png'"
						onmouseout="this.src='/static/images/removeNetwork.png'" /> 
				 	</a>	
				 	</td>
			 	</tr>
			 	
	  </table>
		
		
  </body>
</html>