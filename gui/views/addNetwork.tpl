<!DOCTYPE html>
<html lang="en">
  <head>
    
    <title></title>
    
    <style type="text/css">
    body {
      color:#000000;
      background-color:#FFFFFF;
      
    }
    a  { color:#0000FF; }
    a:visited { color:#800080; }
    a:hover { color:#008000; }
    a:active { color:#FF0000; }
    </style>
    <!--[if IE]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
   
		
	
    
    
  </head>
<body>
	<form name="addCluster" method="post" action="/addCluster">
		<table name=netInput border="0"  width="100%" style="text-align:justify">
  			<tr>
   				<td style="text-align:right">Network Name:</td>
    	 		<td style="text-align:left"><input type="text" name="name" value="" style="width:240px"></td>
  			</tr>
 			<tr>
		    	<td style="text-align:right">Port Group:</td>
		    	<td style="text-align:left"><input type="text" name="portGroup" value="" style="width:240px"></td>
		  	</tr>
		  	<tr>
		  		<td style="text-align:right">Netmask:</td>
		     	<td style="text-align:left"><input type="text" name="mask" value="" style="width:240px"></td>
		  	</tr>
 			<tr>
		    <td style="text-align:right">Type Interface: </td>
			    <td style="text-align:left">
			    	<select name="typeInterface" onchange="checkValue(this)" style="width:100px">
			  			<option selected value="dhcp">DHCP</option>
			  			<option value="static">Static</option>
			  		</select>
				</td>
			</tr>
			<tr>
		    	<td id="dns1Label" style="color:#C0C0C0;text-align:right">Primary DNS:</td>
		     	<td style="text-align:left"><input id="dns1" name="dns1" value="" style="width:240px" disabled></td>
		  	</tr>
		  	<tr>
		     	<td id="dns2Label" style="color:#C0C0C0;text-align:right">Secondary DNS:</td>
		     	<td style="text-align:left"><input id="dns2" name="dns2" value="" style="width:240px" disabled></td>
		  	</tr>
			<tr>
		     	<td id="gwLabel" style="color:#C0C0C0;text-align:right">Gateway:</td>
		     	<td style="text-align:left"><input id="gw" name="gateway" value="" style="width:240px" disabled></td>
		  	</tr>
		  	
  			<tr>
		     	<td id="ipRangesLabel" style="color:#C0C0C0;text-align:right">IP Ranges (ex: 192.168.100.2-100)</td>
		     	
		     	<td><table>
		     	
		     		<tr> 
		     			<td rowspan="3"><select name="ipRanges" id="ipRanges" size="5" style="width:240px" disabled ></select>
		     	 	     <td style="padding-bottom:0px;padding-top:0px;margin:0px 0px">
		     	 	     <img src="/static/images/addButton.png" width="60" height="25" onclick="addRange(this)"
		     	 				onmouseover="this.src='/static/images/addButton2.png'"
								onmouseout="this.src='/static/images/addButton.png'"/ >
     					</td>
     					<input type="hidden" name="ipRangesTB" id="ipRangesTB" value="">
     					
		     	 	</tr>
		  			<tr>
  						<td style="padding-bottom:0px;padding-top:0px;margin:0px 0px">
	  						<img src="/static/images/removeButton.png" width="60" height="25" onclick="removeRange(this)" 
	     						onmouseover="this.src='/static/images/removeButton2.png'"
								onmouseout="this.src='/static/images/removeButton.png'"/ >
     					</td>
     				</tr>
     				<tr>
  						<td style="padding-bottom:0px;padding-top:0px;margin:0px 0px">
  						<img src="/static/images/clearButton.png" width="60" height="25" onclick="clearList(this)"
     							onmouseover="this.src='/static/images/clearButton2.png'"
								onmouseout="this.src='/static/images/clearButton.png'"/ >
     					</td>
     				
     				
     				</tr>
     				
     				<tr>
     	     			<td><input id="ipRange" name="ipRange" value="" style="width:240px" disabled></td>
     				</tr>
     				</table>
     			</td>
     	  	</tr>
     	  	<tr style="align-text:center;
     	  				margin-left: auto;
						margin-right: auto;
     	  				padding: 20px;
						">
    			<td colspan=2 style="align-text:center;
    						margin-left: auto;
							margin-right: auto;">					    			
    				<input type="submit" name="submit" value="Submit" 
    						style="height:40px;
			    				width:140px;
			    				margin: 20px;">
    			</td>
    		<tr>
    		
			</table>
	
	</form>
</body>


<script type="text/javascript">
	function selectAll(){
		var ipRanges=document.getElementById('ipRanges');
		var ipRangesTB=document.getElementById('ipRangesTB');
		ipRangesTB.value=""
		for (var cnt=0;cnt < ipRanges.options.length;cnt++){
	 		ipRangesTB.value+=ipRanges.options[cnt].value+',';
	 	}
	 }

</script>


<script type="text/javascript">
		function addRange(selectedObj) {
			
			var ipRange = document.getElementById('ipRange');
			var ipRanges = document.getElementById('ipRanges');
			newRange = document.createElement("option");
			newRange.value = ipRange.value;
			newRange.innerHTML = ipRange.value;
			if(ipRange.value.length > 0)
			{
				ipRanges.appendChild(newRange);
			}
			ipRange.value=""
			selectAll()
				}
			
</script>

<script type="text/javascript">
		function removeRange(selectedObj) {
			
			var ipRanges = document.getElementById('ipRanges');
			ipRanges.remove(ipRanges.selectedIndex);
			selectAll()
		}
		
</script>






<script type="text/javascript">
		
					
				
	    function checkValue(selectObj){
	    
	        var dns1 = document.getElementById('dns1');
	      	var dns1Label = document.getElementById('dns1Label');
	      	var dns2 = document.getElementById('dns2');
	      	var dns2Label = document.getElementById('dns2Label');
	      	var gw = document.getElementById('gw');
	      	var gwLabel = document.getElementById('gwLabel');
	      	var ipRanges = document.getElementById('ipRanges');
	      	var ipRange = document.getElementById('ipRange');
	      	
	      	var ipRangesLabel = document.getElementById('ipRangesLabel');
	        
		    if (selectObj.value == "static")
		    {	
		    	dns1.disabled=false
		    	dns1Label.style.color=style="#000000"
		    	dns2.disabled=false
		    	dns2Label.style.color=style="#000000"
		    	gw.disabled=false
		    	gwLabel.style.color=style="#000000"
		    	ipRanges.disabled=false
		    	ipRange.disabled=false
		    	ipRangesLabel.style.color=style="#000000"
		    }
		    else
		    {
		    	dns1.disabled=true
			    dns1Label.style.color=style="#C0C0C0"
				dns2.disabled=true
		    	dns2Label.style.color=style="#C0C0C0"
		    	gw.disabled=true
		    	gwLabel.style.color=style="#C0C0C0"
		    	ipRanges.disabled=true
		    	ipRange.disabled=true
		    	ipRangesLabel.style.color=style="#C0C0C0"
		    }
		}
</script> 