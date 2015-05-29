--> Developer install readme for SOA Fusion Order Demo <--

Mandatory build infrastructure:
- JDeveloper 11g + SOA (ADRS or standalone server)
- Ant 1.7
- JDK 6

--------- Getting started, Using FOD with JDeveloper ---------

1) Extract the FusionOrderDemo_R1.zip file containing the source into a directory
2) Open jdeveloper and choose "open application", now navigate to the directory where you extracted the source and open the WebLogicFusionOrderDemo.jws workspace
If you see an error dialog, click OK. The following steps will resolve the reported issue.
3) Modify the build.properties in the bin project to reflect your environment (e.g. oracle.home / java.home / as well as other server side properties) as well as the bits you intend to deploy (e.g. using soa-only or adf, deploying BamOrderBooking or using B2B composite) 
4) Run Ant, target "setupWorkspaceForJdeveloperUse" from within the bin project. 

This target modifies
 a) connections.xml - based on the setting of build.properties (adf/soa deployment)
 b) adf-config.xml - pointing either to a remote or local mds and (foreign.mds.connection)
 c) the deployment plan for the (Bam)OrderBookingComposite
 d) the deployment plan for the B2BX12OrderGateway

The deployment plan in the orderbooking project will replace the endpoints for 
  a) PartnerSupplierComposite
  b) CreditCardAuthorization webservice and
  c) ADFBC based StoreFrontService (or in the standalone case the OrderSDOComposite)
during deployment.

Hence make sure that the plan ($orderbooking/bin/orderbooking_deployment_plan.xml) is attached when deploying

The deployment plan in the b2b project will replace the endpoints for 

  a) ADFBC based StoreFrontService (or in the standalone case the OrderSDOComposite)
during deployment.
  b) (BAM)OrderBookingComposite

Hence make sure that the plan ($b2b/bin/B2BX12OrderGateway_deployment_plan.xml) is attached when deploying

-------------
Ant based compilation / build and deployment, outside of Oracle JDeveloper

$FOD_HOME/bin/build.properties contains the master set of properties that need to be adjusted to your environment.
 a) Change oracle.home to point to your Oracle Home. E.g. c:\\beahome1\\jdeveloper or when on the server e.g. /beahome/AS11gR1SOA
 b) Change the server properties. They will be used for scripting and deployment (admin/managed.server.host/port as well as user / password and targets)
 c) change the mds section to reflect your environment. In case JDeveloper is installed, leave the settings as is, otherwise amend the db settings section and amend the mds type to "db"
 d) in case you want to deploy either bam or b2b - enable those settings.

In $FOD_HOME/bin/build.xml the following targets can be used to deploy the demo 

createMDSConnections --> based on mds settings in build.properties seeds the correct adf-config.xml

compile-build-all --> compiles and builds all soa components.
   after successfull completion, they can be found in $Project/deploy

compile-deploy-all --> compiles, builds and deploys ALL components to the defined server(s) in build.properties.

seedFodJmsResources --> seeds the JMS resources needed for the Fulfillment mediator

setupWorkspaceForJdeveloperUse --> setup the workspace to be used with jdeveloper based deplopment

server-setup-seed-deploy-test --> setup the application, compile its artifacts, deploy them and run the composite tests on the server

server-cleanup-all --> undeploy all artifacts from the server

-------------
> Important information:

1) For the human task details project (OrderApprovalHumanTask): Depending on if you chose soa.only.deployment in the global build.properties, SOA or ADF backed service will be configured

2) For the JMS Adapter in the FulFillment mediator you need to create the following JMS entries in the weblogic console

	DemoSupplierTopic	Topic              	jms/DemoSupplierTopic	SOASubDeployment	SOAJMSServer
	DemoSupplierTopicCF	Connection Factory	jms/DemoSupplierTopicCF	SOASubDeployment	SOAJMSServer

   Also create a new connection factory in the jms adapter deployment

	JNDI Name: eis/Jms/TopicConnectionFactory

	AcknowledgeMode	                java.lang.String	AUTO_ACKNOWLEDGE
	ConnectionFactoryLocation	java.lang.String	jms/DemoSupplierTopicCF
	FactoryProperties	        java.lang.String	
	IsTopic	                        java.lang.Boolean	true
	IsTransacted	                java.lang.Boolean	false
	Password	                java.lang.String	weblogic
	Username	                java.lang.String	weblogic

   Alternatively the $FOD_HOME/bin/build.xml contains a target named "seedFodJmsResources" which creates those. 

3) For the file adapter, part of the FulFillment mediator, make sure that the  orderbooking.file.adapter.dir property in the main build properties points to a writable directory on.the server

4) Make sure BPM user "jstein" is seeded - as the task for order approval is assigned to him. If not the process will generate a recoverable fault and the task is assigned to weblogic user. The (re)assigned task can be found under "Adminstrative tasks" in the worklist. 

   The demo users can be seeded through $FOD/bin/build.xml's "seedDemoUsers" target  

5) In case you chose to deploy the bam orderbooking composite - make sure that build.properties in BamOrderBookingComposite/bin point to your BAM server. To seed the dataobjects use the "seedBAMServerObjects" target. To change the eis/bam/rmi connection factory of the Bam adapter use the "seedBAMAdapterResources" target. Both is done if the demo is installed through "server-setup-seed-deploy-test" and use.bam is set to true

6) In case you chose to deploy the B2BX12OrderGateway - import and deploy the agreements in B2BX12OrderGateway/config to the B2B Server and enable the inbound listener channel. Alternatively the "importAndDeployB2BTradingAgreements" target in B2BX12OrderGateway/bin/build_sca_composite.xml will be called during demo installation.

Make sure that the inbound listener channel points to a usable directory, and create the 
orclsrvs_in directory in it. Also install the xEngine in case it was not seeded - this can be done by extracting the binaries into
$OH/soa/thirdparty/edifecs

7) Inside of the B2BX12OrderGateway's composite.xml on the process, set use.events to true, if the communication should be event based.

-----------------------
Latest certified labels (this means the code is CERTIFIED WITH THIS LABELSET *ONLY*!):

  PCBPEL_MAIN_GENERIC_090507.0200.2787 + corresponding jdeveloper

-----------------------
Open bugs:

 - Bug 7601144 - weblogic.jndi.enabledefaultuser doesn't seem to be working as documented

   This only comes into play with bam orderbooking and human approval workflow being used 
