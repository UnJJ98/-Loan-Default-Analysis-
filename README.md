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

Python：pandas、numpy、sqlalchemy

MySQL：資料轉換、聚合查詢

Power BI：DAX 指標設計、KPI視覺化

## 分析流程（Data Processing Workflow）
#### 1.資料清理（Data Cleaning）
* 評估數據整齊度(每列一個變量，每行一個觀察值，每個單元格是一個值)
* 評估數據缺失值(0或Null值)
* 處理重複數據
* 處理不一致數據(標準化類別型數據)
* 處理無效或錯誤數據
* 保存整理後的數據並匯入MySQL

#### 2.資料轉換 (Data Conversion)
* 建立分析用彙總資料表（依年度、收入區間、信用評分分組）
* 撰寫 GROUP BY 與 CASE WHEN 查詢以支援報表分析

#### 3.數據視覺化 (Data Visualization)
* 撰寫 DAX 指標（Default Rate、YTD、YOY）
* 建立互動式 Dashboard 進行風險分析與趨勢觀察

## 主要分析重點（Key Analyses & Insights）
* 整體違約率：掌握整體貸款組合的信用風險水準
* 信用評分影響：低信用評分族群的違約率顯著偏高
* 收入與年齡分群：低收入與年輕族群違約風險相對較高
* 貸款金額分析：高貸款金額搭配低信用評分時，違約風險明顯上升
* 趨勢分析：透過年度與 YOY 分析觀察風險結構變化

## Power BI Dashboard重點
#### 1.Loan Default Overview:  
    * Loan Amount by Purpose（依貸款用途）  
    * Average Income by Employment Type（就業型態 vs 收入）  
    * Default Rate (%) by Employment Type（關鍵風控圖）  
    * Average Loan Amount by Age Group（年齡 vs 單筆貸款）  
    * Default Rate (%) by Year（時間趨勢）  
![螢幕擷取畫面 2025-12-25 142404](https://github.com/user-attachments/assets/d6bf691a-11c9-4d7b-a62f-190340f176a9)

#### 2.Applicant Demographics & Financial Profile:  
    * Loan (Middle Age Adults) by have Mortgage/Dependents (是否有家屬 / 房貸 vs 貸款總額)  
    * Average Loan Amt (High Credit) (年齡 × 婚姻狀態 vs 平均貸款金額)  
    * Total Loan (Adults) by Credit Score Bins (信用分數區間 vs 貸款總額)  
    * Median Loan Amount by Credit Score Category (信用分數 vs 單筆貸款中位數)  
    * Number of Loans by Education Type (教育程度 vs 貸款件數)  
![螢幕擷取畫面 2025-12-25 193725](https://github.com/user-attachments/assets/d82a4296-db48-4ac0-9f2e-99de778c2259)

#### 3.Financial Rick Metrics:  
    * YOY Loan Amount Change by Year（放款金額年增率）  
    * YOY Default Loans Change by Year（違約案件年增率）  
    * YTD Loan Amount by Credit Sore Bins/MaritalStatus (信用評分區間/婚姻狀況)  
![螢幕擷取畫面 2025-12-25 142624](https://github.com/user-attachments/assets/00704d56-31da-4096-b40a-44ed2d7fc600)

## 專案結構（Project Structure）
```text
Loan-Default-Analysis/
│
├─ original_data/
│   └─ Loan_default.csv
│
├─ python/
│   └─ Loan-Default-Analysis.ipynb
│
├─ sql/
│   └─ Loan_Default_Analysis.sql
│
├─ powerbi/
│   └─ Loan_Default_exercise.pbix
│
└─ README.md
```

## 專案價值（Business Value）
本專案展示如何將原始貸款資料轉換為 可解讀、可決策的信用風險洞察，協助企業在放貸策略、客群篩選與風險控管上做出更佳決策，同時完整呈現數據分析師在實務上的分析能力。

## 進階分析-邏輯回歸 (Logistic Regression)
#### 分析目標 (Analysis Objective)
此分析報告目的是，基於人們的收入、教育程度和年齡等屬性，對於是否違約且風險程度情況進行邏輯回歸分析，從而利用得到的模型，對未來需要借貸的人們，根據屬性預測是否違約和風險程度。

#### 分析流程（Data Processing Workflow）  
**1.匯入所需的工具集**  
* numpy  
* pandas  
* matplotlib.pyplot  
* seaborn  
* statsmodels.api

**2.匯入已整理後的資料集**  
* Loan_cleaned.csv
* Random_Loan.csv

**3.數據視覺化**
* 違約比率
* 年齡與是否違約
* 就業類型與是否違約
    
**4.分析數據**
* 移除不會影響是否違約的變量。
* 把分類變量轉換為category類型。
* 數據中存在分類變量，我們需要引入虛擬變量，也就是用0和1分別表示是否屬該類別。
* 把因變量和自變量劃分出來，因變量為Default變量。
* 對所有自變量查看之間的相關性
* 給模型線性方程添加截距
* 用Logit函數來優化得到邏輯回歸模型的參數值。
* 理解某些自變量系數的實際含義，需要計算自然常數的次方。

**5.預測模型**


## 分析結構 (Analysis Structure)
```text
Logistic Regression Analysis/
│
├─ original_data/
│   └─ Loan_cleaned.csv
│   └─ Random_Loan.csv
├─ python/
│   └─ Loan-Default-Analysis.ipynb
│
└─ README.md
```
