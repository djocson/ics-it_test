create trigger dbo.TR_Basket_insert_update
    on dbo.Basket
after insert
    as begin
        update dbo.Basket
        set DiscountValue =  i.Value * dcnt
        from Basket as b
            join inserted as i on b.ID = i.ID
                join (select ID_SKU, 
                        case when (count(ID) > 1) then 0.05
                        else 0 end as dcnt
                    from inserted
                    group by ID_SKU
                ) as c on i.ID_SKU = c.ID_SKU
    end;