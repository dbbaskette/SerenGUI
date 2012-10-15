'''
Created on Sep 11, 2012

@author: root
'''

from bottle import run,static_file,template,request,route,post,error,redirect #@UnresolvedImport

from Serengeti import Serengeti 
import json
import simplejson 
serengeti = Serengeti()








@route('/')
def mainLogin():
    output = template('login',msg="Welcome to SerenGUI")
    return output


''' Cluster Information Routing
'''

@route('/clusters')
def clusters():
    clusters = serengeti.getAll("clusters")
    output = template('clusters',clusters=clusters)
    return output

@route('/clusterSelection')
def clusterSelection():
    clusters = serengeti.getAll("clusters")
    return template('clusterSelection',clusters=clusters)  
        
@route('/clusters/<clusterName>')
def clusterDetail(clusterName):
    info = serengeti.get("cluster",clusterName)
    output = template('clusterDetail',cluster=info,clusterName=clusterName)
    return output

@route('/clusterPower',method='POST')
def clusterPower():
    start = request.forms.get('start') 
    stop = request.forms.get('stop') 
    clusters = request.POST.getall('clusters')
    if (start == "Power On"):
        response = serengeti.clusterState(clusters,'start')
        
    elif (stop=="Power Off"):
        response = serengeti.clusterState(clusters,'stop')
    print response
    redirect("/clusters")

@route('/addCluster/clusterType')
def clusterType():
    output = template('clusterType')
    return output

@route('/addCluster/clusterConfig',method='POST')
def clusterConfig():
    clusterType = request.forms.get('clusterType')
    datastores = serengeti.getAll("datastores")
    networks = serengeti.getAll("networks")
    distros = serengeti.getAll("distros")
    output = template('addCluster1',clusterType=clusterType,datastores=datastores,networks=networks,distros=distros)
    return output

@route('/addCluster/<clusterType>',method='POST')
def vmConfig(clusterType):
   # network = request.forms.get('network') 
    #datastores = request.POST.getall('datastores') 
   # distro = request.forms.get('distro') 
    #clusterName = request.forms.get('clusterName') 
    #protection = request.forms.get('protection') 
    clusterInfo={'clusterType':clusterType,
                 'clusterName':request.forms.get('clusterName'),
                 'network':request.forms.get('network'),
                 'datastores':request.POST.getall('datastores'),
                 'distro':request.forms.get('distro'),
                 'protection':request.forms.get('protection')}
    
   
    serengeti.setClusterInfo(clusterInfo)
    
    (ngTitle,ngInfo) = serengeti.getNodegroup(clusterType)
    resourcepools = serengeti.getAll("resourcepools")
    output = template('addCluster2',ngTitle=ngTitle,ngInfo=ngInfo,resourcepools=resourcepools,clusterType=clusterType)
    return output


@route('/addCluster/vms',method='POST')
def addClustervms():
  
    vmConfig = request.forms.get('vmList')
    vmArray = vmConfig[:-1].split(';')
    ngSpec=[]
    for data in vmArray:
        vmData=data.split(':')
        ngSpec.append(serengeti.buildNodeGroupSpec(vmData))
    fullSpec = serengeti.buildFullSpec(ngSpec)

    if (serengeti.add(fullSpec,"clusters") == 0):
        redirect("/clusters")

''' Datastore Information Routing
'''


@route('/datastores')
def datatores():
    datastores = serengeti.getAll("datastores")
    return template('datastores',datastores=datastores)

@route('/datastoreSelection')
def datastoreSelection():
    datastores = serengeti.getAll("datastores")
    return template('datastoreSelection',datastores=datastores)  

@route('/datastores/<datastoreName>')
def datastoreDetail(datastoreName):
    datastoreInfo = serengeti.get("datastore",datastoreName)
    return template('datastoreDetail',ds=datastoreInfo)

@route('/addDatastore')
def addDatastoreForm():
    output = template('addDatastore')
    return output

@route('/addDatastore/data',method='POST')
def addDatastore():
    dsSpec = []
    dsName = request.forms.get('dsName') 
    dsSpec.append(request.forms.get('dsSpec'))
    dsType = request.forms.get('dsType')
    dsInfo = {"name":dsName,
              "spec":dsSpec,
              "type":dsType,
              }
    if (serengeti.add(dsInfo,"datastores") == 0):
        redirect("/datastores")
    







''' Resource Pool Information Routing
'''


@route('/respools')
def respools():
    respools = serengeti.getAll("resourcepools")
    return template('respools',respools=respools)

@route('/respoolSelection')
def respoolSelection():
    respools = serengeti.getAll("resourcepools")
    return template('respoolSelection',respools=respools)  

@route('/respools/<respoolName>')
def respoolDetail(respoolName):
    respoolInfo = serengeti.get("resourcepool",respoolName)
    return template('respoolDetail',rp=respoolInfo)

@route('/addResPool')
def addResPoolForm():
    output = template('addResPool')
    return output

@route('/addResPool/data',method='POST')
def addResPool():
    rpName = request.forms.get('rpName') 
    rpVCluster = request.forms.get('rpVCluster') 
    rpVRP = request.forms.get('rpVRP') 

    rpInfo = {"name":rpName,
              "resourcePoolName":rpVCluster,
              "vcClusterName":rpVRP
              }
    if (serengeti.add(rpInfo,"resourcepools") == 0):
        redirect("/respools")














''' Network Information Routing
'''


@route('/networks')
def networks():
    networks = serengeti.getAll("networks")
    return template('networks',networks=networks)

@route('/networkSelection')
def networkSelection():
    networks = serengeti.getAll("networks")
    return template('networkSelection',networks=networks)  
        
@route('/networks/<networkName>')
def networkDetail(networkName):
    info = serengeti.get("network",networkName)
    output = template('networkDetail',network=info)
    return output

@route('/addNetwork')
def addNetworkForm():
    output = template('addNetwork')
    return output

@route('/addNetwork/data',method='POST')
def addNetwork():
    ipRanges=[]
    networkName = request.forms.get('name') 
    portGroup = request.forms.get('portGroup') 
    typeNet = request.forms.get('typeInterface')
    netmask = request.forms.get('mask')

    if (str(typeNet) == "dhcp"):
        info = {"name":networkName,
                "portGroup":portGroup,
                "dhcp":"true",
                "netmask":netmask
                }
    else:
        dns1 = request.forms.get('dns1')
        dns2 = request.forms.get('dns2')
        gateway = request.forms.get('gateway')
        ipRangeCSV = request.forms.get('ipRangesTB')[:-1]
        allIPS = ipRangeCSV.split(',')
        for range in allIPS:
            ips = range.split('-')
            if ("-" in range):
                beginIPs = ips[0]
                endIPs = ips[1]   
                ipSet = {"beginIp":ips[0],"endIp":ips[1]} 
                ipRanges.append(ipSet)
            else:
                
                ipSet = {"beginIp":ips[0],"endIp":ips[0]} 

                ipRanges.append(ipSet)
        print ipRanges

                
        info = {"name":networkName,
                "portGroup":portGroup,
                "dhcp":"false",
                "type":typeNet,
                "netmask":netmask,
                "dns1":dns1,
                "dns2":dns2,
                "gateway":gateway,
                "ip":ipRanges

                }
        print info
   # if (serengeti.add(typeNet,info) == 0):
   #     redirect("/networks")
    if (serengeti.add(info,"networks") == 0):
        redirect("/networks")







@route('/main')
def mainPage():
#    items = serengeti.getNetworks()
    return template('main')

@route('/mainSelection')
def mainSelection():
#    items = serengeti.getNetworks()
    return template('mainSelection')
   





@route('/serengetiLogin',method='POST')
def login():
    servername = request.forms.get('servername') 
    username = request.forms.get('username') 
    password = request.forms.get('password')
    (rtnCode,rtnString) = serengeti.login(servername,username,password)
    if (rtnCode < 0):
        output = template('login',msg="ERROR: "+rtnString)
        return output
    else:
        redirect('/main')
 
@error(404)
def error404(error):
    return "That page does not exist."


@route('/tasks')
def tasks():
    #serengeti = Serengeti()
    tasks = serengeti.getTasks()
   
 

    
@route('/static/<filename>')
def send_static(filename):
    return static_file(filename,root='/mnt/hgfs/vFileShare/EclipseWorkspace/serengui/src/gui/views/static')
@route('/static/images/<filename>')
def send_images(filename):
    return static_file(filename,root='/mnt/hgfs/vFileShare/EclipseWorkspace/serengui/src/gui/views/static/images')




run(host='localhost', port=8010)
     