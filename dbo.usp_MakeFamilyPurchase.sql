create procedure dbo.usp_MakeFamilyPurchase (@FamilySurName as varchar(255)) as
begin
    if (@FamilySurName in (select SurName
        from Family))
    begin
        declare @fid as int
        set @fid = (select ID
            from dbo.Family
            where SurName = @FamilySurName)
        update dbo.Family
        set BudgetValue = BudgetValue - (select sum(Value)
            from dbo.Basket
            group by ID_Family
            having ID_Family = @fid
        )
        where ID = @fid
    end
    else 
        print 'error, there is no such surname in the database'
end; 