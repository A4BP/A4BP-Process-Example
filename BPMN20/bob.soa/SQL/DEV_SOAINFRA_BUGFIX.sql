ALTER TABLE DLV_SUBSCRIPTION MODIFY ( SUBSCRIBER_ID VARCHAR2(1000 BYTE));
ALTER TABLE WORK_ITEM MODIFY ( CUSTOM_ID VARCHAR2(1000 BYTE));
ALTER TABLE CUBE_INSTANCE MODIFY ( PARENT_REF_ID VARCHAR2(1000 BYTE));
ALTER TABLE DLV_MESSAGE MODIFY ( RES_SUBSCRIBER VARCHAR2(1000 BYTE));
ALTER TABLE WFTASK MODIFY ( PARENTCOMPONENTINSTREFID VARCHAR2(1000 BYTE));
ALTER TABLE WFTASKHISTORY MODIFY ( PARENTCOMPONENTINSTREFID VARCHAR2(1000 BYTE));
