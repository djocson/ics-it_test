create table dbo.SKU (
    ID int primary key identity
    ,Code as 's' + convert(varchar, ID) unique
    ,Name varchar(20)
);

create table dbo.Family (
    ID int primary key identity
    ,SurName varchar(255)
    ,BudgetValue decimal (18, 2)
);

create table dbo.Basket (
    ID int primary key identity
    ,ID_SKU int not null references SKU(ID)
    ,ID_Family int not null references Family(ID)
    ,Quantity int check(Quantity >= 0)
    ,Value decimal(18, 2) check(Value >= 0)
    ,PurchaseDate date default(convert(date, sysdatetime()))
    ,DiscountValue decimal(18, 2)
);
