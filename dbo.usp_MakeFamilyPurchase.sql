create procedure dbo.usp_MakeFamilyPurchase (@FamilySurName as varchar(255)) as
begin try
	if @FamilySurName not in (select SurName from dbo.Family) 
		throw 50000, 'error, there is no such surname in the database', 1;
	else
		update dbo.Family
    	set BudgetValue = BudgetValue - (select sum(Value)
        	from dbo.Basket as b 
		join dbo.Family as f on b.ID_Family = f.ID
        	where f.SurName = @FamilySurName
        	group by ID_Family
        	-- having f.SurName = @FamilySurName
    	)
    	where SurName = @FamilySurName
end try
begin catch
    throw
end catch; 
