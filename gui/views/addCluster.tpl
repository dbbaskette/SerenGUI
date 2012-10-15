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
	padding: 0px text-align:left
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
	width: 195px;
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
</style>
<!--[if IE]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->





</head>
<body>
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
							<p class="caption">Enter a Cluster Name:</p>
						</td>
						<td><input id="clusterName" name="clusterName" value="">
						</td>

					</tr>
					<tr>

						<td><table class="internalwide">
								<tr>
									<td class="bdr2">
										<p class="caption">Namenode Availability</p>
									</td>
								</tr>
								<form name=protectionType>
								<tr>
									
									<td><input name="selection" id="none" type="radio" checked
										value="off">No Protection<br>
									</td>
								</tr>
								<tr>
									<td><input name="selection" id="vmha" type="radio"
										value="on">vSphere HA<br>
									</td>
								</tr>
								<tr>
									<td><input name="selection" id="vmft" type="radio"
										value="ft">vSphere FT<br>
									</td>
								</tr>
								</form>
							</table></td>
						<td><table class="internalwide">
								<tr>
									<td class="bdr2">
										<p class="caption">Distributions</p>
									</td>
								</tr>
								<tr>
									<td><select id="distroType" size="5">
											<option value=test>test</option>
									</select></td>
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
					                <select id="netType" size="5"  >
					                	%for net in netInfo:
					                    	<option  value={{net['name']}} >{{net['name']}}</option> 
					                    %end
					                </select>
				                </td>
							</tr>
						</table></td>
						
						
						
					</tr>


				</table></td>
		</tr>

		<tr><!-- Role Configs ROW-->
			
			<td><table class="externalMedium">
					<tr>
						<td class="sectionHeader" colspan="4">
							<p class="header">VM Role Configuration</p>
						</td>
					</tr>
					<tr>
						<td><table class="internal">
								<tr>
									<td class="bdr2"><p class="section">Select Nodegroup</p></td>
								</tr>
								<tr>
									<td><select id="ngType" size="5"
										onclick="addRoles(this[selectedIndex].value);">
										 %for ng in ngInfo:
											<option value={{ng}} >{{ng }}</option>
										 %end
									</select></td>
								</tr>

							</table></td>
  						<td><table class="internal">
                        	<tr>
                           		<td  class="bdr2"><p class="section">Select Role(s)</p> </td>
                            </tr>
                            <tr>
                                <td>
                                	<select id="roleType" size="5" multiple="multiple">
                                    </select>
                                </td>
             				</tr>
                		</table></td>
                		<td><table class="internalsmall">
                            <tr>
                           		<td  class="bdr2"><p class="section">Select Config</p> </td>
                            </tr>
                            <tr>
                            	<td>
                            		<select id="vmConfig" size="5">
			                            <option  value=small >Small</option>             
			                            <option  value=medium >Medium</option>   
			                            <option  value=large >Large</option>
			                            <option  value=extra_large >Extra Large</option>    
			                            <option  value=custom >Custom</option>    
                          			</select>
                          	  </td>
                            </tr>
                            
            			</table></td>
						<td><table class="internalsmall"">
							<tr>
                                <td  class="bdr2" style="height:23px;border-style:none;"><p class="section">VM Qty </p> </td>
                			</tr>
               				 <tr>
                                <td style="background-color:#8cc63e;border-style:none">
                                	<input id="vmQty" name="vmQty" value="1" style="width:98%;text-align:center">
                               </td>
                			</tr>
						</table></td>
                	</tr>
				</table></td>
		</tr>
		<tr>
			<td><table class="externalMedium">
				<tr>
					<td class="sectionHeader" colspan="4">
						<p class="header">VM Environment Configuration</p>
					</td>
				</tr>
				<tr>
					<td><table class="internal">
		            	<tr>
		           			<td  class="bdr2">
		           				<p class="section">Select Storage Type</p>
		           			</td>
		          		</tr>
		           		<tr>
		            		<td>
		             			<select id="dsType" size="5"   >
		            			
		             				<option  value=local >Local</option>  
		             				 <option  value=shared >Shared</option>  
		             				 
		               			</select>
		                 	</td>
		             	</tr>
		            </table></td>
		   		
				   
					<td><table class="internal">
                 		<tr>
                    		<td  class="bdr2">
                   	 			<p class="section">Select Resource Pool(s)</p>
                    		</td>
                  		</tr>
                    	<tr>
                    		<td>
                        		<select id="rpType" size="5"  multiple="multiple" >
                          	  		%for rp in rpInfo:
                              	  		<option  value={{rp ['rpName']}} >{{rp ['rpName']}}</option>               
                               		%end
                        		</select>
                        	</td>
                    	</tr>
            		</table></td>
					 
				</tr>
      		</table></td>
		</tr>
		<tr>
			<td><table class="externalXLarge">
				<tr>
					<td class="sectionHeader" colspan="4">
						<p class="header">VM Install Details</p>
					</td>
				</tr>
				<tr>
					<td><table  class="internal">
                   		<tr>
                         	<td class="bdr2">
                         		<p class="section">Virtual Machine Instances</p>
                         	</td>
                    	</tr>
                    	<tr>
                        	<td>
                            	<div  style="width:490px; overflow-x:scroll; overflow-y:scroll; height:380px" align="left">
                            		<select id=vms size="100" multiple="multiple" align="left" style="width:1000px;height:1000px;overflow-y:hidden">
                                    </select>
                             	</div>
            				</td>
                    	</tr>
    				</table></td>
					<td><table>
						<tr >
							<td">
		                    	<img src="/static/images/addVM.png" width="80" height="55" border="0"
									onmouseover="this.src='/static/images/addVM2.png'"
		                          	onmouseout="this.src='/static/images/addVM.png'"
		                            onclick="addVM()" />
		                    </td>
		       			</tr>
		       			<tr>
		       				<td>
		                        <img src="/static/images/removeVM.png" width="80" height="55" border="0"
		                    		onmouseover="this.src='/static/images/removeVM2.png'"
		                      		onmouseout="this.src='/static/images/removeVM.png'"
		             				onclick="removeVM()" />
		        			</td>
						</tr>
						<tr>
							<td style="height:260px">
                           		<form name="addCluster" method="post" action="/addCluster/vms ">
                           			<input type="hidden" name="vmList" id="vmList" value="">
                                    <input type="hidden" name="outputName" id="outputName" value="">
                                    <input type="image" src="/static/images/build.png" width="80" height="80" alt="submit" name="submit" border="0"
                                 		onmouseover="this.src='/static/images/build2.png'"
                                    	onmouseout="this.src='/static/images/build.png'"
                                    	onclick="selectAll()" />
                                </form
               				</td>
							
						</tr>
					</table></td>	
				</tr>
			</table></td>	
		</tr>
	</table>
</body>




<script type="text/javascript">
		function addRoles(selectNG) {
			var ngType = document.getElementById('ngType');
			var roleType = document.getElementById('roleType');
			roleType.options.length=0
			%for ng in ngInfo:
				%for role in ngInfo[ng]:
					if ("{{ng}}" == selectNG){
						role = document.createElement("option");
						role.value = "{{role}}";
						role.innerHTML = "{{role}}";
						roleType.appendChild(role);
					}
									
				%end
			
			%end	
			
			var vmha = document.getElementById('vmha');
			var vmft = document.getElementById('vmft');	
			var none = document.getElementById('none');	
			
			/*if (ngType.value=="Master"){
				vmha.disabled = false
				vmft.disabled = false
				none.disabled = false
			}else{
				vmha.disabled = true
				vmft.disabled = true
				none.disabled = true
				none.checked = true		
			}*/
			
			
			
			
		}
</script>

<script type="text/javascript">
	function selectAll(){
		var vms=document.getElementById('vms');
		var vmList=document.getElementById('vmList');
		vmList.value="";
		var clusterName = document.getElementById('clusterName');
		var outputName = document.getElementById('outputName');
		
		for (var cnt=0;cnt < vms.options.length;cnt++){
			vmList.value+=vms.options[cnt].value+';';
	 	}
	 	outputName.value = clusterName.value 
	 }

</script>



<script type="text/javascript">
		
	function addVM(){
			
	        var ngType = document.getElementById('ngType');
	      	var roleType = document.getElementById('roleType');
	      	var selRoles = new Array();
	      	var vmConfig = document.getElementById('vmConfig');
	      	var dsType = document.getElementById('dsType');
	      	var rpType = document.getElementById('rpType');
	      	var netType = document.getElementById('netType');
	      	
	      	var selRPs = new Array();
	      	var selDSs = new Array();
	      	var i;
  			var rolecount = 0;
  			var dscount = 0;
  			var rpcount = 0;
  			var protectionType=""
	     	var selNG = ngType.options[ngType.selectedIndex].value;
	      	var selNet = netType.options[ngType.selectedIndex].value;
	      	for(i=0;i<document.protectionType.selection.length; i++) {
				if(document.protectionType.selection[i].checked) {
			  		 protectionType=document.protectionType.selection[i].value;
				}
			}
	      	
	      	
	     	for (i=0; i<roleType.options.length; i++) {
	    		if (roleType.options[i].selected) {
	      			selRoles[rolecount] = roleType.options[i].value;
	      			rolecount++;
	  			 }
	  		}
	  		for (i=0; i<dsType.options.length; i++) {
	    		if (dsType.options[i].selected) {
	      			selDSs[dscount] = dsType.options[i].value;
	      			dscount++;
	  			 }
	  		}
	  		for (i=0; i<rpType.options.length; i++) {
	    		if (rpType.options[i].selected) {
	      			selRPs[rpcount] = rpType.options[i].value;
	      			rpcount++;
	  			 }
	  		}
	  	
	  		var vmQty = document.getElementById('vmQty');
	  		var vms = document.getElementById('vms');
	  		if (selNG != null && rolecount>0 && dscount>0 && rpcount>0 && selNet !=null){
	  			vmString = vmQty.value + ":" + vmConfig.options[vmConfig.selectedIndex].value + ":" + selNG + ":" + selRoles + ":" + selNet + ":" + selDSs + ":" + selRPs + ":" + protectionType
				vmType = document.createElement("option");
				vmType.value = vmString;
				vmType.innerHTML = vmString;
				vms.appendChild(vmType);
	  		}
	  		vmQty.value = 1;
	  		
	}    
</script>