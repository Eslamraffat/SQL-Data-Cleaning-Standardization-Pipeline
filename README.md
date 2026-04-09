This project demonstrates a complete SQL‑based data‑cleaning workflow applied to a messy dataset containing inconsistent formatting, embedded symbols, bracketed values, and non‑numeric characters inside numeric fields.
The goal was to transform the raw file into a clean, analysis‑ready table suitable for BI reporting and downstream modeling.

🛠️ Key Skills Demonstrated
- SQL data cleaning & transformation
- Text normalization (REPLACE, TRIM, COALESCE)
- Numeric extraction & type conversion (TRY_CONVERT, NULLIF)
- Derived metrics & business logic
- Creating clean tables for analytics (SELECT INTO)

🧹 Cleaning Steps Performed
1. Bracket & Symbol Removal
Columns such as peak, all_time_peak, and ref contained values like [123].
These were standardized using nested REPLACE() functions.
2. Removing Non‑Numeric Characters
actual_gross contained letters (a, b, e) and symbols.
These were stripped to allow numeric conversion.
3. Converting to MONEY
After cleaning, actual_gross was safely converted using:
TRY_CONVERT(MONEY, cleaned_value)


4. Cleaning Text Columns
tour_title contained special characters such as †, ‡[4][a], *.
These were removed to create a clean, readable title.
5. Creating Derived Metrics
A new metric was added:
adjust_amount = Adjusted_gross_in_2022 – actual_gross


6. Creating a Clean Table
All cleaned fields were inserted into a new table:
SELECT ... INTO my_file_cleaned
FROM my_file;



📊 Final Output
The resulting table my_file_cleaned is fully standardized and ready for:
- Power BI dashboards
- Exploratory analysis
- Reporting
- Modeling and forecasting

📁 Repository Structure
/SQL-Cleaning-Project
├── README.md
├── Dataset.csv
├── cleaning_script.sql
├── Creating_table
└── Final_result.sql

