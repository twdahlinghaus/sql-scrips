select city 'City', count(*) 'Nbr of Customers', sum(sales) 'Sales',
avg(sales) 'Ave Sale'
from customers c
group by City