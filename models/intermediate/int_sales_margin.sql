
select
    t_sales.date_date,
    t_sales.orders_id,
    t_sales.products_id,
    t_sales.revenue,
    t_sales.quantity,
    t_product.purchase_price,
    (t_product.purchase_price * t_sales.quantity) as purchase_cost,
    (round((t_sales.revenue-(t_product.purchase_price * t_sales.quantity)),2)) as margin,
    
from {{ ref('stg_raw__sales') }} t_sales

inner join {{ ref('stg_raw__product') }} t_product

on t_sales.products_id = t_product.products_id

order by products_id
