------------*************************COUNTY SPECIFIC SCRIPTS *******************************************---------------
/* TO BE RUN FOR NEW COUNTY INSTALLATION */
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- INSERT SITE INFORMATION ---
DECLARE @NODE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_NODE WHERE NAME = 'RECORDSMANAGEMENT')
INSERT INTO ECOMM_SITE (NAME, DESCRIPTION, ACTIVE, COUNTY, STATE, AUTOACTIVATE, TIMEZONE, NODE_ID, DATE_TIME_CREATED, DATE_TIME_MOD, 
	MOD_USER_ID, SUBSCRIPTION_VALIDATION_TEXT, ENABLE_MICRO_TX_OTC, ENABLE_MICRO_TX_WEB, NAME_ON_CHECK, CREATED_BY, CHECK_HOLD_PERIOD, SEARCH_DAY_THRESHOLD, USER_RETENTION_DAYS)
VALUES ('DALLAS', 'Dallas County', 'Y', 'Dallas', 'TX', 'Y', 'America/New_York', @NODE_ID, GETDATE(), GETDATE(), 'SYSTEM', 
	'You can choose only one of the available subscriptions for Dallas.', 'Y', 'Y', 'Dallas County', 'SYSTEM', 72, 30, 30)
GO

--- INSERT SITE CONFIGURATION INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS')
INSERT INTO SITE_CONFIGURATION (SITE_ID, EMAIL_TEMPLATE_FOLDER, FROM_EMAIL_ADDRESS, PAYMENT_CONF_SUB, CHANGE_SUBSCRIPTION_SUB, CANCEL_SUBSCRIPTION_SUB, 
	REACTIVATE_SUBSCRIPTION_SUB, RECURRING_PAYMENT_SUCCESS_SUB, RECURRING_PAYMENT_UNSUCCESSFUL_SUB, PAYMENT_CONF_TEMPLATE, CHANGE_SUBSCRIPTION_TEMPLATE, 
	CANCEL_SUBSCRIPTION_TEMPLATE, REACTIVATE_CANCELLED_SUBSCRIPTION_TEMPLATE, RECURRING_PAYMENT_SUCCESS_TEMPLATE, RECURRING_PAYMENT_UNSUCCESSFUL_TEMPLATE, 
	DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, WEB_PAYMENT_CONFIRMATION_SUB, WEB_PAYMENT_CONFIRMATION_TEMPLATE, REMOVE_SUBSCRIPTION_SUB, 
	REMOVE_SUBSCRIPTION_TEMPLATE, CREATED_BY, ACCESS_AUTHORIZATION_SUB, ACCESS_AUTHORIZATION_TEMPLATE)
VALUES (@SITE_ID, 'Records Management/DALLAS/', 'webmaster@dallascounty.org', 'Payment Confirmation - Roam Dallas Property Records', 
	'Subscription Change Notification - Roam Dallas Property Records', 'Cancelled Subscription Notification - Roam Dallas Property Records', 
	'Subscription Reactivated - Roam Dallas Property Records', 'Recurring Payment Posted Successfully - Roam Dallas Property Records', 
	'Recurring Payment Failed - Roam Dallas Property Records',
	'paymentConfirmation.stl', 'changeConfirmation.stl', 'cancelConfirmation.stl', 'cancelConfirmation.stl', 'recurringPaymentSuccessfulTemplate.stl', 
	'recurringPaymentUnsuccessfulTemplate.stl', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'Web Purchase Confirmation - Roam Dallas Property Records', 'webPaymentConfirmation.stl',
	'Subscription Removed - Roam Dallas Records Management', 'removeSubscription.stl', 'SYSTEM', 'Access Authorization - Roam Dallas Records Management', 'accessAuthorization.stl')
GO

--- INSERT MERCHANT INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS')
INSERT INTO ECOMM_MERCHANTINFO (SITE_ID, USERNAME, PASSWORD, VENDORNAME, ACTIVE, PARTNER, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, IS_MICROPAYMENT_ACCOUNT, CREATED_BY, TRAN_FEE_PERCENTAGE, TRAN_FEE_FLAT, TRAN_FEE_PERCENTAGE_AMEX, TRAN_FEE_FLAT_AMEX)
VALUES (@SITE_ID, 'vpratti', '239C4BED958C2527627816CD4CE18E8FE3EF87334EAF57A9AA5A5657F8239258', 'amcadepay', 'Y', 'paypal', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'SYSTEM', '2.2','0.30','3.50', '0.00')
GO

DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS')
INSERT INTO ECOMM_MERCHANTINFO (SITE_ID, USERNAME, PASSWORD, VENDORNAME, ACTIVE, PARTNER, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, IS_MICROPAYMENT_ACCOUNT, CREATED_BY, TRAN_FEE_PERCENTAGE, TRAN_FEE_FLAT, TRAN_FEE_PERCENTAGE_AMEX, TRAN_FEE_FLAT_AMEX)
VALUES (@SITE_ID, 'vpratti', '239C4BED958C2527627816CD4CE18E8FE3EF87334EAF57A9AA5A5657F8239258', 'amcadepay', 'Y', 'paypal', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM', '2.2','0.30','3.50', '0.00')
GO

--- INSERT MAGENSA INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS')
INSERT INTO ECOMM_MAGENSAINFO (SITE_ID, HOST_ID, HOST_PASSWORD, REGISTEREDBY, ENCRYPTION_BLOCK_TYPE, CARD_TYPE, OUTPUT_FORMAT_CODE, ACTIVE, 
	DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, CREATED_BY)
VALUES (@SITE_ID, 'MAG527997454', 'A36B2CE63B1234A4912C0D933CE63C75E30B9FC6E04AFC1AB70FC678ABC7756E', 'AMCAD', 1, 1, 101, 'Y', GETDATE(), GETDATE(), 'SYSTEM', 'SYSTEM')
GO

--- INSERT CREDIT USAGE FEE INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS')
INSERT INTO ECOMM_CREDITUSAGE_FEE (SITE_ID, TX_FEE_FLAT, TX_FLAT_FEE_CUTOFF_AMT, TX_FEE_PERCENT, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, 
	ACTIVE, DOWNGRADE_FEE, TX_FEE_ADDITIONAL, MICRO_TX_CUT_OFF, CREATED_BY)
VALUES (@SITE_ID, '5.00', '60.00', '5.00', GETDATE(), GETDATE(), 'SYSTEM', 'Y', '5.00', '0.00', '8.33', 'SYSTEM')
GO

--- INSERT WEB PAYMENT FEE INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS')
INSERT INTO ECOMM_WEBPAYMENT_FEE (SITE_ID, TX_FEE_FLAT, TX_FLAT_FEE_CUTOFF_AMT, TX_FEE_PERCENT, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, 
	ACTIVE, TX_FEE_ADDITIONAL, MICRO_TX_CUT_OFF, CREATED_BY)
VALUES (@SITE_ID, '5.00', '60.00', '5.00', GETDATE(), GETDATE(), 'SYSTEM', 'Y', '0.00', '8.33', 'SYSTEM')
GO

--- INSERT TERM INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS')
DECLARE @TERM_TYPE_ID AS INT = (SELECT TOP 1 ID FROM AUTH_TERM_TYP WHERE TERM_TYP_CD = 'R')
INSERT INTO AUTH_TERMS (TERM_DESC, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, SITE_ID, TERM_TYP_ID, ACTIVE, CREATED_BY)
VALUES ('<b>Terms and Conditions</b><br /><br /><ol><li><u>Access to and use of the Dallas County Clerk''s Office Services (hereinafter "Services") provided by the Dallas County Clerk�s Office is subject to the terms and conditions of this User Agreement and all applicable laws and regulations.</u> This includes the laws and regulations governing copyright, trademark and other intellectual property as it may pertain to the property licensed to the County by AMCAD. For the purposes of this User Agreement,  the Dallas County Clerk�s Office shall be referred to as the "County", and you, the User, will be referred to as "You" (including the possessive "Your"), and the "User".</li> <li><u>By reading this document and accessing the services, you accept without limitation or qualification, all of the terms and conditions in this user agreement.</u> You agree that your acceptance obligates you to pay for access to these Services. This includes an obligation to pay the charges incurred by third parties, whether they are your agents or otherwise, who access this Service through Your account. The County reserves the right to change these terms and conditions and the prices charged for Services at any time. Changes to the terms of this Agreement and charges for Services will only apply to future uses of the Services (i.e. a change to the charge for an individual image will apply to charges occurring after the change, while a change to the charge for subscription access will apply to the next billing cycle following the change.) Your continued use of this Site and these Services after the posting of updates to this Agreement, or the charges for Services will constitute your agreement to those terms or charges, as modified. The County additionally reserves the right to modify or discontinue, at any time, any Services, without notice or liability.<br /> <br /><u>LIABILITY FOR CHARGES INCURRED FOR ACCESS TO SERVICES.</u> By checking the "I agree to the   Terms of Use" box and accessing the Services, you agree to pay the charges established for these Services. The current charges applicable to the use of these Services can be seen by clicking on the Subscription menu.</li><li><u>OWNERSHIP AND PROPRIETARY RIGHTS.</u>  All of the products and Services, including but not limited to text, data, maps, images, graphics, trademarks, logos and service marks (collectively, the "Content"), are owned by the County or licensed to the County by AMCAD, the owner of the Content. Although the County does not claim a copyright, trademark or other intellectual property interest in the Content, AMCAD reserves their copyright, trademark or other intellectual property interests in their property that is part of the Content. In connection with those products and Services, you agree to the following: text, data, maps, images, graphics, trademarks, logos and service marks (collectively, the "Content"), are owned by the County or licensed to the County by third-parties who own the Content and the third party licensors'' property interests are protected by copyright, trademark and other intellectual property laws. In connection with those products and Services, you agree to the following: <ul><li>When accessing the Content, you may print a copy. If a printout and/or download is made, applicable third parties shall retain all rights in this material, and such a printout and/or download shall retain any copyright or other notices contained in that Content.</li><li>You will abide by restrictions set forth on the Site with respect to any of the Content. </li><li>You will not in any way violate the intellectual property laws protecting the third party licensors'' property interests in the Content. </li><li>You will not reuse, republish or otherwise distribute the Content or any modified or altered versions of it, whether over the Internet or otherwise, and whether or not for payment, without the express written permission of the copyright holder. </li><li>You will cooperate promptly and completely with any reasonable request by the County related to an investigation of infringement of copyright or other proprietary right of the third party licensor. </li><li>You agree that the material you are accessing contains the trade secrets and intellectual property of AMCAD, and you will cause irreparable harm to AMCAD if this material is used in violation of this agreement. </li></ul> <li><u>INDEMNIFICATION:</u>You hereby agree to indemnify and hold harmless the County, and its respective officials, agencies, officers, subsidiaries, employees, licensors and agents, from and against any and all liability, loss, claims, damages, costs and/or actions (including attorneys'' fees) based upon or arising out of any breach by you or any third party of the obligations under this Agreement. Notwithstanding your indemnification obligation, the County reserves the right to defend any such claim and you agree to provide us with such reasonable cooperation and information as we may request. <br /> <br /> <u>DISCLAIMER OF WARRANTY AND LIMITATION OF LIABILITY:</u>  The County  makes every effort to update this information on a daily basis. Because Property information is continually changing, the County makes no expressed or implied warranty concerning the accuracy of this information.<ul><li>The information and services and products available to you may contain errors and are subject to periods of interruption. The County will do its best to maintain the information and services it offers.  You agree that all use of these services is at your own risk, and that the County will not be held liable for any errors or omissions contained in the content of its services. <br /><br />The services are provided �as is� and the County expressly disclaims any and all warranties, express and implied, including but not limited to any warranties of accuracy, reliability, title, merchantability, non- infringement, fitness for a particular purpose or any other warranty, condition, guarantee or representation whether oral, in writing or in electronic form, including but not limited to the accuracy or completeness of any information contained therein or provided by the services. The County does not represent or warrant that access to the service will be interrupted or that there will be no failures, errors or omissions or loss of transmitted information. The information, documents and related graphics published on this server could include technical inaccuracies or typographical errors. Changes are periodically made to the information herein. The County may make improvements and/or changes in the services provided and/or the content described herein at any time. <br /><br /> This disclaimer of liability applies to any damages or injury caused by any failure of performance error, omission, interruption, deletion, defect, delay in operation or transmission,  computer viruses, communication line failure, theft or destruction or unauthorized access to alteration of or use of record, whether for breach of contract, tortious behavior, negligence or any other cause of action. No advice or information, whether oral or written, obtained by you from the County or through   or from the service shall create any warranty not expressly stated in this agreement. If you are dissatisfied with the service, or any portion thereof, your exclusive remedy shall be to stop using the service. </li> <li><u>MISCELLANEOUS:</u>The County has the right at any time to change or discontinue any aspect or feature of the services, including, but not limited to, content, hours of availability, and equipment needed for access or use. You must use the services for lawful purposes only. <br /><br /> Any user conduct that restricts or inhibits any other person from using or enjoying the services will not be permitted. Uses such as data mining, screen scraping and the use of electronic BOTS for image download are prohibited. Users that are found to be employing the previously mentioned electronic methods may be restricted on this website. <br /><br />These terms and conditions shall be governed by and construed according to the laws of the State of Texas, USA, and you agree to submit to the personal jurisdiction of the courts of the County of Dallas, State of Texas. If any portion of these terms and conditions is deemed by a court to be invalid, the remaining provisions shall remain in full force and effect. You agree that regardless of any statute or law to the contrary, and claim or cause of action arising out of or related to the use of these services, must be filed within one year after such claim or cause of action arose. <br /><br />This is an offer to provide Services, and acceptance is expressly conditioned upon your acceptance of these terms and only these terms. Your acceptance of this Agreement is demonstrated by checking the box of "I agree to the Terms of Use" in the Registration form. This Agreement represents the entire agreement between you (the user) and the County. </li> </ul></li></ol>',
GETDATE(), GETDATE(), 'SYSTEM', @SITE_ID, @TERM_TYPE_ID, 'Y', 'SYSTEM') 
GO

--- INSERT ACCESS INFORMATION ---
INSERT INTO AUTH_ACCESS (ACCESS_CD, ACCESS_DESCR, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, GUEST_FLG, ACTIVE, ACCESS_FEATURES, DEFAULT_ACCESS_FLG, ACCESS_ORDER, CREATED_BY, IS_AUTHORIZATION_REQUIRED)
VALUES ('DALLAS_ADMIN', 'Dallas County ROAM ADMIN', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'Y', 'ACCESS TO THE ROAM DESKTOP.', 'N', NULL, 'SYSTEM', 'N')

INSERT INTO AUTH_ACCESS (ACCESS_CD, ACCESS_DESCR, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, GUEST_FLG, ACTIVE, ACCESS_FEATURES, DEFAULT_ACCESS_FLG, ACCESS_ORDER, CREATED_BY, IS_AUTHORIZATION_REQUIRED)
VALUES ('DALLAS_LAND_MARR_ACCESS', 'Clerk Index Access with Unlimited Image Access ($400 per month) ', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'Y', 'Provides you with County Clerk index access and unlimited image access, with no watermark.  Also provides you premium features such as phonetic searching, access to data dashboards, and the ability to set up a daily alerts on a record by record basis ($400 per month).', 'Y', '1', 'SYSTEM', 'N')
/*
INSERT INTO AUTH_ACCESS (ACCESS_CD, ACCESS_DESCR, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, GUEST_FLG, ACTIVE, ACCESS_FEATURES, DEFAULT_ACCESS_FLG, ACCESS_ORDER, CREATED_BY, IS_AUTHORIZATION_REQUIRED)
VALUES ('DALLAS_DCAD_ACCESS', 'Appraisal Data Access ($200 per month)', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'Y', 'Provides you with access to Appraisal data, including plotting Appraisal data on a Google Map ($200 per month).', 'N', '2', 'SYSTEM', 'N')

INSERT INTO AUTH_ACCESS (ACCESS_CD, ACCESS_DESCR, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, GUEST_FLG, ACTIVE, ACCESS_FEATURES, DEFAULT_ACCESS_FLG, ACCESS_ORDER, CREATED_BY, IS_AUTHORIZATION_REQUIRED)
VALUES ('DALLAS_ALL_ACCESS', 'Clerk Index Access, Unlimited Clerk Image Access Unlimited Appraisal Data Access ($500 per month)', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'Y', 'Provides you with County Clerk index access, unlimited image access with no watermark, Appraisal Data access including plotting Appraisal data on a Google Map PLUS data linking between County Clerk and Appraisal Data. ($500 per month).', 'N', '3', 'SYSTEM', 'N')
*/

INSERT INTO AUTH_ACCESS (ACCESS_CD, ACCESS_DESCR, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, GUEST_FLG, ACTIVE, ACCESS_FEATURES, DEFAULT_ACCESS_FLG, ACCESS_ORDER, CREATED_BY, IS_AUTHORIZATION_REQUIRED)
VALUES ('DALLAS_PERPAGE_ACCESS', 'Clerk Index Access with Image Preview (free) plus "Pay as You Go" Full Image Access ($2 a page, minimum $3 per document)', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'Y', 'Provides you with County Clerk index access, the ability to preview the first page of any document, plus the ability to view and print documents, with no watermark, for a charge ($2 a page, minimum $3 per document).', 'N', '4', 'SYSTEM', 'N')

INSERT INTO AUTH_ACCESS (ACCESS_CD, ACCESS_DESCR, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, GUEST_FLG, ACTIVE, ACCESS_FEATURES, DEFAULT_ACCESS_FLG, ACCESS_ORDER, CREATED_BY, IS_AUTHORIZATION_REQUIRED)
VALUES ('DALLAS_FREE_ACCESS', 'Clerk Index Access with Image Preview (Free)', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'Y', 'Provides you with County Clerk index access and the ability to preview the first page of any documents (Free).', 'N', '5', 'SYSTEM', 'N')

GO


--- INSERT SITE ACCESS INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS')
DECLARE @ACCESS_ID AS INT = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_ADMIN')
INSERT INTO ECOMM_SITE_ACCESS (SITE_ID, ACCESS_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
VALUES (@SITE_ID, @ACCESS_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_LAND_MARR_ACCESS')
INSERT INTO ECOMM_SITE_ACCESS (SITE_ID, ACCESS_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
VALUES (@SITE_ID, @ACCESS_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')

/*
SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_DCAD_ACCESS')
INSERT INTO ECOMM_SITE_ACCESS (SITE_ID, ACCESS_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
VALUES (@SITE_ID, @ACCESS_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_ALL_ACCESS')
INSERT INTO ECOMM_SITE_ACCESS (SITE_ID, ACCESS_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
VALUES (@SITE_ID, @ACCESS_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
*/

SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_PERPAGE_ACCESS')
INSERT INTO ECOMM_SITE_ACCESS (SITE_ID, ACCESS_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
VALUES (@SITE_ID, @ACCESS_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_FREE_ACCESS')
INSERT INTO ECOMM_SITE_ACCESS (SITE_ID, ACCESS_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
VALUES (@SITE_ID, @ACCESS_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')

GO

--- INSERT SUBSCRIPTIONFEE INFORMATION ---
DECLARE @SUBSCRIPTION_TYP_ID AS INT = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'MONT')
DECLARE @SITEACCESS_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE_ACCESS WHERE ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_LAND_MARR_ACCESS'))
INSERT INTO ECOMM_SUBSCRIPTIONFEE (SUBSCRIPTION_TYP_ID, SITEACCESS_ID, FEE, TERM, CURRENCY, ACTIVE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, CREATED_BY)
VALUES (@SUBSCRIPTION_TYP_ID, @SITEACCESS_ID, '400.00', 0, 'USD', 'Y', GETDATE(), GETDATE(), 'SYSTEM', 'SYSTEM')
/*
SET @SITEACCESS_ID  = (SELECT TOP 1 ID FROM ECOMM_SITE_ACCESS WHERE ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_DCAD_ACCESS'))
INSERT INTO ECOMM_SUBSCRIPTIONFEE (SUBSCRIPTION_TYP_ID, SITEACCESS_ID, FEE, TERM, CURRENCY, ACTIVE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, CREATED_BY)
VALUES (@SUBSCRIPTION_TYP_ID, @SITEACCESS_ID, '200.00', 0, 'USD', 'Y', GETDATE(), GETDATE(), 'SYSTEM', 'SYSTEM')
SET @SITEACCESS_ID  = (SELECT TOP 1 ID FROM ECOMM_SITE_ACCESS WHERE ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_ALL_ACCESS'))
INSERT INTO ECOMM_SUBSCRIPTIONFEE (SUBSCRIPTION_TYP_ID, SITEACCESS_ID, FEE, TERM, CURRENCY, ACTIVE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, CREATED_BY)
VALUES (@SUBSCRIPTION_TYP_ID, @SITEACCESS_ID, '500.00', 0, 'USD', 'Y', GETDATE(), GETDATE(), 'SYSTEM', 'SYSTEM')	
*/
SET @SUBSCRIPTION_TYP_ID = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'PPV')
SET @SITEACCESS_ID = (SELECT TOP 1 ID FROM ECOMM_SITE_ACCESS WHERE ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_PERPAGE_ACCESS'))
INSERT INTO ECOMM_SUBSCRIPTIONFEE (SUBSCRIPTION_TYP_ID, SITEACCESS_ID, FEE, TERM, CURRENCY, ACTIVE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, CREATED_BY)
VALUES (@SUBSCRIPTION_TYP_ID, @SITEACCESS_ID, '0', -1, 'USD', 'Y', GETDATE(), GETDATE(), 'SYSTEM', 'SYSTEM')		
SET @SUBSCRIPTION_TYP_ID = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'FREE')
SET @SITEACCESS_ID = (SELECT TOP 1 ID FROM ECOMM_SITE_ACCESS WHERE ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_FREE_ACCESS'))
INSERT INTO ECOMM_SUBSCRIPTIONFEE (SUBSCRIPTION_TYP_ID, SITEACCESS_ID, FEE, TERM, CURRENCY, ACTIVE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, CREATED_BY)
VALUES (@SUBSCRIPTION_TYP_ID, @SITEACCESS_ID, '0', -1, 'USD', 'Y', GETDATE(), GETDATE(), 'SYSTEM', 'SYSTEM')		
GO	

--- INSERT NON RECURRING FEE INFORMATION ---
DECLARE @SUBSCRIPTION_TYP_ID AS INT = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'PPV')
DECLARE @ACCESS_ID AS INT = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_PERPAGE_ACCESS')
INSERT INTO ECOMM_NON_RECURRING_FEE (SUBSCRIPTION_TYP_ID, ACCESS_ID, FEE_UNDER_PAGE_THRESHOLD, PAGE_THRESHOLD, FEE_OVER_PAGE_THRESHOLD, IS_SERVICE_FEE, CURRENCY, 
DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY) VALUES (@SUBSCRIPTION_TYP_ID, @ACCESS_ID, '1.00', 1, '1.00', 'N', 'USD', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
SET @SUBSCRIPTION_TYP_ID = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'PP')
SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_PERPAGE_ACCESS')
INSERT INTO ECOMM_NON_RECURRING_FEE (SUBSCRIPTION_TYP_ID, ACCESS_ID, FEE_UNDER_PAGE_THRESHOLD, PAGE_THRESHOLD, FEE_OVER_PAGE_THRESHOLD, IS_SERVICE_FEE, CURRENCY, 
DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY) VALUES (@SUBSCRIPTION_TYP_ID, @ACCESS_ID, '2.00', 2, '0.00', 'Y', 'USD', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
SET @SUBSCRIPTION_TYP_ID = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'PPV')
SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_PERPAGE_ACCESS')
INSERT INTO ECOMM_NON_RECURRING_FEE (SUBSCRIPTION_TYP_ID, ACCESS_ID, FEE_UNDER_PAGE_THRESHOLD, PAGE_THRESHOLD, FEE_OVER_PAGE_THRESHOLD, IS_SERVICE_FEE, CURRENCY, 
DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY) VALUES (@SUBSCRIPTION_TYP_ID, @ACCESS_ID, '0.00', 2, '1.00', 'Y', 'USD', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')

GO


--- INSERT BANK DETAILS ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS')
INSERT INTO ECOMM_BANK_DETAILS (SITE_ID, FROM_FNAME, FROM_LNAME, FROM_MINITIAL, FROM_ADDRLINE1, FROM_ADDRLINE2, FROM_CITY, FROM_STATE, FROM_ZIPCODE, FROM_PHONENUM,
								BANK_NAME, BANK_CODE, ROUTING_NUM, ACCOUNT_NUM, LAST_ISSUED_CHECK_NUM, START_CHECK_NUM, END_CHECK_NUM, BANK_ADDRLINE1, BANK_ADDRLINE2, BANK_CITY, BANK_STATE, BANK_ZIPCODE,
								DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
						VALUES (@SITE_ID, 'AMCAD', '', '','15867 N Mountain Road','','Broadway','VA','22815','','BB&T','111-20/121','056005318','0005132069613', 30000, 30000, 39999,
								NULL,NULL,NULL,NULL,NULL,GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')

GO								
--- INSERT SITE ADMIN USER ---
INSERT INTO AUTH_USERS (EMAIL_ID, PASSWORD, FIRST_NAME, LAST_NAME, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP, PHONE, CREATED_IP, 
						ACCOUNT_NONEXPIRED, ACCOUNT_NONLOCKED, CREDENIALS_NONEXPIRED, ACTIVE, LAST_LOGIN_TIME, REGISTERED_NODE, CURRENT_LOGIN_TIME, CREATED_BY)
				VALUES ('dallasadmin@amcad.com', '2851FFD2E30E91904A9E86F326E442065D75DB65A028854E9A5ACEE67E53EA59', 'ROAM', 'ADMIN', GETDATE(), GETDATE(), 'admin@amcad.com', null, null, null, null, null, null, '1.1.1.1.1', 
						'Y', 'Y', 'Y', 'Y', GETDATE(), 'RECORDSMANAGEMENT', GETDATE(), 'SYSTEM')
DECLARE @ACCESS_ID AS INT = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_ADMIN')
DECLARE @USER_ID AS INT = (SELECT TOP 1 ID FROM AUTH_USERS WHERE EMAIL_ID = 'dallasadmin@amcad.com')
INSERT INTO AUTH_USERS_ACCESS (ACCESS_ID, USER_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, COMMENTS, IS_ACCESS_OVERRIDDEN, CREATED_BY, IS_AUTHORIZED)
				VALUES (@ACCESS_ID, @USER_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', NULL, 'N', 'SYSTEM', 'Y')
GO

--- INSERT RECEIPT CONFIGURATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS')
INSERT INTO ECOMM_RECEIPT_CONFIGURATION (SITE_ID, BUSINESSNAME, ADDRESS_LINE_1, ADDRESS_LINE_2, CITY, STATE, ZIP, PHONE, COMMENTS_1, COMMENTS_2, TYPE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY) VALUES 
(@SITE_ID, 'Dallas County Clerk''s Office', '509 Main St', 'Suite 200', 'Dallas', 'TX','75202','2146537099','','','OTC',GETDATE(), GETDATE(), 'SYSTEM','Y', 'SYSTEM')
GO



--- INSERT PROFIT SHARE ---
DECLARE @ACCESS_ID AS INT = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_LAND_MARR_ACCESS')
INSERT INTO ECOMM_PROFIT_SHARE (ACCESS_ID, CLIENT_SHARE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
            VALUES(@ACCESS_ID, 0.50, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')	
/*
SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_DCAD_ACCESS')
INSERT INTO ECOMM_PROFIT_SHARE (ACCESS_ID, CLIENT_SHARE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
            VALUES(@ACCESS_ID, 0.50, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')	
            SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_ALL_ACCESS')
INSERT INTO ECOMM_PROFIT_SHARE (ACCESS_ID, CLIENT_SHARE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
            VALUES(@ACCESS_ID, 0.50, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
*/
SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_PERPAGE_ACCESS')
INSERT INTO ECOMM_PROFIT_SHARE (ACCESS_ID, CLIENT_SHARE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
            VALUES(@ACCESS_ID, 0.50, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')	  
								

