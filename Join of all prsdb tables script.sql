select r.id, r.description as 'Description', r.status as 'Status', r.total as 'Total', u.lastname as 'Lastname', v.name as 'Vendor', 
p.name as 'Product', p.price as 'Unit Price', li.quantity as 'Quantity', p.price * li.quantity as 'Line Total'
from requests r

join Users u on u.Id = r.UserId
join lineitems li on li.RequestId = r.Id
join products p on p.id = li.ProductId
join vendors v on v.Id = p.VendorId
group by r.Description;
