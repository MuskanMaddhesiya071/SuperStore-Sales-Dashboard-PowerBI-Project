# 📊 Superstore Sales Dashboard – Power BI Project

## 📸 Screenshots

### 📊 Dashboard View
![Dashboard](![Screenshot 2025-07-09 103348](https://github.com/user-attachments/assets/42b512c6-202c-4ecb-8519-b1db3724fa22)
)

### 🧩 Data Model View
![Data Model](![Screenshot 2025-07-09 103414](https://github.com/user-attachments/assets/195d2339-645c-49fd-aa43-6a4d7c532c4a)
)

---


## ✅ Objectives

- Normalize raw transactional sales data  
- Design a **snowflake schema** data model  
- Create calculated measures using **DAX**  
- Build an interactive Power BI dashboard  
- Extract and communicate strategic business insights

---

## 🔧 Tools & Technologies

- Power BI Desktop  
- Power Query  
- DAX (Data Analysis Expressions)  
- Dimensional Modeling (Snowflake Schema)  

---

## 🧹 Data Preparation & Modeling

### 🔄 1. Raw Data Normalization
The flat transactional data was normalized into multiple dimension tables to reduce redundancy:
- `Customer_Lookup`
- `Territory_Lookup`
- `Products_Lookup`
- `Sub_Category_Lookup`
- `Category_Lookup`
- `Calendar_Lookup`

### 🧊 2. Snowflake Schema Modeling
- **Fact Table:** `Sales_Fact` contains Order, Product, and Financial data.
- **Dimension Tables:** Provide lookup references for filtering and slicing data.

> Relationships flow **from dimension to fact table**, enabling efficient filtering.

---

## 📊 Dashboard Features

| Metric              | Description                           |
|---------------------|---------------------------------------|
| 💰 Total Sales      | Total revenue generated               |
| 📦 Total Orders     | Number of completed orders            |
| 📈 Profit Margin    | Overall profitability                 |
| 🚚 Delivery Days    | Average shipping time                 |
| 🧍‍♂️ Top Customers   | Best performing customers             |
| 🗺️ Sales by Region   | Geo-map of performance by state       |
| 📅 Sales Trend      | Time-series analysis by month & year |
| 🎯 Sales vs Target  | Actual vs Expected performance        |

---

## 🔍 Key Insights

- **Sales exceeded target by $580K** (Actual: $2.3M vs Target: $1.72M)
- **California** is the top-performing state with $470K+ in sales.
- **Phones and Chairs** are the most sold sub-categories (~$170K each).
- **Corporate Segment** generates the highest revenue (30.4% share).
- **Sales spike in Q4**, ideal for promotional campaigns.
- **Central states** show lower performance – opportunity to expand.
- **Average delivery time is 4 days** – room for logistical improvements.

## 📌 Learnings
- Hands-on experience with data modeling best practices

- Used advanced DAX for KPIs: YoY Growth, MoM %, Profit Margin

- Built a dashboard suitable for executive-level reporting

- Understood importance of data structuring for scalab

---


## 📬 Contact

**Muskan Maddheshiya**  
📧 maddheshiyamuskan4@gmail.com
🔗 [LinkedIn](www.linkedin.com/in/muskan-maddhesiya97)

---

⭐ If you found this project useful, feel free to star the repo and share it!
