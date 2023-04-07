create view dbo.vw_SKUPrice as ID, Code, Name, dbo.udf_GetSKUPrice(ID)
    from dbo.SKU