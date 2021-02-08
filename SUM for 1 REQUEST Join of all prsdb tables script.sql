select r.description, sum(p.price * li.quantity) as 'Total'
from requests r

join Users u on u.Id = r.UserId
join lineitems li on li.RequestId = r.Id
join products p on p.id = li.ProductId
join vendors v on v.Id = p.VendorId
;