# Uber-Supply-Demand-Gaps

Youtube: 

I worked on analyzing Uber ride request data to identify rider behavior patterns. The dataset included over 6,700 records with several missing values, unstructured timestamps, and mixed data types.

I cleaning the raw CSV file in Excel. I changed the timestamp formats, replaced 'NA' values, and created new columns such as Day Category (Early Morning, Morning, Evening, Night, Late Night) and Travel Time (Difference between Req_timestamp and Drop_timestamp) to give better analysis. I changed the mixed datatype date format to standard date format for the columns Request timestamp and drop timestamp and split them to different columns based on delimiter. with this the dataset is ready for analysis and visualization.

Using Excel, I built dashboards with pivot tables and charts to visualize trends in request status, pickup points, and time of day. I identified the imbalance between ride demand and driver availability.

I imported the cleaned dataset into VS Code after converting all time fields into valid DATETIME format and handling missing values correctly. I wrote SQL queries to extract more specific insights. I analyzed hourly request distribution, cancellation rates across different pickup points, and patterns around high-demand periods. This project helped me identify when and where Uber might need to allocate more drivers or address operational gaps.
