<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>EMC Greenplum HD / Project Serengeti</title>
	
	<style type="text/css" media="screen">
		html, body 		{ margin: 0; padding: 0; }
		body 			{ color: #333; font: 12px Helvetica, Arial, sans-serif; line-height: 18px; }
		h2				{ color: #333; }
		a				{ color: #337810; }
		p				{ margin: 0 0 18px; }
		#container		{ width: 760px; margin: 0 auto;}
		
		/* Header */
		#header			{ background: #eee; border-bottom: 2px solid #ddd; }
		#header h1  	{ color: #004b6f; margin: 0 0 3px; padding: 24px 18px 0; }
		#header p		{ color: #666; font-size: 11px; font-weight: bold; padding: 0 18px; }
		
		/* Content Style */
		#navigation		{ border-bottom: 1px solid #ccc; margin-right: 18px; }
		#navigation ul	{ padding: 0 18px 9px; }
		#extra			{ margin-left: 18px; }
		#extra small	{ font-size: 11px; line-height: 18px; }
		#content		{ border-bottom: 1px solid #ccc; margin-left: 18px; }
		#content p, #extra p { padding-right: 18px; }
		
		/* Content Positioning and Size */
		#navigation		{ float: right; width: 175px; }
		#content		{ float: left; width: 540px; }
		#extra			{ float: left; width: 540px; }		/* Footer */
		#footer			{ background: #333; border-bottom: 2px solid #999; clear: left; width: 100%; }
		#footer a		{ color: #eee; }
		#footer	p		{ color: #ccc; margin: 0; padding: 0 18px 10px; }
		#footer ul		{ border-bottom: 1px solid #555; list-style: none; margin: 0 18px 6px; padding: 10px 0 6px; }
		#footer li		{ display: inline; font-size: 11px; font-weight: bold; padding-right: 5px; }
	</style>
	<!--[if IE]>
	<style type="text/css">
	    #navigation, #content, #extra { margin-top: 20px; }
	</style>
	<![endif]-->
</head><body>
	<div id="container">
		
		<div id="wrapper">
			<div id="content">
			<img src="static/images/serengeti.jpg" width="500" height="350" alt="" title="" border="0" />
			</div>
		</div>
		<div id="navigation">
			<h2>Hadoop Links</h2>
			<ul>
				<li><a href="http://www.greenplum.com/products/greenplum-hd" title="Greenplum HD">Greenplum HD</a></li>
				<li><a href="http://www.vmware.com/hadoop">VMware</a></li>
				<li><a href="http://www.isilon.com/hadoop">Isilon</a></li>
				<li><a href="http://serengeti.cloudfoundry.com/">Project Serengeti</a></li>
				
			</ul>
		</div>
		<div id="extra">
			<h2>{{msg}}</h2>
			<!-- Start of FORM -->
             <form method="post" action="/serengetiLogin">

                <div style=" text-align: left; text-indent: 0px; padding: 0px 0px 0px 0px; margin: 0px 0px 0px 0px;"><table width="100%" border="1" cellpadding="5" cellspacing="2" style="background-color: #ffffff;">
                	 <tr valign="top">
  					 	 <td style="border-width : 0px;text-align: right">Serengeti Server:</td>
						 <td style="border-width : 0px;"><input type="text" name="servername" value="10.13.156.200:8080"></td>
  					 </tr>
					 <tr valign="top">
  					 	 <td style="border-width : 0px;text-align: right">Username:</td>
  					 	 <td style="border-width : 0px;"><input type="text" name="username" value=""></td>
					 </tr>
                	 <tr valign="top">
					 	 <td style="border-width : 0px;text-align: right">Password:</td>
                  	 	 <td style="border-width : 0px;"><input type="password" name="password" value=""></td>
					 </tr>
					 <tr valign="top">
					 	 <td style="border-width : 0px;text-align: left"> </td>
					 	 <td style="border-width : 0px;text-align: left"><input type="submit" name="submit" value="Connect">
					 </tr>

                </table>
                </div>

             </form>
<!-- End of FORM -->
			
		</div>
	</div>
</body>
</html>
