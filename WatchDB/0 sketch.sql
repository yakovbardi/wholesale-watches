/*
WatchName varchar(100) not blank 
WatchDesc computed based on WatchName
RRP Computed based on WatchName
Status varchar(30) not null one of these option in stock, in store at the retailer, or sold and not paid for, sold and paid for, or RETURNED
StoreName varchar(100) not null default blank
StoreAddress computed off of StoreName if not blank
StorePhoneNumber computed off of StoreName if not blank
StoreEmail computed off of StoreName if not blank
DateDelivered date not null before the current date
Price decimal (6,2) greater than zero
OrderId computed watchname date order id
constraint status in stock then other column empty
constraint storename is left out then store address, phonenumber, email left out
*/