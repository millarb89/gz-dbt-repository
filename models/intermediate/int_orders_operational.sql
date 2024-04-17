SELECT
  o.orders_id
  ,o.date_date
  ,ROUND(o.margin + s.shipping_fee - (s.logcost + s.ship_cost),2) AS operational_margin 
  ,o.quantity
  ,o.revenue
  ,o.purchase_cost
  ,o.margin
  ,s.shipping_fee
  ,s.logcost
  ,s.ship_cost
FROM {{ref("int_orders_margin")}} o
LEFT JOIN {{ref("stg_raw__ship")}} s 
  USING(orders_id)
ORDER BY orders_id desc

-- select
--     t_sales.orders_id,
--     t_sales.date_date,
--     round(sum(t_sales.revenue), 2) as revenue,
--     sum(t_sales.quantity) as quantity,
--     round(sum(t_product.purchase_price * t_sales.quantity),2) as purchase_cost,
--     round(sum(t_sales.revenue - (t_product.purchase_price * t_sales.quantity)), 2) as margin,
--     round(sum(t_product.purchase_price * t_sales.quantity), 2) as operational_cost,
--     round(sum(t_sales.revenue - (t_product.purchase_price * t_sales.quantity)), 2) as operational_margin

-- from {{ ref('stg_raw__sales') }} t_sales

-- left join {{ ref('stg_raw__product') }} t_product

-- on t_sales.products_id = t_product.products_id

-- left join {{ ref('stg_raw__ship') }} t_ship

-- on t_sales.orders_id = t_ship.orders_id

-- group by t_sales.orders_id, t_sales.date_date



-- --order by products_id
