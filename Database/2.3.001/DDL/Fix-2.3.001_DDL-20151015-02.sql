/****** Object:  StoredProcedure [dbo].[SP_PAYASUGO_GET_TRAN_DETAIL]    Script Date: 10/15/2015 12:34:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dbo].[SP_PAYASUGO_GET_TRAN_DETAIL]
    @USERNAME VARCHAR(50), @TX_ID INT, @IS_REFUND CHAR(1) = 'N'
AS
BEGIN

IF (@IS_REFUND = 'N')
SELECT
  payasugoTx.ID AS pasAsUGoTx_ID,
  payasugoTx.TX_REFERENCE_NUM AS pasAsUGoTx_TX_REFERENCE_NUM,
  payasugoTx.AMOUNT AS pasAsUGoTx_AMOUNT,
  payasugoTx.SERVICE_FEE AS pasAsUGoTx_SERVICE_FEE,
  payasugoTx.TX_AMOUNT AS pasAsUGoTx_TX_AMOUNT,
  payasugoTx.TX_DATE AS pasAsUGoTx_TX_DATE,
  payasugoTx.CARD_NUMBER AS pasAsUGoTx_CARD_NUMBER,
  payasugoTx.ACCOUNTNAME AS pasAsUGoTx_ACCOUNTNAME,
  payasugoTx.TX_TYPE AS pasAsUGoTx_TX_TYPE,
  payasugoTx.DATE_TIME_CREATED AS pasAsUGoTx_DATE_TIME_CREATED,
  site.DESCRIPTION AS site_NAME,
  access.ACCESS_DESCR AS access_ACCESS_DESCR,
  payasugoTxItems.PRODUCT_ID AS pasAsUGoTxItems_PRODUCT_ID,
  payasugoTxItems.PRODUCT_TYPE AS pasAsUGoTxItems_PRODUCT_TYPE,
  payasugoTxItems.PAGE_COUNT AS pasAsUGoTxItems_PAGE_COUNT,
  payasugoTxItems.AMOUNT AS pasAsUGoTxItems_AMOUNT,
  payasugoTxItems.SERVICE_FEE AS pasAsUGoTxItems_SERVICE_FEE,
  payasugoTxItems.TOTAL_AMOUNT AS pasAsUGoTxItems_TOTAL_AMOUNT,
  payasugoTxItems.IS_REFUNDED AS pasAsUGoTxItems_IS_REFUNDED,
  payasugoTxItems.DATE_TIME_MOD AS pasAsUGoTxItems_DATE_TIME_MOD,
  payasugoTxItems.COMMENTS AS payasugoTxItems_COMMENTS,
  payasugoTxItems.DOWNLOAD_URL AS pasAsUGoTxItems_DOWNLOAD_URL,
  payasugoTxItems.IS_DOCUMENT_AVAILABLE AS pasAsUGoTxItems_IS_DOCUMENT_AVAILABLE,
  payasugoTx.ORG_REF_NUM AS pasAsUGoTx_ORG_REF_NUM,
  site.TIMEZONE AS site_TIMEZONE,
  payasugoTxItems.CERTIFIED_DOCUMENT_NUMBER AS CERTIFIED_DOCUMENT_NUMBER,
  users.FIRST_NAME AS FIRST_NAME,
  users.LAST_NAME AS LAST_NAME,
  payasugoTx.IS_CERTIFIED AS IS_CERTIFIED,
  location.ID AS LOCATION_ID,
  location.DESCRIPTION AS LOCATION_DESCRIPTION
FROM ECOMM_PAYASUGO_TX payasugoTx
INNER JOIN ECOMM_PAYASUGO_TX_ITEMS payasugoTxItems
  ON payasugoTxItems.PAYASUGO_TX_ID = payasugoTx.ID
INNER JOIN AUTH_USERS users
  ON payasugoTx.USER_ID = users.ID
INNER JOIN AUTH_ACCESS access
  ON access.ID = payasugoTx.ACCESS_ID
INNER JOIN ECOMM_SITE_ACCESS siteaccess
  ON siteaccess.ACCESS_ID = access.ID
INNER JOIN ECOMM_SITE site
  ON site.ID = siteaccess.SITE_ID
LEFT OUTER JOIN ECOMM_LOCATION location
  ON location.ID = payasugoTxItems.LOCATION_ID
WHERE users.EMAIL_ID = @USERNAME AND
payasugoTx.ID = @TX_ID
ORDER BY site.NAME,
access.ACCESS_DESCR,
payasugoTx.TX_DATE DESC
ELSE
SELECT
  payasugoTx.ID AS pasAsUGoTx_ID,
  payasugoTx.TX_REFERENCE_NUM AS pasAsUGoTx_TX_REFERENCE_NUM,
  payasugoTx.AMOUNT AS pasAsUGoTx_AMOUNT,
  payasugoTx.SERVICE_FEE AS pasAsUGoTx_SERVICE_FEE,
  payasugoTx.TX_AMOUNT AS pasAsUGoTx_TX_AMOUNT,
  payasugoTx.TX_DATE AS pasAsUGoTx_TX_DATE,
  payasugoTx.CARD_NUMBER AS pasAsUGoTx_CARD_NUMBER,
  payasugoTx.ACCOUNTNAME AS pasAsUGoTx_ACCOUNTNAME,
  payasugoTx.TX_TYPE AS pasAsUGoTx_TX_TYPE,
  payasugoTx.DATE_TIME_CREATED AS pasAsUGoTx_DATE_TIME_CREATED,
  site.DESCRIPTION AS site_NAME,
  access.ACCESS_DESCR AS access_ACCESS_DESCR,
  payasugoTxItems.PRODUCT_ID AS pasAsUGoTxItems_PRODUCT_ID,
  payasugoTxItems.PRODUCT_TYPE AS pasAsUGoTxItems_PRODUCT_TYPE,
  payasugoTxItems.PAGE_COUNT AS pasAsUGoTxItems_PAGE_COUNT,
  payasugoTxItems.AMOUNT AS pasAsUGoTxItems_AMOUNT,
  payasugoTxItems.SERVICE_FEE AS pasAsUGoTxItems_SERVICE_FEE,
  payasugoTxItems.TOTAL_AMOUNT AS pasAsUGoTxItems_TOTAL_AMOUNT,
  payasugoTxItems.IS_REFUNDED AS pasAsUGoTxItems_IS_REFUNDED,
  payasugoTxItems.DATE_TIME_MOD AS pasAsUGoTxItems_DATE_TIME_MOD,
  payasugoTxItems.COMMENTS AS payasugoTxItems_COMMENTS,
  payasugoTxItems.DOWNLOAD_URL AS pasAsUGoTxItems_DOWNLOAD_URL,
  payasugoTxItems.IS_DOCUMENT_AVAILABLE AS pasAsUGoTxItems_IS_DOCUMENT_AVAILABLE,
  payasugoTx.ORG_REF_NUM AS pasAsUGoTx_ORG_REF_NUM,
  site.TIMEZONE AS site_TIMEZONE,
  payasugoTxItems.CERTIFIED_DOCUMENT_NUMBER AS CERTIFIED_DOCUMENT_NUMBER,
  users.FIRST_NAME AS FIRST_NAME,
  users.LAST_NAME AS LAST_NAME,
  payasugoTx.IS_CERTIFIED AS IS_CERTIFIED,
  location.ID AS LOCATION_ID,
  location.DESCRIPTION AS LOCATION_DESCRIPTION
FROM ECOMM_PAYASUGO_TX payasugoTx
INNER JOIN ECOMM_PAYASUGO_TX_ITEMS payasugoTxItems
  ON payasugoTxItems.REFUND_TRAN_ID = payasugoTx.ID
INNER JOIN AUTH_USERS users
  ON payasugoTx.USER_ID = users.ID
INNER JOIN AUTH_ACCESS access
  ON access.ID = payasugoTx.ACCESS_ID
INNER JOIN ECOMM_SITE_ACCESS siteaccess
  ON siteaccess.ACCESS_ID = access.ID
INNER JOIN ECOMM_SITE site
  ON site.ID = siteaccess.SITE_ID
LEFT OUTER JOIN ECOMM_LOCATION location
  ON location.ID = payasugoTxItems.LOCATION_ID
WHERE users.EMAIL_ID = @USERNAME AND
payasugoTx.ID = @TX_ID
ORDER BY site.NAME,
access.ACCESS_DESCR,
payasugoTx.TX_DATE DESC
  
END

