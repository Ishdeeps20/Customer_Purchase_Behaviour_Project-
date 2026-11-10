# Customer Shopping Behaviour Analysis

End-to-end data analysis project: clean a retail dataset with **Python**, store it in **MySQL**, answer business questions with **SQL**, and present the results in a **Power BI** dashboard.

## Objective
Understand who buys, what they buy, and how subscriptions, discounts and shipping relate to spending, so the business can target customers better.

## Dataset
- `customer_shopping_behavior.csv`: 3,900 customers, 18 columns
- Fields include age, gender, item, category, purchase amount (USD), location, review rating, subscription status, shipping type, discount applied, previous purchases and purchase frequency

## Tools
Python (pandas, SQLAlchemy, PyMySQL) · MySQL · Power BI · Jupyter Notebook

## Workflow
1. **Data cleaning (Python):**
   - Filled 37 missing review ratings with the median rating of each category
   - Standardised column names (lowercase, underscores)
   - Dropped `promo_code_used`, which was identical to `discount_applied`
2. **Feature engineering:**
   - `age_group`: four quartile bands (Young Adult, Adult, Middle-aged, Senior)
   - `purchase_frequency_days`: purchase frequency converted to days
3. **Database:** loaded the cleaned data into MySQL (`mytable`) using SQLAlchemy
4. **SQL analysis:** 11 business questions (joins-free aggregations, subqueries, CTEs, window functions, CASE WHEN)
5. **Dashboard:** Power BI report with KPI cards, charts and slicers

## Key questions answered
- Revenue by gender, age group and subscription status
- Top 5 products by review rating and by discount rate
- Top 3 products in each category
- Customer segments: New / Returning / Loyal
- Do subscribers spend more? Are repeat buyers more likely to subscribe?
- Express vs Standard shipping spend

## Key insights
- Subscribers spend about the same as non-subscribers (about $59 per purchase) and contribute 27% of revenue
- Male customers account for about 68% of revenue
- Clothing is the top category (45% of revenue)
- 80% of customers are Loyal (more than 10 previous purchases), with only 83 New customers
- Revenue is spread almost evenly across age groups (24% to 27% each)
- About 43% of purchases use a discount


Visuals: KPI cards (customers, average purchase, average rating), subscription donut, revenue and customers by category and age group, slicers for subscription, gender, category and shipping type.

## Repository structure
```
├── data/customer_shopping_behavior.csv
├── notebooks/Customer_Shopping_Behaviour.ipynb
├── sql/Customer_Behaviour.sql
├── dashboard/customer_behavior_dashboard.pbix
└── README.md
```

## How to run
1. Install: `pip install pandas sqlalchemy pymysql`
2. Create a MySQL database named `mydatabase`
3. Run the notebook (it asks for your MySQL password) to clean the data and upload it
4. Run the queries in `sql/Customer_Behaviour.sql`
5. Open the `.pbix` file in Power BI Desktop and refresh the data source

## Author
Ishdeep Singh· www.linkedin.com/in/ishdeep-singh-b3402217b · Ishdeeps20@gmail.com
