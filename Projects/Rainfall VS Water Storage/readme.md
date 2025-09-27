Chennai Reservoir Analysis Dashboard Project

🎯 Project Objective
The primary objective of this project is to create an interactive Business Intelligence solution using Power BI to monitor and analyze the state of Chennai's critical water resources. This involves:

Tracking historical and current water storage levels across the four major reservoirs.

Analyzing rainfall patterns and identifying seasonal variations.

Determining the correlation and efficiency between rainfall received and the resulting increase in water storage.

🛠️ Tools and Data Structure
Tools Used
Power BI Desktop: Data import, modeling, DAX measure creation and report design.

Power BI Service: Hosting, sharing, and creation of the final Executive Snapshot Dashboard.

Data Model Structure
The project uses two primary tables, confirming that no Unpivot transformation was used, as the reservoir names remain column headers.

Table Name	Content	Key Columns
chennai_reservoir_levels	Daily water storage (MCft)	Date, Month, Year, 4 Reservoir Columns (POONDI, etc.)
chennai_reservoir_rainfall	Daily rainfall (mm) for reservoir catchment areas	Date, Month, Year, 4 Reservoir Columns (POONDI, etc.)


📊 Report 1: Reservoir Levels Analysis (Initial Screenshot)
This report focuses on water storage levels using the chennai_reservoir_levels table .

🔑 Key Performance Indicators (4 KPIs)
KPI Name	Value Shown in SS	DAX Focus
Total Combined Storage	26.25M	Total SUM of all four reservoirs across the filtered period.
Current Total Storage	9.47K	Storage level on the LASTDATE available in the filter context.
POONDI Avg Last 30 Days	1.83K	Average level of POONDI reservoir over the last 30 days.
MoM/YoY Level Change %	(Not shown in SS)	Measures percentage change in average level vs. a previous period.

📈 Visual Charts (5 Charts)
Total Storage Last 30 Days/Over Time (Line Chart): Trend of combined storage levels over time.

Monthly Average Storage Level by Reservoir (100% Stacked Column Chart): Shows the proportional share of average monthly storage among the four reservoirs.

Yearly Distribution of Storage by Reservoir (100% Stacked Bar Chart): Shows the percentage contribution of each reservoir to the annual total storage.

Total Combined Storage by Year (Clustered Column Chart): Compares the full yearly storage volume across all available years.

Monthly Average Level by Reservoir (Line Chart): (Implied by design, showing individual reservoir trends on a single plot).

🔪 Slicers
Month, Quarter, Year (Using built-in date hierarchy slicers).

⛈️ Report 2: Rainfall & Correlation Analysis (Second Screenshot)
This report investigates rainfall patterns and the relationship between rain and levels .

🔑 Key Performance Indicators (4 KPIs)
KPI Name	Value Shown in SS	DAX Focus
Total Combined Rainfall	92.69K	Total SUM of rainfall across all four reservoirs for the filtered period.
Wettest Day Rainfall	1.28K	Maximum combined rainfall on any single day in history.
POONDI Avg Last 30 Days	(Value from R1)	Included here for comparison.
Rainfall Efficiency Ratio	(Implied)	DIVIDE(Storage, Rainfall) to measure efficiency (Cross-Table KPI).

📈 Visual Charts (5 Charts)
Monthly Total Rainfall (Clustered Column Chart): Seasonal analysis, identifying the wettest (October, November) and driest (February, March) months.

Rainfall vs. Level Change (Combo Chart): Primary Correlation Visual. Shows Rainfall (Columns) vs. Total Storage (Line) over time.

Total Combined Rainfall by Year (Line Chart): Trend of total annual rainfall, highlighting high-rain years (e.g., 2005, 2015).

Sum of CHEMBARAMBAKKAM, Sum of POONDI... by Year (Clustered Column Chart): Compares the annual total rainfall received by each of the four individual reservoirs (by dragging all four columns into the Y-Axis).

Individual Rainfall Trends (Line Chart): (Implied, or used the scatter plot not visible).

🔪 Slicers
Month, Quarter, Year (Using built-in date hierarchy slicers).

🖥️ Dashboard: Chennai Water Resource Monitoring (Third Screenshot)
This is the final summary page, combining the most critical metrics and trends from both reports .

Title
Chennai Water Resource Monitoring (Centralized and prominent)

Pinned Tiles (4 KPIs & 5 Visuals)
Tile Type	Content	Report Source
KPI	Reservoir Combined Storage (26.25M)	Report 1 (Total Storage)
KPI	Total Combined Rainfall (92.69K)	Report 2
KPI	POONDI Avg Last 30 Days (132.30)	Report 1 (Value from SS is lower, possibly due to filtering)
KPI	Rainfall Efficiency Ratio	Report 2
Visual	Rainfall vs. Level Change (Combo Chart)	Report 2 (Core Correlation)
Visual	POONDI Avg Last 30 Days by Year (Line Chart)	Report 1 (Focus on a key reservoir's trend)
Visual	Seasonal Storage Trend (Area Chart)	Report 1 (Shows the typical seasonal decline/increase)
Visual	Historical Highs (Bar Chart)	Report 1 (Compares maximum recorded levels across reservoirs)
Visual	(One final visual is implied/not clearly visible in the SS, likely a simpler trend or gauge)	

🔪 Slicers
Non-Interactive: Dashboard tiles are static snapshots based on the filters applied in the reports (Month, Quarter, Year) before pinning. An explicit Year Slicer is included on the right for interactive filtering of the dashboard view.

💡 Conclusion
This Power BI project provides a robust solution for water resource management. By separating Levels (R1) and Rainfall/Correlation (R2), the dashboard offers targeted insights. The use of the Combo Chart (V3) clearly highlights the direct, critical relationship between rainfall events and subsequent water level recovery, making the final dashboard an effective tool for executive monitoring and strategic planning.
