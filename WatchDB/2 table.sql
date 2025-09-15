use WatchDB 
go 
drop table if exists [Order] 
go
create table dbo.[Order](
    OrderId int not null identity primary key,
    WatchName varchar(100) constraint ck_Order_WatchName_cannot_be_blank check(WatchName <> ''),
    WatchDesc as case WatchName 
                    when 'the old fashioned chronograph watch' then 'gold finished case, day of week dial, 12 hour dial, day and night dial, brown leather band'
                    when 'the yellow hybrid watch' then 'hybrid watch, steal case and wrist band, two color band, shows day of week, date'
                    when 'the self winding magnificent watch' then 'gold plated case, black leather band, day of week dial, 12 hour dial, day and night dial, self winding'
                    when 'the black coffee watch' then 'silver plated case, black leather band, day of week dial, 12 hour dial, month dial, black watch face, self winding, open back'
                 end,
    RRP  as case WatchName 
                    when 'the old fashioned chronograph watch' then 100
                    when 'the yellow hybrid watch' then 100
                    when 'the self winding magnificent watch' then 150
                    when 'the black coffee watch' then 200
            end,
    Status varchar(30) not null constraint ck_Order_Status_one_of_5_options check(Status in ('in stock', 'delivered', 'sold', 'paid', 'returned')),
    StoreName varchar(100) constraint ck_Order_StoreName_cannot_be_blank check(StoreName <> ''),
    StoreAddress as case 
                        when StoreName like '%phoenix%' then '123 Hullo Plaza phoenix Arizona'
                        when StoreName like '%lancaster%' then '34 Greco ct. Lancaster PA'
                    end,
    StorePhoneNumber as case 
                            when StoreName like '%phoenix%' then '347-666-9898'
                            when StoreName like '%lancaster%' then '424-575-8890'
                        end,  
    StoreEmail as case 
                      when StoreName like '%phoenix%' then 'Management@TWC.com'
                      when StoreName like '%lancaster%' then 'TWAH@gmail.com'
                  end,
    DateDelivered date constraint ck_Order_DateDelivered_must_be_before_current_date check(DateDelivered <= getdate()),
    Price decimal (6,2) constraint ck_Order_Price_greater_than_50 check(Price >= 50),
--AS There is no date ordered stored in the db so I can't include it in the compute
--AS Not greater to use Primary key but there is no other id column so not sure what you want this based off of.
    UniqueOrderId as concat(WatchName, OrderId) persisted,
    constraint ck_Order_if_status_in_stock_then_all_info_on_store_null_otherwise_not_null check((Status = 'in stock' and StoreName is null and DateDelivered is null and price is null) 
                                                                                              or(Status <> 'in stock' and StoreName is not null and DateDelivered is not null and price is not null))
)
go