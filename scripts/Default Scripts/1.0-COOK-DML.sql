
------------*************************COUNTY SPECIFIC SCRIPTS *******************************************---------------
/* TO BE RUN FOR NEW COUNTY INSTALLATION */
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--- INSERT SITE INFORMATION ---
DECLARE @NODE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_NODE WHERE NAME = 'CASEMANAGEMENT')
INSERT INTO ECOMM_SITE (NAME, DESCRIPTION, ACTIVE, COUNTY, STATE, AUTOACTIVATE, TIMEZONE, NODE_ID, DATE_TIME_CREATED, DATE_TIME_MOD, 
	MOD_USER_ID, SUBSCRIPTION_VALIDATION_TEXT, ENABLE_MICRO_TX_OTC, ENABLE_MICRO_TX_WEB, NAME_ON_CHECK, CREATED_BY, CHECK_HOLD_PERIOD, SEARCH_DAY_THRESHOLD, USER_RETENTION_DAYS)
VALUES ('COOK', 'Cook County', 'Y', 'Chicago', 'IL', 'Y', 'America/New_York', @NODE_ID, GETDATE(), GETDATE(), 'SYSTEM', 
	'You can choose only one of the available subscriptions for Cook County.', 'Y', 'Y', 'Cook County', 'SYSTEM', 3, 30, 30)
GO

--- INSERT SITE CONFIGURATION INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'COOK')
INSERT INTO SITE_CONFIGURATION (SITE_ID, EMAIL_TEMPLATE_FOLDER, FROM_EMAIL_ADDRESS, PAYMENT_CONF_SUB, CHANGE_SUBSCRIPTION_SUB, CANCEL_SUBSCRIPTION_SUB, 
	REACTIVATE_SUBSCRIPTION_SUB, RECURRING_PAYMENT_SUCCESS_SUB, RECURRING_PAYMENT_UNSUCCESSFUL_SUB, PAYMENT_CONF_TEMPLATE, CHANGE_SUBSCRIPTION_TEMPLATE, 
	CANCEL_SUBSCRIPTION_TEMPLATE, REACTIVATE_CANCELLED_SUBSCRIPTION_TEMPLATE, RECURRING_PAYMENT_SUCCESS_TEMPLATE, RECURRING_PAYMENT_UNSUCCESSFUL_TEMPLATE, 
	DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, WEB_PAYMENT_CONFIRMATION_SUB, WEB_PAYMENT_CONFIRMATION_TEMPLATE,REMOVE_SUBSCRIPTION_SUB, 
	REMOVE_SUBSCRIPTION_TEMPLATE, CREATED_BY, ACCESS_AUTHORIZATION_SUB, ACCESS_AUTHORIZATION_TEMPLATE)
VALUES (@SITE_ID, 'casemanagement/cook', 'noReply@amcad.com', 'Payment Confirmation - Roam Cook County Court Records', 
	'Subscription Change Notification - Roam Cook County Court Records', 'Cancelled Subscription Notification - Roam Cook County Court Records', 
	'Subscription Reactivated - Roam Cook County Court Records', 'Recurring Payment Posted Successfully - Roam Cook County Court Records', 
	'Recurring Payment Failed - Roam Cook County Court Records',
	'paymentConfirmation.stl', 'changeConfirmation.stl', 'cancelConfirmation.stl', 'cancelConfirmation.stl', 'recurringPaymentSuccessfulTemplate.stl', 
	'recurringPaymentUnsuccessfulTemplate.stl', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'Web Purchase Confirmation - Roam Cook County Court Records', 'webPaymentConfirmation.stl', 
	'Subscription Removed - Roam Cook County Court Records', 'removeSubscription.stl', 'SYSTEM', 'Access Authorization - Roam Cook County Court Records', 'accessAuthorization.stl')
GO


--- INSERT MERCHANT INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'COOK')
INSERT INTO ECOMM_MERCHANTINFO (SITE_ID, USERNAME, PASSWORD, VENDORNAME, ACTIVE, PARTNER, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, IS_MICROPAYMENT_ACCOUNT, CREATED_BY, TRAN_FEE_PERCENTAGE, TRAN_FEE_FLAT)
VALUES (@SITE_ID, 'vpratti', 'CEB77F52BC8102C8E237C08B163FA8B03BA120E22FAB31731DD376FED560FF91', 'amcadepay', 'Y', 'paypal', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'SYSTEM', '2.2','0.30')
GO

DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'COOK')
INSERT INTO ECOMM_MERCHANTINFO (SITE_ID, USERNAME, PASSWORD, VENDORNAME, ACTIVE, PARTNER, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, IS_MICROPAYMENT_ACCOUNT, CREATED_BY, TRAN_FEE_PERCENTAGE, TRAN_FEE_FLAT)
VALUES (@SITE_ID, 'vpratti', 'CEB77F52BC8102C8E237C08B163FA8B03BA120E22FAB31731DD376FED560FF91', 'amcadepay', 'Y', 'paypal', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM', '2.2','0.30')
GO

--- INSERT MAGENSA INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'COOK')
INSERT INTO ECOMM_MAGENSAINFO (SITE_ID, HOST_ID, HOST_PASSWORD, REGISTEREDBY, ENCRYPTION_BLOCK_TYPE, CARD_TYPE, OUTPUT_FORMAT_CODE, ACTIVE, 
	DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, CREATED_BY)
VALUES (@SITE_ID, 'MAG527997454', '00959E91C9572E48B2B728AE8AAB53346A9D7AC12471B5C9A5993A5CA5007F22', 'AMCAD', 1, 1, 101, 'Y', GETDATE(), GETDATE(), 'SYSTEM', 'SYSTEM')
GO

--- INSERT CREDIT USAGE FEE INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'COOK')
INSERT INTO ECOMM_CREDITUSAGE_FEE (SITE_ID, TX_FEE_FLAT, TX_FLAT_FEE_CUTOFF_AMT, TX_FEE_PERCENT, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, 
	ACTIVE, DOWNGRADE_FEE, TX_FEE_ADDITIONAL, MICRO_TX_CUT_OFF, CREATED_BY)
VALUES (@SITE_ID, '5.00', '60.00', '5.00', GETDATE(), GETDATE(), 'SYSTEM', 'Y', '5.00', '0.00', '8.33', 'SYSTEM')
GO

--- INSERT WEB PAYMENT FEE INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'COOK')
INSERT INTO ECOMM_WEBPAYMENT_FEE (SITE_ID, TX_FEE_FLAT, TX_FLAT_FEE_CUTOFF_AMT, TX_FEE_PERCENT, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, 
	ACTIVE, TX_FEE_ADDITIONAL, MICRO_TX_CUT_OFF, CREATED_BY)
VALUES (@SITE_ID, '5.00', '60.00', '5.00', GETDATE(), GETDATE(), 'SYSTEM', 'Y', '0.00', '8.33', 'SYSTEM')
GO

--- INSERT TERM INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'COOK')
DECLARE @TERM_TYPE_ID AS INT = (SELECT TOP 1 ID FROM AUTH_TERM_TYP WHERE TERM_TYP_CD = 'R')
INSERT INTO AUTH_TERMS (TERM_DESC, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, SITE_ID, TERM_TYP_ID, ACTIVE, CREATED_BY)
VALUES ('COOK COUNTY - TERMS AND CONDITIONS', GETDATE(), GETDATE(), 'SYSTEM', @SITE_ID, @TERM_TYPE_ID, 'Y', 'SYSTEM')
GO

--- INSERT ACCESS INFORMATION ---
INSERT INTO AUTH_ACCESS (ACCESS_CD, ACCESS_DESCR, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, GUEST_FLG, ACTIVE, ACCESS_FEATURES, DEFAULT_ACCESS_FLG, ACCESS_ORDER, CREATED_BY, IS_AUTHORIZATION_REQUIRED)
VALUES ('COOK_ADMIN', 'Cook County ROAM ADMIN', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'Y', 'ACCESS TO THE ROAM DESKTOP.', 'N', NULL, 'SYSTEM', 'N')

INSERT INTO AUTH_ACCESS (ACCESS_CD, ACCESS_DESCR, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, GUEST_FLG, ACTIVE, ACCESS_FEATURES, DEFAULT_ACCESS_FLG, ACCESS_ORDER, CREATED_BY, IS_AUTHORIZATION_REQUIRED)
VALUES ('COOK_ALL_ACCESS', 'Circuit Court Record Search plus Unlimited Image Access Subscription ($100 Per Month)', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'Y', 'Provides you with Civil and Chancery image access with no watermark. The fee is $100 per month.', 'N', '1', 'SYSTEM', 'Y')

INSERT INTO AUTH_ACCESS (ACCESS_CD, ACCESS_DESCR, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, GUEST_FLG, ACTIVE, ACCESS_FEATURES, DEFAULT_ACCESS_FLG, ACCESS_ORDER, CREATED_BY, IS_AUTHORIZATION_REQUIRED)
VALUES ('COOK_PERPAGE_ACCESS', 'Circuit Court Record Search plus "Pay as You Go" Image Access ($1 a page, minimum $2 per document)', GETDATE(), GETDATE(), 'SYSTEM', 'N', 'Y', 'Provides you with Cook County Civil and Chancery record access, plus the ability to view and print documents, with no watermark, for a charge ($1 a page, minimum $2 per document).', 'N', '2', 'SYSTEM', 'N')

GO


--- INSERT SITE ACCESS INFORMATION ---
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'COOK')
DECLARE @ACCESS_ID AS INT = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'COOK_ADMIN')
INSERT INTO ECOMM_SITE_ACCESS (SITE_ID, ACCESS_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
VALUES (@SITE_ID, @ACCESS_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'COOK_ALL_ACCESS')
INSERT INTO ECOMM_SITE_ACCESS (SITE_ID, ACCESS_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
VALUES (@SITE_ID, @ACCESS_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'COOK_PERPAGE_ACCESS')
INSERT INTO ECOMM_SITE_ACCESS (SITE_ID, ACCESS_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
VALUES (@SITE_ID, @ACCESS_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
GO

--- INSERT SUBSCRIPTIONFEE INFORMATION ---
DECLARE @SUBSCRIPTION_TYP_ID AS INT = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'MONT')
DECLARE @SITEACCESS_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE_ACCESS WHERE ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'COOK_ALL_ACCESS'))
INSERT INTO ECOMM_SUBSCRIPTIONFEE (SUBSCRIPTION_TYP_ID, SITEACCESS_ID, FEE, TERM, CURRENCY, ACTIVE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, CREATED_BY)
VALUES (@SUBSCRIPTION_TYP_ID, @SITEACCESS_ID, '100.00', 0, 'USD', 'Y', GETDATE(), GETDATE(), 'SYSTEM', 'SYSTEM')
SET @SUBSCRIPTION_TYP_ID = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'PPV')
SET @SITEACCESS_ID = (SELECT TOP 1 ID FROM ECOMM_SITE_ACCESS WHERE ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'COOK_PERPAGE_ACCESS'))
INSERT INTO ECOMM_SUBSCRIPTIONFEE (SUBSCRIPTION_TYP_ID, SITEACCESS_ID, FEE, TERM, CURRENCY, ACTIVE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, CREATED_BY)
VALUES (@SUBSCRIPTION_TYP_ID, @SITEACCESS_ID, '0', -1, 'USD', 'Y', GETDATE(), GETDATE(), 'SYSTEM', 'SYSTEM')		
GO	

--- INSERT NON RECURRING FEE INFORMATION ---
DECLARE @SUBSCRIPTION_TYP_ID AS INT = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'PPV')
DECLARE @ACCESS_ID AS INT = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'COOK_PERPAGE_ACCESS')
DECLARE @SITE_ACCESS_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE_ACCESS WHERE ACCESS_ID = @ACCESS_ID)

INSERT INTO ECOMM_NON_RECURRING_FEE (SUBSCRIPTION_TYP_ID, SITEACCESS_ID, FEE_UNDER_PAGE_THRESHOLD, PAGE_THRESHOLD, FEE_OVER_PAGE_THRESHOLD, IS_SERVICE_FEE, CURRENCY, 
DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY) VALUES (@SUBSCRIPTION_TYP_ID, @SITE_ACCESS_ID, '2.00', 1, '0.50', 'N', 'USD', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
SET @SUBSCRIPTION_TYP_ID = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'PPV')

INSERT INTO ECOMM_NON_RECURRING_FEE (SUBSCRIPTION_TYP_ID, SITEACCESS_ID, FEE_UNDER_PAGE_THRESHOLD, PAGE_THRESHOLD, FEE_OVER_PAGE_THRESHOLD, IS_SERVICE_FEE, CURRENCY, 
DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY) VALUES (@SUBSCRIPTION_TYP_ID, @SITE_ACCESS_ID, '0.00', 19, '-0.25', 'N', 'USD', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
SET @SUBSCRIPTION_TYP_ID = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'PP')

INSERT INTO ECOMM_NON_RECURRING_FEE (SUBSCRIPTION_TYP_ID, SITEACCESS_ID, FEE_UNDER_PAGE_THRESHOLD, PAGE_THRESHOLD, FEE_OVER_PAGE_THRESHOLD, IS_SERVICE_FEE, CURRENCY, 
DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY) VALUES (@SUBSCRIPTION_TYP_ID, @SITE_ACCESS_ID, '1.00', 1, '0.00', 'Y', 'USD', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
SET @SUBSCRIPTION_TYP_ID = (SELECT TOP 1 ID FROM CODELOOKUP WHERE CODE = 'PPV')

INSERT INTO ECOMM_NON_RECURRING_FEE (SUBSCRIPTION_TYP_ID, SITEACCESS_ID, FEE_UNDER_PAGE_THRESHOLD, PAGE_THRESHOLD, FEE_OVER_PAGE_THRESHOLD, IS_SERVICE_FEE, CURRENCY, 
DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY) VALUES (@SUBSCRIPTION_TYP_ID, @SITE_ACCESS_ID, '0.00', 1, '1.00', 'Y', 'USD', GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')

GO


--- INSERT BANK DETAILS ---


DECLARE @HIGHESTSTARTCHECKNUM AS INT = (SELECT MAX(START_CHECK_NUM) FROM ECOMM_BANK_DETAILS)
DECLARE @HIGHESTENDCHECKNUM AS INT = (SELECT MAX(END_CHECK_NUM) FROM ECOMM_BANK_DETAILS)
SET @HIGHESTSTARTCHECKNUM = @HIGHESTSTARTCHECKNUM + 10000
SET @HIGHESTENDCHECKNUM = @HIGHESTENDCHECKNUM + 10000
DECLARE @SITE_ID AS INT = (SELECT TOP 1 ID FROM ECOMM_SITE WHERE NAME = 'COOK')
INSERT INTO ECOMM_BANK_DETAILS (SITE_ID, FROM_FNAME, FROM_LNAME, FROM_MINITIAL, FROM_ADDRLINE1, FROM_ADDRLINE2, FROM_CITY, FROM_STATE, FROM_ZIPCODE, FROM_PHONENUM,
								BANK_NAME, BANK_CODE, ROUTING_NUM, ACCOUNT_NUM, LAST_ISSUED_CHECK_NUM, START_CHECK_NUM, END_CHECK_NUM, BANK_ADDRLINE1, BANK_ADDRLINE2, BANK_CITY, BANK_STATE, BANK_ZIPCODE,
								DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
						VALUES (@SITE_ID, 'AMCAD', '', '','15867 N Mountain Road','','Broadway','VA','22815','','Capital Bank','65-334/550','055003340','111989111', @HIGHESTSTARTCHECKNUM, @HIGHESTSTARTCHECKNUM, @HIGHESTENDCHECKNUM,
								NULL,NULL,NULL,NULL,NULL,GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
GO								
--- INSERT SITE ADMIN USER ---
INSERT INTO AUTH_USERS (EMAIL_ID, PASSWORD, FIRST_NAME, LAST_NAME, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP, PHONE, CREATED_IP, 
						ACCOUNT_NONEXPIRED, ACCOUNT_NONLOCKED, CREDENIALS_NONEXPIRED, ACTIVE, LAST_LOGIN_TIME, REGISTERED_NODE, CURRENT_LOGIN_TIME, CREATED_BY)
				VALUES ('cookcountyadmin@amcad.com', '2851FFD2E30E91904A9E86F326E442065D75DB65A028854E9A5ACEE67E53EA59', 'ROAM', 'ADMIN', GETDATE(), GETDATE(), 'admin@amcad.com', null, null, null, null, null, null, '1.1.1.1.1', 
						'Y', 'Y', 'Y', 'Y', GETDATE(), 'CASEMANAGEMENT', GETDATE(), 'SYSTEM')
DECLARE @ACCESS_ID AS INT = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'COOK_ADMIN')
DECLARE @USER_ID AS INT = (SELECT TOP 1 ID FROM AUTH_USERS WHERE EMAIL_ID = 'cookcountyadmin@amcad.com')
INSERT INTO AUTH_USERS_ACCESS (ACCESS_ID, USER_ID, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, COMMENTS, IS_ACCESS_OVERRIDDEN, CREATED_BY, IS_AUTHORIZED)
				VALUES (@ACCESS_ID, @USER_ID, GETDATE(), GETDATE(), 'SYSTEM', 'Y', NULL, 'N', 'SYSTEM', 'Y')
GO

--- INSERT PROFIT SHARE ---
DECLARE @ACCESS_ID AS INT = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'COOK_ALL_ACCESS')
INSERT INTO ECOMM_PROFIT_SHARE (ACCESS_ID, CLIENT_SHARE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
            VALUES(@ACCESS_ID, 0.50, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')
SET @ACCESS_ID = (SELECT TOP 1 ID FROM AUTH_ACCESS WHERE ACCESS_CD = 'COOK_PERPAGE_ACCESS')
INSERT INTO ECOMM_PROFIT_SHARE (ACCESS_ID, CLIENT_SHARE, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, CREATED_BY)
            VALUES(@ACCESS_ID, 0.50, GETDATE(), GETDATE(), 'SYSTEM', 'Y', 'SYSTEM')	  
								

