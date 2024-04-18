

library(rio)

chicago_c <- read.csv("Chicago-C.csv")
houston_c <- read.csv("Houston-C.csv")
newyork_c <- read.csv("NewYork-C.csv")
sanfran_c <- read.csv("SanFrancisco-C.csv")
chicago_f <- read.csv("Chicago-F.csv")
houston_f <- read.csv("Houston-F.csv")
newyork_f <- read.csv("NewYork-F.csv")
sanfran_f <- read.csv("SanFrancisco-F.csv")



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


# Calculating mean, max, min, q1, median and q3

mean_c <- sapply(weather_c, apply, 1, mean)
max_c <- sapply(weather_c, apply, 1, max)
min_c <- sapply(weather_c, apply, 1, min)
q1_c <- sapply(weather_c, apply, 1, quantile, probs = c(0.25))
med_c <- sapply(weather_c, apply, 1, median)
q3_c <- sapply(weather_c, apply, 1, quantile, probs = c(0.75))


mean_f <- sapply(weather_f, apply, 1, mean)
max_f <- sapply(weather_f, apply, 1, max)
min_f <- sapply(weather_f, apply, 1, min)
q1_f <- sapply(weather_f, apply, 1, quantile, probs = c(0.25))
med_f <- sapply(weather_f, apply, 1, median)
q3_f <- sapply(weather_f, apply, 1, quantile, probs = c(0.75))


df_list <- list(mean_c, max_c, min_c, q1_c, med_c, q3_c,
                mean_f, max_f, min_f, q1_f, med_f, q3_f)


export_list(df_list, c("mean_c.csv", "max_c.csv", "min_c.csv", "q1_c.csv", "med_c.csv", "q3_c.csv",
                       "mean_f.csv", "max_f.csv", "min_f.csv", "q1_f.csv", "med_f.csv", "q3_f.csv"))


               
