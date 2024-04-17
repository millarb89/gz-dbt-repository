select
    t_sales.orders_id,
    t_sales.date_date,
    round(sum(t_sales.revenue), 2) as revenue,
    sum(t_sales.quantity) as quantity,
    round(sum(t_product.purchase_price * t_sales.quantity), 2) as purchase_cost,
    round(sum(t_sales.revenue - (t_product.purchase_price * t_sales.quantity)), 2) as margin

from {{ ref('stg_raw__sales') }} t_sales

left join {{ ref('stg_raw__product') }} t_product

on t_sales.products_id = t_product.products_id

group by t_sales.orders_id, t_sales.date_date

--order by products_id
