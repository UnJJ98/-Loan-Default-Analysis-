-- 建立資料庫`loan_db`
CREATE database loan_db;
Use  loan_db;

-- 已匯入`cleaned_data`並查詢`loan_cleaned`是否成功匯入
SELECT * FROM loan_cleaned;
SELECT Count(LoanID) FROM loan_cleaned;

-- 新增`Age Groups`欄位
ALTER TABLE loan_cleaned
ADD COLUMN `Age Groups` VARCHAR(20);

UPDATE loan_cleaned SET
`Age Groups`=
Case 
WHEN Age <=19 THEN 'Teen'
WHEN Age <=39 THEN 'Adults'
WHEN Age <=59 THEN 'Middle Age Adults'
ELSE 'Senior Citizens'
END;

-- 新增Credit Bins欄位
ALTER TABLE loan_cleaned
ADD COLUMN `Credit Bins` VARCHAR(20);

UPDATE loan_cleaned SET
`Credit Bins` =
CASE
WHEN CreditScore <=400 THEN 'Very Low'
WHEN CreditScore <=450 THEN 'Low'
WHEN CreditScore <=650 THEN 'Medium'
ELSE 'High'
END;

-- 新增Income Bracket欄位
ALTER TABLE loan_cleaned
ADD COLUMN `Income Bracket` VARCHAR(20);

UPDATE loan_cleaned SET
`Income Bracket`=
CASE
WHEN Income < 30000 THEN 'Low Income'
WHEN Income <60000 THEN 'Medium Income'
ELSE 'High Income'
END;

-- Default Rate分析:哪一群人最容易違約?
CREATE VIEW Default_Rate_Analysis AS
SELECT
`Credit Bins`,
COUNT(*) AS Total_Loans,
SUM(CASE WHEN `Default` = 1 THEN 1 ELSE 0 END) AS Default_Count,
ROUND(SUM(CASE WHEN `Default` = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Default_Rate
FROM loan_cleaned
GROUP BY `Credit Bins`
ORDER BY Default_Rate DESC;

SELECT * FROM Default_Rate_Analysis;


-- Exposure at Risk:哪一群人違約時，影響的「金額」最大？
CREATE VIEW Exposure_Risk_Analysis AS
SELECT
`Income Bracket`,
SUM(LoanAmount) AS Total_Loan,
SUM(CASE WHEN `Default` = 1 THEN LoanAmount ELSE 0 END) AS Default_Loan_Amount,
ROUND(SUM(CASE WHEN `Default` = 1 THEN LoanAmount ELSE 0 END)/SUM(LoanAmount) *100, 2) AS Risk_Exposure_Ratio
FROM loan_cleaned
GROUP BY `Income Bracket`;

SELECT * FROM Exposure_Risk_Analysis;


-- Cross Analysis:高風險是不是集中在「某些特定組合」？
CREATE VIEW Cross_Analysis AS
SELECT
`Age Groups`,
`Credit Bins`,
COUNT(*) AS Total_Loans,
ROUND(SUM(CASE WHEN `Default` = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Default_Rate
FROM loan_cleaned
GROUP BY `Age Groups`,`Credit Bins`
ORDER BY Default_Rate DESC;

SELECT * FROM Cross_Analysis;

-- Loan Amount分析:不同族群「借多少」？
CREATE VIEW Loan_Amount_Analysis AS
SELECT
`Age Groups`,
AVG(LoanAmount) AS Avg_Loan,
Min(LoanAmount) AS Min_Loan,
MAX(LoanAmount) AS MAX_Loan
FROM loan_cleaned
GROUP BY `Age Groups`;

SELECT * FROM Loan_Amount_Analysis;

-- Stability分析:收入高就一定不違約嗎？
CREATE VIEW Stability_Analysis AS
SELECT
`Income Bracket`,
COUNT(*) AS Total,
SUM(CASE WHEN `Default`= 1 THEN 1 ElSE 0 END) AS Default_Count,
ROUND(SUM(CASE WHEN `Default`= 1 THEN 1 ElSE 0 END)/COUNT(*) *100, 2) AS Default_Rate
FROM loan_cleaned
GROUP BY `Income Bracket`
ORDER BY Default_Rate DESC;

SELECT * FROM Stability_Analysis;

-- Business Recommendation

-- Default Rate分析 >> 信用分類越低的人違約率就越高 
SELECT * FROM Default_Rate_Analysis;

-- Exposure at Risk分析 >> 收入水平越低的人違約的風險越高(違約金額)
SELECT * FROM Exposure_Risk_Analysis;

-- Cross_Analysis >> 年齡越小(越年輕)且信用分類越低的人違約率越高
SELECT * FROM Cross_Analysis;

-- Loan Amount分析 >> 年齡對於貸款金額不是重要影響的因素之一
SELECT * FROM Loan_Amount_Analysis;

--  Stability分析 >> 收入水平越低的人違約率越高
SELECT * FROM Stability_Analysis;

-- 信用分類與收入水平是影響違約風險的核心因子，而年齡本身影響有限，但在與信用交互時，年輕且低信用族群形成高度集中的風險區域。
-- SET SQL_SAFE_UPDATES = 0/1;