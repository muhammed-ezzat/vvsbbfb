/****** Object:  StoredProcedure [dbo].[SP_USER_DELETE_ALL_INACTIVE]    Script Date: 10/15/2015 9:15:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_USER_DELETE_ALL_INACTIVE] AS

BEGIN
DECLARE @INACTIVEUSERS TABLE (
  ID INT,
  EMAIL_ID VARCHAR(55),
  PASSWORD VARCHAR(250),
  FIRST_NAME VARCHAR(50),
  LAST_NAME VARCHAR(50),
  ADDRESS_1 VARCHAR(250),
  ADDRESS_2 VARCHAR(250),
  CITY VARCHAR(50),
  STATE CHAR(2),
  ZIP VARCHAR(10),
  PHONE VARCHAR(10),
  CREATED_IP VARCHAR(20),
  REGISTERED_NODE VARCHAR(50),
  CREATED_BY VARCHAR(50),
  LAST_LOGIN_TIME DATETIME,
  DATE_TIME_CREATED DATETIME,
  DATE_TIME_MOD DATETIME,
  MOD_USER_ID VARCHAR(50),
  ACTIVE CHAR(1),
  IS_ACCESS_OVERRIDDEN CHAR(1)
)

INSERT INTO @INACTIVEUSERS 
  SELECT
    USERS.ID AS USERS_ID,
    USERS.EMAIL_ID AS USERS_EMAIL,
    USERS.PASSWORD AS USERS_PASSWORD,
    USERS.FIRST_NAME AS USERS_FIRST_NAME,
    USERS.LAST_NAME AS USERS_LAST_NAME,
    USERS.ADDRESS_1 AS USERS_ADDRESS_1,
    USERS.ADDRESS_2 AS USERS_ADDRESS_2,
    USERS.CITY AS USERS_CITY,
    USERS.STATE AS USERS_STATE,
    USERS.ZIP AS USERS_ZIP,
    USERS.PHONE AS USERS_PHONE,
    USERS.CREATED_IP AS USERS_CREATED,
    USERS.REGISTERED_NODE AS USERS_REGISTERED_NODE,
    USERS.CREATED_BY AS USERS_CREATED_BY,
    USERS.CURRENT_LOGIN_TIME AS USERS_CURRENT_LOGIN_TIME,
    USERS.DATE_TIME_CREATED AS USERS_DATE_TIME_CREATED,
    GETDATE() AS DATE_TIME_MOD,
    'SYSTEM' AS MOD_USER_ID,
    'Y' AS ACTIVE,
    AUA.IS_ACCESS_OVERRIDDEN
  FROM AUTH_USERS USERS 
    INNER JOIN AUTH_USERS_ACCESS AUA ON AUA.USER_ID = USERS.ID
    INNER JOIN AUTH_ACCESS AA ON AUA.ACCESS_ID = AA.ID 
  WHERE
    USER_ID NOT IN (
      SELECT USER_ID FROM AUTH_USERS_ACCESS
      WHERE FIRM_ADMIN_USER_ACCESS_ID IS NOT NULL
      UNION
      SELECT USER_ID FROM AUTH_USERS_ACCESS
      WHERE IS_FIRM_ACCESS_ADMIN = 'Y'
    ) AND
    NOT EXISTS (
      SELECT USER_ID FROM ECOMM_RECUR_TX_HIST_INFO RECUR
      WHERE RECUR.USER_ID = USERS.ID
    ) AND 
    NOT EXISTS (
      SELECT USER_ID FROM ECOMM_PAYASUGO_TX PAYASUGO
      WHERE PAYASUGO.USER_ID = USERS.ID
    ) AND
    NOT EXISTS (
      SELECT USER_ID FROM AUTH_USERS_ALERTS ALERTS
      WHERE ALERTS.USER_ID = USERS.ID
    ) AND 
    NOT EXISTS (
      SELECT USER_ID FROM ECOMM_USERS_PURCHASES PURCHASES
      WHERE PURCHASES.USER_ID = USERS.ID
    ) AND
    (
      USERS.CURRENT_LOGIN_TIME < GETDATE() - 
        (
          SELECT MAX(USER_RETENTION_DAYS)
          FROM ECOMM_SITE SITE 
            INNER JOIN ECOMM_SITE_ACCESS SITEACCESS ON SITEACCESS.SITE_ID = SITE.ID 
            INNER JOIN AUTH_ACCESS ACCESS ON ACCESS.ID = SITEACCESS.ACCESS_ID
            INNER JOIN AUTH_USERS_ACCESS USERACCESS ON (
              USERACCESS.ACCESS_ID = ACCESS.ID AND 
              USERACCESS.USER_ID =  USERS.ID
            )
        ) OR 
        USERS.CURRENT_LOGIN_TIME < GETDATE() - 180
    ) AND
    USERS.EMAIL_ID NOT LIKE '%admin@roam.com' AND
    USERS.EMAIL_ID NOT LIKE '%admin@amcad.com' AND
    USERS.ACTIVE = 'Y' AND
    AA.ACTIVE = 'Y'

DELETE FROM ECOMM_USERS_ACCOUNT
WHERE USER_ACCESS_ID IN (
  SELECT ID FROM AUTH_USERS_ACCESS
  WHERE USER_ID IN (
    SELECT ID FROM @INACTIVEUSERS
    WHERE ID NOT IN (
      SELECT ID FROM @INACTIVEUSERS
      WHERE IS_ACCESS_OVERRIDDEN = 'Y'
    )
  )
)

DELETE FROM ECOMM_CCINFO
WHERE USER_ID IN (
  SELECT ID FROM @INACTIVEUSERS
  WHERE ID NOT IN (
    SELECT ID FROM @INACTIVEUSERS
    WHERE IS_ACCESS_OVERRIDDEN = 'Y'
  )
)

DELETE FROM ECOMM_USERS_SHOPPING_CART
WHERE USER_ID IN (
  SELECT ID FROM @INACTIVEUSERS
  WHERE ID NOT IN (
    SELECT ID FROM @INACTIVEUSERS
    WHERE IS_ACCESS_OVERRIDDEN = 'Y'
  )
)

DELETE FROM AUTH_USERS_TERMS
WHERE USER_ID IN (
  SELECT ID FROM @INACTIVEUSERS
  WHERE ID NOT IN (
    SELECT ID FROM @INACTIVEUSERS
    WHERE IS_ACCESS_OVERRIDDEN = 'Y'
  )
)

DELETE FROM AUTH_USERS_EVENTS
WHERE USER_ID IN (
  SELECT ID FROM @INACTIVEUSERS
  WHERE ID NOT IN (
    SELECT ID FROM @INACTIVEUSERS
    WHERE IS_ACCESS_OVERRIDDEN = 'Y'
  )
)

DELETE FROM AUTH_USERS_ACCESS
WHERE USER_ID IN (
  SELECT ID FROM @INACTIVEUSERS
  WHERE ID NOT IN (
    SELECT ID FROM @INACTIVEUSERS
    WHERE IS_ACCESS_OVERRIDDEN = 'Y'
  )
)

DELETE FROM AUTH_USERS
WHERE ID IN (
  SELECT ID FROM @INACTIVEUSERS
  WHERE ID NOT IN (
    SELECT ID FROM @INACTIVEUSERS
    WHERE IS_ACCESS_OVERRIDDEN = 'Y'
  )
)

INSERT INTO AUTH_USERS_ARCHIVE (
    EMAIL_ID, PASSWORD, FIRST_NAME, LAST_NAME, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP, PHONE, CREATED_IP, REGISTERED_NODE,
    CREATED_BY, LAST_LOGIN_TIME, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, ARCH_USERNAME, ARCH_MACHINENAME, ARCH_COMMENTS
  ) 
  SELECT DISTINCT
    EMAIL_ID, PASSWORD, FIRST_NAME, LAST_NAME, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP, PHONE, CREATED_IP, REGISTERED_NODE,
    CREATED_BY, LAST_LOGIN_TIME, DATE_TIME_CREATED, DATE_TIME_MOD, MOD_USER_ID, ACTIVE, 'SYSTEM', 'ECOMSERVER', 'Auto Deletion of Inactive User'
  FROM @INACTIVEUSERS 
  WHERE ID NOT IN (
    SELECT ID FROM @INACTIVEUSERS
    WHERE IS_ACCESS_OVERRIDDEN = 'Y'
  )

END
