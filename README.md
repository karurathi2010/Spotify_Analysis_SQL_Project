# Spotify_Data_Analysis_SQL_Project
![spotify_logo](https://github.com/user-attachments/assets/f37d406b-349d-42c0-abec-dce6779c27f9)

# Project Overview.
The project aims to analyze a dataset representing various musical attributes for tracks in the Spotify database. This analysis will include multiple queries addressing different levels of complexity, ranging from basic data retrieval to advanced performance analysis using SQL window functions and aggregation techniques. The dataset contains information about tracks, albums, artists, and user interactions such as streams, views, likes, and comments.
The database schema for Spotify includes information about tracks, albums, artists, and user engagement metrics, such as views, likes, and comments. The table structure includes columns related to various attributes of the tracks, such as danceability, energy, loudness, liveness, and duration.
## Queries Overview
The following are the queries to be executed, categorized by complexity level:

## Detailed Query Explanation

### Easy Queries
* Simple data retrieval, filtering, and basic aggregations.

![image](https://github.com/user-attachments/assets/70a41dcd-9341-4949-8458-cd45662dfd4f)

### Medium Queries
* More complex queries involving grouping, aggregation functions, and joins.

  ![image](https://github.com/user-attachments/assets/cb4efc6c-2624-4272-ac92-3730faa97d73)

### Advanced Queries
* Nested subqueries, window functions, CTEs, and performance optimization.

![image](https://github.com/user-attachments/assets/f6d2997f-3cc8-42be-8347-24762e5cdd06)

![image](https://github.com/user-attachments/assets/9d799b28-7aa7-4df2-b562-4a4237047403)

# Query Optimization Technique
To improve query performance, we carried out the following optimization process:

### Initial Query Performance Analysis Using EXPLAIN
We began by analyzing the performance of a query using the EXPLAIN function.
The query retrieved tracks based on the artist column, and the performance metrics were as follows:
* Execution time (E.T.): 7 ms
* Planning time (P.T.): 0.17 ms
Below is the screenshot of the EXPLAIN result before optimization:
![spotify_explain_before_index](https://github.com/user-attachments/assets/67938942-4cf0-4b62-b53a-fe721f3021ee)

### Index Creation on the artist Column
To optimize the query performance, we created an index on the artist column. This ensures faster retrieval of rows where the artist is queried.
* SQL command for creating the index:
![image](https://github.com/user-attachments/assets/4d0fcd0d-61b2-4934-a8d5-26e856db67ae)

### Performance Analysis After Index Creation
After creating the index, we ran the same query again and observed significant improvements in performance:
* Execution time (E.T.): 0.153 ms
* Planning time (P.T.): 0.152 ms
Below is the screenshot of the EXPLAIN result after index creation:
![spotify_explain_after_index](https://github.com/user-attachments/assets/e669c41f-13f0-40f9-82d6-2fbfa1e13395)

### Graphical Performance Comparison
A graph illustrating the comparison between the initial query execution time and the optimized query execution time after index creation.
* Graph view shows the significant drop in both execution and planning times:
  ![spotify_graphical view 3](https://github.com/user-attachments/assets/2d692ce7-acdd-4885-b43b-3666d49855bb)
  ![spotify_graphical view 2](https://github.com/user-attachments/assets/10263d1f-edac-4000-b26a-9449a08b659b)
  ![spotify_graphical view 1](https://github.com/user-attachments/assets/19d732c3-e6af-478f-a9b1-a55c24be50d1)
  
  
### This optimization shows how indexing can drastically reduce query time, improving the overall performance of our database operations in the Spotify project.
# Next Steps
* Visualize the Data: Use a data visualization tool like Tableau or Power BI to create dashboards based on the query results.
* Expand Dataset: Add more rows to the dataset for broader analysis and scalability testing.
* Advanced Querying: Dive deeper into query optimization and explore the performance of SQL queries on larger datasets.
  
# Conclusion
This project covers a wide range of SQL queries, from simple data retrieval to advanced analysis using window functions and aggregation techniques. It serves as a practical exercise to understand various SQL functionalities and how they can be applied to analyze a music streaming dataset like Spotify. The queries address real-world use cases and optimize performance for large datasets by leveraging SQL’s advanced features.








