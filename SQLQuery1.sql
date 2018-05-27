
SELECT P.ProductName, C.CategoryName
FROM ProductTable as P LEFT JOIN ProductCategoryTable PC ON P.ProductId=PC.ProductId
LEFT JOIN CategoryTable as C ON PC.CategoryId= C.CategoryId
 