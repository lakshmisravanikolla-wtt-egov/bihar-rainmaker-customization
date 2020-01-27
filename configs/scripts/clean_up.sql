---------- Changing column type from varchar to text -------------
ALTER TABLE message ALTER COLUMN message TYPE text;


----- To enable cancel receipt --------------
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";


------------------------------------- Data clean up scripts ---------------------------
-------DELETE TL DATA

TRUNCATE
eg_tl_tradelicense_audit, 
eg_tl_tradelicensedetail_audit, 
eg_tl_institution, eg_tl_address, 
eg_tl_verificationdocument, 
eg_tl_applicationdocument,  
eg_tl_document_owner, 
eg_tl_owner, 
eg_tl_tradeunit, 
eg_tl_calculator_accessory, 
eg_tl_calculator_tradetype, 
eg_tl_accessory, 
eg_tl_tradelicensedetail, 
eg_tl_tradelicense 
RESTART IDENTITY;





-------DELETE PT DATA
TRUNCATE
 eg_pt_address_audit_v2,
 eg_pt_document_propertydetail_v2,
 eg_pt_drafts_v2,
 eg_pt_property_audit_v2,
 eg_pt_unit_v2,
 eg_pt_owner_v2, 
 eg_pt_institution_v2,
 eg_pt_document_owner_v2,
 eg_pt_propertydetail_v2,
 eg_pt_assessment,
 eg_pt_property_v2, 
 eg_pt_address_v2
RESTART IDENTITY;


-------DELETE WF DATA
TRUNCATE
 eg_wf_document_v2,
 eg_wf_processinstance_v2
RESTART IDENTITY;

-------DELETE BILL DATA
TRUNCATE
 egbs_demanddetail_v1_audit,
 egbs_demand_v1_audit,
 egbs_billdetail_v1, egbs_billaccountdetail_v1,
 egbs_bill_v1,
 egbs_demanddetail_v1,
 egbs_demand_v1
RESTART IDENTITY;

-------DELETE CL DATA
TRUNCATE
 egcl_bankaccountservicemapping,
 egcl_bill,
 egcl_bill_audit,
 egcl_billaccountdetail,
 egcl_billdetial,
 egcl_billdetial_audit,
 egcl_instrumentheader,
 egcl_instrumentheader_v1,
 egcl_instrumentheader_v1_history,
 egcl_payment,
 egcl_payment_audit,
 egcl_paymentdetail,
 egcl_paymentdetail_audit,
 egcl_receiptdetails,
 egcl_receiptdetails_v1,
 egcl_receiptdetails_v1_history,
 egcl_receiptheader,
 egcl_receiptheader_v1,
 egcl_receiptheader_v1_history,
 egcl_receiptinstrument,
 egcl_receiptinstrument_v1,
 egcl_remittance,
 egcl_remittancedetails,
 egcl_remittanceinstrument,
 egcl_remittancereceipt
RESTART IDENTITY;

-------DELETE HRMS DATA

DELETE FROM eg_hrms_departmentaltests WHERE employeeid in (SELECT uuid FROM eg_user WHERE username NOT IN ('BH_SUPERUSER', 'BH_HRMS'));
DELETE FROM eg_hrms_educationaldetails WHERE employeeid in (SELECT uuid FROM eg_user WHERE username NOT IN ('BH_SUPERUSER', 'BH_HRMS'));
DELETE FROM eg_hrms_empdocuments WHERE employeeid in (SELECT uuid FROM eg_user WHERE username NOT IN ('BH_SUPERUSER', 'BH_HRMS'));
DELETE FROM eg_hrms_jurisdiction WHERE employeeid in (SELECT uuid FROM eg_user WHERE username NOT IN ('BH_SUPERUSER', 'BH_HRMS'));
DELETE FROM eg_hrms_servicehistory WHERE employeeid in (SELECT uuid FROM eg_user WHERE username NOT IN ('BH_SUPERUSER', 'BH_HRMS'));
DELETE FROM eg_hrms_deactivationdetails WHERE employeeid in (SELECT uuid FROM eg_user WHERE username NOT IN ('BH_SUPERUSER', 'BH_HRMS'));
DELETE FROM eg_hrms_assignment WHERE employeeid in (SELECT uuid FROM eg_user WHERE username NOT IN ('BH_SUPERUSER', 'BH_HRMS'));
DELETE FROM eg_hrms_employee WHERE uuid in (SELECT uuid FROM eg_user WHERE username NOT IN ('BH_SUPERUSER', 'BH_HRMS'));


-------DELETE USER DATA

TRUNCATE eg_user_login_failed_attempts RESTART IDENTITY;

DELETE FROM eg_user_address WHERE userid in (SELECT id FROM eg_user WHERE username NOT IN ('BH_SUPERUSER', 'BH_HRMS'));
DELETE FROM eg_userrole_v1 WHERE user_id in (SELECT id FROM eg_user WHERE username NOT IN ('BH_SUPERUSER', 'BH_HRMS'));
DELETE FROM eg_user WHERE username NOT IN ('BH_SUPERUSER', 'BH_HRMS');


--- RESTARTING SEQ 
ALTER SEQUENCE SEQ_EG_TL_APL RESTART WITH 1;
ALTER SEQUENCE SEQ_EG_PT_LN RESTART WITH 1;
ALTER SEQUENCE SEQ_EG_HRMS_EMP_CODE RESTART WITH 1;
ALTER SEQUENCE SEQ_COLL_RCPT_NUM RESTART WITH 1;
ALTER SEQUENCE seq_uc_demand_consumer_code RESTART WITH 1;


DROP SEQUENCE IF EXISTS SEQ_EG_TL_APL_BH_hajipur;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_APL_BH_biharsharif;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_APL_BH_danapur;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_APL_BH_muzaffarpur;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_APL_BH_sitamarhi;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_APL_BH_bhagalpur;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_APL_BH_katihar;
CREATE SEQUENCE SEQ_EG_TL_APL_BH_hajipur;
CREATE SEQUENCE SEQ_EG_TL_APL_BH_biharsharif;
CREATE SEQUENCE SEQ_EG_TL_APL_BH_danapur;
CREATE SEQUENCE SEQ_EG_TL_APL_BH_muzaffarpur;
CREATE SEQUENCE SEQ_EG_TL_APL_BH_sitamarhi;
CREATE SEQUENCE SEQ_EG_TL_APL_BH_bhagalpur;
CREATE SEQUENCE SEQ_EG_TL_APL_BH_katihar;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_LN_BH_hajipur;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_LN_BH_biharsharif;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_LN_BH_danapur;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_LN_BH_muzaffarpur;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_LN_BH_sitamarhi;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_LN_BH_bhagalpur;
DROP SEQUENCE IF EXISTS SEQ_EG_TL_LN_BH_katihar;
CREATE SEQUENCE SEQ_EG_TL_LN_BH_hajipur;
CREATE SEQUENCE SEQ_EG_TL_LN_BH_biharsharif;
CREATE SEQUENCE SEQ_EG_TL_LN_BH_danapur;
CREATE SEQUENCE SEQ_EG_TL_LN_BH_muzaffarpur;
CREATE SEQUENCE SEQ_EG_TL_LN_BH_sitamarhi;
CREATE SEQUENCE SEQ_EG_TL_LN_BH_bhagalpur;
CREATE SEQUENCE SEQ_EG_TL_LN_BH_katihar;







------- DONT DELETE
--- eg_filestoremap
--- eg_pt_billingslab_v2
--- eg_tl_billingslab
--- eg_token
--- eg_wf_action_v2
--- eg_wf_businessservice_v2
--- eg_wf_state_v2
--- message
--- pg_buffercache
--- pg_stat_statements
