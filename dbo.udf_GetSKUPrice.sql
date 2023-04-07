create function dbo.udf_GetSKUPrice (@sku_id as int)
returns decimal(18, 2)
begin
    declare @q as int, @v as decimal(18, 2), @price as decimal(18, 2)
    select @q = sum(Quantity), @v = sum(Value)
        from dbo.Basket
        group by ID_SKU
        having ID_SKU = @sku_id
    set @price = @v / @q
    return @price
end;