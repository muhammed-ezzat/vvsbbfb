

/****** Object:  StoredProcedure [dbo].[SP_USER_GET_DETAILS]    Script Date: 2/9/2016 3:54:50 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE  [dbo].[SP_USER_GET_DETAILS]
 @USERNAME VARCHAR(50),   
 @NODENAME VARCHAR(50)  
AS  
BEGIN
  
DECLARE @SQL0 NVARCHAR(4000) = '';
  
DECLARE @SQL1 NVARCHAR(4000) = '';

DECLARE @CONDITION0 NVARCHAR(4000) = '';
  
DECLARE @CONDITION1 NVARCHAR(4000) = '';
  
DECLARE @SQL2 NVARCHAR(4000) = '';
  
DECLARE @CONDITION2 NVARCHAR(4000) = '';
  
DECLARE @SQL3 NVARCHAR(4000) = '';
  
DECLARE @CONDITION3 NVARCHAR(4000) = '';

DECLARE @ParmDefinition0 NVARCHAR(500);
  
DECLARE @ParmDefinition1 NVARCHAR(500);
  
DECLARE @ParmDefinition2 NVARCHAR(500);

DECLARE @COUNTOFFLAGS INT
SET @ParmDefinition0 = N'@COUNTOFFLAGSOUT INT OUTPUT'
SET @SQL0 = N'SELECT @COUNTOFFLAGSOUT = COUNT(USERS.ID) 
FROM AUTH_USERS USERS 
INNER JOIN AUTH_USERS_ACCESS USERSACCESS ON USERS.ID = USERSACCESS.USER_ID 
INNER JOIN AUTH_ACCESS ACCESS ON ACCESS.ID = USERSACCESS.ACCESS_ID 
INNER JOIN ECOMM_SITE_ACCESS ESA ON ESA.ACCESS_ID = ACCESS.ID
INNER JOIN ECOMM_SITE SITE ON SITE.ID = ESA.SITE_ID
INNER JOIN ECOMM_NODE NODE ON NODE.ID = SITE.NODE_ID
WHERE USERSACCESS.IS_AUTHORIZED = ''N'' AND USERSACCESS.IS_DELETED = ''N'''
IF (@USERNAME IS NOT NULL AND @USERNAME <> '')
SET @CONDITION0 = @CONDITION0 + ' AND USERS.EMAIL_ID = ''' + @USERNAME + ''''
  
IF (@NODENAME IS NOT NULL AND @NODENAME <> '')
SET @CONDITION0 = @CONDITION0 + ' AND NODE.NAME = ''' + @NODENAME + ''''
SET @SQL0 = @SQL0 + @CONDITION0
EXECUTE SP_EXECUTESQL	@SQL0,
					@ParmDefinition0,
					@COUNTOFFLAGSOUT = @COUNTOFFLAGS OUTPUT;

  
DECLARE @TOTALAMOUNT INT
SET @ParmDefinition1 = N'@TOTALAMOUNTOUT INT OUTPUT'
SET @SQL1 = N'SELECT @TOTALAMOUNTOUT = SUM(FEE) FROM ECOMM_SUBSCRIPTIONFEE FEE   
INNER JOIN ECOMM_SITE_ACCESS SITEACCESS ON SITEACCESS.ID = FEE.SITEACCESS_ID  
INNER JOIN AUTH_USERS_ACCESS USERACCESS ON USERACCESS.ACCESS_ID = SITEACCESS.ACCESS_ID  
INNER JOIN AUTH_USERS USERS ON USERS.ID = USERACCESS.USER_ID  
INNER JOIN ECOMM_SITE SITE ON SITE.ID = SITEACCESS.SITE_ID  
INNER JOIN ECOMM_NODE NODE ON NODE.ID = SITE.NODE_ID  
WHERE USERACCESS.IS_DELETED = ''N'''

IF (@USERNAME IS NOT NULL AND @USERNAME <> '')
SET @CONDITION1 = @CONDITION1 + ' AND USERS.EMAIL_ID = ''' + @USERNAME + ''''
  
IF (@NODENAME IS NOT NULL AND @NODENAME <> '')
SET @CONDITION1 = @CONDITION1 + ' AND NODE.NAME = ''' + @NODENAME + ''''
SET @SQL1 = @SQL1 + @CONDITION1
EXECUTE SP_EXECUTESQL	@SQL1,
					@ParmDefinition1,
					@TOTALAMOUNTOUT = @TOTALAMOUNT OUTPUT;
  
  
DECLARE @AMOUNTDUE INT
SET @ParmDefinition2 = N'@AMOUNTDUEOUT INT OUTPUT'
SET @SQL2 = N'SELECT @AMOUNTDUEOUT = SUM(FEE) FROM ECOMM_SUBSCRIPTIONFEE FEE   
INNER JOIN ECOMM_SITE_ACCESS SITEACCESS ON SITEACCESS.ID = FEE.SITEACCESS_ID  
INNER JOIN AUTH_USERS_ACCESS USERACCESS ON USERACCESS.ACCESS_ID = SITEACCESS.ACCESS_ID  
INNER JOIN AUTH_USERS USERS ON USERS.ID = USERACCESS.USER_ID  
INNER JOIN ECOMM_SITE SITE ON SITE.ID = SITEACCESS.SITE_ID  
INNER JOIN ECOMM_NODE NODE ON NODE.ID = SITE.NODE_ID  
WHERE USERACCESS.IS_DELETED = ''N'' 
AND USERACCESS.IS_ACCESS_OVERRIDDEN = ''N'' AND USERACCESS.ID NOT IN (SELECT USER_ACCESS_ID FROM ECOMM_USERS_ACCOUNT WHERE ACTIVE = ''Y'')  
AND FEE.SUBSCRIPTION_TYP_ID IN (SELECT ID FROM CODELOOKUP WHERE CATEGORY = ''RECURRING_SUBSCRIPTION'')
AND ( (USERACCESS.IS_FIRM_ACCESS_ADMIN = ''Y'' ) OR (USERACCESS.IS_FIRM_ACCESS_ADMIN = ''N'' AND USERACCESS.FIRM_ADMIN_USER_ACCESS_ID IS NULL))'
IF (@USERNAME IS NOT NULL AND @USERNAME <> '')
SET @CONDITION2 = @CONDITION2 + ' AND USERS.EMAIL_ID = ''' + @USERNAME + ''''
  
IF (@NODENAME IS NOT NULL AND @NODENAME <> '')
SET @CONDITION2 = @CONDITION2 + ' AND NODE.NAME = ''' + @NODENAME + ''''
SET @SQL2 = @SQL2 + @CONDITION2
EXECUTE SP_EXECUTESQL	@SQL2,
					@ParmDefinition2,
					@AMOUNTDUEOUT = @AMOUNTDUE OUTPUT;

DECLARE @ACCOUNTNUMBER AS VARCHAR(100) = ''

DECLARE @CREDIT_CARD_ID VARCHAR(10) = ''
  
DECLARE @ISCARDACTIVE CHAR(1) = 'N'

(SELECT TOP 1
	@ACCOUNTNUMBER = ACCOUNTNUMBER,
	@ISCARDACTIVE = ACTIVE,
	@CREDIT_CARD_ID = CC.ID
FROM ECOMM_CCINFO CC
WHERE CC.USER_ID IN (SELECT TOP 1
	ID
FROM AUTH_USERS
WHERE EMAIL_ID = @USERNAME)
)
  
  
DECLARE @ISPAIDUSER CHAR(1) = 'N'
  
DECLARE @ISPAYMENTDUE CHAR(1) = 'N'
  
DECLARE @ISCARDAVAILABLE CHAR(1) = 'N'

DECLARE @ISAUTHORIZATIONPENDING CHAR(1) = 'N'

IF (@COUNTOFFLAGS > 0)
SET @ISAUTHORIZATIONPENDING = 'Y'  
  
IF (@TOTALAMOUNT > 0)
SET @ISPAIDUSER = 'Y'
  
IF (@AMOUNTDUE > 0)
SET @ISPAYMENTDUE = 'Y'
  
IF (@ACCOUNTNUMBER IS NOT NULL AND @ACCOUNTNUMBER <> '')
SET @ISCARDAVAILABLE = 'Y'

SET @SQL3 = 'SELECT    
 USERS.ID AS USERS_ID  
 ,USERS.EMAIL_ID AS USERS_EMAIL_ID  
 ,USERS.PASSWORD AS USERS_PASSWORD   
 ,CAST(USERS.ACTIVE AS VARCHAR(1)) AS USERS_ACTIVE  
 ,CAST(USERS.ACCOUNT_NONEXPIRED AS VARCHAR(1)) AS USERS_ACCOUNT_NONEXPIRED  
 ,CAST(USERS.CREDENIALS_NONEXPIRED AS VARCHAR(1)) AS USERS_CREDENIALS_NONEXPIRED  
 ,CAST(USERS.ACCOUNT_NONLOCKED AS VARCHAR(1)) AS USERS_ACCOUNT_NONLOCKED  
 ,ACCESS.ACCESS_CD AS ACCESS_ACCESS_CD  
 ,''' + @ISCARDAVAILABLE + ''' AS ISCARDAVAILABLE  
 ,''' + @ISCARDACTIVE + ''' AS ISCARDACTIVE   
 ,''' + @ACCOUNTNUMBER + ''' AS ACCOUNTNUMBER  
 ,''' + @ISPAIDUSER + ''' AS ISPAIDUSER  
 ,''' + @ISPAYMENTDUE + ''' AS ISPAYMENTDUE
 ,''' + @CREDIT_CARD_ID + ''' AS CREDIT_CARD_ID  
,USERS.FIRST_NAME AS USERS_FIRST_NAME  
 ,USERS.LAST_NAME AS USERS_LAST_NAME  
 ,ACCESS.GUEST_FLG AS ACCESS_GUEST_FLG    
 ,LOOKUP.CATEGORY AS LOOKUP_CATEGORY  
 ,USERS.LAST_LOGIN_TIME AS USERS_LAST_LOGIN_TIME  
 ,USERS.DATE_TIME_CREATED AS USERS_DATE_TIME_CREATED  
 ,SITE.ID AS SITE_ID  
 ,SITE.NAME AS SITE_NAME  
 ,USERS.REGISTERED_NODE AS USERS_REGISTERED_NODE  
 ,ACCESS.ID AS ACCESS_ID  
 ,USERS.CURRENT_LOGIN_TIME AS USERS_CURRENT_LOGIN_TIME  
 ,USERACCESS.COMMENTS AS USERACCESS_COMMENTS  
 ,USERACCESS.IS_ACCESS_OVERRIDDEN AS USERACCESS_IS_ACCESS_OVERRIDDEN  
 ,USERACCESS.IS_AUTHORIZED AS USERACCESS_IS_AUTHORIZED  
 ,SITE.DESCRIPTION AS SITE_DESCRIPTION  
 ,USERACCESS.ACTIVE  
 ,USERS.PHONE  
 ,ISNULL((SELECT CASE WHEN SUM(CASE  
  WHEN ISNULL(AUT1.ACTIVE,''N'') = ''Y'' THEN  0  
  ELSE 1  
  END) = 0 THEN ''Y''  
  ELSE ''N'' 
  END
 
  FROM AUTH_USERS USERS1   
  INNER JOIN AUTH_USERS_ACCESS AUA1 ON AUA1.USER_ID = USERS1.ID  
  INNER JOIN AUTH_ACCESS ACCESS1 ON ACCESS1.ID = AUA1.ACCESS_ID  
  INNER JOIN ECOMM_SITE_ACCESS SITEACCESS1 ON SITEACCESS1.ACCESS_ID = ACCESS1.ID  
  INNER JOIN ECOMM_SITE SITE1 ON SITE1.ID = SITEACCESS1.SITE_ID  
  INNER JOIN AUTH_TERMS AT1 ON AT1.SITE_ID = SITE1.ID'
  
 IF (@NODENAME IS NOT NULL AND @NODENAME <> '')  
 BEGIN
	SET @SQL3 = @SQL3 + ' INNER JOIN ECOMM_NODE NODE1 ON NODE1.ID = SITE1.NODE_ID'  
 END
SET @SQL3 = @SQL3 + ' LEFT OUTER JOIN AUTH_USERS_TERMS AUT1 ON USERS1.ID = AUT1.USER_ID AND AUT1.TERM_ID = AT1.ID  
  WHERE AUA1.IS_DELETED = ''N'' '
   
 IF (@NODENAME IS NOT NULL AND @NODENAME <> '')  
 BEGIN
SET @SQL3 = @SQL3 + ' AND NODE1.NAME = ''' + @NODENAME + ''''
  
 END

SET @SQL3 = @SQL3 + ' AND USERS1.ID = USERS.ID AND AT1.ACTIVE =''Y'' GROUP BY USERS1.ID), ''Y'') AS TERMSAGREED  
  ,USERS.FIRM_NAME AS USERS_FIRM_NAME
  ,USERS.FIRM_NUMBER AS USERS_FIRM_NUMBER
  ,USERS.BAR_NUMBER AS USERS_BAR_NUMBER
  ,ACCESS.IS_FIRM_LEVEL_ACCESS AS ACCESS_IS_FIRM_LEVEL_ACCESS
  ,USERACCESS.IS_FIRM_ACCESS_ADMIN AS USERACCESS_IS_FIRM_ACCESS_ADMIN
  ,USERACCESS.FIRM_ADMIN_USER_ACCESS_ID AS USERACCESS_FIRM_ADMIN_USER_ACCESS_ID
  ,ACCESS.ACTIVE AS ACCESS_ACTIVE
  ,USERACCESS.ID AS USERACCESS_ID
  ,''' + @ISAUTHORIZATIONPENDING + ''' AS ISAUTHORIZATIONPENDING 
FROM  
      AUTH_USERS USERS  
      INNER JOIN AUTH_USERS_ACCESS USERACCESS ON USERACCESS.USER_ID = USERS.ID  
      INNER JOIN AUTH_ACCESS ACCESS ON ACCESS.ID = USERACCESS.ACCESS_ID  
      LEFT OUTER JOIN ECOMM_SITE_ACCESS SITEACCESS ON SITEACCESS.ACCESS_ID = ACCESS.ID  
      LEFT OUTER JOIN ECOMM_SITE SITE ON SITE.ID = SITEACCESS.SITE_ID        
      LEFT OUTER JOIN ECOMM_NODE NODE ON NODE.ID = SITE.NODE_ID        
      LEFT OUTER JOIN ECOMM_SUBSCRIPTIONFEE FEE ON FEE.SITEACCESS_ID = SITEACCESS.ID  
      LEFT OUTER JOIN CODELOOKUP LOOKUP ON LOOKUP.ID = FEE.SUBSCRIPTION_TYP_ID  
      LEFT OUTER JOIN ECOMM_CCINFO CC ON USERS.ID = CC.USER_ID WHERE USERACCESS.IS_DELETED = ''N'' '
SET @CONDITION3 = ' AND ACCESS.ACTIVE = ''Y'' AND USERACCESS.ACTIVE = ''Y'' AND USERACCESS.IS_AUTHORIZED = ''Y'''
SET @CONDITION3 = @CONDITION3 + ' AND USERS.EMAIL_ID = ''' + @USERNAME + ''''
  
IF (@NODENAME IS NOT NULL AND @NODENAME <> '')  
BEGIN
SET @CONDITION3 = @CONDITION3 + ' AND (NODE.NAME = ''' + @NODENAME + ''' OR NODE.NAME IS NULL)'
END

SET @SQL3 = @SQL3 + @CONDITION3
EXEC SP_EXECUTESQL @SQL3  

END


GO

