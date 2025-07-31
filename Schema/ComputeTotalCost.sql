-- Compute Total Cost of One Order


WITH IngredientCost AS (
	SELECT
		oi.OrderID,
		SUM(oi.Quantity * r.Quantity * i.IngredientPrice) AS TotalIngredientCost
	FROM OrderItems oi
	JOIN Recipe r ON oi.ItemID = r.ItemID
	JOIN Ingredients i ON i.IngredientID = r.IngredientID
	WHERE oi.OrderID = 'ORD1'
	GROUP BY oi.OrderID
),
StaffCost AS (
	SELECT
		o.OrderID,
		SUM(
			(DATEDIFF(MINUTE, sh.StartTime, sh.EndTime) / 60.0) * s.HourlyRate
		) AS TotalStaffCost

	FROM Orders o
	JOIN OrderStaff os ON o.OrderID = os.OrderRowID
	JOIN Staff s ON os.StaffID = s.StaffID
	JOIN Schedule sc ON sc.StaffID = s.StaffID
	JOIN Shift sh ON sh.ShiftID = sc.ShiftID
	WHERE o.OrderID = 'ORD1' 
		AND CAST(sc.Date AS DATE) = CAST(o.CreatedAt AS DATE)
	GROUP BY o.OrderID
),
DeliveryCost AS (
	SELECT
		OrderID,
		CASE 
			WHEN Delivery = 1 THEN 5.00
			ELSE 0.00
		END AS TotalDeliveryCost
	FROM Orders
	WHERE OrderID = 'ORD1'
)
SELECT
	o.OrderID,
	ic.TotalIngredientCost,
	sc.TotalStaffCost,
	dc.TotalDeliveryCost,
	(ic.TotalIngredientCost + sc.TotalStaffCost + dc.TotalDeliveryCost) AS TotalOrderCost
FROM Orders o
-- USE LEFT JOIN, becase for example in the case of pickup, the order is not included in the OrderStaff because no staff is needed for picking up
LEFT JOIN IngredientCost ic ON o.OrderID = ic.OrderID
LEFT JOIN StaffCost sc ON o.OrderID = sc.OrderID
LEFT JOIN DeliveryCost dc ON o.OrderID = dc.OrderID
WHERE o.OrderID = 'ORD1';
