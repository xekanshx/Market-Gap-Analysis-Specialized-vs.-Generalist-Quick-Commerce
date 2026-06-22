# 📌 Project Overview
This project analyzes the product assortment, true landed cost, and availability of essential baby care items across three major platforms in India: OZi (Specialized Quick-Commerce), Blinkit (General Quick-Commerce), and FirstCry (Specialized E-Commerce).

The goal of this analysis was to test a core product hypothesis: Generalist quick-commerce platforms fail to meet the specialized depth required by parents, leaving a massive market gap for a specialized quick-commerce player to compete on both price and speed.

🔗 [Live Dashboard](https://datastudio.google.com/reporting/97143527-2922-4e8b-8fe5-cd27aa4da243)

# Data collection
- I made Gemini generate a list of 30 random babycare and children products.
<img width="516" height="976" alt="image" src="https://github.com/user-attachments/assets/b12e29b4-af9b-4ce0-ab1f-ae8de2e2931a" />
- Then I cross searched these products across all 3 sites and noted the details about the pricing, product information and delivery time.
<img width="1632" height="661" alt="image" src="https://github.com/user-attachments/assets/6d70131d-2f29-49a3-be93-b5b91ef2d49d" />

# Data structure
- I split the data into two tables, one contained the general information about the product like categroy, brand and product name, while the other contained the factual prices(numeric) and delivery time for each product per platform. (I created artificial product_id to refer to these products uniquely)
<img width="769" height="683" alt="image" src="https://github.com/user-attachments/assets/e515a60f-2342-4998-9fea-5c48647725d8" />
<img width="808" height="502" alt="image" src="https://github.com/user-attachments/assets/33462739-9371-4c0e-aa92-57a2c9773baf" />




# 🛠 Tools Used
1. The "Generalist Gap"
Data Collection: Manual scraping & cart testing to capture true unit economics (bypassing welcome coupons and price-anchoring dark patterns).

Google Sheets: Exploratory Data Analysis (EDA) and data structuring.

Looker Studio: Executive dashboarding and visual storytelling.

SQL (SQLite): Relational data filtering, Common Table Expressions (CTEs), and aggregate calculations to normalize pricing data.

# 📊 Key Findings & Product Insights
1. The "Generalist Gap"
Visual analysis revealed that while Blinkit competes well on speed (~11.5 mins), it completely abandons parents in specialized niche categories. For example, in the Mom care category, OZi and FirstCry maintained a 100% fill rate, while Blinkit dropped to just 25%.

2. The Assortment Bias
Initial raw category averages made FirstCry appear artificially expensive. Visualizing the data proved this was an illusion caused by Assortment Bias: FirstCry frequently stocked out of basic, lower-priced items in the Health and wellness and Bath and skin categories, leaving only premium items to pull their average up.

3. The "Apples-to-Apples" Price Winner
To remove the Assortment Bias, I engineered a SQL CTE to isolate only the products available across all three platforms simultaneously (a 12-item overlapping basket).

When comparing the exact same basket of goods, the true average landed cost (Discounted Price + Delivery + Handling) proved OZi's unit economics:

OZi: ₹546.75

Blinkit: ₹554.50

FirstCry: ₹587.25

Conclusion: OZi successfully bridges the market gap. They match the specialized catalog depth of the e-commerce giant (FirstCry) while delivering products exponentially faster, all while maintaining the lowest true basket cost.
