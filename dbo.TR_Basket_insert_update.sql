create trigger dbo.TR_Basket_insert_update on dbo.Basket
after insert as
begin
    with mpl as (select ID_SKU, 
            case when (count(ID) > 1) then 0.05 else 0 end as dcnt
        from inserted
        group by ID_SKU)
    update dbo.Basket
    set DiscountValue =  i.Value * dcnt
    from Basket as b
    join inserted as i on b.ID = i.ID
    join mpl on i.ID_SKU = mpl.ID_SKU
end;
