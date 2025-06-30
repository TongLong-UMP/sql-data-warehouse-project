/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables
    if they already exist.
    Run this script to re-define the DDL structure of 'silver' Tables
===============================================================================
*/

USE [DataWarehouse]
GO

IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_cust_info;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [silver].[crm_cust_info](
    [cst_id] [varchar](50) NOT NULL,
    [cst_key] [varchar](50) NULL,
    [cst_firstname] [varchar](100) NULL,
    [cst_lastname] [varchar](100) NULL,
    [cst_marital_status] [varchar](10) NULL,
    [cst_gndr] [varchar](10) NULL,
    [cst_create_date] [datetime] NULL
) ON [PRIMARY]
GO

IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE silver.crm_prd_info;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [silver].[crm_prd_info](
    [prd_id] [int] NULL,
    [cat_id] [nvarchar](50) NULL,
    [prd_key] [nvarchar](50) NULL,
    [prd_nm] [nvarchar](50) NULL,
    [prd_cost] [int] NULL,
    [prd_line] [nvarchar](50) NULL,
    [prd_start_dt] [date] NULL,
    [prd_end_dt] [date] NULL,
    [dwh_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE silver.crm_sales_details;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [silver].[crm_sales_details](
    [sls_ord_num] [nvarchar](50) NULL,
    [sls_prd_key] [nvarchar](50) NULL,
    [sls_cust_id] [int] NULL,
    [sls_order_dt] [date] NULL,
    [sls_ship_dt] [date] NULL,
    [sls_due_dt] [date] NULL,
    [sls_sales] [int] NULL,
    [sls_quantity] [int] NULL,
    [sls_price] [int] NULL,
    [dwh_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE silver.erp_cust_az12;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [silver].[erp_cust_az12](
    [cid] [nvarchar](50) NULL,
    [bdate] [date] NULL,
    [gen] [nvarchar](50) NULL,
    [dwh_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE silver.erp_loc_a101;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [silver].[erp_loc_a101](
    [cid] [nvarchar](50) NULL,
    [cntry] [nvarchar](50) NULL,
    [dwh_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE silver.erp_px_cat_g1v2;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [silver].[erp_px_cat_g1v2](
    [id] [nvarchar](50) NULL,
    [cat] [nvarchar](50) NULL,
    [subcat] [nvarchar](50) NULL,
    [maintenance] [nvarchar](50) NULL,
    [dwh_create_date] [datetime2](7) NULL
) ON [PRIMARY]
GO

ALTER TABLE [silver].[crm_prd_info] ADD DEFAULT (getdate()) FOR [dwh_create_date]
GO
ALTER TABLE [silver].[crm_sales_details] ADD DEFAULT (getdate()) FOR [dwh_create_date]
GO
ALTER TABLE [silver].[erp_cust_az12] ADD DEFAULT (getdate()) FOR [dwh_create_date]
GO
ALTER TABLE [silver].[erp_loc_a101] ADD DEFAULT (getdate()) FOR [dwh_create_date]
GO
ALTER TABLE [silver].[erp_px_cat_g1v2] ADD DEFAULT (getdate()) FOR [dwh_create_date]
GO
