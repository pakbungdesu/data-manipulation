
chicago_c <- read.csv("Chicago-C.csv")
houston_c <- read.csv("Houston-C.csv")
newyork_c <- read.csv("NewYork-C.csv")
sanfran_c <- read.csv("SanFrancisco-C.csv")
chicago_f <- read.csv("Chicago-F.csv")
houston_f <- read.csv("Houston-F.csv")
newyork_f <- read.csv("NewYork-F.csv")
sanfran_f <- read.csv("SanFrancisco-F.csv")



### Clean data by change row names
city_list <- list(chicago_c, houston_c, newyork_c, sanfran_c, chicago_f, 
                  houston_f, newyork_f, sanfran_f)



for (i in 1:8){
  row.names(city_list[[i]]) <- city_list[[i]]$X
  city_list[[i]]$X <- NULL
}


chicago_c <- as.matrix(city_list[[1]])
houston_c <- as.matrix(city_list[[2]])
newyork_c <- as.matrix(city_list[[3]])
sanfran_c <- as.matrix(city_list[[4]])
chicago_f <- as.matrix(city_list[[5]])
houston_f <- as.matrix(city_list[[6]])
newyork_f <- as.matrix(city_list[[7]])
sanfran_f <- as.matrix(city_list[[8]])

weather_c <- list(Chicago = chicago_c, Houston = houston_c, 
                  NewYork = newyork_c, SanFran = sanfran_c)

weather_f <- list(Chicago = chicago_f, Houston = houston_f, 
                  NewYork = newyork_f, SanFran = sanfran_f)


info <- list(c = weather_c, f = weather_f)

# Aggregation for celsius data

cities <- c("Chicago", "Houston", "NewYork", "SanFran")
c_min <- list()
c_max <- list()
c_mean <- list()
c_q <- list()
c_med <- list()
c_range <- list()

c_range <- lapply(info$c, function(x) x[1,]-x[2,])


for(city in cities){
  c_min[[city]] <- apply(info$c[[city]], 1, min)
  c_max[[city]] <- apply(info$c[[city]], 1, max)
  c_mean[[city]] <- apply(info$c[[city]], 1, mean)
  c_q[[city]] <- apply(info$c[[city]], 1, quantile)
  c_med[[city]] <- apply(info$c[[city]], 1, median)
}


# Aggregation for fahrenheit data

f_min <- list()
f_max <- list()
f_mean <- list()
f_q <- list()
f_med <- list()
f_range <- list()

f_range <- lapply(info$f, function(x) x[1,]-x[2,])


for(city in cities){
  f_min[[city]] <- apply(info$f[[city]], 1, min)
  f_max[[city]] <- apply(info$f[[city]], 1, max)
  f_mean[[city]] <- apply(info$f[[city]], 1, mean)
  f_q[[city]] <- apply(info$f[[city]], 1, quantile)
  f_med[[city]] <- apply(info$f[[city]], 1, median)
}


# Combine data together by list and dataframe

agg_data <- list()

c_q1 <- lapply(c_q, "[", 2,)
c_q3 <- lapply(c_q, "[", 4,)
f_q1 <- lapply(f_q, "[", 2,)
f_q3 <- lapply(f_q, "[", 4,)


for (city in cities) {
  agg_data$c[[city]] <- data.frame(min = c_min[[city]], max = c_max[[city]],
                                 mean = c_mean[[city]], q1 = c_q1[[city]],
                                 median = c_med[[city]], q3 = c_q3[[city]])
}

for (city in cities) {
  agg_data$f[[city]] <- data.frame(min = f_min[[city]], max = f_max[[city]],
                                   mean = f_mean[[city]], q1 = f_q1[[city]],
                                   median = f_med[[city]], q3 = f_q3[[city]])
}

range <- list()
range$c <- data.frame(Chicago = c_range$Chicago, Houston = c_range$Houston,
                      NewYork = c_range$NewYork, Sanfrancisco = c_range$SanFran)
range$f <- data.frame(Chicago = f_range$Chicago, Houston = f_range$Houston,
                      NewYork = f_range$NewYork, Sanfrancisco = f_range$SanFran)




                  
