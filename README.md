# Netflix Movies and TV Shows Data Analysis using SQL and Tableau

## Overview
This project focuses on analyzing Netflix's content library using both SQL and Tableau. It includes solutions to 15 business problems related to Netflix's movies and TV shows dataset using SQL and provides insightful visualizations through an interactive Tableau dashboard. The analysis aims to uncover patterns in Netflix's catalog, optimize content strategy, and explore key trends such as genre popularity, content ratings, regional availability, and release years.

---

## Features
- **SQL Analysis**: Solutions to 15 business problems, including the count of movies vs. TV shows, most common ratings, top content by country, and more.
- **Tableau Dashboards**: Interactive visualizations showcasing genre popularity, content distribution across regions, release year trends, and ratings analysis.
- **Business Problem Insights**: Answers to business questions using SQL queries and data exploration to help optimize Netflix's content strategy.

---

## Dataset
**Dataset Link:** [Kaggle Movies Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

The dataset used for this analysis includes publicly available information about Netflix’s content library, including:
- Show ID
- Content type
- Titles
- Director
- Casts
- Date added
- Release years
- Content ratings
- Content duration
- Country availability
- Genres
- Description of content

---

## Tools and Techniques Used
- **SQL**: For solving business problems and extracting key insights from the Netflix dataset.
  Employed advanced SQL techniques such as:
  - **Aggregation Functions**: `COUNT()`, `SUM()`, `ROUND()`, etc.
  - **String Manipulation**: `STRING_TO_ARRAY()`, `UNNEST()`, `SPLIT_PART()`, `TRIM()`.
  - **Date Manipulation**: `TO_DATE()`, `EXTRACT()`, `CURRENT_DATE`.
  - **Window Functions**: `RANK()` for ranking data.
  - **Pattern Matching**: `ILIKE` for case-insensitive searches.
  - **Conditional Logic**: `CASE` statements for categorizing content.
  - **Subqueries**: To calculate average releases, filter specific years, etc.
  - **Filtering & NULL Handling**: Using `WHERE` and `IS NULL` to filter and clean the data.
- **Tableau**: For creating interactive dashboards and visualizations, offering deeper insights into the data.
- **Data Cleaning & Shaping**: Data was cleaned and shaped for optimal analysis, including handling missing values and formatting issues.
- **Visualization Techniques**: Utilized advanced Tableau features like calculated fields, filters, and interactive charts.

---

## Installation
1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/PriyanshiNegi01/Netflix-Data-Analysis.git
   ```
2. Open the Tableau workbook (`NetflixDataAnalysis_PriyanshiNegi.twb`) using Tableau Desktop.
3. Explore the interactive visualizations and insights on the dashboard.

---

## Usage
- Use the filters to explore different genres, ratings, or regions.
- Hover over the charts for detailed insights and data points.
- Navigate through the multiple sheets to view different aspects of the analysis.

---

## Conclusion
This project provides a comprehensive analysis of Netflix's content catalog using both SQL and Tableau. The SQL queries tackle a range of business problems, while the Tableau visualizations help present these insights interactively. Together, they offer a deep understanding of Netflix's content trends, user preferences, and strategic opportunities for content optimization.

---

## License
This project is licensed under the MIT License.
