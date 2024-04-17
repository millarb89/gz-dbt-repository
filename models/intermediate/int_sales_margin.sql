SELECT
  t_orders.orders_id
  ,t_orders.date_date
  ,ROUND(t_orders.margin + t_ship.shipping_fee - (t_ship.logcost + t_ship.ship_cost),2) AS operational_margin 
  ,t_orders.quantity
  ,t_orders.revenue
  ,t_orders.purchase_cost
  ,t_orders.margin
  ,t_ship.shipping_fee
  ,t_ship.logcost
  ,t_ship.ship_cost
FROM {{ref("int_orders_margin")}} t_orders
LEFT JOIN {{ref("stg_raw__ship")}} t_ship
  USING(orders_id)
ORDER BY orders_id desc