CREATE VIEW gold.calendar27
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageproj2607.blob.core.windows.net/silver/AdventureWorks_Calender/',
            FORMAT = 'PARQUET'
        ) as QUER1


------------------------
-- CREATE VIEW CUSTOMERS
------------------------
CREATE VIEW gold.Customers27
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageproj2607.blob.core.windows.net/silver/AdventureWorks_Customers',
            FORMAT = 'PARQUET'
        ) as QUER1



------------------------
-- CREATE VIEW PRODUCTS
------------------------
CREATE VIEW gold.products27
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageproj2607.blob.core.windows.net/silver/AdventureWorks_Products/',
            FORMAT = 'PARQUET'
        ) as QUER1



        

------------------------
-- CREATE VIEW RETURNS
------------------------
CREATE VIEW gold.returns27
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageproj2607.blob.core.windows.net/silver/AdventureWorks_Returns/',
            FORMAT = 'PARQUET'
        ) as QUER1


    ------------------------
-- CREATE VIEW SALES
------------------------
CREATE VIEW gold.sales27
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageproj2607.blob.core.windows.net/silver/AdventureWorks_Sales/',
            FORMAT = 'PARQUET'
        ) as QUER1


------------------------
-- CREATE VIEW SUBCAT
------------------------
CREATE VIEW gold.subcat27
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageproj2607.blob.core.windows.net/silver/AdventureWorks_SUbCategories/',
            FORMAT = 'PARQUET'
        ) as QUER1



------------------------
-- CREATE VIEW TERRITORIES
------------------------
CREATE VIEW gold.territories27
AS
SELECT 
    * 
FROM 
    OPENROWSET
        (
            BULK 'https://awstorageproj2607.blob.core.windows.net/silver/AdventureWorks_Territories/',
            FORMAT = 'PARQUET'
        ) as QUER1