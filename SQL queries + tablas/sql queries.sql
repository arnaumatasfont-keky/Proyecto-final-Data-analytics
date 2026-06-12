USE olist_ecommerce;

SELECT
COUNT(distinct s.seller_id) AS total_sellers,
COUNT(DISTINCT oi.order_id) AS total_orders,
COUNT(*) AS total_items,
ROUND(SUM(oi.price), 2) AS total_revenue
FROM sellers s
JOIN order_items oi ON s.seller_id = oi.seller_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered';


CREATE OR REPLACE VIEW seller_performance_base AS
SELECT
	s.seller_id,
    s.seller_city,
    s.seller_state,
    
    ROUND(SUM(oi.price), 2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    COUNT(*) AS total_items_sold,
    ROUND(SUM(oi.price) / COUNT(DISTINCT oi.order_id), 2) AS avg_order_value,
    
    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    ROUND(SUM(CASE WHEN r.review_score <= 2 THEN 1 ELSE 0 END) / COUNT(r.review_score) *100, 2) AS low_review_score_pct,
    
    ROUND(AVG(o.delivery_days), 2) AS avg_delivery_days,
    ROUND(AVG(o.is_delayed) * 100, 2) AS delay_rate_pct,
    ROUND(AVG(o.delay_days), 2) AS avg_delay_days
    
FROM sellers s
JOIN order_items oi ON s.seller_id = oi.seller_id
JOIN orders o ON oi.order_id = o.order_id
LEFT JOIN reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'
GROUP BY
	s.seller_id,
    s.seller_city,
    s.seller_state;

SELECT *
FROM seller_performance_base
ORDER BY total_revenue DESC
LIMIT 20;

SELECT *
FROM seller_performance_base
WHERE total_orders >= 20
	AND avg_review_score IS NOT NULL
ORDER BY avg_review_score ASC
LIMIT 20;

SELECT *
FROM seller_performance_base
WHERE total_orders >= 20
ORDER BY delay_rate_pct DESC
LIMIT 20;



DROP VIEW IF EXISTS seller_monthly_performance;

CREATE VIEW seller_monthly_performance AS
SELECT 
	s.seller_id,
    s.seller_city,
    s.seller_state,
    
    o.purchase_year_month,

    ROUND(SUM(oi.price), 2) AS monthly_revenue,

    COUNT(DISTINCT oi.order_id) AS monthly_orders,

    COUNT(oi.order_item_id) AS monthly_items_sold,

    ROUND(AVG(r.review_score), 2) AS monthly_avg_review_score,

    ROUND(AVG(o.is_delayed) * 100, 2) AS monthly_delay_rate_pct,

    ROUND(AVG(o.delivery_days), 2) AS monthly_avg_delivery_days

FROM sellers s

JOIN order_items oi
    ON s.seller_id = oi.seller_id

JOIN orders o
    ON oi.order_id = o.order_id

LEFT JOIN reviews r
    ON o.order_id = r.order_id

WHERE o.order_status = 'delivered'

GROUP BY
    s.seller_id,
    s.seller_city,
    s.seller_state,
    o.purchase_year_month;
    
    
SELECT *
FROM seller_monthly_performance
ORDER BY monthly_revenue DESC
LIMIT 20;


CREATE VIEW seller_category_performance AS
SELECT
	s.seller_id,
    
    COALESCE(t.product_category_name_english, p.product_category_name, 'unknown') AS category,
    
    ROUND(SUM(oi.price), 2) AS category_revenue,
    COUNT(distinct oi.order_id) AS category_order,
    COUNT(oi.order_item_id) AS category_item_sold,
    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    ROUND(AVG(o.is_delayed) * 100, 2) AS delay_rate_pct
    
FROM sellers s

JOIN order_items oi ON s.seller_id = oi.seller_id
JOIN orders o ON oi.order_id = o.order_id
LEFT JOIN products p ON oi.product_id = p.product_id
LEFT JOIN translation t ON p.product_category_name = t.product_category_name
LEFT JOIN reviews r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered'

GROUP BY
	s.seller_id,
    category;
    

SELECT *
FROM seller_category_performance
ORDER BY category_revenue DESC
LIMIT 20;


DROP VIEW IF EXISTS category_performance;

CREATE VIEW category_performance AS
SELECT
    COALESCE(
        t.product_category_name_english,
        p.product_category_name,
        'unknown'
    ) AS category,

    ROUND(SUM(oi.price), 2) AS total_revenue,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    COUNT(oi.order_item_id) AS total_items_sold,
    COUNT(DISTINCT oi.seller_id) AS total_sellers,

    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    ROUND(AVG(o.is_delayed) * 100, 2) AS delay_rate_pct,
    ROUND(AVG(o.delivery_days), 2) AS avg_delivery_days

FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
LEFT JOIN products p ON oi.product_id = p.product_id
LEFT JOIN translation t ON p.product_category_name = t.product_category_name
LEFT JOIN reviews r ON o.order_id = r.order_id

WHERE o.order_status = 'delivered'

GROUP BY
    category;
    
SELECT *
FROM category_performance
ORDER BY total_revenue DESC;


DROP VIEW IF EXISTS seller_segments;

CREATE VIEW seller_segments AS
SELECT *,
	CASE
		WHEN total_revenue >= 5000
			AND avg_review_score >= 4
            AND delay_rate_pct <= 5
		THEN 'Top Performer'
        
        WHEN total_revenue >= 5000
			AND (avg_review_score <4 OR delay_rate_pct > 10)
		THEN 'High Value Risk'
        
        WHEN delay_rate_pct > 10
			AND avg_review_score < 4
		THEN 'Operational risk'
        
        WHEN total_revenue < 1000
			AND total_orders <10
		THEN 'Low Impact'
        
        ELSE 'Standard Seller'
	END AS seller_segment
FROM seller_performance_base;




SELECT 
	seller_segment, 
	COUNT(*) AS sellers
FROM seller_segments
GROUP BY seller_segment
ORDER BY sellers DESC;
