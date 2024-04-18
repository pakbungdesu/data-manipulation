
df <- read.csv(file = "Future-500-Dataset.csv", na.strings = c(""))
df_backup <- df
str(df)
summary(df)

### Change data type
df$Industry <- factor(df$Industry)
df$ID <- factor(df$ID)
df$Inception <- factor(df$Inception)
df$State <- factor(df$State)
df$City <- factor(df$City)

### Clean data
df$Expenses <- gsub(" Dollars", "", df$Expenses)
df$Expenses <- gsub(",", "", df$Expenses)
df$Expenses <- as.numeric(df$Expenses)


df$Revenue <- gsub("[$]", "", df$Revenue)
df$Revenue <- gsub("[,]", "", df$Revenue)
df$Revenue <- as.numeric(df$Revenue)

### fill missing values with correct data
df[is.na(df$State) & df$City == "New York", "State"] <- "NY"
df[is.na(df$State) & df$City == "San Francisco", "State"] <- "CA"


### Fill missing values with median of sub-sector

df[is.na(df$Employees), ]

median(df$Employees, na.rm = TRUE)
med_emp_retail <- median(df[df$Industry == "Retail",]$Employees, na.rm = TRUE)
df[is.na(df$Employees) & df$Industry == "Retail", "Employees"] <- med_emp_retail


med_emp_fiser <- median(df[df$Industry == "Financial Services",]$Employees, na.rm = TRUE)
df[is.na(df$Employees) & df$Industry == "Financial Services", "Employees"] <- med_emp_fiser


median(df$Growth, na.rm = TRUE)
med_growth_con <- median(df[df$Industry=="Construction",]$Growth, na.rm = TRUE)
df[is.na(df$Growth) & df$Industry=="Construction", "Growth"] <- med_growth_con


median(df$Expenses, na.rm = TRUE)
med_exp_con <- median(df[df$Industry == "Construction",]$Expenses, na.rm = TRUE)


df[is.na(df$Expenses) & df$Industry=="Construction", "Expenses"] <- med_exp_con
df[is.na(df$Expenses),"Expenses"] <- df[is.na(df$Expenses),"Revenue"] - df[is.na(df$Expenses),"Profit"]


med_rev_con <- median(df[df$Industry == "Construction",]$Revenue, na.rm = TRUE)
df[is.na(df$Revenue)& df$Industry=="Construction", "Revenue"] <- med_rev_con

### Complete the columns by calculation
df[8, "Profit"] <- df[8, "Revenue"] - df[8, "Expenses"]
df[42, "Profit"] <- df[42, "Revenue"] - df[42, "Expenses"]

### Check that missing values were filled
df[!complete.cases(df),]













