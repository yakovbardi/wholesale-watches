
use WatchDB
--1: The Watch Collection(phoenix) needs to be restored, show me a list of all the watches they had and sold (and don't have in stock right now)
select *
from [Order] o 
where o.StoreName like '%phoenix%'
and o.[Status] = 'sold'
--2: The Watch Collection(phoenix) needs to be restored, but they complained that watches with brown leather bands don't sell, and just take up space on his limited display, I need a list of all watches in stock that DON'T have BROWN leather bands.
select *
from [Order] o 
where o.[Status] = 'in stock'
and o.WatchDesc like '%brown leather%'