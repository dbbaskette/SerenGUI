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
    p.caption{ 	font-size: 12pt;
    			margin:0px;
    			padding:0px	}
    p.section{ 	font-size: 14pt;
    			margin:0px;
    			padding:0px	}
    td.increment{	margin:0px;
    				padding:0px;
    				width:0px;
    				height:0px	}
    img.increment{	margin:0px;
    				padding:0px;
    				width:25px;
    				height:25px	}
    				
    table.bdr 	{	border-style:solid;
    				border-width:1px}
   	tr.bdr		{	border-style:solid;
    				border-width:1px;
    				}				
    td.bdr 		{	border-style:solid;
    				border-width:1px;
    				background-color:#8cc63e}				
    				
    </style>
    <!--[if IE]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
   
		
	
    
    
</head>
<body>
	<table>
		<tr>
			<td><table class="bdr">
				<tr>
					<td colspan="4" class="bdr"><p class="section">Server Quantities</p> </td>
				<tr>
				<tr>
					<td> <p class="caption">Masters:</p> </td>
					<td> <input type="text" name="masterQty" id="masterQty" value="1" style="width:50px"></td>
					<td class="increment"> <img class="increment" src="/static/images/plus.png"  />
					<td class="increment"> <img class="increment" src="/static/images/minus.png" />
				</tr>
				<tr>
					<td> <p class="caption">Workers:</p> </td>
					<td> <input type="text" name="masterQty" id="workerQty" value="1" style="width:50px"></td>
					<td class="increment"> <img class="increment" src="/static/images/plus.png"  />
					<td class="increment"> <img class="increment" src="/static/images/minus.png" />
				</tr>
				<tr>
					<td> <p class="caption">Clients:</p> </td>
					<td> <input type="text" name="masterQty" id="clientQty" value="1" style="width:50px"></td>
					<td class="increment"> <img class="increment" src="/static/images/plus.png"  />
					<td class="increment"> <img class="increment" src="/static/images/minus.png" />
				</tr>
			</table></td>
		</tr>
	</table>
	
	
	
	
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