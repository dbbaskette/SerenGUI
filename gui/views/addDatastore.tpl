<!DOCTYPE html>
<html lang="en">
  <head>
    
    <title></title>
    
    <style type="text/css">
    <!--
    body {
      color:#000000;
      background-color:#FFFFFF;
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
<!-- Start of FORM -->
<form method="post" action="/addDatastore/data">
	  <table border="1"  width="100%">
  <tr>
     <td>Name</td>
     <td><input type="text" name="dsName" value=""></td>
  </tr>
  <tr>
     <td>Virtual Center Datastore(s)</td>
     <td><input type="text" name="dsSpec" value=""></td>
  </tr>
 <tr>
     <td>Type</td>
     <td><select name="dsType">
  			<option selected value="SHARED">Shared</option>
  			<option value="LOCAL">Local</option>
  			
		</select>
	</td>
  </tr>
  <tr>
     
     <td><input type="submit" name="submit" value="submit">
	</td>
  </tr>
  </tr>
  
</table>

</form>