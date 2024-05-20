
## Content
- Data Manipulation using R
- Data Manipulation using Python (Numpy, Pandas etc.)


## Data Manipulation using R
- Data Cleaning
  - Adjust data structure to prevent data type errors
    
  - Tackle with missing values using `is.na()` and `complete.cases()`
    - Replace with correct data
      ```{r}
      # Example
      
      df[is.na(df$State) & df$City == "New York", "State"] <- "NY"
      df[is.na(df$State) & df$City == "San Francisco", "State"] <- "CA"
      ```
      
    - Fill with median imputation of sub-sector
       ```{r}
      # Example
       
      med_emp_retail <- median(df[df$Industry == "Retail",]$Employees, na.rm = TRUE)
      df[is.na(df$Employees) & df$Industry == "Retail", "Employees"] <- med_emp_retail
      ```
      
  
- Aggregation and Summarisation
  - Using `apply()`, `lapply()`, `sapply()` through matrix
  - Store dataframe in a list and export in one time by `export_list()`
    




