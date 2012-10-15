'''
Created on Sep 25, 2012

@author: root
'''
import urllib2
import requests
import simplejson

class Serengeti():

    serengetiSession =  requests.session()
    clusterInfo=[]
    roles = {"Namenode":"hadoop_namenode",
             "Jobtracker":"hadoop_jobtracker",
             "Tasktracker" : "hadoop_tasktracker",
             "Datanode" : "hadoop_datanode",
             "Hadoop Client" : "hadoop_client",
             "Hive" : "hive",
             "Hive-Server" : "hive_server",
             "Pig" : "pig" }
    sneRoles={"Namenode":roles['Namenode'],"Jobtracker":roles['Jobtracker'],"Datanode,Tasktracker":roles['Datanode']+","+roles['Tasktracker']}
    masterRoles = {"Namenode":roles['Namenode'],"Jobtracker":roles['Jobtracker']}
    workerRoles = {"Datanode,Tasktracker":roles['Datanode']+","+roles['Tasktracker']}
    computeRoles = {"Tasktracker":roles['Tasktracker']}
    dataRoles = {"Datanode":roles['Datanode']}
    clientRoles = {"Hadoop Client":roles['Hadoop Client'],"Hive":roles['Hive'],"Hive-Server":roles['Hive-Server'],"Pig":roles['Pig']}
    standardNodeGroup = {"Master":masterRoles,"Worker":workerRoles,"Client":clientRoles,"SNE":sneRoles}
    separateNodeGroup = {"Master":masterRoles,"Compute":computeRoles,"Data":dataRoles,"Client":clientRoles}
    isilonNodeGroup = {"Master":masterRoles,"Compute":computeRoles,"Client":clientRoles}
    serverName = "hostname:port"
   
   
    def buildNodeGroupSpec(self,ngInfo):
        roleArray=[]
        
        vmQty = ngInfo[0]
        vmConfig = ngInfo[1]
        vmNG = str(ngInfo[2].lower())
        vmRoles = ngInfo[3].split(',')
        vmDS = ngInfo[4]
        vmRPs = ngInfo[5].split(',')
        vmCPUs = ngInfo[6]
        vmRAM = ngInfo[7]
        vmStorage = ngInfo[8]
        storageDetails={'type':vmDS,'sizeGB':vmStorage,'dsNames':self.clusterInfo['datastores']}
        if (vmNG == "master"):
            protection=self.clusterInfo['protection']
        else:
            protection="off"
        
        for role in vmRoles:
            roleArray.append(self.roles[role])
        spec = {'name':vmNG,'roles':roleArray,'instanceNum':int(vmQty),'instanceType':vmConfig,"rpNames":vmRPs,"storage":storageDetails,"haFlag":protection}
        return spec
    
    
    def buildFullSpec(self,ngSpec):
        return {'name':self.clusterInfo['clusterName'],'nodeGroups':ngSpec,'networkName':self.clusterInfo['network'],'distro':self.clusterInfo['distro']}
    
        
    def setClusterInfo(self,clusterInfo):
        self.clusterInfo=clusterInfo
    
    def getClusterInfo(self):
        return self.clusterInfo   
    
    def getNodegroup(self,clusterType):
        if (clusterType=="standard"):
            ngInfo = self.standardNodeGroup
            ngTitle = "Standard"
        elif (clusterType=="separate"):
            ngInfo = self.separateNodeGroup
            ngTitle = "Compute / Data Separated "

        else:
            ngInfo = self.isilonNodeGroup
            ngTitle = "Compute Only - Isilon"

        return (ngTitle,ngInfo)
    
    def getAll(self,objType):
        url = "http://"+str(self.serverName)+"/serengeti/api/"+str(objType)
        response = self.serengetiSession.get(url)
        return response.json

    def get(self,objType,objName):
        url = "http://"+str(self.serverName)+"/serengeti/api/"+str(objType)+"/"+str(objName)
        response = self.serengetiSession.get(url)
        #print response.content
        return response.json
    
       
    def clusterState(self,clusters,command):
        for cluster in clusters:
            url = "http://"+str(self.serverName)+"/serengeti/api/cluster/"+str(cluster)+"?state="+str(command)
            #stateChange = {'state':str(command)}
            print url
            response = self.serengetiSession.put(url)
   
      
    def add(self,info,objType):      
        url = "http://"+str(self.serverName)+"/serengeti/api/"+str(objType)
        headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}
        
        response = self.serengetiSession.post(url, data=simplejson.dumps(info),headers=headers)
        
       
        if (response.status_code==200):
            return 0
        else:   
            return -1

    
    def getTasks(self):
        url = "http://"+str(self.serverName)+"/serengeti/api/tasks"
        req = urllib2.Request(url)
        tasksJSON = self.opener.open(req).read()
        return simplejson.loads(tasksJSON)
    
    
    def login(self,servername,username,password):
        self.serverName = servername
        url = "http://"+str(self.serverName)+"/serengeti/j_spring_security_check"
        loginParams = {'j_username':str(username),'j_password':str(password)}
        self.serengetiSession = requests.session()
        try:
            response = self.serengetiSession.post(url,data=loginParams)
            response.raise_for_status()
        except requests.HTTPError:
            return (-1,"Username/Password Incorrect")
        except requests.ConnectionError:
            return (-1,"Server Not Found")
        except requests.RequestException:
            return (-1,"req Not Found")
        return(0,"Login Successful")
#      
def __init__(self):
    print "SerenGUI Started"
    

