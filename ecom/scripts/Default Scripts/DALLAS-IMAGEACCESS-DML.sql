------------*************************COUNTY SPECIFIC SCRIPTS *******************************************---------------
/* TO BE RUN FOR NEW COUNTY INSTALLATION */
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- INSERT SITE INFORMATION ---
DECLARE @NODE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_NODE WHERE NAME = 'RECORDSMANAGEMENT')
INSERT INTO ECOMM_SITE (NAME, DESCRIPTION, ACTIVE, COUNTY, STATE, AUTOACTIVATE, TIMEZONE, NODE_ID, DATE_TIME_CREATED, DATE_TIME_MOD, 
	MOD_USER_ID, SUBSCRIPTION_VALIDATION_TEXT, ENABLE_MICRO_TX_OTC, ENABLE_MICRO_TX_WEB, NAME_ON_CHECK, CREATED_BY, CHECK_HOLD_PERIOD, SEARCH_DAY_THRESHOLD, USER_RETENTION_DAYS)
VALUES ('DALLAS-IMAGEACCESS', 'Dallas County Image Access', 'Y', 'Dallas', 'TX', 'Y', 'America/New_York', @NODE_ID, GETDATE(), GETDATE(), 'SYSTEM', 
	'You can choose only one of the available subscriptions for Dallas.', 'Y', 'Y', 'Dallas County', 'SYSTEM', 72, 30, 30)
GO

--- INSERT SITE CONFIGURATION INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS-IMAGEACCESS')
INSERT INTO SITE_CONFIGURATION (SITE_ID, EMAIL_TEMPLATE_FOLDER, FROM_EMAIL_ADDRESS, PAYMENT_CONF_SUB, CHANGE_SUBSCRIPTION_SUB, CANCEL_SUBSCRIPTION_SUB, 
	REACTIVATE_SUBSCRIPTION_SUB, RECURRING_PAYMENT_SUCCESS_SUB, RECURRING_PAYMENT_UNSUCCESSFUL_SUB, PAYMENT_CONF_TEMPLATE, CHANGE_SUBSCRIPTION_TEMPLATE, 
	CANCEL_SUBSCRIPTION_TEMPLATE, REACTIVATE_CANCELLED_SUBSCRIPTION_TEMPLATE, RECURRING_PAYMENT_SUCCESS_TEMPLATE, RECURRING_PAYMENT_UNSUCCESSFUL_TEMPLATE, 
	DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, WEB_PAYMENT_CONFIRMATION_SUB, WEB_PAYMENT_CONFIRMATION_TEMPLATE,REMOVE_SUBSCRIPTION_SUB, 
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
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS-IMAGEACCESS')
INSERT INTO ECOMM_MERCHANTINFO (SITE_ID, USERNAME, PASSWORD, VENDORNAME, ACTIVE, PARTNER, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, IS_MICROPAYMENT_ACCOUNT, CREATED_BY, TRAN_FEE_PERCENTAGE, TRAN_FEE_FLAT)
VALUES (@SITE_ID, 'vpratti', 'uavYiFVA2PbFMHA31+OyWIz1cOQU+ewwoUExCkBndRY=', 'amcadepay', 'Y', 'paypal', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'SYSTEM', '1.9','0.30')
GO

DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS-IMAGEACCESS')
INSERT INTO ECOMM_MERCHANTINFO (SITE_ID, USERNAME, PASSWORD, VENDORNAME, ACTIVE, PARTNER, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, IS_MICROPAYMENT_ACCOUNT, CREATED_BY, TRAN_FEE_PERCENTAGE, TRAN_FEE_FLAT)
VALUES (@SITE_ID, 'dallasroam', '2gJL6bVchd+y/3V6yf440xcfy78IWMO0I/LqQsoTbXc=', 'amcadepay', 'Y', 'paypal', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM', '1.9','0.30')
GO

--- INSERT MAGENSA INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS-IMAGEACCESS')
INSERT INTO ECOMM_MAGENSAINFO (SITE_ID, HOST_ID, HOST_PASSWORD, REGISTEREDBY, ENCRYPTION_BLOCK_TYPE, CARD_TYPE, OUTPUT_FORMAT_CODE, ACTIVE, 
	DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, CREATED_BY)
VALUES (@SITE_ID, 'MAG527997454', '6JR9jqHe0je68YkZz2HlRb1mIbsZFORf9HZgouyuR8Y=', 'AMCAD', 1, 1, 101, 'Y', GETDATE(), GETDATE(), 'SYSTEM', 'SYSTEM')
GO

--- INSERT CREDIT USAGE FEE INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS-IMAGEACCESS')
INSERT INTO ECOMM_CREDITUSAGE_FEE (SITE_ID, TX_FEE_FLAT, TX_FLAT_FEE_CUTOFF_AMT, TX_FEE_PERCENT, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, 
	ACTIVE, DOWNGRADE_FEE, TX_FEE_ADDITIONAL, MICRO_TX_CUT_OFF, CREATED_BY)
VALUES (@SITE_ID, '5.00', '60.00', '5.00', GETDATE(), GETDATE(), 'SYSTEM', 'Y', '5.00', '0.00', '8.33', 'SYSTEM')
GO

--- INSERT WEB PAYMENT FEE INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS-IMAGEACCESS')
INSERT INTO ECOMM_WEBPAYMENT_FEE (SITE_ID, TX_FEE_FLAT, TX_FLAT_FEE_CUTOFF_AMT, TX_FEE_PERCENT, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, 
	ACTIVE, TX_FEE_ADDITIONAL, MICRO_TX_CUT_OFF, CREATED_BY)
VALUES (@SITE_ID, '5.00', '60.00', '5.00', GETDATE(), GETDATE(), 'SYSTEM', 'Y', '0.00', '8.33', 'SYSTEM')
GO


--- INSERT TERM TYPE INFORMATION ---
INSERT INTO AUTH_TERM_TYP (TERM_TYP_CD, TERM_TYP_DESC, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
VALUES ('R', 'REGISTRATION', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
GO

--- INSERT TERM INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS-IMAGEACCESS')
DECLARE @TERM_TYPE_ID AS INT = (SELECT TOP 1 ID FROM AUTH_TERM_TYP WHERE TERM_TYP_CD = 'R')
INSERT INTO AUTH_TERMS (TERM_DESC, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, SITE_ID, TERM_TYP_ID, ACTIVE, CREATED_BY)
VALUES ('DALLAS - TERMS AND CONDITIONS', GETDATE(), GETDATE(), 'SYSTEM', @SITE_ID, @TERM_TYPE_ID, 'Y', 'SYSTEM')
GO

--- INSERT ACCESS INFORMATION ---
INSERT INTO AUTH_ACCESS (ACCESS_CD, ACCESS_DESCR, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, GUEST_FLG, ACTIVE, ACCESS_FEATURES, DEFAULT_ACCESS_FLG, ACCESS_ORDER, CREATED_BY, IS_AUTHORIZATION_REQUIRED)
VALUES ('DALLASIMAGEACCESS_ADMIN', 'Dallas County IMAGE ACCESS ADMIN', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'Y', 'ACCESS TO THE ROAM IMAGE ACCESS DESKTOP.', 'N', NULL, 'SYSTEM', 'N')
INSERT INTO AUTH_ACCESS (ACCESS_CD, ACCESS_DESCR, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, GUEST_FLG, ACTIVE, ACCESS_FEATURES, DEFAULT_ACCESS_FLG, ACCESS_ORDER, CREATED_BY, IS_AUTHORIZATION_REQUIRED)
VALUES ('DALLAS_PERPAGE_ACCESS', 'Dallas Pay As You Go Access', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'Y', 'Provides access to all Dallas County Marriage Records. This subscription is Pay-As-You-Go and documents can be purchased individually. The charge is $1 for each of the first two pages and $0.50 for each of the remaining pages.', 'N', '4', 'SYSTEM', 'N')
GO

--- INSERT SITE ACCESS INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS-IMAGEACCESS')
DECLARE @ACCESS_ID AS INT = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_PERPAGE_ACCESS')
INSERT INTO ECOMM_SITE_ACCESS (SITE_ID, ACCESS_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
VALUES (@SITE_ID, @ACCESS_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLASIMAGEACCESS_ADMIN')
INSERT INTO ECOMM_SITE_ACCESS (SITE_ID, ACCESS_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
VALUES (@SITE_ID, @ACCESS_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
GO

--- INSERT SUBSCRIPTIONFEE INFORMATION ---
DECLARE @SUBSCRIPTION_TYP_ID AS INT = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'PPV')
DECLARE @SITEACCESS_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE_ACCESS WHERE ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_PERPAGE_ACCESS'))
INSERT INTO ECOMM_SUBSCRIPTIONFEE (SUBSCRIPTION_TYP_ID, SITEACCESS_ID, FEE, TERM, CURRENCY, ACTIVE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, CREATED_BY)
VALUES (@SUBSCRIPTION_TYP_ID, @SITEACCESS_ID, '0', -1, 'USD', 'Y', GETDATE(), GETDATE(), 'SYSTEM', 'SYSTEM')		
GO

--- INSERT NON RECURRING FEE INFORMATION ---
DECLARE @SUBSCRIPTION_TYP_ID AS INT = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'PPV')
DECLARE @ACCESS_ID AS INT = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_PERPAGE_ACCESS')
INSERT INTO ECOMM_NON_RECURRING_FEE (SUBSCRIPTION_TYP_ID, ACCESS_ID, FEE_UNDER_PAGE_THRESHOLD, PAGE_THRESHOLD, FEE_OVER_PAGE_THRESHOLD, IS_SERVICE_FEE, CURRENCY, 
DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY) VALUES (@SUBSCRIPTION_TYP_ID, @ACCESS_ID, '1.00', 2, '0.50', 'N', 'USD', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
GO

--- INSERT BANK DETAILS ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS-IMAGEACCESS')
INSERT INTO ECOMM_BANK_DETAILS (SITE_ID, FROM_FNAME, FROM_LNAME, FROM_MINITIAL, FROM_ADDRLINE1, FROM_ADDRLINE2, FROM_CITY, FROM_STATE, FROM_ZIPCODE, FROM_PHONENUM,
								BANK_NAME, BANK_CODE, ROUTING_NUM, ACCOUNT_NUM, LAST_ISSUED_CHECK_NUM, START_CHECK_NUM, END_CHECK_NUM, BANK_ADDRLINE1, BANK_ADDRLINE2, BANK_CITY, BANK_STATE, BANK_ZIPCODE,
								DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
						VALUES (@SITE_ID, 'AMCAD', '', '','15867 N Mountain Road','','Broadway','VA','22815','','BB&T','111-20/121','056005318','0005132069613', 20000, 20000, 29999, 
								NULL,NULL,NULL,NULL,NULL,GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
								
GO
--- INSERT ROAM ADMIN USER ---								
INSERT INTO AUTH_USERS (EMAIL_ID, PASSWORD, FIRST_NAME, LAST_NAME, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP, PHONE, CREATED_IP, 
						ACCOUNT_NONEXPIRED, ACCOUNT_NONLOCKED, CREDENIALS_NONEXPIRED, ACTIVE, LAST_LOGIN_TIME, REGISTERED_NODE, CURRENT_LOGIN_TIME, CREATED_BY)
				VALUES ('dallasimageaccessadmin@amcad.com', 'ZvWawqsY/FXAJG16k4Z4dQrzk0dJ/dAYukkIq4zh8m0=', 'ROAM', 'ADMIN', GETDATE(), GETDATE(), 'admin@amcad.com', null, null, null, null, null, null, '1.1.1.1.1', 
						'Y', 'Y', 'Y', 'Y', GETDATE(), 'RECORDSMANAGEMENT', GETDATE(), 'SYSTEM')
DECLARE @ACCESS_ID AS INT = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLASIMAGEACCESS_ADMIN')
DECLARE @USER_ID AS INT = (SELECT TOP 1 ID FROM AUTH_USERS WHERE EMAIL_ID = 'dallasimageaccessadmin@amcad.com')
INSERT INTO AUTH_USERS_ACCESS (ACCESS_ID, USER_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, COMMENTS, IS_ACCESS_OVERRIDDEN, CREATED_BY, IS_AUTHORIZED)
				VALUES (@ACCESS_ID, @USER_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', NULL, 'N', 'SYSTEM', 'N')
GO

--- INSERT RECEIPT CONFIGURATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'DALLAS-IMAGEACCESS')
INSERT INTO ECOMM_RECEIPT_CONFIGURATION (SITE_ID, BUSINESSNAME, ADDRESS_LINE_1, ADDRESS_LINE_2, CITY, STATE, ZIP, PHONE, COMMENTS_1, COMMENTS_2, TYPE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY) VALUES (@SITE_ID, 'AMCAD', '220 Spring St', 'Suite 150', 'Herndon', 'VA','20170','7037377775','','','OTC',GETDATE(), GETDATE(), 'SYSTEM','Y', 'SYSTEM')
GO



--- INSERT PROFIT SHARE ---
DECLARE @ACCESS_ID AS INT = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'DALLAS_PERPAGE_ACCESS')
INSERT INTO ECOMM_PROFIT_SHARE (ACCESS_ID, CLIENT_SHARE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
            VALUES(@ACCESS_ID, 0.50, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')	
	