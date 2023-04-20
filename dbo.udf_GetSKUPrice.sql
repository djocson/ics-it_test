create function dbo.udf_GetSKUPrice (@sku_id as int)
returns decimal(18, 2)
begin
    declare @price as decimal(18, 2)
    set @price = (select sum(Value) / sum (Quantity)
        from dbo.Basket
        group by ID_SKU
        having ID_SKU = @sku_id)
    return @price
end;
