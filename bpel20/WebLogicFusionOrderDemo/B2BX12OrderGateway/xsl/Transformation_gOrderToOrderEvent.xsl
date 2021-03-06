<?xml version="1.0" encoding="UTF-8" ?>
<?oracle-xsl-mapper
  <!-- SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY. -->
  <mapSources>
    <source type="WSDL">
      <schema location="../services/oracle/fodemo/storefront/store/service/common/serviceinterface/StoreFrontService.wsdl"/>
      <rootElement name="createOrderInfoVOSDO" namespace="www.globalcompany.example.com/types/"/>
    </source>
  </mapSources>
  <mapTargets>
    <target type="XSD">
      <schema location="../services/oracle/fodemo/storefront/entities/events/OrderEO.xsd"/>
      <rootElement name="NewOrderSubmittedInfo" namespace="/oracle/fodemo/storefront/entities/events/schema/OrderEO"/>
    </target>
  </mapTargets>
  <!-- GENERATED BY ORACLE XSL MAPPER 11.1.1.0.0(build 090528.1400.2831) AT [MON JUN 01 08:57:13 PDT 2009]. -->
?>
<xsl:stylesheet version="1.0"
                xmlns:bpws="http://schemas.xmlsoap.org/ws/2003/03/business-process/"
                xmlns:xpath20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:types="www.globalcompany.example.com/types/"
                xmlns:ns1="/oracle/fodemo/storefront/entities/events/schema/OrderEO"
                xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:ora="http://schemas.oracle.com/xpath/extension"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:errors="http://xmlns.oracle.com/adf/svc/errors/"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:ns3="commonj.sdo/xml"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:ns4="http://xmlns.oracle.com/adf/svc/types/"
                xmlns:hwf="http://xmlns.oracle.com/bpel/workflow/xpath"
                xmlns:tns="www.globalcompany.example.com"
                xmlns:med="http://schemas.oracle.com/mediator/xpath"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns5="commonj.sdo/java"
                xmlns:ns0="urn:oracle:integration:b2b:X12/4010/850"
                xmlns:ns6="/oracle/fodemo/storefront/store/queries/common/"
                xmlns:ids="http://xmlns.oracle.com/bpel/services/IdentityService/xpath"
                xmlns:xdk="http://schemas.oracle.com/bpel/extension/xpath/function/xdk"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:ns2="commonj.sdo"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xsi xsl types soap wsdl errors ns3 ns4 tns ns5 ns6 ns2 xsd ns1 bpws xpath20 ora socket mhdr oraext dvm hwf med ids xdk xref">
  <xsl:template match="/">
    <ns1:NewOrderSubmittedInfo>
      <ns1:OrderId>
        <ns1:newValue>
          <xsl:attribute name="value">
            <xsl:value-of select="/types:createOrderInfoVOSDO/types:orderInfoVO1/ns6:OrderId"/>
          </xsl:attribute>
        </ns1:newValue>
      </ns1:OrderId>
    </ns1:NewOrderSubmittedInfo>
  </xsl:template>
</xsl:stylesheet>
