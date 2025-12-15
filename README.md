# -Loan-Default-Analysis-
## 專案簡介（Project Overview）
本專案使用 Loan Default（貸款違約）資料集，透過 Python、MySQL 與 Power BI 進行完整的數據分析流程，探討影響貸款違約的關鍵因素，並將分析結果轉化為可執行的信用風險與商業決策洞察。此專案旨在展示從資料清理、探索式分析（EDA）、指標設計（KPI）到視覺化報表的端到端數據分析能力，適用於數據分析師／金融風控相關職位。

## 專案目標（Business Objectives）
* 計算整體與分群的貸款違約率（Default Rate）

* 分析信用評分、收入、年齡、就業類型對違約的影響

* 探討貸款金額與違約風險的關聯性

* 觀察年度 / YTD / YOY的貸款與違約趨勢

* 提供可協助信用審核與風險控管的數據洞察

## 資料集說明（Dataset Description）
資料集主要欄位如下：
* **LoanID** :	A unique identifier for each loan in the dataset.
  
* **Age** :	The borrower's age at the time the loan was issued.
  
* **Income** :	The borrower's annual income
  
* **LoanAmount** :	The total amount of the loan that the borrower is requesting or has been approved for.
  
* **CreditScore** :	A numerical representation of the borrower's creditworthiness, typically ranging from 300 to 850. A higher credit score indicates the borrower is more likely to repay the debt.
  
* **MonthsEmployed** :	The number of months the borrower has been employed at their current job or with their current employer.
  
* **NumCreditLines** :	The total number of active credit lines (e.g., credit cards, loans) the borrower has at the time of applying for the loan.
  
* **InterestRate** :	The annual percentage rate (APR) charged for borrowing the loan amount, usually expressed as a percentage.
  
* **LoanTerm** :	The length of time (in months) over which the loan is to be repaid.
  
* **DTIRatio** :	The Debt-to-Income ratio, which measures the borrower’debt payments relative to their income. A higher ratio can indicate greater financial stress.
  
* **Education** :	The highest level of education the borrower has completed (e.g., High School, Bachelor’s, Master’s, etc.).
  
* **EmploymentType** :	The type of employment the borrower is engaged in (e.g., Full-Time, Part-Time, Self-Employed, etc.).
  
* **MaritalStatus** :	The marital status of the borrower (e.g., Single, Married, Divorced, etc.).
  
* **HasMortgage** :	An indicator (e.g., Yes/No) that shows whether the borrower has an existing mortgage on a property.
  
* **HasDependents** :	An indicator (e.g., Yes/No) that shows whether the borrower has dependents (children, other family members) to support.
  
* **LoanPurpose** :	The primary reason for taking out the loan (e.g., Home Purchase, Debt Consolidation, Education, etc.).
  
* **HasCoSigner** :	An indicator (e.g., Yes/No) that shows whether the borrower has a co-signer for the loan (someone who agrees to take responsibility if the borrower defaults).
  
* **Default** :	An indicator (e.g., Yes/No) that shows whether the borrower defaulted on the loan or failed to make timely payments.
  
* **Loan Date (DD/MM/YYYY)** :	The date the loan was issued or originated.

## 工具與技術（Tools & Technologies）

Python：pandas、numpy、matplotlib、seaborn（資料清理與 EDA）

MySQL：資料轉換、聚合查詢、分析用資料表建立

Power BI：DAX 指標設計、KPI視覺化

## 分析流程（Data Processing Workflow）



