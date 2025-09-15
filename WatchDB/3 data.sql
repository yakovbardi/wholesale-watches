use WatchDB 
go

delete [Order] 
go

insert [Order](WatchName, Status, StoreName, DateDelivered, Price)
select 'the old fashioned chronograph watch', 'in stock', null, null, null
union select 'the yellow hybrid watch', 'delivered', 'The Watch Collection(phoenix)', '2023-09-12', 50
union select 'the yellow hybrid watch', 'sold', 'The Watch Collection(phoenix)', '2023-09-12', 50
union select 'the self winding magnificent watch', 'returned', 'The Watch Collection(phoenix)', '2023-09-26', 80
union select 'the black coffee watch', 'paid', 'The Watch Auction House(Lancaster PA)', '2020-07-12', 90
